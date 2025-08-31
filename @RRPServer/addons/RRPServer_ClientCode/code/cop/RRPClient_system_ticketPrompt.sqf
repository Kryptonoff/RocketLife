/*
	Filename: 	RRPClient_system_ticketPrompt.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_cop","_val","_display","_control"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if(isNull _cop) exitWith {};
_val = _this select 1;

createDialog "UnionDialogTicketPay";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
_display = findDisplay 2600;
_control = _display displayCtrl 2601;
life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +("%1 выписал вам штраф в размере $%2"),GVAR_RNAME(_cop),_val];

[] spawn {
	disableSerialization;
	waitUntil {uiSleep 0.3; life_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !life_ticket_paid) then {
		[0,"%1 отказался от уплаты штрафа.",true,[GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",west];		
		[1,"%1 отказался от уплаты штрафа.",true,[GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",life_ticket_cop];
	};
};