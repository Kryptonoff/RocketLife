/*

	Filename: 	RRPClient_system_isFlatnumber.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _value = _this select 0;
private _valid = ["0","1","2","3","4","5","6","7","8","9","."];
private _array = _value splitString "";
private _return = true;

{
	if !(_x in _valid) then {_return = false};
} foreach _array;

_return;