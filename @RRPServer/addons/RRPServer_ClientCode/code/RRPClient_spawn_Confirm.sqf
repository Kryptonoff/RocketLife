/*
  Project: Rimas Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

#include "..\script_macros.hpp"
private["_spCfg","_sp","_spawnPos","_text"];
closeDialog 0;

if(life_spawn_point isEqualTo []) then {
	private["_sp","_spCfg"];
	_spCfg = [player call getSide] call RRPClient_spawn_PointCfg;
	_sp = _spCfg select 0;

	if(isNil {(call compile format["%1", _sp select 0])}) then {
		if(["Точка отключения",life_spawn_point select 1] call BIS_fnc_inString) then {
			player setPosATL life_logout_position;
		} else {
			if !(isNil {_sp # 3}) then {
				player setPosATL (_sp # 3);
			} else {
				player setPosATL (getMarkerPos (_sp select 0));
			};
		};
	} else {
		_spawnPos = selectRandom (call compile format["%1", _sp select 0]);
		_spawnPos = _spawnPos buildingPos 0;
		if !(isNil {_sp # 3}) then {
			player setPosATL (_sp # 3);
		} else {
			player setPosATL _spawnPos;
		};
	};

	_text = format["%2 %1",_sp select 1,"Вы возродились в"];
} else {
	if(isNil {(call compile format["%1",life_spawn_point select 0])}) then {
		if(["Точка отключения",life_spawn_point select 1] call BIS_fnc_inString) then {
			player setPosATL life_logout_position;
		} else {
			if(["house",life_spawn_point select 0] call BIS_fnc_inString) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call RRPClient_system_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};

				_pos = selectRandom _bPos;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (life_spawn_point select 0));
			};
		};
	} else {
		_spawnPos = selectRandom (call compile format["%1", life_spawn_point select 0]);
		_spawnPos = _spawnPos buildingPos 0;
		player setPosATL _spawnPos;
	};
	_text = format["%2 %1",life_spawn_point select 1,"Вы возродились в"];
};


if(life_firstSpawn) then
{
	life_firstSpawn = false;
	if (life_gov) then {
		[0,format["Губернатор %1 прибыл на остров.",player call getFullName]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
	} else {
		if (GVAR_RTITLE(player) isEqualTo "") then {
			[0,format["%1 прибыл на остров",player call getNickName]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
		} else {
			[0,format["%1 %2 прибыл на остров",GVAR_RTITLE(player),player call getNickName]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
		};
	};

	life_connected = true;
	[21] call RRPClient_session_updatePartial;
};
[4] call RRPClient_session_updatePartial;
call RRPClient_system_updateViewDistance;

spawn_camera camPreparePos (ASLToATL (eyePos player));
spawn_camera camPrepareTarget player;
spawn_camera camCommitPrepared 1;
waitUntil {camCommitted spawn_camera};

["DynamicBlur", 400, [0]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		cl_spawnmenu_blur = ppEffectCreate [_name, _priority];
		cl_spawnmenu_blur < 0
	} do {
		_priority = _priority + 1;
	};
	cl_spawnmenu_blur ppEffectEnable true;
	cl_spawnmenu_blur ppEffectAdjust _effect;
	cl_spawnmenu_blur ppEffectCommit 0.1;
};

spawn_camera cameraEffect ["terminate","back"];
camDestroy spawn_camera;
player switchCamera "INTERNAL";
setterrainGrid ([50,25] select enableGrass);
enableEnvironment [true, enableSoundAmbient];
if (isNull LIFE_HANDLE_HUD) then {LIFE_HANDLE_HUD = [] spawn RRPClient_hud_init};

if (player call getSide in ["civ","reb"]) then
{
	if (life_firstTime) then {
		life_firstTime = false;
		[["life_firstTime",life_firstTime,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
	};
};

if(life_jail_coin > 0) then  {
	call RRPClient_cw_spawnPlayer;
};

call RRPClient_snow_onPlayerSpawned;
call RRPClient_init_actions;

if (0 in (player getVariable ["rrpvar_questsList",[0,0,0,0,0,0,0,0]])) then {
	[] spawn {
		uiSleep 10; 
		call RRPClient_forBeginner_openMenu
	}
};
[5, saveMe, [], true] call RRPClient_system_thread_addTask;
[300, RRPClient_session_saveStats, [], true] call RRPClient_system_thread_addTask;
player setVariable ["sessionCompleted",true,true];
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;
[] spawn RRPClient_system_welcomeNotification;
enableHUD call RRPClient_hud_show;
player disableTIEquipment true;