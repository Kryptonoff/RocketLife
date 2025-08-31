/*

	Filename: 	RRPClient_system_resHBClient.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];

private _cP = 0;
private _error = false;
private _title = format["%1 реанимирует вас",GVAR_RNAME(_unit)];
player say3D "defib";
titleText[_title,"PLAIN"];

while {true} do {
	uiSleep 0.15;
	_cP = _cP + 0.01;
	[_cP,"medic"] call RRPClient_system_progressBar;
	if (_cP >= 1) exitWith {};
	if (GVAR_RESTRAINED(_unit) OR {player distance _unit > 4} OR {!alive _unit} OR {(_unit GVAR ["tazed",false])}) exitWith {_error = true};
	if !(LSINCAP(player)) exitWith {_error = true};
	if (player GVAR ["reviving",ObjNull] != _unit) exitWith {_error = true};
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
[player,"reviving"] call RRPClient_system_clearGlobalVar;

if (_error) exitWith {titleText["Реанимация прервана!","PLAIN"];};

[player,"medicStatus"] call RRPClient_system_clearGlobalVar;
player SVAR ["tf_unable_to_use_radio", false];
player setUnconscious false;

["Death_Screen_V2"] call RRPClient_gui_DestroyRscLayer;
player setDamage 0;

if !((_unit call getSide) in ["cop","med"]) then {
	private _chance = if (["washing"] call perk) then {50}else{100};
	if (random 100 < _chance) then {
		RRPClientDeleteAmmoTime = time + (10 * 60)
	};
};

if ((_unit call getSide) isEqualTo "med") then 
{
	private _reviveFee = (getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_revive_fee")) * 2;
	_reviveFee = if (('med' call RRPClient_groups_getSideLevel) >= 5) then {_reviveFee * 2} else {_reviveFee};
	[_unit,"atm","add",_reviveFee] remoteExecCall ["RRPServer_system_moneyChange",2];
	["SuccessTitleAndText",["Реанимация",format ["Вы успешно провели реанимацию и получили $%1 в качестве награды",[_reviveFee] call RRPClient_util_numberText]]] remoteExec ["toast",_unit]
};

[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;

2 fadeSound 1;
cutText ["Вы приходите в себя...", "BLACK IN", 5];
uiSleep 4;

["all"] call RRPClient_system_removeBuff;
if (isNull LIFE_HANDLE_HUD) then {LIFE_HANDLE_HUD = [] spawn RRPClient_hud_init};
if (isNull LIFE_HANDLE_EFFECTS) then {LIFE_HANDLE_EFFECTS = [] spawn RRPClient_effects_Init};