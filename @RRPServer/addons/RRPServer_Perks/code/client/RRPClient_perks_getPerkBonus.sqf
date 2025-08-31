/*
** Author: Jack "Scarso" Farhall
** Description: 
*/

scopeName "fn_getPerkBonus";

_this params [
	["_perk", "", [""]]
];

private _cfg = missionConfigFile >> "CfgPerks" >> _perk >> "Leveling";
if !(isClass _cfg) exitWith { 0 };

((VRP_Perks getOrDefault [_perk, [1, 0]]) call compile getText (_cfg >> "levelCalculation"))