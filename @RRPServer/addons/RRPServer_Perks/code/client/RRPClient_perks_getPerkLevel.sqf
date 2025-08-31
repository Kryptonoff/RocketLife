/*
** Author: Jack "Scarso" Farhall
** Description: 
*/
scopeName "fn_getPerkLevel";

_this params [
	["_perk", "", [""]]
];

private _cfg = missionConfigFile >> "CfgPerks" >> _perk;
if !(isClass _cfg) exitWith { [1, 0] };

(VRP_Perks getOrDefault [_perk, [1, 0]])