/*
** Author: Jack "Scarso" Farhall
** Description: 
*/
scopeName "fn_getMaxLevel";

_this params [
	["_lvlCfg", missionConfigFile >> "CfgProgression" >> "Leveling", [configNull]]
];

if !(isClass _lvlCfg) exitWith { 0 };

(getNumber (_lvlCfg >> "maxLevel"))
