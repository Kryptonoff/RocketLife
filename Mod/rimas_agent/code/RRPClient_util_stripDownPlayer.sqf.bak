/*
	
	Filename: 	RRPClient_util_stripDownPlayer.sqf
	Project: 	Rimas Altis Life RPG
	Web:		Rimas RP

*/

removeAllWeapons player;
{player removeMagazine _x;} forEach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} forEach (assignedItems player);

if(HMD player != "") then {
	player unlinkItem (HMD player);
};