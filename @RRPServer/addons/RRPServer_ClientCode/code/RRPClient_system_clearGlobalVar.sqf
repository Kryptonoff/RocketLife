/*

	Filename: 	RRPClient_system_clearGlobalVar.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
params [
	["_object",objNull,[objNull,grpNull]],
	["_var","",[""]]
];
if (isNull _object) exitWith {};
if (EQUAL(_var,"")) exitWith {};

if (!isNil {_object GVAR _var}) then {
	_object SVAR [_var,nil,true];
	format["ClearGlobalVar - %1 isNil",_var] call RRPClient_system_log;
};