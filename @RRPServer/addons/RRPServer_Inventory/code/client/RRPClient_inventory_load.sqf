/*

	Filename: 	RRPClient_inventory_loadNew.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_inventory",[],[[]]]
];

if (isNull _unit) exitWith {};
if (EQUAL(_inventory,[])) exitWith {};

// Раскидываем данные по пременным
_inventory params [
	/* 00 */	"_uniform",
	/* 01 */	"_vest",
	/* 02 */	"_backpack",
	/* 03 */	"_itemCargo",
	/* 04 */	"_backpackCargo",
	/* 05 */	"_weaponCargo",
	/* 06 */	"_ammoCargo",
	/* 07 */	"_headgear",
	/* 08 */	"_goggles",
	/* 09 */	"_binocular",
	/* 10 */	"_primaryweapon", "_primaryweaponacc",
	/* 11 */	"_secondaryweapon", "_secondaryweaponacc",
	/* 12 */	"_handgunweapon", "_handgunweaponacc",
	/* 13 */	"_assigneditems"
];

// Добавляем форму с проверкой на существующий класс
if !(EQUAL(_uniform,"")) then {
	if (isclass (configfile >> "cfgWeapons" >> _uniform)) then {
		_unit forceadduniform _uniform;
	};
};


// Добавляем броник с проверкой на существующий класс
if !(EQUAL(_vest,"")) then {
	if (isclass (configfile >> "cfgWeapons" >> _vest)) then {
		_unit addvest _vest;
	};
};


// Добавляем рюкзак с проверкой на существующий класс
if !(EQUAL(_backpack,"")) then {
	if (isclass (configfile >> "cfgVehicles" >> _backpack)) then {		
		_unit addbackpack _backpack;
		clearAllItemsFromBackpack _unit;
	};
};

private _backpackContainer = backpackContainer player;
if (_itemCargo isNotEqualTo []) then {
	if ((_itemCargo select 0) isEqualType []) then {
		{_backpackContainer addWeaponCargoGlobal [_x select 0, _x select 1]} foreach _itemCargo;
	} else {
		{_backpackContainer addItemCargoGlobal [_x, 1]} foreach _itemCargo;
	};
};

if (_backpackCargo isNotEqualTo []) then {
	if ((_backpackCargo select 0) isEqualType []) then {
		{_backpackContainer addWeaponCargoGlobal [_x select 0, _x select 1]} foreach _backpackCargo;
	} else {
		{_backpackContainer addBackpackCargoGlobal [_x, 1]} foreach _backpackCargo;
	};
};

if (_weaponCargo isNotEqualTo []) then {
	if ((_weaponCargo select 0) isEqualType []) then {
		{_backpackContainer addWeaponCargoGlobal [_x select 0, _x select 1]} foreach _weaponCargo;
	} else {
		{_backpackContainer addWeaponCargoGlobal [_x, 1]} foreach _weaponCargo;
	};
};

if (_ammoCargo isNotEqualTo []) then {
	if (((_ammoCargo select 0) select 0) isEqualType []) then {
		{_backpackContainer addMagazineAmmoCargo [(_x select 0) select 0, _x select 1, (_x select 0) select 1]} forEach _ammoCargo;
	} else {
		{_backpackContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1]} forEach _ammoCargo;
	};
};

// Добавляем головной убор с проверкой на существующий класс
if !(EQUAL(_headgear,"")) then {
	if (isclass (configfile >> "cfgWeapons" >> _headgear)) then {
		_unit addheadgear _headgear;
	};
};

// Добавляем очки с проверкой на существующий класс
if !(EQUAL(_goggles,"")) then {
	if (isclass (configfile >> "cfgGlasses" >> _goggles)) then {
		_unit addgoggles _goggles;
	};
};

// Добавляем оружия и бинокль
{
	if !(EQUAL(_x,"")) then {
		_unit addweapon _x;
	};
} foreach [_binocular,_primaryweapon,_secondaryweapon,_handgunweapon];

// Ставим обвес на автомат
{
	if !(EQUAL(_x,"")) then {
		_unit addPrimaryWeaponItem _x;
	};
} forEach _primaryweaponacc;

// Ставим обвес на рпг
{
	if !(EQUAL(_x,"")) then {
		_unit addSecondaryWeaponItem _x;
	};
} forEach _secondaryweaponacc;

// Ставим обвес на пистолет
{
	if !(EQUAL(_x,"")) then {
		_unit addHandgunItem _x;
	};
} forEach _handgunweaponacc;

// Закидываем карту, компас и тд
{
	if !(EQUAL(_x,"")) then {
		_unit linkitem ([_x] call RRPClient_system_tfRadioParent);
	};
} forEach _assigneditems;

true