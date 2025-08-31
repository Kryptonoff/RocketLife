/*

	Filename: 	RRPClient_inventory_removeFromSlot.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_dropSlot", "", [""]],
	["_itemClass", "", [""]],
	["_box", objNull, [objNull]],
	["_save", true, [true]]
];

private _removeFromHotkey = {
	if ((bind_number_array select _this) isNotEqualTo ["", ""]) then {
		bind_number_array set [_this, ["", ""]];
		["bind_number_array", str bind_number_array] call RRPClient_reg_write;
		call RRPClient_hotkeys_hudWeaponUpdate;
	};
};

private _collectSecondaryItems = {
	params ["_itemClass", "_box"];

	private _return = false;
	private _weaponsItemsPl = weaponsitems player;
	private _weaponsItemsCargo = weaponsItemsCargo backpackContainer player;
	{
		if (_x in _weaponsItemsCargo) then {_weaponsItemsPl set [_forEachIndex, -1]; _weaponsItemsCargo set [_weaponsItemsCargo find _x, -1]};
	} forEach _weaponsItemsPl;
	_weaponsItemsPl = _weaponsItemsPl - [-1];
	{
		if (_itemClass == _x select 0) exitWith {
			_Muzzle = _x select 1;
			_Flash = _x select 2;
			_Optics = _x select 3;
			_Mag1Array = _x select 4;
			_Mag2Array = _x select 5;
			_PrimWepBipod = _x select 6;

			private _adding_fnc = if (_box isEqualTo (backpackContainer player)) then {
				if (_Muzzle != "") then {[_Muzzle, 1, -1, false] call RRPClient_inventory_addItemToInventory};
				if (_Flash != "") then {[_Flash, 1, -1, false] call RRPClient_inventory_addItemToInventory};
				if (_Optics != "") then {[_Optics, 1, -1, false] call RRPClient_inventory_addItemToInventory};
				if !(_Mag1Array isEqualTo []) then {[_Mag1Array select 0, 1, _Mag1Array select 1, false] call RRPClient_inventory_addItemToInventory};
				if !(_Mag2Array isEqualTo []) then {[_Mag2Array select 0, 1, _Mag2Array select 1, false] call RRPClient_inventory_addItemToInventory};
				if (_PrimWepBipod != "") then {[_PrimWepBipod, 1, -1, false] call RRPClient_inventory_addItemToInventory};
			} else {
				if (_Muzzle != "") then {[_Muzzle, 1, -1, _box, false] call RRPClient_inventory_addToBox};
				if (_Flash != "") then {[_Flash, 1, -1, _box, false] call RRPClient_inventory_addToBox};
				if (_Optics != "") then {[_Optics, 1, -1, _box, false] call RRPClient_inventory_addToBox};
				if !(_Mag1Array isEqualTo []) then {[_Mag1Array select 0, 1, _Mag1Array select 1, _box, false] call RRPClient_inventory_addToBox};
				if !(_Mag2Array isEqualTo []) then {[_Mag2Array select 0, 1, _Mag2Array select 1, _box, false] call RRPClient_inventory_addToBox};
				if (_PrimWepBipod != "") then {[_PrimWepBipod, 1, -1, _box, false] call RRPClient_inventory_addToBox};
			};


			player removeWeapon _itemClass;
			_return = true;
		};
	} foreach _weaponsItemsPl;

	_return
};


private _return = false;
switch (_dropSlot) do {
	case "binocular";

	case "primWepPl": {0 call _removeFromHotkey; _return = [_itemClass, _box] call _collectSecondaryItems};
	case "secWepPl": {1 call _removeFromHotkey; _return = [_itemClass, _box] call _collectSecondaryItems};
	case "hgWepPl": {2 call _removeFromHotkey; _return = [_itemClass, _box] call _collectSecondaryItems};
	

	case "primWepMuzzle";
	case "primWepFlash";
	case "primWepOptics";
	case "primWepMuzzleMag1";
	case "primWepMuzzleMag2";
	case "primWepBipod" : {player removePrimaryWeaponItem _itemClass; _return = true;};

	case "secWepMuzzle";
	case "secWepFlash";
	case "secWepOptics";
	case "secWepMuzzleMag1";
	case "secWepMuzzleMag2";
	case "secWepBipod" : {player removeSecondaryWeaponItem _itemClass; _return = true;};

	case "hgWepMuzzle";
	case "hgWepFlash";
	case "hgWepOptics";
	case "hgWepMuzzleMag1";
	case "hgWepMuzzleMag2";
	case "hgWepBipod" : {player removeHandgunItem _itemClass; _return = true;};

	case "uniform" : {
		call RRPClient_inventory_emptyUniformVest;
		removeUniform player;

		_return = true;
	};
	case "vest" : {
		call RRPClient_inventory_emptyUniformVest;
		removeVest player;
		
		_return = true;
	};
	case "backpack" : {removeBackpack player; _return = true;};

	case "headgear" : {removeHeadgear player; _return = true;};
	case "goggles" : {removeGoggles player; _return = true;};
	
	case "hmd";
	case "compass";
	case "gps";
	case "map";
	case "radio";
	case "watch": {player unlinkItem _itemClass; _return = true;};

	default {[format ["Ошибка! default remove from slot %1 | %2 ", _dropSlot, _itemClass]] call hints}; 
};

[_itemClass, _save] call RRPClient_inventory_onPutItem;

_return