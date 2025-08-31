/*

	Filename: 	RRPClient_inventory_addToSlot.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

	TODO: 
*/
#include "..\..\script_macros.hpp"
params ["_dropSlot", "_itemClass", "_itemAmmo"];
private _fnc_loadMagazine = {
	params ["_weapon", "_muzzleSelection"];
	_displayName = getText (configFile >> "CfgMagazines" >> _itemClass >> "displayName");
	_itemAmmoMax = getNumber(configfile >> "CfgMagazines" >> _itemClass >> "count");
	_searching = format["%1(%2/%3)", _displayName, _itemAmmo, _itemAmmoMax];
	_magazineDetail = magazinesDetail player;
	_idx = [_searching, _magazineDetail] call RRPClient_system_index;

	_selection = _magazineDetail select _idx;
	_split = _selection splitString "([ ]/:)";
	_split_count = count _split;

	_id = _split select (_split_count - 2);
	_cr = _split select (_split_count - 1);

	_muzzle = getArray(configFile >> "CfgWeapons" >> _weapon >> "muzzles") select _muzzleSelection;
	if (_muzzle isEqualTo "this") then {_muzzle = _weapon};

	player action ["loadmagazine", player, player, parsenumber _cr, parsenumber _id , _weapon, _muzzle];
};

private _fnc_addToHotkey = {
	params ["_itemClass", "_idx"];

	switch (getNumber (configFile >> "CfgWeapons" >> _itemClass >> "type")) do {
		case (1): {bind_number_array set [_idx, ["weapons", _itemClass]]};
		case (2): {bind_number_array set [_idx, ["weapons", _itemClass]]};
		case (4): {bind_number_array set [_idx, ["weapons", _itemClass]]};
		default {};
	};

	["bind_number_array", str bind_number_array] call RRPClient_reg_write;
	call RRPClient_hotkeys_hudWeaponUpdate;	
};

switch (_dropSlot) do {
	case "binocular";

	case "primWepPl": {[_itemClass, 0] call _fnc_addToHotkey; player addWeapon _itemClass};
	case "secWepPl": {[_itemClass, 1] call _fnc_addToHotkey; player addWeapon _itemClass};
	case "hgWepPl": {[_itemClass, 2] call _fnc_addToHotkey; player addWeapon _itemClass};

	case "primWepMuzzle";
	case "primWepFlash";
	case "primWepOptics";
	case "primWepBipod": {player addPrimaryWeaponItem _itemClass};

	case "secWepMuzzle";
	case "secWepFlash";
	case "secWepOptics";
	case "secWepBipod": {player addSecondaryWeaponItem _itemClass};

	case "hgWepMuzzle";
	case "hgWepFlash";
	case "hgWepOptics";
	case "hgWepBipod": {player addHandgunItem _itemClass};

	case "primWepMuzzleMag1": {[primaryWeapon player, 0] call _fnc_loadMagazine};
	case "primWepMuzzleMag2": {[primaryWeapon player, 1] call _fnc_loadMagazine};
	case "secWepMuzzleMag1": {[secondaryWeapon player, 0] call _fnc_loadMagazine};
	case "secWepMuzzleMag2": {[secondaryWeapon player, 1] call _fnc_loadMagazine};
	case "hgWepMuzzleMag1": {[handgunWeapon player, 0] call _fnc_loadMagazine};
	case "hgWepMuzzleMag2": {[handgunWeapon player, 1] call _fnc_loadMagazine};

	case "uniform": {player forceAddUniform _itemClass};
	case "vest": {player addVest _itemClass};
	case "backpack": {player addBackpack _itemClass};

	case "headgear": {player addHeadgear _itemClass};
	case "goggles": {player addGoggles _itemClass};
	
	case "hmd";
	case "compass";
	case "gps";
	case "map";
	case "radio";
	case "watch": {player linkItem _itemClass};

	default {hint format ["Ошибка! default remove from slot %1 / %2 ", _dropSlot, _itemClass]}; 
};

[_itemClass, true] call RRPClient_inventory_onTakeItem;