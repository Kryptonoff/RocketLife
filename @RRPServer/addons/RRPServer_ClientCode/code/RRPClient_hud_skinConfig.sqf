/*

	Filename: 	RRPClient_hud_skinConfig.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgThemes" >> life_myThemeID)) then {
	life_myThemeID = "default";
};