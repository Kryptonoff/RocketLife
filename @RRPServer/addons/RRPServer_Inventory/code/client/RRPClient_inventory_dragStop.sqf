/*

	Filename: 	RRPClient_inventory_dragStop.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/
	
*/
#include "..\..\script_macros.hpp"
private _fnc_move = {
	private _display = (findDisplay 1000) createDisplay "custom_inventory_move";
	_display displayAddEventHandler ["Unload", {fl_inv_numberEnd = true}];
	private _hintTextCtrl = _display displayCtrl 1103;
	private _amountSliderCtrl = _display displayCtrl 1104;
	private _amountTextCtrl = _display displayCtrl 1105;
	private _moveButtonCtrl = _display displayCtrl 1106;
	private _itemAmountMax = if (isClass (missionConfigFile >> "VirtualItems" >> _itemClass)) then {
		if (_dropType isEqualTo "backpack_list") then {
			[_itemClass, _itemAmount, life_carryWeight, life_maxWeight] call RRPClient_inventory_canAddVirtItem
		} else {
			_currentWeight = (fl_inv_currentContainer getVariable ["Trunk",[[],0]]) select 1;
			_maxWeight = fl_inv_currentContainer call RRPClient_inventory_getContainerMaxMassVirt;
			[_itemClass, _itemAmount, _currentWeight, _maxWeight] call RRPClient_inventory_canAddVirtItem;
		};
	} else {
		if (_dropType isEqualTo "backpack_list") then {
			[_itemClass, _itemAmount, backpackContainer player] call RRPClient_inventory_canAddItem
		} else {
			[_itemClass, _itemAmount, fl_inv_currentContainer] call RRPClient_inventory_canAddItem
		};
	};
	_hintTextCtrl ctrlSetStructuredText parseText "<t align='center'>Укажите количество:</t>";
	_amountSliderCtrl ctrlAddEventHandler ["SliderPosChanged", '
		fl_inv_moveAmount = round (_this select 1);
		((findDisplay 1100) displayCtrl 1105) ctrlSetStructuredText parseText format["<t align=''center''>%1 / ' + str _itemAmountMax + '</t>", fl_inv_moveAmount]
	'];
	_amountSliderCtrl sliderSetRange [0, _itemAmountMax];
	_amountSliderCtrl sliderSetPosition _itemAmountMax;
	_amountSliderCtrl sliderSetSpeed [1, 1];
	_amountTextCtrl ctrlSetStructuredText parseText format["<t align='center'>%1 / %1</t>", _itemAmountMax];
	_moveButtonCtrl ctrlSetText "Переместить";
	_moveButtonCtrl buttonSetAction "fl_inv_numberEnd = true";
	fl_inv_numberEnd = false;
	fl_inv_moveAmount = _itemAmountMax;
	/*fl_inv_numberArray = [];
	private _ctrlText = (findDisplay 1000) ctrlCreate ["RscStructuredText", 1111];
	_ctrlText ctrlSetPosition [0.5, 0.25, 0.5, 0.25];
	_ctrlText ctrlSetBackgroundColor [0, 0, 0, 0.75];
	_ctrlText ctrlSetStructuredText parseText "<t align='center'>Укажите количество для перемещения с помощью клавиатуры и нажмите <t underline='1'>ENTER</t>:<br/><t size='3'>0</t></t>";
	_ctrlText ctrlCommit 0;
	ctrlSetFocus _ctrlText;

	fl_inv_numberEH = (findDisplay 1000) displayAddEventHandler ["KeyDown", {
		params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
		private _change = false;
		switch (_code) do { 
			case 2;
			case 3;
			case 4;
			case 5;
			case 6;
			case 7;
			case 8;
			case 9;
			case 10: {fl_inv_numberArray pushBack (_code - 1); _change = true}; 
			case 11: {fl_inv_numberArray pushBack 0; _change = true}; 
			case 14: {fl_inv_numberArray deleteAt (count fl_inv_numberArray) - 1; _change = true}; 

			case 15;
			case 28: {fl_inv_numberEnd = true; ctrlDelete ((findDisplay 1000) displayCtrl 1111); (findDisplay 1000) displayRemoveEventHandler ["KeyDown", fl_inv_numberEH]}; 
			default {}; 
		};
		if (_change) then {
			_numberStr = "";
			{_numberStr = _numberStr + str _x} forEach fl_inv_numberArray;
			((findDisplay 1000) displayCtrl 1111) ctrlSetStructuredText parseText format["<t align='center'>Укажите количество для перемещения с помощью клавиатуры и нажмите <t underline='1'>ENTER</t>:<br/><t size='3'>%1</t></t>", _numberStr];
		};
	}];*/
	waitUntil {fl_inv_numberEnd};
	if (isNull _display) exitWith {0};
	_display closeDisplay 1;
	fl_inv_moveAmount
};
disableSerialization;
params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

private _fl_inv_allowedDragInfo = if (!isNil "fl_inv_allowedDragInfo") then {fl_inv_allowedDragInfo} else {[]};
private _externalDragInfo = if (!isNil "fl_inv_externalDragInfo") then {fl_inv_externalDragInfo};
private _backpackDragInfo = if (!isNil "fl_inv_backpackDragInfo") then {fl_inv_backpackDragInfo};
private _slotDragInfo = if (!isNil "fl_inv_slotDragInfo") then {fl_inv_slotDragInfo};

fl_inv_allowedDragInfo = nil;
fl_inv_externalDragInfo = nil;
fl_inv_backpackDragInfo = nil;
fl_inv_slotDragInfo = nil;

if (_button != 0) exitWith {};

fl_inv_dragging = false;
["all"] call RRPClient_inventory_colorSlots;

private _idx = ctrl_positions findIf {(_x select 1) call RRPClient_inventory_inControl};
private _idxHotkey = hotkeys_controls findIf {_x call RRPClient_inventory_inControl};
if (_idxHotkey isNotEqualTo -1) exitWith {
	if (_idxHotkey in [0,1,2]) exitWith {["Горячие клавиши", "На первые три слота перманентно привязано оружие"] call toastError};
	if !(isNil "_backpackDragInfo") exitWith {
		_backpackDragInfo params ["_itemClass", "_itemAmount", "_itemAmmo"];
		_whiteListMagazine = getArray(missionconfigFile >> "LifeCfgSettings" >> "array_magazine_hotKey");
		_whiteListMagazine pushback getText(missionConfigFile >> "LifeCfgArcheology" >> "initItem");
		_whiteListMagazine = _whiteListMagazine + getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorArtefactItems") + getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorRadimetrItems") + getArray(missionConfigFile >> "LifeCfgAnomaly" >> "detectorAnomalyItems");
		
		if ("RRPItem_" in _itemClass or _itemClass in _whiteListMagazine) then {
			bind_number_array set [_idxHotkey, ["inventory", _itemClass]];
			["bind_number_array", str bind_number_array] call RRPClient_reg_write;
			call RRPClient_hotkeys_hudWeaponUpdate;
		} else {
			["Горячие клавиши", "Этот предмет нельзя назначить!"] call toastError;
		};
	};
	if !(isNil "_slotDragInfo") exitWith {
		_itemClass = uiNamespace getVariable [format["%1_class",_slotDragInfo], ""];
		if (_itemClass in [primaryWeapon player, secondaryWeapon player, handgunWeapon player, binocular player]) then {
			bind_number_array set [_idxHotkey, ["weapons", _itemClass]];
			["bind_number_array", str bind_number_array] call RRPClient_reg_write;
			call RRPClient_hotkeys_hudWeaponUpdate;
		};
	};
};
if (_idx isEqualTo -1) exitWith {};

private _dropType = ((ctrl_positions select _idx) select 0);
if !(_dropType in _fl_inv_allowedDragInfo) exitWith {};

private _success = false;
switch (_dropType) do {
	case "external": {
		if !(isNil "_backpackDragInfo") exitWith {
			_backpackDragInfo params ["_itemClass", "_itemAmount", "_itemAmmo"];
			_moveAmount = if (_shift AND _itemAmount != 1) then {call _fnc_move} else {1};
			if (_moveAmount < 1) exitWith {};

			_success = [_itemClass, _moveAmount, _itemAmmo] call RRPClient_inventory_removeFromInventory;
			if (_success) then {[_itemClass, _moveAmount, _itemAmmo, fl_inv_currentContainer] call RRPClient_inventory_addToBox};
		};

		if !(isNil "_slotDragInfo") exitWith {
			_itemClass = uiNamespace getVariable [format["%1_class",_slotDragInfo], ""];
			_itemAmmo = uiNamespace getVariable [format["%1Ammo_class",_slotDragInfo], -1];

			_success = [_slotDragInfo, _itemClass, fl_inv_currentContainer] call RRPClient_inventory_removeFromSlot;
			if (_success) then {[_itemClass, 1, _itemAmmo, fl_inv_currentContainer] call RRPClient_inventory_addToBox};
		};
	};

	case "backpack_list": {
		if !(isNil "_externalDragInfo") exitWith {
			_externalDragInfo params ["_itemClass", "_itemAmount", "_itemAmmo"];
			_moveAmount = if (_shift AND _itemAmount != 1) then {call _fnc_move} else {1};
			if (_moveAmount < 1) exitWith {};

			_success = [_itemClass, _moveAmount, _itemAmmo, fl_inv_currentContainer] call RRPClient_inventory_removeFromBox;
			if (_success) then {[_itemClass, _moveAmount, _itemAmmo] call RRPClient_inventory_addItemToInventory} else {HINT_2("Ошибка! Не получилось удалить предмет!", _dropType, _externalDragInfo)};
		};
		
		if !(isNil "_slotDragInfo") exitWith {
			_itemClass = uiNamespace getVariable [format["%1_class",_slotDragInfo], ""];
			_itemAmmo = uiNamespace getVariable [format["%1Ammo_class",_slotDragInfo], -1];
			
			_success = [_slotDragInfo, _itemClass, backpackContainer player, false] call RRPClient_inventory_removeFromSlot;
			if (_success) then {[_itemClass, 1, _itemAmmo] call RRPClient_inventory_addItemToInventory};
		};
	};

	default {
		if !(isNil "_externalDragInfo") exitWith {
			_externalDragInfo params ["_itemClass", "_itemAmount", "_itemAmmo"];

			private _occupiedItemClass = uiNamespace getVariable [format["%1_class", _dropType], ""];
			private _occupiedItemAmmo = uiNamespace getVariable [format["%1Ammo_class", _dropType], -1];
			if !(_occupiedItemClass isEqualTo "") then {
				[_dropType, _occupiedItemClass, fl_inv_currentContainer, false] call RRPClient_inventory_removeFromSlot;
				[_occupiedItemClass, 1, _occupiedItemAmmo, fl_inv_currentContainer, false] call RRPClient_inventory_addToBox;
			};
			_success = [_itemClass, 1, _itemAmmo, fl_inv_currentContainer] call RRPClient_inventory_removeFromBox;
			if (_success) then {[_dropType, _itemClass, _itemAmmo] call RRPClient_inventory_addToSlot} else {HINT_2("Ошибка! Не получилось удалить предмет!", _dropType, _externalDragInfo)};
		};

		if !(isNil "_backpackDragInfo") exitWith {
			_backpackDragInfo params ["_itemClass", "_itemAmount", "_itemAmmo"];

			private _occupiedItemClass = uiNamespace getVariable [format["%1_class", _dropType], ""];
			private _occupiedItemAmmo = uiNamespace getVariable [format["%1Ammo_class", _dropType], -1];
			if !(_occupiedItemClass isEqualTo "") then {
				[_dropType, _occupiedItemClass, backpackContainer player, false] call RRPClient_inventory_removeFromSlot;
				[_occupiedItemClass, 1, _occupiedItemAmmo, false] call RRPClient_inventory_addItemToInventory
			};
			_success = if !(_dropType in ["primWepMuzzleMag1", "primWepMuzzleMag2", "secWepMuzzleMag1", "secWepMuzzleMag2", "hgWepMuzzleMag1", "hgWepMuzzleMag2"]) then {[_itemClass, 1, _itemAmmo, false] call RRPClient_inventory_removeFromInventory} else {true};
			if (_success) then {[_dropType, _itemClass, _itemAmmo] call RRPClient_inventory_addToSlot};
		};
	}; 
};

[] spawn RRPClient_inventory_update;