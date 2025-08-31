/*

	Filename: 	RRPClient_config_loadFromProfile.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"

if (GVAR_PRNS ["PRNS_ServerSession",""] isEqualTo server_timeText) then {
	life_arc_currentZones = GVAR_PRNS ["PRNS_arc_currentZones",[]];
	life_cs_warn = GVAR_PRNS ["PRNS_cs_warn", 0];
	life_atm_robCounter = GVAR_PRNS ["PRNS_atm_robCounter", 0];

	if ((life_atm_robCounter % 3) isEqualTo 0 AND life_atm_robCounter isNotEqualto 0) then {
		player setVariable ["ATMRobber", true, true];
	};
} else {
	SVAR_PRNS ["PRNS_ServerSession",server_timeText];
	
	life_arc_currentZones = [];
	SVAR_PRNS ["PRNS_arc_currentZones",life_arc_currentZones];
	
	life_cs_warn = 0;
	SVAR_PRNS ["PRNS_cs_warn",0];
	
	life_atm_robCounter = 0;
	SVAR_PRNS ["PRNS_atm_robCounter",0];
};