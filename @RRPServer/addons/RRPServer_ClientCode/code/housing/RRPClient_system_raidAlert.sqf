/*
	Filename: 	RRPClient_system_raidAlert.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _mode = param [0,0,[0]];

switch (_mode) do {
	case 0: {
		["Кто-то пытается проникнуть в ваше жилье!","info"] call RRPClient_system_hint;
		titleText["Кто-то пытается проникнуть в ваше жилье!","PLAIN"];
	};

	case 1: {
		["Полиция обыскивает ваше жилье!","police"] call RRPClient_system_hint;
		titleText["Полиция обыскивает ваше жилье!","PLAIN"];
	};
};

life_pvp = true;		
life_pvp_start = time;
[player,"houseRaid",true] call CBA_fnc_setVarNet;