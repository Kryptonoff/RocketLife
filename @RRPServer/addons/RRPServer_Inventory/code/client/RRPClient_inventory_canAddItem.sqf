/*

	Filename: 	RRPClient_inventory_canAddItem.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]],
	["_itemAmount", -1, [0]],
	["_container", objNull, [objNull]]
];
if (EQUAL(_itemClass,"") OR EQUAL(_itemAmount,-1) OR isNull _container) exitWith {0};

private _itemWeight = _itemClass call RRPClient_inventory_getItemMass;
private _currentWeight = switch (true) do {
	case (_container getVariable ["shelter_container", false]);
	case (_container getVariable ["safe_container", false]);
	case (typeOf _container in ["Land_LuggageHeap_03_F", LIFE_SETTINGS(getText,"life_trunkClass")]): {(_container GVAR ["inventory", [[], 0]]) select 1};

	default {_container call RRPClient_inventory_getContainerLoadAbs};
};
//if (_currentWeight isEqualTo 0) exitWith {hint '_currentWeight = 0'};

private _maxWeight = _container call RRPClient_inventory_getContainerMaxMass;
if ((_currentWeight + _itemWeight) > _maxWeight) exitWith {0};

private _return = _itemAmount;
if ((_currentWeight + (_itemWeight * _itemAmount)) > _maxWeight) then {
	for "_i" from _itemAmount to 0 step -1 do {
		_return = _i;
		if ((_currentWeight + (_itemWeight * _return)) <= _maxWeight) exitWith {};
	};
};

_return;