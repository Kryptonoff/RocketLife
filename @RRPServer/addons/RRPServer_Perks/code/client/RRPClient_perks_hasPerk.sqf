/*
** Author: Jack "Scarso" Farhall
** Description: 
*/
scopeName "fn_hasPerk";

_this params [
	["_perk", "", [""]]
];


(isClass (missionConfigFile >> "CfgPerks" >> _perk) && { _perk in VRP_Perks })