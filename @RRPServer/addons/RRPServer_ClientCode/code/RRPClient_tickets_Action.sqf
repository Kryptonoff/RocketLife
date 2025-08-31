/*
	Filename: 	RRPClient_tickets_Action.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitwith {};
if (!isPlayer _unit) exitwith {};
disableSerialization;
if !(createDialog "UnionDialogFreeTicketGive") exitWith {};
ctrlSetText [5201,format["Счет для %1",_unit call getFullName]];
life_ticket_unit = _unit;