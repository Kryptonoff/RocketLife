/*

	Filename: 	RRPClient_system_loadInHB.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_bed","_units","_unit"];
_bed = param [0,ObjNull,[ObjNull]];
if (isNull _bed) exitWith {};
if (!isNull life_DraggedBody) exitWith {["Вы кого-то несете. Положите его сперва на землю"] call hints};

_units = nearestObjects[_bed,["Man"],5] - [player];
if (EQUAL(_units,[])) exitWith {};

{
	if (!isNil "_unit") exitWith {};
	if (LSINCAP(_x) && isPlayer _x) exitWith {_unit = _x};
} foreach _units;

if (isNil "_unit") exitWith {};

[_bed] remoteExecCall ["RRPClient_system_moveIn",_unit];