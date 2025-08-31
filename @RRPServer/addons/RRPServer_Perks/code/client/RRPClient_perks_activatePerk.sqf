/*
** Author: Jack "Scarso" Farhall
** Description: 
*/
scopeName "fn_activatePerk";

_this params [
	["_perk", "", [""]],
	["_params", []],
	["_increase", true, [false]]
];

if !([_perk] call RRPClient_perks_hasPerk) exitWith { _params };

private _level = [_perk] call RRPClient_perks_getPerkLevel;

_params = call {
	_level params [
		"_level", "_xp"
	];

	private _bonus = [_perk] call RRPClient_perks_getPerkBonus;

	call compile getText (missionConfigFile >> "CfgPerks" >> _perk >> "onActivated");
};

if (_increase) then {
	[_perk, round (random 5)] call RRPClient_perks_addPerkXP;
};

_params