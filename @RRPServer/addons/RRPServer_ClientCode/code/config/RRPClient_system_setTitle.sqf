/*

	Filename: 	RRPClient_system_setTitle.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
call RRPClient_system_titleConfig;
[player,"realtitle",M_CONFIG(getText,"LifeCfgTitles",life_myTitleID,"title")] call CBA_fnc_setVarNet;