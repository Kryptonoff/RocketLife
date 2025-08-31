/*

	Filename: 	RRPClient_inventory_open.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
if !(canSuspend) exitWith {_this spawn RRPClient_inventory_open};
if (life_dance OR life_action_inUse OR ([player] call RRPClient_system_isInputBlocked)/* OR life_opening*/) exitWith {["Дождитесь окончания действия", "error"] call RRPClient_gui_hint};
if !(isNull (findDisplay 1000)) exitWith {["Уже открыт", "error"] call RRPClient_gui_hint};

private _externalContainer = param [0, objNull];
private _externalUse = false;
private _insideContainer = objectParent player;
private _insideUse = false;

if !(isNull _externalContainer) then {
	if (((locked _externalContainer) < 2 OR _externalContainer in life_vehicles) AND !([_externalContainer] call RRPClient_system_isContainerInUse) AND !(_externalContainer isKindOf "Man")) then {
		fl_inv_currentContainer = _externalContainer;
		_externalUse = true;
	};
};
if (!(_externalUse) AND !(isNull _insideContainer)) then {
	if (((locked _insideContainer) < 2 OR _insideContainer in life_vehicles) AND !([_insideContainer] call RRPClient_system_isContainerInUse)) then {
		fl_inv_currentContainer = _insideContainer;
		_insideUse = true;
	};
};
/* И если теперь ничего нет :( */
if (!_externalUse AND !_insideUse AND isNull _insideContainer) then {
	_externalContainers = nearestObjects [player, ["WeaponHolderSimulated"], 2.5] select {!([_x] call RRPClient_system_isContainerInUse)};
	if (_externalContainers isEqualTo []) then {
		(getPosASL player) params ["_xPos", "_yPos", "_zPos"];
		_position = [_xPos + 0.2, _yPos + 0.2, _zPos];
		_helper = createVehicle ["Land_HelipadEmpty_F", [0,0,0], [], 0, "NONE"];
		_helper setPosASL _position;

		_externalContainer = createVehicle ["WeaponHolderSimulated_Scripted", [0,0,0], [], 0, "NONE"];
		_externalContainer setPosASL _position;

		_externalContainer attachTo [_helper];
	} else {
		_externalContainer = _externalContainers select 0;
	};
	fl_inv_currentContainer = _externalContainer;
};
if (isNull fl_inv_currentContainer) exitWith {["Инвентарь недоступен", "error"] call RRPClient_gui_hint};

life_opening = true;
private _connected = call RRPClient_inventory_checkConnection;
if !(_connected) exitWith {["Вы потеряли соединение с сервером!", "error"] call RRPClient_gui_hint;life_opening = false;};
life_opening = false;

disableSerialization;
private _display = (findDisplay 46) createDisplay "custom_inventory";
if (isNull _display) exitWith {["Откройте инвентарь еще раз", "error"] call RRPClient_gui_hint};

_display displayAddEventHandler ["KeyDown", {
	params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
	if ([player,false] call RRPClient_system_isInputBlocked && {!(_code in [15,207])}) exitWith {true};
	if ([player] call RRPClient_system_isInputBlocked && {!(_code in [15,17,30,31,32,207])}) exitWith {true};
	!(_code in [1,15,17,30,31,32,207])
}];

[fl_inv_currentContainer, "openedByUnit", getPlayerUID player] call CBA_fnc_setVarNet;

/* Tabs */
private _groundTab = _display displayCtrl 632;
private _backpackTab = _display displayCtrl 619;

/* Save postions */
if (isNil "ctrl_positions") then {
	ctrl_positions = [
		["uniform", ctrlPosition (_display displayCtrl 6331)],
		["vest", ctrlPosition (_display displayCtrl 6381)],
		["backpack", ctrlPosition (_display displayCtrl 6191)],
		["headgear", ctrlPosition (_display displayCtrl 6240)],
		["goggles", ctrlPosition (_display displayCtrl 6216)],
		["hmd", ctrlPosition (_display displayCtrl 6217)],
		["compass", ctrlPosition (_display displayCtrl 6212)],
		["gps", ctrlPosition (_display displayCtrl 6215)],
		["map", ctrlPosition (_display displayCtrl 6211)],
		["radio", ctrlPosition (_display displayCtrl 6214)],
		["watch", ctrlPosition (_display displayCtrl 6213)],
		["binocular", ctrlPosition (_display displayCtrl 6238)],
		["primWepPl", ctrlPosition (_display displayCtrl 610)],
		["primWepMuzzle", ctrlPosition (_display displayCtrl 620)],
		["primWepFlash", ctrlPosition (_display displayCtrl 622)],
		["primWepOptics", ctrlPosition (_display displayCtrl 621)],
		["primWepMuzzleMag1", ctrlPosition (_display displayCtrl 623)],
		["primWepMuzzleMag2", ctrlPosition (_display displayCtrl 644)],
		["primWepBipod", ctrlPosition (_display displayCtrl 641)],
		["secWepPl", ctrlPosition (_display displayCtrl 611)],
		["secWepMuzzle", ctrlPosition (_display displayCtrl 624)],
		["secWepFlash", ctrlPosition (_display displayCtrl 626)],
		["secWepOptics", ctrlPosition (_display displayCtrl 625)],
		["secWepMuzzleMag1", ctrlPosition (_display displayCtrl 627)],
		["secWepBipod", ctrlPosition (_display displayCtrl 642)],
		["hgWepPl", ctrlPosition (_display displayCtrl 612)],
		["hgWepMuzzle", ctrlPosition (_display displayCtrl 628)],
		["hgWepFlash", ctrlPosition (_display displayCtrl 630)],
		["hgWepOptics", ctrlPosition (_display displayCtrl 629)],
		["hgWepMuzzleMag1", ctrlPosition (_display displayCtrl 631)],
		["hgWepBipod", ctrlPosition (_display displayCtrl 643)],
		["external", ctrlPosition _groundTab],
		["backpack_list", ctrlPosition _backpackTab]
	];
};
/* Titles */
[] call RRPClient_inventory_setTitle;

/* Filters */
private _filterGround = _display displayCtrl 6554;
_filterGround lbAdd "Все";
_filterGround lbAdd "Одежда";
_filterGround lbAdd "Оружие";
_filterGround lbAdd "Магазины";
_filterGround lbAdd "Аксессуары";
_filterGround lbAdd "Предметы";
_filterGround lbAdd "Виртуальные предметы";
_filterGround lbSetCurSel 0;

private _filterBackpack = _display displayCtrl 6555;
_filterBackpack lbAdd "Все";
_filterBackpack lbAdd "Одежда";
_filterBackpack lbAdd "Оружие";
_filterBackpack lbAdd "Магазины";
_filterBackpack lbAdd "Аксессуары";
_filterBackpack lbAdd "Предметы";
_filterBackpack lbAdd "Виртуальные предметы";
_filterBackpack lbSetCurSel 0;

/* ETC */
_display displayAddEventHandler ["MouseMoving", {
	params ["_display"/*, "_mouseX", "_mouseY"*/];

	_ctrlBackground = _display displayCtrl 9300;
	if !(isNull _ctrlBackground) then {
		if !((ctrlPosition _ctrlBackground) call RRPClient_inventory_inControl) then {
			ctrlDelete _ctrlBackground;
			if !(isNull (_display displayCtrl 9301)) then {ctrlDelete (_display displayCtrl 9301)};
			if !(isNull (_display displayCtrl 9302)) then {ctrlDelete (_display displayCtrl 9302)};
			if !(isNull (_display displayCtrl 9303)) then {ctrlDelete (_display displayCtrl 9303)};
			if !(isNull (_display displayCtrl 9304)) then {ctrlDelete (_display displayCtrl 9304)};
		};
	};
}];

lastKeybindPressed = -1;
_display displayAddEventHandler ["MouseButtonDown", {
	params ["_display", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	private _idxHotkey = hotkeys_controls findIf {_x call RRPClient_inventory_inControl};
	if (_idxHotkey in [0,1,2]) exitWith {["Горячие клавиши", "На первые три слота перманентно привязано оружие"] call toastError};
	
	if (_idxHotkey isNotEqualTo -1 AND {(bind_number_array select _idxHotkey) isNotEqualTo ["", ""]}) then {
		if (lastKeybindPressed isEqualTo _idxHotkey) then {
			bind_number_array set [_idxHotkey, ["", ""]];
			["bind_number_array", str bind_number_array] call RRPClient_reg_write;
			call RRPClient_hotkeys_hudWeaponUpdate;
			["Горячие клавиши", "Горячая клавиша сброшена!"] call toastSuccess;
		} else {
			lastKeybindPressed = _idxHotkey;
			["Горячие клавиши", "Чтобы сбросить горячую клавишу - нажмите на нее еще раз"] call toastInfo;
		};
	};
}];

_backpackTab ctrlAddEventHandler ["MouseButtonDown", {
	params ["_control", "_button"];
	if (_button != 1) exitWith {};
	fl_inv_backpackSelChanged = false;
	[{fl_inv_backpackSelChanged}, {
		private _backpackCurSel = lbCurSel _this;
		if (_backpackCurSel isEqualTo -1 OR (_this lbData _backpackCurSel) isEqualTo "") exitWith {["Нужно сначала выбрать предмет", "error"] call RRPClient_gui_hint};
		(parseSimpleArray (_this lbData _backpackCurSel) + [_this lbValue _backpackCurSel]) call RRPClient_inventory_rightClick;
	}, _control, 60] call CBA_fnc_waitUntilAndExecute;
}];

_backpackTab ctrlAddEventHandler ["LBSelChanged", {
	fl_inv_backpackSelChanged = true;
}];

_backpackTab ctrlAddEventHandler ["LBDrag", {
	_lbInfo = _this select 1 select 0;
	_itemData = (parseSimpleArray (_lbInfo select 2));
	fl_inv_backpackDragInfo = _itemData + [_lbInfo select 1];
	call RRPClient_inventory_allowedSlots;
}];
_groundTab ctrlAddEventHandler ["LBDrag", {
	_lbInfo = _this select 1 select 0;
	_itemData = (parseSimpleArray (_lbInfo select 2));
	fl_inv_externalDragInfo = _itemData + [_lbInfo select 1];
	call RRPClient_inventory_allowedSlots;
}];

_backpackTab ctrlAddEventHandler ["LBDblClick", {
	params ["_control", "_selectedIndex"];
	_lbInfo = (parseSimpleArray (_control lbData _selectedIndex)) + [(_control lbValue _selectedIndex)];
	_lbInfo params ["_itemClass", "_itemAmount", "_itemAmmo"];

	fl_inv_backpackDragInfo = [_itemClass, 1, _itemAmmo];
	call RRPClient_inventory_allowedSlots;
	if !("external" in fl_inv_allowedDragInfo) exitWith {fl_inv_allowedDragInfo = nil; fl_inv_backpackDragInfo = nil};
	fl_inv_allowedDragInfo = nil; fl_inv_backpackDragInfo = nil;

	_success = [_itemClass, 1, _itemAmmo] call RRPClient_inventory_removeFromInventory;
	if (_success) then {[_itemClass, 1, _itemAmmo, fl_inv_currentContainer] call RRPClient_inventory_addToBox};

	[] spawn RRPClient_inventory_update;
	[] call RRPClient_system_saveGear;
}];
_groundTab ctrlAddEventHandler ["LBDblClick", {
	params ["_control", "_selectedIndex"];
	_lbInfo = (parseSimpleArray (_control lbData _selectedIndex)) + [(_control lbValue _selectedIndex)];
	_lbInfo params ["_itemClass", "_itemAmount", "_itemAmmo"];

	fl_inv_externalDragInfo = [_itemClass, 1, _itemAmmo];
	call RRPClient_inventory_allowedSlots;
	if !("backpack_list" in fl_inv_allowedDragInfo) exitWith {fl_inv_allowedDragInfo = nil; fl_inv_externalDragInfo = nil};
	fl_inv_allowedDragInfo = nil; fl_inv_externalDragInfo = nil;

	_success = [_itemClass, 1, _itemAmmo, fl_inv_currentContainer] call RRPClient_inventory_removeFromBox;
	if (_success) then {[_itemClass, 1, _itemAmmo] call RRPClient_inventory_addItemToInventory};

	[] spawn RRPClient_inventory_update;
	[] call RRPClient_system_saveGear;
}];

//other
/*if (_externalContainer getVariable ["safe_container", false]) then {
	_ground1Button = _display displayCtrl 6558;
	_ground1Button ctrlShow true;

	_maxSlots = getNumber(missionConfigFile >> "LifeCfgSafe" >> "maxSlots");
	if (sr_safe_slots >= _maxSlots) exitWith {
		_ground1Button ctrlSetText "Максимальное количество слотов!";
		_ground1Button ctrlEnable false;
	};

	_ground1Button ctrlSetText "Увеличить количество слотов";
	_ground1Button buttonSetAction "[] spawn RRPClient_BoxUpgradeSlots";
};*/

[{_this getVariable ["openedByUnit", ""] != steamid OR ([player] call RRPClient_system_isInputBlocked) OR isNull (findDisplay 1000) OR (player distance _this > 5 AND _this != objectParent player)}, {(findDisplay 1000) closeDisplay 1; deleteVehicle sr_safe_container/*hint str [_this getVariable ["openedByUnit", ""], _this getVariable ["openedByUnit", ""] != steamid, ([player] call RRPClient_system_isInputBlocked), isNull (findDisplay 1000), (player distance _this > 5 AND _this != objectParent player)]*/}, fl_inv_currentContainer] call CBA_fnc_waitUntilAndExecute;

call RRPClient_inventory_emptyUniformVest;
["all"] call RRPClient_inventory_colorSlots;
[] spawn RRPClient_inventory_update;

playSound "zipper";