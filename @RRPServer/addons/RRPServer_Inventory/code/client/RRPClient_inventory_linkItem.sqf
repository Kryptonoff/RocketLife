/*

	Filename: 	RRPClient_inventory_linkItem.sqf
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
	//оружие самое ценное, поэтому не допускаем пропадания и замены
	case "Weapon": {
		private _config = configFile >> "CfgWeapons" >> _itemClass;
		if (!isClass _config OR {getNumber (_config >> "scope") < 1}) exitWith {_return};
		//можем ли добавить прямо в руки
		private _canAdd = switch (getNumber (_config >> "type")) do {
			case (1): {EQUAL(RIFLE,"")};
			case (2): {EQUAL(PISTOL,"")};
			case (4): {EQUAL(LAUNCHER,"")};
			default {false};
		};
		//добавляем, если нужнй слот свободен
		if (_canAdd) then {
			player addWeapon _itemClass;
			if (_itemClass in LIFE_SETTINGS(getArray,"life_gatherTools")) then {
				if (EQUAL((secondaryWeaponMagazine player),[])) then {
					player addSecondaryWeaponItem "Fatum_Magazine_Swing";
				};
			};
			_return = true;
		} else {
			_return = false;
		};
	};
	//со шмотками у нас попроще, главное сохранить содержимое
	case "Equipment": {
		switch (_itemType) do {
			case "Glasses": {
				if (EQUAL(PGOOGLES,"")) then {
					player addGoggles _itemClass;
					_return = true;
				} else {
					[PGOOGLES] call RRPClient_inventory_addItemToInventory; //попробуем добавить текущий предмет в инвентарь
					removeGoggles player;
					player addGoggles _itemClass;
					_return = true;
				};
			};
			case "Headgear": {
				if (EQUAL(PHEADGEAR,"")) then {
					player addHeadGear _itemClass;
					_return = true;
				} else {
					[PHEADGEAR] call RRPClient_inventory_addItemToInventory; //попробуем добавить текущий предмет в инвентарь
					removeHeadGear player;
					player addHeadgear _itemClass;
					_return = true;
				};
			};
			case "Vest": {
				if (EQUAL(PVEST,"")) then {
					player addVest _itemClass;
					_return = true;
				} else {
					[PVEST] call RRPClient_inventory_addItemToInventory; //попробуем добавить текущий предмет в инвентарь
					private _items = PVEST_ITEMS;
					removeVest player;
					player addVest _itemClass;
					{
						[_x] call RRPClient_inventory_addItemToInventory;
					} forEach _items;
					_return = true;
				};
			};
			case "Uniform": {
				if (EQUAL(PUNIFORM,"")) then {
					player forceAddUniform _itemClass;
					_return = true;
				} else {
					[PUNIFORM] call RRPClient_inventory_addItemToInventory; //попробуем добавить текущий предмет в инвентарь
					private _items = PUNIFORM_ITEMS;
					removeUniform player;
					player forceAddUniform _itemClass;
					{
						[_x] call RRPClient_inventory_addItemToInventory;
					} forEach _items;
					_return = true;
				};
			};
			case "Backpack": {
				if (EQUAL(PBACKPACK,"")) then {
					player addBackpack _itemClass;
					clearAllItemsFromBackpack player;
					_return = true;
				} else {
					private _backpackContainer = backpackContainer player;
					_itemCargo = itemCargo _backpackContainer;
					_backpackCargo = backpackCargo _backpackContainer;
					_weaponCargo = weaponCargo _backpackContainer;
					_ammoCargo = magazinesAmmoCargo _backpackContainer;
					
					removeBackpack player;
					player addBackpack _itemClass;

					clearAllItemsFromBackpack player;
					_backpackContainer = backpackContainer player;
					{_backpackContainer addItemCargoGlobal [_x, 1]} foreach _itemCargo;
					{_backpackContainer addBackpackCargoGlobal [_x, 1]} foreach _backpackCargo;
					{_backpackContainer addWeaponCargoGlobal [_x, 1]} foreach _weaponCargo;
					{_backpackContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1]} forEach _ammoCargo;

					_return = true;
				};
			};
			default {_return = false};
		};
	};

	//теперь со всяким хламом
	case "Item": {
		switch (true) do {
			//сошки, глушаки, прицелы
			case (_itemType in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]) : {
				//надо определить для какого оружия эта хуйня подходит
				private _weapon = switch (true) do {
					case (_itemClass in ([RIFLE] call CBA_fnc_compatibleItems)) : {"rifle"};
					case (_itemClass in ([PISTOL] call CBA_fnc_compatibleItems)) : {"pistol"};
					case (_itemClass in ([LAUNCHER] call CBA_fnc_compatibleItems)) : {"launcher"};
					default {""};
				};
				
				//теперь попробуем добавить на пушку исходя из предыдущего варианта, или же просто в инвентарь
				switch (_weapon) do {
					case "rifle" : {
						if !(_itemClass in RIFLE_ITEMS) then {
							player addPrimaryWeaponItem _itemClass;
							_return = true;
						} else {
							_return = false;
						};
					}; 
					case "pistol" : {
						if !(_itemClass in PISTOL_ITEMS) then {
							player addHandgunItem _itemClass;
							_return = true;
						} else {
							_return = false;
						};
					}; 
					case "launcher" : {
						if !(_itemClass in LAUNCHER_ITEMS) then {
							player addSecondaryWeaponItem _itemClass;
							_return = true;
						} else {
							_return = false;
						};
					};
					default {_return = false}; 
				};
			};
			//карта, бинокль и т.д.
			case (_itemType in ["Compass","GPS","Map","Radio","Watch","NVGoggles","UAVTerminal","LaserDesignator","Binocular"]) : {
				if (_itemClass in (assignedItems player)) then {
					_return = false;
				} else {
					switch (true) do { 
						case (EQUAL(_itemType,"Binocular")) : {
							_return = true;
							player addWeapon _itemClass;
						};
						default {
							_return = true;
							player linkItem _itemClass;
						}; 
					};
				};
			}; 
			default {_return = false};
		};
	};
	case "Magazine": {
		_return = false;
	};
	case "Mine": {
		_return = false;
	};
	default {
	    diag_log format["Error RRPClient_inventory_linkItem нет категории [%1] для этого предмета [%2]",_itemCategory,_itemClass];
	};
};

_return