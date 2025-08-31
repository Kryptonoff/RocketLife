/*

	Filename: 	RRPClient_system_removeWeaponsReward.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_value",0,[0]]
];

if (isNull _unit OR EQUAL(_value,0)) exitWith {};

if (ISPSIDE("cop")) then {
	_value = ["priceUp",_value] call RRPClient_system_VIP;
};

[[player,"atm","add",_value],"system_moneyChange"] call RRPClient_system_hcExec;
_log = format ["removeWeaponsReward: atm (add) %3 to NAME:%1 (%2)",name player,steamid,_value];
["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
[format["Вы конфисковали у %1 нелегальных предметов на сумму в $%2",GVAR_RNAME(_unit),[_value] call RRPClient_util_numberText]] call hints;
