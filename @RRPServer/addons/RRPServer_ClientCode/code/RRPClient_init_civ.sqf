/*

	Filename: 	RRPClient_init_civ.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
waitUntil {!(isNull (findDisplay 46))};

player addRating 9999999;

[player,"lvl",('civ' call RRPClient_groups_getSideLevel)] call CBA_fnc_setVarNet;
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;
[player,"karma",life_karma] call CBA_fnc_setVarNet;

switch (true) do {
    case (life_is_arrested): {
		life_is_arrested = false;
		[player,true,life_jail_time] call RRPClient_system_jail;
    };

	case (life_slave): {
		[player,"slave"] call RRPClient_system_clearGlobalVar;
		call RRPClient_system_sellSlaveAction;
	};

	case (player getVariable ["RRPVariablePartyMeatActive",false]): {
	    partyMeat call RRPClient_partymeat_startGaming;
	};

	default {
		call RRPClient_spawn_Menu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	};
};
if (!(isNil "ClientEventInfo")) then {[] spawn RRPClient_events_effetcEventZone};
