/*

	Filename: 	RRPClient_inventory_filterBackpack.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 1000;
if (isNull _display) exitWith {};

private _index = param [1, -1, [0]];
if (EQUAL(_index,-1)) exitWith {};

SVAR_UINS ["BackpackInv_Filter", _index];

private _backpackTab = _display displayCtrl 619;
lbClear _backpackTab;

if (_index in [0, 6]) then {
	private ["_itemAmount","_itemIcon"];
	{
		_itemAmount = missionNamespace getVariable [format ["life_inv_%1",getText(missionConfigFile >> "VirtualItems" >> configName _x >> "variable")],0];
		if (_itemAmount > 0) then {
			_idx = _backpackTab lbAdd format ["%1 x %2", _itemAmount, (getText(_x >> "displayName"))];
			_backpackTab lbSetData [_idx, str [configName _x, _itemAmount]];
			_backpackTab lbSetColor [_idx, [0,0.5,1,1]];
			_itemIcon = getText (_x >> "icon");
			if !(EQUAL(_itemIcon,"")) then {_backpackTab lbSetPicture [_idx, _itemIcon]};
		};
	} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
};

private _playerItems = call RRPClient_inventory_getInventoryItems;
private "_itemDS";
{
	_x params ["_item", "_amount"];
	_item params ["_item", ["_ammo", -1]];
	_itemDS = _item call RRPClient_inventory_itemDetailsShort;

	if !(EQUAL(_itemDS,[])) then {
		_good = switch (_index) do {
			case 0: {true};
			case 1: {EQUAL((_itemDS select 4),"Equipment")};
			case 2: {EQUAL((_itemDS select 4),"Weapon")};
			case 3: {EQUAL((_itemDS select 4),"Magazine") && !(EQUAL((_itemDS select 5),"UnknownMagazine"))};
			case 4: {EQUAL((_itemDS select 4),"Item") && ((_itemDS select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])};
			case 5: {EQUAL((_itemDS select 4),"Item") && !((_itemDS select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])};
			default {false};
		};

		if (_good) then {
			_ammoText = if (_ammo > 1 AND _itemDS#5 != "UnknownMagazine") then {format [" [%1 пат] ", _ammo]} else {" "};
			_tooltipText = _itemDS select 3;
			if (_tooltipText isEqualTo "" OR _itemDS#5 != "UnknownMagazine") then {
				_tooltipText = _itemDS select 1;
			} else {
				_tooltipText = [_tooltipText, ["<br />", "<br/>"], "\n"] call RRPClient_inventory_replaceArray;
			};
	
			_idx = _backpackTab lbAdd format ["%1 x%2%3", _amount, _ammoText, _itemDS select 1];
			_backpackTab lbSetData [_idx, str [_itemDS select 0, _amount]];
			_backpackTab lbSetValue [_idx,_ammo];
			_backpackTab lbSetPicture [_idx,_itemDS select 2];
			_backpackTab lbSetTooltip [_idx, _tooltipText];
		};
	};
} foreach _playerItems;

(_display displayCtrl 6557) ctrlEnable (lbSize _backpackTab > 0 OR (backpack player isEqualTo ""));