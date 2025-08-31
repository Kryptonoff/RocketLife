/*

	Filename: 	RRPClient_inventory_addItemToInventory.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]],
	["_itemAmount", 1, [0]],
	["_itemAmmo", -1, [-1]],
	["_save", true, [true]]
];
if (EQUAL(_itemClass,"")) exitWith {false};

(_itemClass call RRPClient_inventory_itemType) params ["_itemCategory", "_itemType"];
if (EQUAL(_itemCategory,"")) exitWith {false};

private _canAdd = if (_itemCategory isEqualTo "VirtualItem") then {
	[_itemClass, _itemAmount, life_carryWeight, life_maxWeight] call RRPClient_inventory_canAddVirtItem
} else {
	[_itemClass, _itemAmount, backpackContainer player] call RRPClient_inventory_canAddItem
};

private _container = if (_canAdd >= _itemAmount) then {
	backpackContainer player
} else {
	private _weaponHolder = nearestObject [player, "WeaponHolderSimulated_Scripted"];
	if (isNull _weaponHolder OR {player distance _weaponHolder > 3}) then {
	    _weaponHolder = createVehicle ["WeaponHolderSimulated_Scripted", [0,0,0], [], 0, "NONE"];
	    _weaponHolder setPosASL getPosASL player;
	};
	["У вас в инвентаре нет свободного места, поэтому предмет был сброшен на землю! Не забудьте его подобрать!", "error"] call RRPClient_gui_hint;
	
	_weaponHolder
};

private _return = false;
switcH (_itemCategory) do {
	case "VirtualItem": {
		_return = if (_container isEqualTo (backpackContainer player)) then {
			[true, _itemClass, _itemAmount] call RRPClient_inventory_handleInv;
		} else {
			[true, _itemClass, _itemAmount, _container, false] call RRPClient_inventory_handleVehInv;
		};
	};
	case "Weapon": {
		_container addWeaponCargoGlobal [_itemClass, _itemAmount];
		_return = true;
	};
	case "Mine";
	case "Magazine": {
		_container addMagazineAmmoCargo [_itemClass, _itemAmount, _itemAmmo];
		_return = true;
	};
	default {
		if (EQUAL(_itemType,"Backpack")) then {
			_container addBackpackCargoGlobal [_itemClass, _itemAmount];
			_return = true;
		} else {			
			_container addItemCargoGlobal [_itemClass, _itemAmount];
			_return = true;
		};
	};
};

if (_container isEqualTo (backpackContainer player)) then {[_itemClass, _save] call RRPClient_inventory_onTakeItem};

_return