/*

	Filename: 	RRPClient_inventory_itemDetailsShort.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

	new format: [_item,_displayName,_picture,_desc,_category]

*/
#include "..\..\script_macros.hpp"
private _item = _this;
if (EQUAL(_item,"") OR !(_item isEqualType "")) exitWith {[]};

if !(isNil {GVAR_MNS format ["IDS_%1",_item]}) exitWith {GVAR_MNS format ["IDS_%1",_item]}; //проверяем кэщ

private _cfg = switch (true) do {
	case (isClass (configFile >> "CfgMagazines" >> _item)) : {"CfgMagazines"};
	case (isClass (configFile >> "CfgWeapons" >> _item)) : {"CfgWeapons"};
	case (isClass (configFile >> "CfgVehicles" >> _item)) : {"CfgVehicles"};
	case (isClass (configFile >> "CfgGlasses" >> _item)) : {"CfgGlasses"};
	default {""};
};

if (EQUAL(_cfg,"")) exitWith {[]};
if !(_cfg isEqualType "") exitWith {[]};
if !(isClass (configFile >> _cfg >> _item)) exitWith {[]};

private _config = configFile >> _cfg >> _item;
private _displayName = getText (_config >> "displayName");
private _picture = getText (_config >> "picture");
private _desc = getText (_config >> "descriptionshort");

private _bis_ItemType = [_item] call RRPClient_inventory_itemType;
private _category = _bis_ItemType select 0;
private _type = _bis_ItemType select 1;

private _return = [_item,_displayName,_picture,_desc,_category,_type];

SVAR_MNS [format ["IDS_%1",_item],_return]; //кэшируем

_return