/*

	Filename: 	RRPClient_inventory_removeAllItemsFromGround.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
private _takeButton = (findDisplay 1000) displayCtrl 6556;
_takeButton ctrlEnable false;

private _groundVirtItems = +(fl_inv_currentContainer getVariable ["Trunk",[[],0]]) select 0;
{
	_x params ["_itemClass", "_itemAmount"];
	if ([_itemClass] call RRPClient_system_canUseItem) then {
		_itemAmount = [_itemClass, _itemAmount, life_carryWeight, life_maxWeight] call RRPClient_inventory_canAddVirtItem;

		if (_itemAmount > 0) then {
			if ([false, _itemClass, _itemAmount, fl_inv_currentContainer, false] call RRPClient_inventory_handleVehInv) then {
				[true, _itemClass, _itemAmount] call RRPClient_inventory_handleInv;
			};
		};
	};
} foreach _groundVirtItems;

private _groundItems = (weaponCargo fl_inv_currentContainer + itemCargo fl_inv_currentContainer + magazinesAmmoCargo fl_inv_currentContainer + backpackCargo fl_inv_currentContainer);
private _itemsFinal = ((fl_inv_currentContainer getVariable ["inventory", [[], 0]]) select 0);
private _listed = [];
private ["_item", "_itemCount"];
{
	if (!(_x in _listed) && !(_x isEqualTo "")) then {
		_item = _x;
		_listed pushBack _item;
		_itemCount = {_x isEqualTo _item} count _groundItems;
		_itemsFinal pushBack [_item, _itemCount];
	};
} forEach _groundItems;

{
	_x params ["_itemClass", "_itemAmount"];
	_itemClass params ["_itemClass", ["_ammo", -1]];
	if ([_itemClass] call RRPClient_system_canUseItem) then {
		_itemAmount = [_itemClass, _itemAmount, backpackContainer player] call RRPClient_inventory_canAddItem;
	
		if (_itemAmount > 0) then {
			if ([_itemClass, _itemAmount, _ammo, fl_inv_currentContainer, false] call RRPClient_inventory_removeFromBox) then {
				[_itemClass, _itemAmount, _ammo, false, false] call RRPClient_inventory_addItems;
			};
		};
	};
} foreach _itemsFinal;

[] call RRPClient_system_saveGear;
[fl_inv_currentContainer, "All", player] call RRPClient_inventory_saveContainer;

[] spawn RRPClient_inventory_update;

_takeButton ctrlEnable true;