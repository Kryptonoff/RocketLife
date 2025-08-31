/*

	Filename: 	RRPClient_system_onGetOutMan.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_position","",[""]],
	["_vehicle",objNull,[objNull]],
	["_turret",[],[[]]]
];

_vehicle removeAction AID_VEHOUT;
_vehicle removeAction AID_VEHNITRO;
_vehicle removeAction AID_VEHPARA;
if (EQUAL(life_dhl_car,_vehicle)) then {
	_vehicle removeAction AID_VEHDHM;
};

call RRPClient_system_updateViewDistance;