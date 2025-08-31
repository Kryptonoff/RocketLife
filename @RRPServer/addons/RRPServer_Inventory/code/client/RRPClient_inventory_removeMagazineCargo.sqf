/*

	Filename: 	RRPClient_inventory_removeMagazineCargo.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_container", objNull, [objNull]], 
	["_itemClass", "", [""]], 
	["_count", 1, [0]],
	["_itemAmmo", -1, [0]]
];
if (isNull _container OR _itemClass isEqualTo "" OR _count < 1) exitWith {false};

private _magazinesAmmo = magazinesAmmoCargo _container;
clearMagazineCargoGlobal _container;

{
	_x params ["_magazineClass", "_magazineAmmo"];

	if (_count != 0 && {_magazineClass == _itemClass} && {_itemAmmo < 0 || {_magazineAmmo == _itemAmmo}}) then {
		_count = _count - 1;
	} else {
		_container addMagazineAmmoCargo [_magazineClass, 1, _magazineAmmo];
	};
} forEach _magazinesAmmo;

(_count == 0)