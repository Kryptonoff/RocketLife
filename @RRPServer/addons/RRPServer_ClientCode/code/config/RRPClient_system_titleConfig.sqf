/*

	Filename: 	RRPClient_system_titleConfig.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgTitles" >> life_myTitleID)) exitWith {
	life_myTitleID = "default";
};

if !([M_CONFIG(getText,"LifeCfgTitles",life_myTitleID,"conditions")] call RRPClient_util_conditionsCheck) exitWith {
	life_myTitleID = "default";
};
[["life_myTitleID",life_myTitleID,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
