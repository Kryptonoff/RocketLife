/*
** Author: Jack "Scarso" Farhall
** Description: 
*/
scopeName "fn_getPerkRequirement";

_this params [
	["_perk", "", [""]]
];

_faction = {
	_this params [
		["_object", objNull, [objNull]],
		["_factions", [], [[]]]
	];
	if (isNull _object) exitWith {};
	_factions findIf {_x == (_object call getSide)} > -1;
};

private _cfg = missionConfigFile >> "CfgPerks" >> _perk;
if !(isClass _cfg) exitWith { ["Не существует!", 0] };

// Faction Check..
private _factions = getArray (_cfg >> "Requirements" >> "factions");
if !([player, _factions] call _faction) exitWith {
	["Фракция", _factions]
};

// Level Check...
private _level = getNumber (_cfg >> "Requirements" >> "level");
if (VRP_Level < _level) exitWith {
	["Уровень", _level]
};

// Prestige Check...
private _prestige = getNumber (_cfg >> "Requirements" >> "prestige");
if (VRP_Prestige < _prestige) exitWith {
	["Престиж", _prestige]
};

// Profession Check...
private _profession = getArray (_cfg >> "Requirements" >> "profession");
if ((count _profession) > 0 && { VRP_Prestige < ([_profession select 0] call RRPClient_skills_getLevel) }) exitWith {
	_profession
};

// Empty Array? Success!
[]