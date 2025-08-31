/*
	Filename: 	RRPClient_system_ticketAction.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
disableSerialization;
if !(createDialog "UnionDialogTicketGive") exitWith {};
if (isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format["Штрафуем %1",_unit call getFullName]];
life_ticket_unit = _unit;