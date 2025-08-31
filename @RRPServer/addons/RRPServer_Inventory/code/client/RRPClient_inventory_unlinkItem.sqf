/*

	Filename: 	RRPClient_inventory_unlinkItem.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]]
];
if (EQUAL(_itemClass,"")) exitWith {false};

private _itemInformation = _itemClass call RRPClient_inventory_itemType;
private _itemCategory = _itemInformation select 0;
private _itemType = _itemInformation select 1;

if (EQUAL(_itemCategory,"")) exitWith {false};

private _return = false;
switch (_itemCategory) do {
	case "Weapon": {
		switch (true) do {
			case (EQUAL(RIFLE,_itemClass)) : {
				{
					if !(EQUAL(_x,"")) then {
						[_x] call RRPClient_inventory_addItemToInventory;
						player removePrimaryWeaponItem _x; 
					};
				} forEach RIFLE_ITEMS;
				player removeWeapon _itemClass;
				_return = true;
			};
			case (EQUAL(PISTOL,_itemClass)) : {
				{
					if !(EQUAL(_x,"")) then {
						[_x] call RRPClient_inventory_addItemToInventory;
						player removeHandgunItem _x;
					};
				} forEach PISTOL_ITEMS;
				player removeWeapon _itemClass;
				_return = true;
			};
			case (EQUAL(LAUNCHER,_itemClass)) : {
				{
					if !(EQUAL(_x,"")) then {
						[_x] call RRPClient_inventory_addItemToInventory;
						player removeSecondaryWeaponItem _x;
					};
				} forEach LAUNCHER_ITEMS;
				player removeWeapon _itemClass;
				_return = true;
			};
		};
	};
	case "Equipment": {
		switch (_itemType) do {			
			case "Glasses": {
				if (EQUAL(PGOOGLES,_itemClass)) then {
					removeGoggles player;
					_return = true;
				};
			};
			case "Headgear": {
				if (EQUAL(PHEADGEAR,_itemClass)) then {
					removeHeadgear player;
					_return = true;
				};
			};
			case "Vest": {
				if (EQUAL(PVEST,_itemClass)) then {
					removeVest player;
					_return = true;
				};
			};
			case "Uniform": {
				if (EQUAL(PUNIFORM,_itemClass)) then {
					removeUniform player;
					_return = true;
				};
			};
			case "Backpack": {
				private _backpacsIn = (getBackpackCargo (backpackContainer player)) select 0;
				if (_itemClass in _backpacsIn) then {
					//если рюкзак в рюкзаке
					_return = [backpackContainer player, _itemClass] call CBA_fnc_removeBackpackCargo;				
				};				
				//если их там не было, то видимо рюкзак одет на игроке - удаляем			
				if (EQUAL(PBACKPACK,_itemClass)) then {
					removeBackpack player;
					_return = true;
				};
			};
		};
	};
	case "Item": {
		switch (true) do {
			//сошки, глушаки, прицелы
			case (_itemType in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]) : {
				switch (true) do {
					case (_itemClass in (primaryWeaponItems player + primaryWeaponMagazine player)): {
						player removePrimaryWeaponItem _itemClass;
						_return = true;
					};
					case (_itemClass in (secondaryWeaponMagazine player + secondaryWeaponItems player)): {
						player removeSecondaryWeaponItem _itemClass;
						_return = true;
					};
					case (_itemClass in (handgunMagazine player + handgunItems player)): {
					 	player removeHandgunItem _itemClass;
						_return = true;
					};
					default {};
				};
			};
			case (_itemType in ["Compass","GPS","Map","Radio","Watch","NVGoggles","UAVTerminal","LaserDesignator","Binocular"]) : {
				if (_itemClass in (assignedItems player)) then {
					switch (true) do { 
						case (EQUAL(_itemType,"Binocular")) : {
							player removeWeapon _itemClass;
							_return = true;
						};
						default {
							player unlinkItem _itemClass;
							_return = true;
						}; 
					};
				} else {
					_return = false
				};
			}; 
			default {
				_return = false;
			};
		};
	};
	case "Magazine": {
		_return = false;
	};
	//теперь с минами
	case "Mine": {
		_return = false;
	};
	default {
	    diag_log format["Error RRPClient_inventory_unlinkItem нет категории [%1] для этого предмета [%2]",_itemCategory,_itemClass];
	};
};


_return