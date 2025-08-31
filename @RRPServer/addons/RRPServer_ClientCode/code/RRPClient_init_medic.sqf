/*

	Filename: 	RRPClient_init_medic.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
waitUntil {!(isNull (findDisplay 46))};

player addRating 9999999;

[player,"medrank",('med' call RRPClient_groups_getSideLevel)] call CBA_fnc_setVarNet;
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;

if (player getVariable ["RRPVariablePartyMeatActive",false]) then {
    partyMeat call RRPClient_partymeat_startGaming;
} else {
    call RRPClient_spawn_Menu;
    waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
    waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

if (!(isNil "ClientEventInfo")) then {[] spawn RRPClient_events_effetcEventZone};
