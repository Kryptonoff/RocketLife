/*

	Filename: 	RRPClient_inventory_removeItems.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]],
	["_itemAmount", 1, [0]],
	["_itemAmmo", -1, [-1]],
	["_doUnlink", false, [false]]
];
if (EQUAL(_itemClass,"")) exitWith {false};

private _return = [_itemClass, _itemAmount, _itemAmmo] call RRPClient_inventory_removeFromInventory;
if (_return) exitWith {true};

private _unlinked = false;
if (_doUnlink AND {[_itemClass] call RRPClient_inventory_unlinkItem}) then {_unlinked = true};

_unlinked