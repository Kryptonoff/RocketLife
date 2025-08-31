/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\script_macros.hpp"
try {
	if (isnil "life_ticket_val" OR isNil "life_ticket_owner") exitWith {};
	if (CASH < life_ticket_val) exitWith 
	{
		if(BANK < life_ticket_val) exitWith 
		{
			[false,format["%1 не мог оплатить счет, потому что у него нет необходимой суммы",player call getFullName]] remoteExecCall ["RRPClient_tickets_response",life_ticket_owner];
			closeDialog 0;
			throw "У вас не хватает денег оплатить счет";		
		};
		["SuccessTitleOnly",[format["Вы оплатили счет в размере $%1",[life_ticket_val] call RRPClient_util_numberText]]] call toast;
		[[player,"atm","take",life_ticket_val],"system_moneyChange"] call RRPClient_system_hcExec;

		life_ticket_paid = true;	
		[1,format["%1 оплатил счет",player call getFullName]] remoteExecCall ["RRPClient_system_broadcast",life_ticket_owner];
		[true,format["%1 оплатил счет",player call getFullName], life_ticket_val] remoteExecCall ["RRPClient_tickets_response",life_ticket_owner];
		closeDialog 0;
	};

	["SuccessTitleOnly",format["Вы оплатили счет в размере $%1",[life_ticket_val] call RRPClient_util_numberText]] call toast;

	[[player,"cash","take",life_ticket_val],"system_moneyChange"] call RRPClient_system_hcExec;

	life_ticket_paid = true;

	_toAdd = [false,life_ticket_val] call RRPClient_util_addAndCalculateTax;
	[true,format["%1 оплатил счет",player call getFullName], _toAdd] remoteExecCall ["RRPClient_tickets_response",life_ticket_owner];

	closeDialog 0;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
true
