/*

	Filename: 	RRPClient_evh_onPlayerKilled.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];

if !(EQUAL(_unit,_killer)) exitWith {};

if ((vehicle _unit) != _unit) then {
	unassignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

["all"] call RRPClient_system_removeBuff;
false call RRPClient_hud_show;
call RRPClient_effects_Terminate;

// (getPlayerUID _unit) remoteExecCall ["RRPServer_session_deletePlayerData",2];
[(getPlayerUID _unit),"session_deletePlayerData"] call RRPClient_system_hcExec;

cutText["","BLACK OUT",0];
1 fadeSound 0;
playMusic "DeathMusic";

[_unit,"medicStatus"] call RRPClient_system_clearGlobalVar;
[_unit,"lifeState","DEAD"] call CBA_fnc_setVarNet;

life_medicstatus = -1;
life_medicstatusby = "";

disableSerialization;
if (!isNull (findDisplay 49)) then {(findDisplay 49) closeDisplay 0} else {closeDialog 0};
call RRPClient_snow_onPlayerDied;
["Death_Screen_V2"] call RRPClient_gui_DestroyRscLayer;
[_unit] spawn RRPClient_system_respawnScreen;
