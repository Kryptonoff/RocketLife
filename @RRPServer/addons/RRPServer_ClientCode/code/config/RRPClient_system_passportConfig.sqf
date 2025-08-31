/*

	Filename: 	RRPClient_system_passportConfig.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"

private _side = player call getSide;

if (!isClass (missionConfigFile >> "LifeCfgPassports" >> life_myPassportID)) exitWith {
	life_myPassportID = format ["%1default",_side];
};

private _passportSide = M_CONFIG(getText,"LifeCfgPassports",life_myPassportID,"side");
if !(EQUAL(_passportSide,_side)) exitWith {
	life_myPassportID = format ["%1default",_side];
};

private _conditions = M_CONFIG(getText,"LifeCfgPassports",life_myPassportID,"conditions");
if !([_conditions] call RRPClient_util_conditionsCheck) exitWith {
	life_myPassportID = format ["%1default",_side];	
};
[["life_myPassportID",life_myPassportID,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
