/*

	Filename: 	RRPClient_system_OpenPhone.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_mode"];
_mode = param [0,0,[0]];
closeDialog 0;
if (LSNOTALIVE(player)) exitWith {}; //Prevent them from opening this for exploits while dead.

switch (_mode) do
{
	case 0 : {createDialog "UnionDialogSmartphone";};
	case 1 : {createDialog "RRPDialogSmartphoneNotruf";};
};