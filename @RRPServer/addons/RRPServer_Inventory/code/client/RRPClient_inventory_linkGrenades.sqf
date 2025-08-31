/*

	Filename: 	RRPClient_inventory_linkGrenades.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
private _grenades = magazines player select {_x call BIS_fnc_isThrowable};
private _neededNades = _grenades arrayIntersect _grenades;
{
	player removeMagazine _x;
	player addMagazine _x;
} forEach _neededNades;