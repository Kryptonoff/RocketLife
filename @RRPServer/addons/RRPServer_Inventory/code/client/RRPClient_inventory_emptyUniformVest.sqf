/*

	Filename: 	RRPClient_inventory_emptyUniformVest.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
private _uniformContainer = uniformContainer player;
private _vestContainer = vestContainer player;
private _backpackContainer = backpackContainer player;

if !((uniformItems player) isEqualTo []) then {
	{clearMagazineCargoGlobal _uniformContainer; _backpackContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1]} forEach (magazinesAmmoCargo _uniformContainer);
	{clearItemCargoGlobal _uniformContainer; _backpackContainer addItemCargoGlobal [_x, 1]} foreach (itemCargo _uniformContainer);
	{clearBackpackCargo _uniformContainer; _backpackContainer addBackpackCargoGlobal [_x, 1]} foreach (backpackCargo _uniformContainer);
	{clearWeaponCargo _uniformContainer; _backpackContainer addWeaponCargoGlobal [_x, 1]} foreach (weaponCargo _uniformContainer);
};

if !((vestItems player) isEqualTo []) then {
	{clearMagazineCargoGlobal _vestContainer; _backpackContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1]} forEach (magazinesAmmoCargo _vestContainer);
	{clearItemCargoGlobal _vestContainer; _backpackContainer addItemCargoGlobal [_x, 1]} foreach (itemCargo _vestContainer);
	{clearBackpackCargo _vestContainer; _backpackContainer addBackpackCargoGlobal [_x, 1]} foreach (backpackCargo _vestContainer);
	{clearWeaponCargo _vestContainer; _backpackContainer addWeaponCargoGlobal [_x, 1]} foreach (weaponCargo _vestContainer);
};

if !([(uniformItems player), (vestItems player)] isEqualTo [[],[]]) exitWith {hint ("Ошибка! Сообщите администрации emptyunn " + str ([(uniformItems player), (vestItems player)]))}