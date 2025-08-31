/*
	Filename: 	RRPClient_system_govBank.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _mode = param [0,"",[""]];
private _val = parseNumber(ctrlText 3902);
closeDialog 0;
if(_val <= 0) exitwith {};
if(_val > 999999) exitWith {hint "Нельзя за раз снять или положить больше $999,999"};
if(!([str(_val)] call RRPClient_system_isnumber)) exitWith {hint "екорректный ввод. Введите сумму"};

if (_mode == "") exitWith {hint "Операция не указана"};
if (life_action_inUse) exitWith {};

call RRPClient_actions_inUse;

switch (_mode) do {
	case "add": {
		if (BANK < _val) exitWith {hint "У вас нет такой суммы на счету, чтобы внести их в казну"; life_action_inUse = false;};
		[player,"atm","take",_val] remoteExecCall ["RRPServer_system_moneyChange",2];

		_log = format ["govBank: atm (take) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_val];	
		["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
		[player,"serverbank","add",_val] remoteExecCall ["RRPServer_system_moneyChange",2];
	};
	
	case "take": {
		if (server_bank < _val) exitWith {hint "В казне нет такого количества валюты..."; life_action_inUse = false;};
		[player,"atm","add",_val] remoteExecCall ["RRPServer_system_moneyChange",2];
		[player,"serverbank","take",_val] remoteExecCall ["RRPServer_system_moneyChange",2];
	};
};