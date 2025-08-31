/*

	Filename: 	RRPClient_system_stopEscortingAction.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP
	
*/
#include "..\..\script_macros.hpp"
{
	detach _x;
} forEach (call RRPClient_util_attachedObjectsPlayer);