/*

	Filename: 	RRPClient_inventory_addItems.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]],
	["_itemAmount", 1, [0]],
	["_itemAmmo", -1, [-1]],
	["_doLink", false, [false]],
	["_save", true, [true]]
];
if (EQUAL(_itemClass,"")) exitWith {false};

private _linked = false;
if (_doLink AND {[_itemClass] call RRPClient_inventory_linkItem}) then {_itemAmount = _itemAmount - 1; _linked = true};
if (_itemAmount < 1) exitWith {_linked};

[_itemClass, _itemAmount, _itemAmmo, _save] call RRPClient_inventory_addItemToInventory;