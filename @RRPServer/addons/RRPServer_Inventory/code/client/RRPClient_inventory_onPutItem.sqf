/*

	Filename: 	RRPClient_inventory_onPutItem.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]],
	["_save", true, [true]]
];
if (_itemClass isEqualTo "") exitWith {};

if (_save) then {
	playSound "click";
	[] call RRPClient_system_saveGear;
};