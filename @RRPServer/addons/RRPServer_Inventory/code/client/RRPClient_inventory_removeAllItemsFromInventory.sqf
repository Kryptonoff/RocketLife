/*

	Filename: 	RRPClient_inventory_removeAllItemsFromInventory.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
private _takeButton = (findDisplay 1000) displayCtrl 6557;
_takeButton ctrlEnable false;

private ["_itemAmount", "_itemClass"];
{
	_itemClass = configName _x;
	_itemAmount = ITEM_VALUE(_itemClass);

	if (_itemAmount > 0) then {
		if (LIFE_SETTINGS(getNumber,"life_useFuelTrucks") isEqualTo 1) then {
			private _truck = typeOf fl_inv_currentContainer;
			if (EQUAL(_truck,"Land_LuggageHeap_03_F")) exitWith {};
		
			private _fuelStuff = LIFE_SETTINGS(getArray,"life_fuelStuff");
			private _fuelTrucks = LIFE_SETTINGS(getArray,"life_fuelTrucks");
			
			switch (true) do {
				case (!(_itemClass in _fuelStuff) && (_truck in _fuelTrucks)): {_itemAmount = -1};
				case ((_itemClass in _fuelStuff) && !(_truck in _fuelTrucks)): {_itemAmount = -1};
			};
		};
		if (_itemAmount isEqualTo -1) exitWith {};
		_itemAmount = [_itemClass, _itemAmount, ((fl_inv_currentContainer getVariable ["Trunk",[[],0]]) select 1), (fl_inv_currentContainer call RRPClient_inventory_getContainerMaxMassVirt)] call RRPClient_inventory_canAddVirtItem;

		if (_itemAmount > 0) then {
			if ([false, _itemClass, _itemAmount] call RRPClient_inventory_handleInv) then {
				[_itemClass, _itemAmount, -1, fl_inv_currentContainer, false] call RRPClient_inventory_addToBox;
			};
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

private _playerItems = call RRPClient_inventory_getInventoryItems;
{
	_x params ["_itemClass", "_itemAmount"];
	_itemClass params ["_itemClass", ["_ammo", -1]];
	_itemAmount = [_itemClass, _itemAmount, fl_inv_currentContainer] call RRPClient_inventory_canAddItem;

	if (_itemAmount > 0) then {
		if ([_itemClass, _itemAmount, _ammo, false] call RRPClient_inventory_removeFromInventory) then {
			[_itemClass, _itemAmount, _ammo, fl_inv_currentContainer, false] call RRPClient_inventory_addToBox;
		};
	};
} foreach _playerItems;

[] call RRPClient_system_saveGear;
[fl_inv_currentContainer, "All", player] call RRPClient_inventory_saveContainer;

[] spawn RRPClient_inventory_update;

_takeButton ctrlEnable true;