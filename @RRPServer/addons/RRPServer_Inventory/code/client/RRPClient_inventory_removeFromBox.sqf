/*

	Filename: 	RRPClient_inventory_removeFromBox.sqf
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
	["_container", objNull, [objNull]],
	["_save", true, [true]]
];
if (EQUAL(_itemClass,"") OR isNull _container) exitWith {false};
	
(_itemClass call RRPClient_inventory_itemType) params ["_itemCategory", "_itemType"];
if (EQUAL(_itemCategory,"")) exitWith {false};

if ((typeOf _container in ["Land_LuggageHeap_03_F", LIFE_SETTINGS(getText,"life_trunkClass")] OR _container getVariable ["shelter_container", false] OR _container getVariable ["safe_container", false]) AND _itemCategory != "VirtualItem") exitWith {
	(_container GVAR ["inventory", [[], 0]]) params ["_containerItems", "_currentWeight"];
	
	private _itemWeight = _itemClass call RRPClient_inventory_getItemMass;
	private _itemArray = if (_itemAmmo != -1) then {[_itemClass,_itemAmmo]} else {_itemClass};
	private _indexH = [_itemArray,_containerItems] call RRPClient_system_index;
	if (EQUAL(_indexH,-1)) exitWith {systemChat str ["У вас нет такого предмета в хранилище", _itemArray]; false};
	
	private _val = (_containerItems select _indexH) select 1;
	if (_itemAmount > _val) exitWith {systemChat "У вас нет такого количества предметов в хранилище"; false};
	
	if (EQUAL((_val - _itemAmount),0)) then {
		_containerItems set [_indexH,[-1]];
		_containerItems = _containerItems - [[-1]];
	} else {
		_containerItems set[_indexH,[_itemArray,_val - _itemAmount]];
	};
	_container SVAR ["inventory",[_containerItems, (_currentWeight - (_itemWeight * _itemAmount))], true];

	if (_save) then {[_container, "Inventory", player] call RRPClient_inventory_saveContainer};

	true
};

private _return = false;
switcH (_itemCategory) do {
	case "VirtualItem": {
		_return = [false, _itemClass, _itemAmount, _container, _save] call RRPClient_inventory_handleVehInv;
	};
	case "Weapon": {
		_return = [_container, _itemClass, _itemAmount, false] call CBA_fnc_removeWeaponCargo;
	};
    case "Mine";
	case "Magazine": {
		_return = [_container, _itemClass, _itemAmount, _itemAmmo] call RRPClient_inventory_removeMagazineCargo;
	};
	default {
		switch (_itemType) do { 
			case "Backpack": {_return = [_container, _itemClass, _itemAmount, false] call CBA_fnc_removeBackpackCargo}; 
			case "Binocular"; 
			case "LaserDesignator": {_return = [_container, _itemClass, _itemAmount, false] call CBA_fnc_removeWeaponCargo}; 
			default {_return = [_container, _itemClass, _itemAmount, false] call CBA_fnc_removeItemCargo}; 
		};
	};
};

_return