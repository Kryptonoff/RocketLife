/*

	Filename: 	RRPClient_inventory_removeItem.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\..\script_macros.hpp"
params [
	["_item","",[""]],
	["_itemAmmo",-1,[-1]]
];
if (EQUAL(_item,"")) exitWith {false};

private _itemInfo = _item call RRPClient_inventory_itemDetailsShort;
private _category = _itemInfo select 4;
private _type = _itemInfo select 5;

if (EQUAL(_category,"")) exitWith {false};

private _return = false;
switch (_category) do {
	case "Weapon": {
		_return = [_item] call RRPClient_inventory_removeItemFromInventory;
		if !(_return) then {
			switch (true) do {
				case (EQUAL(RIFLE,_item)) : {
					{
						if !(EQUAL(_x,"")) then {
							[_x] call RRPClient_inventory_addItemToInventory;
							player removePrimaryWeaponItem _x;
						};
					} forEach RIFLE_ITEMS;
					player removeWeapon _item;
					_return = true;
				};
				case (EQUAL(PISTOL,_item)) : {
					{
						if !(EQUAL(_x,"")) then {
							[_x] call RRPClient_inventory_addItemToInventory;
							player removeHandgunItem _x;
						};
					} forEach PISTOL_ITEMS;
					player removeWeapon _item;
					_return = true;
				};
				case (EQUAL(LAUNCHER,_item)) : {
					{
						if !(EQUAL(_x,"")) then {
							[_x] call RRPClient_inventory_addItemToInventory;
							player removeSecondaryWeaponItem _x;
						};
					} forEach LAUNCHER_ITEMS;
					player removeWeapon _item;
					_return = true;
				};
			};
		};
	};
	case "Equipment": {
		switch (_type) do {			
			case "Glasses": {
				_return = [_item] call RRPClient_inventory_removeItemFromInventory;
				if !(_return) then {
					if (EQUAL(PGOOGLES,_item)) then {
						removeGoggles player;
						_return = true;
					};
				};				
			};
			case "Headgear": {
				_return = [_item] call RRPClient_inventory_removeItemFromInventory;
				if !(_return) then {
					if (EQUAL(PHEADGEAR,_item)) then {
						removeHeadgear player;
						_return = true;
					};
				};
			};
			case "Vest": {
				_return = [_item] call RRPClient_inventory_removeItemFromInventory;
				if !(_return) then {
					if (EQUAL(PVEST,_item)) then {
						removeVest player;
						_return = true;
					};
				};
			};
			case "Uniform": {
				_return = [_item] call RRPClient_inventory_removeItemFromInventory;
				if !(_return) then {
					if (EQUAL(PUNIFORM,_item)) then {
						removeUniform player;
						_return = true;
					};
				};
			};
			case "Backpack": {
				private _backpacsIn = (getBackpackCargo (backpackContainer player)) select 0;
				if (_item in _backpacsIn) then {
					//если рюкзак в рюкзаке
					_return = [backpackContainer player, _item] call CBA_fnc_removeBackpackCargo;				
				};				
				//если их там не было, то видимо рюкзак одет на игроке - удаляем			
				if !(_return) then {
					if (EQUAL(PBACKPACK,_item)) then {
						removeBackpack player;
						_return = true;
					};
				};
			};
		};
	};
	case "Magazine": {
		_return = [_item,_itemAmmo] call RRPClient_inventory_removeMagazine;
		if !(_return) then {
			_return = [_item] call RRPClient_inventory_removeItemFromWeapon;
		};
	};
	case "Item": {
		switch (true) do {
			//сошки, глушаки, прицелы
			case (_type in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]) : {
				_return = [_item] call RRPClient_inventory_removeItemFromWeapon;
				if !(_return) then {
					_return = [_item] call RRPClient_inventory_removeItemFromInventory;
				};
			};
			default {
				_return = [_item] call RRPClient_inventory_removeItemFromInventory;
			};
		};
	};
	//теперь с минами
	case "Mine": {
		_return = [_item] call RRPClient_inventory_removeItemFromInventory;
	};
	default {
	    diag_log format["Error RRPClient_inventory_removeItem нет категории [%1] для этого предмета [%2]",_category,_item];
	};
};

[] spawn RRPClient_inventory_update;

_return