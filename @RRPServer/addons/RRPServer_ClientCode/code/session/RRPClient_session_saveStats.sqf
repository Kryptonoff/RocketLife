/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (player getVariable ["sessionCompleted",false]) then {
	[[
		getPosATL player,
		RRPClientHunger,
		RRPClientThirst,
		RRPClientNarcomania,
		life_sickness,
		life_diarrhea,
		getPlayerUID player
	],"session_updateStats"] call RRPClient_system_hcExec;
};
true
