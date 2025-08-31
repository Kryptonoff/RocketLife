/*

	Filename: 	RRPClient_inventory_getItemMass.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
private _itemCfg = switch true do {
	case (isClass(configFile >> "CfgWeapons" >> _this)): {"CfgWeapons"};
	case (isClass(configFile >> "CfgMagazines" >> _this)): {"CfgMagazines"};
	case (isClass(configFile >> "CfgVehicles" >> _this)): {"CfgVehicles"};
	case (isClass(configFile >> "CfgGlasses" >> _this)): {"CfgGlasses"};

	default {""}
};
if (_itemCfg isEqualTo "") exitWith {-1};

private _mass = getNumber(configFile >> _itemCfg >> _this >> "mass");
if (_mass isEqualTo 0) then {
	_mass = getNumber(configFile >> _itemCfg >> _this >> "ItemInfo" >> "mass");
	if (_mass isEqualTo 0) then {_mass = getNumber(configFile >> _itemCfg >> _this >> "WeaponSlotsInfo" >> "mass")};
};

_mass