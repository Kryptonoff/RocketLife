/*

	Filename: 	RRPClient_inventory_removeFromInventory.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]],
	["_itemAmount", 1, [0]],
	["_itemAmmo", -1, [-1]],
	["_save", true, [true]]
];
if (_itemClass isEqualTo "") exitWith {false};

(_itemClass call RRPClient_inventory_itemType) params ["_itemCategory", "_itemType"];
if (_itemCategory isEqualTo "") exitWith {false};

private _return = false;
//private _itemRemovedAmount = -1;
switcH (true) do {
	case (_itemCategory isEqualTo "VirtualItem"): {
		_return = [false, _itemClass, _itemAmount] call RRPClient_inventory_handleInv;
	};
	case (_itemCategory isEqualTo "Magazine" AND _itemAmmo != -1): {
		private _oldMagazines = (magazinesAmmo player) select {(_x select 0) isEqualTo _itemClass};
		if !([_itemClass, _itemAmmo] in _oldMagazines) exitWith {false};
		
		player removeMagazines _itemClass;
		
		private _toDelete = _itemAmount;
		{
			if (_x isEqualTo [_itemClass,_itemAmmo] AND _toDelete != 0) then {
				_toDelete = _toDelete - 1;	
			} else {
				(backpackContainer player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
			};
		} forEach _oldMagazines;

		//_itemRemovedAmount = _itemAmount - _toDelete;
		_return = _toDelete isEqualTo 0;
	};
	case (_itemType isEqualTo "Backpack"): {
		_return = [backpackContainer player, _itemClass, _itemAmount, false] call CBA_fnc_removeBackpackCargo;
	};
	default {
		_oldCount = count itemsWithMagazines player;
		for "_i" from 1 to _itemAmount do {player removeItem _itemClass};

		//_itemRemovedAmount = _oldCount;
		_return = (count itemsWithMagazines player isEqualTo (_oldCount - _itemAmount));	
	};
};

[_itemClass, _save] call RRPClient_inventory_onPutItem;

_return