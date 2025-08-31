/*

	Filename: 	RRPClient_effects_Uran.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
while {true} do {
	if (!life_radx_used && (LSALIVE(player))) then {
		player say3d "radiation1";
		"Вы находитесь в радиактивной зоне !!! Без специальной защиты вы погибнете мучительной смертью!!!" call chat;				
		if ((damage player) < 0.89) then {
			player setDamage ((damage player) + 0.05);
		} else {
			[player,player] call RRPClient_dmg_Agony;
		};
	};
	uiSleep 10;
};