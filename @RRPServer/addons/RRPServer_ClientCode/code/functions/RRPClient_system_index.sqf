/*

	Filename: 	RRPClient_system_index.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
params ["_item",["_stack",[],[[]]]];
_stack findIf {_item in _x}