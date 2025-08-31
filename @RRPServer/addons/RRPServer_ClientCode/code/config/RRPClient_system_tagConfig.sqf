/*

	Filename: 	RRPClient_system_tagConfig.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgTags" >> life_myTagID)) exitWith {
	life_myTagID = "";
};

private _side = player call getSide;
private _tagSide = M_CONFIG(getText,"LifeCfgTags",life_myTagID,"side");
if !(EQUAL(_tagSide,_side)) exitWith {
	life_myTagID = "";
};

private _conditions = M_CONFIG(getText,"LifeCfgTags",life_myTagID,"conditions");
if !([_conditions] call RRPClient_util_conditionsCheck) exitWith {
	life_myTagID = "";
};