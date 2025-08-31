/*

	Filename: 	RRPClient_effects_Position.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _markers = LIFE_SETTINGSWORLD(getArray,worldName,"life_posWhite");
if (EQUAL(_markers,[])) exitWith {};
_detected = 0;
private["_pos1","_pos2","_dist","_jumper"];
while {true} do {
	_pos1 = getPosWorld player;
	uiSleep 1;
	_pos2 = getPosWorld player;
	if (NOTINVEH(player)) then {
		if ((_pos2 select 2 ) > 10) exitWith {};
		_dist = _pos1 distance2D _pos2;
		if (_dist > 40) then {
			if (FETCH_CONST(life_adminlevel) > 0) exitWith {};
			_jumper = true;
			{
				if ((_pos2 distance (getMarkerPos (_x select 0)) < (_x select 1)) OR (_pos1 distance (getMarkerPos (_x select 0)) < (_x select 1))) exitWith {
					_jumper = false;
				};
			} forEach _markers;
			if (_jumper) then {
				_pos1 = [round (_pos1 select 0),round (_pos1 select 1),round (_pos1 select 2)];
				_pos2 = [round (_pos2 select 0),round (_pos2 select 1),round (_pos2 select 2)];
				_dist = round(_pos1 distance2D _pos2);
				// player setPosWorld _pos1;
				_detected = _detected + 1;
				[format["Moved from %1 to %2 --> (%3 m) for 1 sec || %4 (%5)",_pos1,_pos2,_dist,GVAR_RNAME(player),steamid],"TELEPORT"] remoteExecCall ["RRPServer_system_logIt",2];
				['Possible TELEPORT!','SpyGlass','FFFF00',format ["Moved from %1 to %2 --> (%3 m) for 1 sec || %4 (%5)",_pos1,_pos2,_dist,GVAR_RNAME(player),steamid]] remoteExec ['RRPServer_discord_sendMessage',2];
				if (_detected > 10) then 
				{
					['CONFIRMED TELEPORT!','SpyGlass','FF0000',format ["Moved from %1 to %2 --> (%3 m) for 1 sec || %4 (%5)",_pos1,_pos2,_dist,GVAR_RNAME(player),steamid]] remoteExec ['RRPServer_discord_sendMessage',2];
					[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];
				};
			};
		};
	};
};
