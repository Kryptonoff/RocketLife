/*
	Filename: 	RRPClient_system_giveDiff.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
params ["_unit","_item","_val","_from"];
if !(EQUAL(_unit,player)) exitWith {};
private _bool = if (count _this > 4) then {true} else {false};
private _name = ITEM_NAME(_item);

if (_bool) then {
	if ([true,_item,(parseNumber _val)] call RRPClient_system_handleInv) then {
		[format["Вы пытались передать %1 %2 %3, но произошла ошибка.",GVAR_RNAME(_from),_val,_name],"error"] call hints;
	};
} else {
	if ([true,_item,(parseNumber _val)] call RRPClient_system_handleInv) then {
		[format["%1 возвращено %2 %3 не смогли унести",GVAR_RNAME(_from),_val,_name],"error"] call hints;
	};
};