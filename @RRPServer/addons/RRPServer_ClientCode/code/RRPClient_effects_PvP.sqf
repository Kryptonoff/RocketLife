/*

	Filename: 	RRPClient_effects_PvP.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private ["_pvpstart","_lasttime"];
while {life_pvp} do {				
	_pvpstart = life_pvp_start;	
	if !(player GVAR ["pvp",false]) then {
		format ["Вы перешли в PvP режим на %1 минут", LIFE_SETTINGS(getNumber,"life_pvpTimer")] call chat;			
		player SVAR ["pvp",true,true];						
		_lasttime = time;
	};		
	
	if (((time - _pvpstart) > (LIFE_SETTINGS(getNumber,"life_pvpTimer") * 60)) && {EQUAL(life_pvp_start,_pvpstart)}) then {
		"Вы вышли из PvP режима" call chat;	
		[player,"pvp"] call RRPClient_system_clearGlobalVar;
		life_pvp = false;			
		life_pvp_start = 0;
		[player,"houseRaid"] call RRPClient_system_clearGlobalVar;
	};

	uiSleep 1;	
};