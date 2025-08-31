/*
	
	Filename: 	RRPClient_admin_getID.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _unit = CONTROL_DATA(2902);
_unit = call compile format["%1", _unit];
if(isNil "_unit" OR isNull _unit) exitwith {};

[[_unit,player],"system_getID"] call RRPClient_system_hcExec;