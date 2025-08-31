/*

	Filename: 	RRPClient_system_padSkinConfig.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
if (!isClass (missionConfigFile >> "CfgWallpaper" >> life_myPadSkinID)) exitWith {
	life_myPadSkinID = "IMG_0";
};
