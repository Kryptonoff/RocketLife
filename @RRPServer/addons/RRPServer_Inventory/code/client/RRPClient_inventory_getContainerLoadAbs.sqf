/*

	Filename: 	RRPClient_inventory_getContainerLoadAbs.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
private _items = magazineCargo _this + itemCargo _this + backpackCargo _this + weaponCargo _this;
private _totalMass = 0;

{
	_totalMass = _totalMass + (_x call RRPClient_inventory_getItemMass);
} forEach _items;

_totalMass