/*
	Filename: 	RRPClient_system_ticketPay.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	if (isnil "life_ticket_val" OR {isNil "life_ticket_cop"}) exitWith {};
	if (CASH < life_ticket_val) exitWith {
		if(BANK < life_ticket_val) exitWith {
			[1,"%1 не мог заплатить штраф, потому что у него не хватает денег.",true,[GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",life_ticket_cop];
			closeDialog 0;
			throw "У вас не хватает денег заплатить штраф.";		
		};
		[format["Вы оплатили штраф в размере $%1",[life_ticket_val] call RRPClient_util_numberText]] call hints;	
		
		[[player,"atm","take",life_ticket_val],"system_moneyChange"] call RRPClient_system_hcExec;
		
		_log = format ["ticketPay: atm (take) %3 to NAME:%1 (%2)",name player,steamid,life_ticket_val];	
		["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
		life_ticket_paid = true;	
		[0,"%1 заплатил штраф в размере $%2",true,[GVAR_RNAME(player),[life_ticket_val] call RRPClient_util_numberText]] remoteExecCall ["RRPClient_system_broadcast",west];	
		[1,"%1 заплатил штраф.",true,[GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",life_ticket_cop];	
		
		[steamid] remoteExecCall ["RRPServer_ws_wantedRemove",2];
		[[life_ticket_cop,"atm","add",life_ticket_val],"system_moneyChange"] call RRPClient_system_hcExec;

		["iro4ka",1] call RRPClient_ach_gateway;
		_log = format ["ticketPay: atm (add) %3 to NAME:%1 (%2)",name life_ticket_cop,getPlayerUID life_ticket_cop,life_ticket_val];
		["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
		closeDialog 0;
	};


	[[player,"cash","take",life_ticket_val],"system_moneyChange"] call RRPClient_system_hcExec;

	_log = format ["ticketPay: cash (take) %3 to NAME:%1 (%2)",name player,steamid,life_ticket_val];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];

	life_ticket_paid = true;

	[0,"%1 заплатил штраф в размере $%2",true,[GVAR_RNAME(player),[life_ticket_val] call RRPClient_util_numberText]] remoteExecCall ["RRPClient_system_broadcast",west];
	[1,"%1 заплатил штраф.",true,[GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",life_ticket_cop];

	[steamid] remoteExecCall ["RRPServer_ws_wantedRemove",2];
	[[life_ticket_cop,"atm","add",life_ticket_val],"system_moneyChange"] call RRPClient_system_hcExec;

	["iro4ka",1] call RRPClient_ach_gateway;
	_log = format ["ticketPay: atm (add) %3 to NAME:%1 (%2)",name life_ticket_cop,getPlayerUID life_ticket_cop,life_ticket_val];
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];

	closeDialog 0;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
