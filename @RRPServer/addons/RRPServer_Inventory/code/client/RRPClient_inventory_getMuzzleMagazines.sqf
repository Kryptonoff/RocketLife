/*

	Filename: 	RRPClient_inventory_getMuzzleMagazines.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/
	
*/
#include "..\..\script_macros.hpp"
private _weapon = _this;
private _compatibleMagazines = [];
private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;

{
	_muzzle = if (_x == "this") then {_weaponCfg} else {_weaponCfg >> _x};
	_muzzleMagazines = [];

	{
		{
			_muzzleMagazines append (getArray _x);
		} foreach configproperties [configFile >> "CfgMagazineWells" >> _x,"isArray _x"];
	} foreach getArray (_muzzle >> "magazineWell");

	{
		_muzzleMagazines pushBackUnique _x;
	} foreach (getarray (_muzzle >> "magazines"));

	_compatibleMagazines pushBack [configName _muzzle, _muzzleMagazines];
} foreach getarray (_weaponCfg >> "muzzles");

_compatibleMagazines