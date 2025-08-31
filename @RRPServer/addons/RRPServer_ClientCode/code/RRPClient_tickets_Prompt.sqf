/*
	Filename: 	RRPClient_tickets_Prompt.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
if (!isNull (findDisplay 5300)) exitwith {}; 

private _owner = param [0,objNull,[objNull]];
if (isNull _owner) exitWith {};
private _val = param [1,-1,[0]];
if (EQUAL(_val,-1)) exitWith {};

createDialog "UnionDialogFreeTicketPay";
disableSerialization;
waitUntil {!isnull (findDisplay 5300)};

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_owner = _owner;

(CONTROL(5300,5301)) ctrlSetStructuredText parseText format["%1 выставил вам счет в размере %2$;",GVAR_RNAME(_owner),_val];

[] spawn {
	disableSerialization;
	waitUntil {uiSleep 0.3; life_ticket_paid OR (isNull (findDisplay 5300))};
	if(isNull (findDisplay 5300) && !life_ticket_paid) then {
		[1,format["%1 отказался от уплаты счета",GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",life_ticket_owner];
	};
};