/*

	Filename: 	RRPClient_system_removeDrugs.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_medic"];
_medic = param [0,ObjNull,[ObjNull]];

RRPClientNarcomania = 0;

[format["Медик %1 снял с вас все наркотические зависимости!",GVAR_RNAME(_medic)]] call hints;
