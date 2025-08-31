/*
	
	Filename: 	RRPClient_parking_PayDone.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
params [	
	["_plate","",[""]],
	["_price",-1,[0]]
];

[[player,"atm","take",_price],"system_moneyChange"] call RRPClient_system_hcExec;
[1, "add",_price] remoteExecCall ["RRPServer_groups_moneyChange",2];
_log = format ["vehParking: atm (take) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_price];	
["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
["SuccessTitleAndText",[format["Оплачен штраф в размере $%1 за технику с номером %2. Вы можете забрать технику со штрафстоянки",[_price] call RRPClient_util_numberText,_plate]]] call toast;
["iro4ka",1] call RRPClient_ach_gateway;
["stopham",1] call RRPClient_ach_gateway;
