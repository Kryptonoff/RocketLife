/*

	Filename: 	RRPClient_system_jip.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
"JIP - Search for Land Vehicle..." call RRPClient_system_log;
private ["_index","_material"];
{
	_index = _x GVAR ["life_VEH_color",""];
	if !(EQUAL(_index,"")) then {
		[_x,_index] call RRPClient_system_colorVehicle;
	};
	_material = _x GVAR ["Life_VEH_material",""];
	if !(EQUAL(_material,"")) then {
		[_x,_material] call RRPClient_system_materialVehicle;
	};
	//if ([typeof _x] call RRPClient_system_havePlate) then {[_x] call RRPClient_system_setPlate};
} foreach (allMissionObjects "LandVehicle");

"JIP - Search for Air Vehicle..." call RRPClient_system_log;
{
	_index = _x GVAR ["life_VEH_color",""];
	if !(EQUAL(_index,"")) then {
		[_x,_index] call RRPClient_system_colorVehicle;
	};
	//if ([typeof _x] call RRPClient_system_havePlate) then {[_x] call RRPClient_system_setPlate};
} foreach (allMissionObjects "Air");


"JIP - Colors, materials and plates updated" call RRPClient_system_log;
