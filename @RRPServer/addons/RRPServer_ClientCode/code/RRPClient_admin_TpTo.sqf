/*
	Filename: 	RRPClient_admin_TpTo.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_unit"];
_unit = call compile format["%1", CONTROL_DATA(2902)];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {["Недопустимая операция, балда."] call hints};

player setPosATL (getPosATL _unit);
player reveal _unit;
 
[format["Вы телепортировались к %1",GVAR_RNAME(_unit)]] call hints;