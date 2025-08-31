/*

	Filename: 	RRPClient_inventory_getInventoryItems.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
private _items = items player + magazinesAmmo player + backpackCargo (backpackContainer player);

private _itemsFinal = [];
private _listed = [];
private ["_item","_itemCount"];
{
	if (!(_x in _listed) && !(_x isEqualTo "")) then {
		_item = _x;
		_listed pushBack _item;
		_itemCount = {_x isEqualTo _item} count _items;
		_itemsFinal pushBack [_item, _itemCount]
	};
} forEach _items;

_itemsFinal;