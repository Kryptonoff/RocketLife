/*

	Filename: 	RRPClient_inventory_saveNew.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0, objnull, [objnull]];
if (isNull _unit) exitWith {[]};

call RRPClient_inventory_emptyUniformVest;

private _weaponMagazines = [];
{
	switch (_x select 0) do {
		case (primaryweapon _unit): {
			_PrimWepMag1Array = _x select 4;
			_PrimWepMag2Array = _x select 5;
			if !(_PrimWepMag1Array isEqualTo []) then {_weaponMagazines pushBack _PrimWepMag1Array};
			if !(_PrimWepMag2Array isEqualTo []) then {_weaponMagazines pushBack _PrimWepMag2Array};
		};
		case (secondaryweapon _unit): {
			_SecWepMag1Array = _x select 4;
			if !(_SecWepMag1Array isEqualTo []) then {_weaponMagazines pushBack _SecWepMag1Array};
		};
		case (handgunweapon _unit): {
			_HgWepMag1Array = _x select 4;
			if !(_HgWepMag1Array isEqualTo []) then {_weaponMagazines pushBack _HgWepMag1Array};
		};
		//теряется магазино от бинокля, нужен ли он вообще?
	};
} foreach (weaponsitems _unit);

private _assigned = [];
{
	_assigned pushBack ([_x] call RRPClient_system_tfRadioParent);
} forEach (assigneditems _unit);

private _backpackContainer = backpackContainer _unit;
private _return = [
	/* 00 */	uniform _unit, 
	/* 01 */	vest _unit, 
	/* 02 */	backpack _unit,
	/* 03 */	(itemCargo _backpackContainer) call RRPClient_inventory_packArray,
	/* 04 */	(backpackCargo _backpackContainer) call RRPClient_inventory_packArray,
	/* 05 */	(weaponCargo _backpackContainer) call RRPClient_inventory_packArray,
	/* 06 */	((magazinesAmmoCargo _backpackContainer) + _weaponMagazines) call RRPClient_inventory_packArray,
	/* 07 */	headgear _unit,
	/* 08 */	goggles _unit,
	/* 09 */	binocular _unit,
	/* 10 */	primaryweapon _unit, primaryWeaponItems _unit,
	/* 11 */	secondaryweapon _unit, secondaryWeaponItems _unit,
	/* 12 */	handgunweapon _unit, handgunItems _unit,
	/* 13 */	_assigned - [binocular _unit]
];

_return