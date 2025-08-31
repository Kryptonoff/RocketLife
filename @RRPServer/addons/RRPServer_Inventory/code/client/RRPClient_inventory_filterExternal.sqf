/*

	Filename: 	RRPClient_inventory_filterExternal.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
if (isNull fl_inv_currentContainer) exitWith {
	private _display = findDisplay 1000;
	if (isNull _display) exitWith {};

	private _groundTab = _display displayCtrl 632;
	private _ca_ContainerBackground = _display displayCtrl 1001;
	private _titleContainerBackground = _display displayCtrl 1019;
	private _externalContainerBackground = _display displayCtrl 1240;

	if (ctrlShown _groundTab) then {
		_groundTab ctrlShow false;
		_ca_ContainerBackground ctrlShow false;
		_titleContainerBackground ctrlShow false;
		_externalContainerBackground ctrlShow false;
	};
};

disableSerialization;
private _display = findDisplay 1000;
if (isNull _display) exitWith {};

private _index = param [1, -1, [0]];
if (EQUAL(_index,-1)) exitWith {};

SVAR_UINS ["ExternalInv_Filter", _index];

private _groundTab = _display displayCtrl 632;
lbClear _groundTab;

if (_index in [0, 6]) then {
	private _data = fl_inv_currentContainer GVAR ["Trunk",[[],0]];
	_data = _data select 0;
	
	private "_icon";
	{
		_x params ["_itemClass", "_itemAmount"];
		if (_itemAmount > 0) then {
			_idx = switch (true) do { 
				case (_itemClass in ["money_virt","dmoney_virt"]): {_groundTab lbAdd format["$%1",[_itemAmount] call RRPClient_util_numberText]}; 
				case ("recipe_" in _itemClass): {_groundTab lbAdd format['[%1] - Рецепт: "%2"',_itemAmount, localize getText(missionConfigFile >> "LifeCfgRecipes" >> (_itemClass select [7,100]) >> "displayName")]}; 
				default {_groundTab lbAdd format["%1 x %2",_itemAmount,ITEM_NAME(_itemClass)]}; 
			};
			_icon = [ITEM_ICON(_itemClass), "\fatum_pack\icons\items\form_of_police.paa"] select ("recipe_" in _itemClass);
			_groundTab lbSetData [_idx, str [_itemClass, _itemAmount]];
			_groundTab lbSetPicture [_idx, _icon];
			_groundTab lbSetColor [_idx, [0,0.5,1,1]];
		};
	} foreach _data;
};

private _groundItems = (weaponCargo fl_inv_currentContainer + itemCargo fl_inv_currentContainer + magazinesAmmoCargo fl_inv_currentContainer + backpackCargo fl_inv_currentContainer);
private _itemsFinal = ((fl_inv_currentContainer GVAR ["inventory", [[], 0]]) select 0);
private _listed = [];
private ["_item","_itemCount"];
{
	if (!(_x in _listed) && !(_x isEqualTo "")) then {
		_item = _x;
		_listed pushBack _item;
		_itemCount = {_x isEqualTo _item} count _groundItems;
		_itemsFinal pushBack [_item,_itemCount];
	};
} forEach _groundItems;

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
			
			_idx = _groundTab lbAdd format ["%1 x%2%3", _amount, _ammoText, _itemDS select 1];
			_groundTab lbSetData [_idx, str[_itemDS select 0, _amount]];
			_groundTab lbSetValue [_idx,_ammo];
			_groundTab lbSetPicture [_idx,_itemDS select 2];
			_groundTab lbSetTooltip [_idx, _tooltipText];
		};
	};
} foreach _itemsFinal;

(_display displayCtrl 6556) ctrlEnable (lbSize _groundTab > 0);