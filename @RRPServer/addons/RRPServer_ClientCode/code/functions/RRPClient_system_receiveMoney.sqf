/*
	Filename: 	RRPClient_system_receiveMoney.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_val","",[""]],
	["_from",Objnull,[Objnull]]
];

if (isNull _unit OR isNull _from OR _val == "") exitWith {};
if (player != _unit) exitWith {};
if !([_val] call RRPClient_system_isnumber) exitWith {};
if (_unit == _from) exitWith {}; 

[format["%1 передал вам $%2",_from call getNickName,[(parseNumber _val)] call RRPClient_util_numberText]] call hints;
[[player,"cash","add",_val,[format ["Получил деньги: %4 (%5) ($%3) от %1 (%2)",name _from,getPlayerUID _from,_val,name _unit,getPlayerUID _unit],"TransferLog"]],"system_moneyChange"] call RRPClient_system_hcExec;
