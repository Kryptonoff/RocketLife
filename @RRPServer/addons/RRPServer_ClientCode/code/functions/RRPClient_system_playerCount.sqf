/*
	
	Filename: 	RRPClient_system_playerCount.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _faction = param [0,"error",[""]];
count (allPlayers select {_x call getSide isEqualTo _faction})