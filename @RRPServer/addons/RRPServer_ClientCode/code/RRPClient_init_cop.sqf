/*

	Filename: 	RRPClient_init_cop.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
waitUntil {!(isNull (findDisplay 46))};

player addRating 9999999;

[player,"copLevel",('cop' call RRPClient_groups_getSideLevel)] call CBA_fnc_setVarNet;
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;


switch (true) do {
    case (life_slave): {
		[player,"slave"] call RRPClient_system_clearGlobalVar;
		call RRPClient_system_sellSlaveAction;
    };

	case (player getVariable ["RRPVariablePartyMeatActive",false]): {
	   partyMeat call RRPClient_partymeat_startGaming;
	};

	default {
		call RRPClient_spawn_Menu;
	   	waitUntil{!isNull (findDisplay 38500)};
	   	waitUntil{isNull (findDisplay 38500)};
	};
};
if (!(isNil "ClientEventInfo")) then {[] spawn RRPClient_events_effetcEventZone};
if (('cop' call RRPClient_groups_getSideLevel) > 20) then {player setUnitTrait ["UAVHacker",true]};
