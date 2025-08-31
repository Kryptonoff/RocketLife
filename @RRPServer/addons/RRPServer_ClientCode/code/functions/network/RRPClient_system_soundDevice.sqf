/*

	Filename: 	RRPClient_system_soundDevice.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\..\script_macros.hpp"
if (isNull _this) exitWith {};
if (player distance _this > 2500) exitWith {}; //Don't run it... They're to far out..

while {true} do {
	if (isNull _this OR !alive _this) exitWith {};
	_min = _this GVAR "mining";
	if (isNil "_min") exitWith {};
	_this say3D "Device_disassembled_loop";
	uiSleep 28.6;
};