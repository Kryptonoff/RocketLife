/*

	Filename: 	RRPClient_system_vehSetupRadio.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (EQUAL(_vehicle,objNull)) exitWith {};

[_vehicle,"tf_hasRadio",true] call CBA_fnc_setVarNet;
switch (player call getSide) do {
	case "cop": {
		[_vehicle,"tf_side","west"] call CBA_fnc_setVarNet;
		[_vehicle,"TF_RadioType","tf_rt1523g"] call CBA_fnc_setVarNet;
		[_vehicle,"tf_range",60000] call CBA_fnc_setVarNet;
	};
	case "civ": {
		[_vehicle,"tf_side","independent"] call CBA_fnc_setVarNet;
		[_vehicle,"TF_RadioType","tf_anprc155"] call CBA_fnc_setVarNet;
		[_vehicle,"tf_range",30000] call CBA_fnc_setVarNet;
	};
	case "reb": {
		[_vehicle,"tf_side","independent"] call CBA_fnc_setVarNet;
		[_vehicle,"TF_RadioType","tf_anprc155"] call CBA_fnc_setVarNet;
		[_vehicle,"tf_range",30000] call CBA_fnc_setVarNet;
	};
	case "med": {
		[_vehicle,"tf_side","east"] call CBA_fnc_setVarNet;
		[_vehicle,"TF_RadioType","tf_mr3000"] call CBA_fnc_setVarNet;
		[_vehicle,"tf_range",60000] call CBA_fnc_setVarNet;
	};
};