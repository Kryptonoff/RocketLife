/*

	Filename: 	RRPClient_vehicles_alarmSound.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _source = param [0,ObjNull,[ObjNull]];
if (isNull _source) exitWith {};
_source say3D "car_alarm";