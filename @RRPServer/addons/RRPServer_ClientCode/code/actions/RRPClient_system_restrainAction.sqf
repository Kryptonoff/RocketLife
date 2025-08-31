/*
	Filename: 	RRPClient_system_restrainAction.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR (player distance _unit > 3) OR !isPlayer _unit OR EQUAL(player,_unit) OR ((_unit getVariable ["isBeginner",false]) and !(player call getSide isEqualTo "cop")) ) exitWith {};
if (GVAR_RESTRAINED(_unit)) exitWith {};

if (player getVariable ["surrender",false]) exitWith {};
if (player getVariable ["knoked",false]) exitWith {};
if (player getVariable ["tazed",false]) exitWith {};
if (player getVariable ["surrender",false]) exitWith {};

([player] call RRPClient_system_isSafeZone) params ["_isSafeZone","_isNeutralZone"];
if (_isSafeZone AND {!(player call getSide in ["cop","med"])}) exitWith {["Вы находитесь в зеленой зоне!"] call hints};
if (_isNeutralZone) exitWith {["Вы находитесь в нейтральной зоне!"] call hints};

if (([player] call RRPClient_system_isShopNear) && {!(player call getSide in ["cop","med"])}) exitWith { ["Вы находитесь рядом с продавцом!"] call hints };
if (_unit GVAR ["inPBfight",false]) exitWith {["Игрок участвует в сражении"] call hints};


[_unit,"restrained",true] call CBA_fnc_setVarNet;

private _isCop = (player call getSide) isEqualTo "cop";
private _sound = selectRandom ["action_ducttape_0", "action_ducttape_1", "action_ducttape_2"];
if (_isCop) then {
	_sound = "cuff";
	_unit setVariable ["restrainedCop", true, true];
};

private _dir = getDir _unit;
if (((_unit worldToModel (player modelToWorld [0, 0, 0])) select 1) < 0) then {
	_unit playActionNow "Disable_Gesture";
	player playActionNow "Disable_Gesture";
	_unit attachTo [player,[0,0,0]];
	[player,"ag_svyaz_backward_main",true] remoteExecCall ["RRPClient_system_animSync",-2];
	[_unit,"ag_svyaz_backward_victim",true] remoteExecCall ["RRPClient_system_animSync",-2];
	uiSleep 3.2;
	player say3D _sound;
	[player,_isCop,_sound,"ag_svyaz_Gestbackward_loop"] remoteExec ["RRPClient_system_restrain",_unit];
	uiSleep 0.248;
	_unit attachTo [player,[0,0.6,0]];
	[player,"",true] remoteExecCall ["RRPClient_system_animSync",-2];
	[_unit,"",true] remoteExecCall ["RRPClient_system_animSync",-2];
	detach _unit;
} else {
	_unit playActionNow "Disable_Gesture";
	player playActionNow "Disable_Gesture";
	_unit attachTo [player, [0,0.87,0.02]];
	[player,"ag_svyaz_main",true] remoteExecCall ["RRPClient_system_animSync",-2];
	[_unit,"ag_svyaz_victim",true] remoteExecCall ["RRPClient_system_animSync",-2];
	uiSleep 3;
	player say3D _sound;
	[player,_isCop,_sound,"ag_svyaz_GestForward_loop"] remoteExec ["RRPClient_system_restrain",_unit];
	uiSleep 0.125;
	[player,"",true] remoteExecCall ["RRPClient_system_animSync",-2];
	[_unit,"",true] remoteExecCall ["RRPClient_system_animSync",-2];
	detach _unit;
	[_unit,_dir] remoteExecCall ["RRPClient_system_setDir",-2];
};

titleText ["Цель задержана. Нажмите Win-key для взаимодействия", "PLAIN"];