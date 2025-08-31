/*
	
	Filename: 	RRPClient_system_insurancePayDone.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

private["_vehicle","_price","_displayName"];
_price = param [0,0,[0]];

_price = round (_price / 1.7);

[format["Ваша техника попала под страховой случай!.<br/>Страховая компания возмещает вам часть стоимости и переводит на банковский счет $%1",[_price] call RRPClient_util_numberText]] call hints;

[[player,"atm","add",_price],"system_moneyChange"] call RRPClient_system_hcExec;

["whereInsure",1] call RRPClient_ach_gateway;
_log = format ["insuranceDeposit: atm (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_price];	
["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
life_action_inUse = false;