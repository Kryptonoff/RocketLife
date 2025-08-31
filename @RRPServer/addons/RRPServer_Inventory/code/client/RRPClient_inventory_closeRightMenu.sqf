/*

	Filename: 	RRPClient_inventory_closeRightMenu.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
private _display = findDisplay 1000;
if (isNull _display) exitWith {};
if !(isNull (_display displayCtrl 9300)) then {ctrlDelete (_display displayCtrl 9300)};
if !(isNull (_display displayCtrl 9301)) then {ctrlDelete (_display displayCtrl 9301)};
if !(isNull (_display displayCtrl 9302)) then {ctrlDelete (_display displayCtrl 9302)};
if !(isNull (_display displayCtrl 9303)) then {ctrlDelete (_display displayCtrl 9303)};
if !(isNull (_display displayCtrl 9304)) then {ctrlDelete (_display displayCtrl 9304)};