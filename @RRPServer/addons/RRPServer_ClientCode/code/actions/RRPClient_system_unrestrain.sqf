/*
	
	Filename: 	RRPClient_system_unrestrain.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR !(GVAR_RESTRAINED(_unit))) exitWith {};

[_unit,"restrained"] call RRPClient_system_clearGlobalVar;
[_unit,"isBlind"] call RRPClient_system_clearGlobalVar;
player playAction "ag_unTiedSomeone";

detach _unit;
titleText[format ["Вы освободили руки %1",GVAR_RNAME(_unit)],"PLAIN"];