/*
	
	Filename: 	RRPClient_system_nearUnits.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
params [
	["_faction","error",[""]],
	["_position",(getPosWorld player),[[]]],
	["_radius",30,[0]]	
];

if (EQUAL(_faction,"error")) exitWith {false};

private _ret = false;

_ret = {_x != player && {_x call getSide == _faction} && {alive _x} && {_position distance _x < _radius}} count playableUnits > 0;
_ret;