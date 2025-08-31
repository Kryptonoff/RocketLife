/*
	
	Filename: 	RRPClient_system_openGovBankMenu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if(isNull (findDisplay 3900)) then {
	if !(createDialog "UnionDialogGovAtm") exitWith {};
};

if !(life_gov) exitWith {closeDialog 0};

private _balance = CONTROL(3900,3901);
_balance ctrlSetStructuredText parseText format ["<t size='1.2'>$%1</t>",[server_bank] call RRPClient_util_numberText];