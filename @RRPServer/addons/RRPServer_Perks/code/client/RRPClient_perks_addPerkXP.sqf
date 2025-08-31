/*
** Author: Jack "Scarso" Farhall
** Description: 
*/
scopeName "fn_addPerkXP";

_this params [
	["_perk", "", [""]],
	["_amount", 1, [0]]
];

if !([_perk] call RRPClient_perks_hasPerk) exitWith { false };

private _cfg = missionConfigFile >> "CfgPerks" >> _perk >> "Leveling";
if !(isClass _cfg) exitWith { false };

// Stops easy spam leveling by adding a mini cooldown...
private _recentIncreases = + (missionNamespace getVariable ["VRP_PerksXP", createHashMap]);
if (time < (_recentIncreases getOrDefault [_perk, time])) exitWith { false };
_recentIncreases set [_perk, time + (random 8)];
missionNamespace setVariable ["VRP_PerksXP", _recentIncreases];

private _requirement = getNumber (_cfg >> "xpLevel");
private _max = getNumber (_cfg >> "maxLevel");

([_perk] call RRPClient_perks_getPerkLevel) params [
	"_level", "_xp"
];

if (_level > 1) then {
	_requirement = _requirement * (getNumber (_cfg >> "xpMultipler") * _level);
};

private _previousLevel = _level;
_xp = _xp + _amount;

for "_i" from 0 to 1 step 0 do {
	if (_xp < _requirement || { _level isEqualTo _max }) exitWith {};
	_xp = _xp - _requirement;
	_level = _level + 1;
};

// "Clamp" them...
_level = (_level max 0) min _max;
_xp = (_xp max 0) min _requirement;

if (_previousLevel < _level) then {
	["Перки","You leveled up a perk!"] call toastInfo;
};

VRP_Perks set [_perk, [_level, _xp]];
[player, VRP_Perks] remoteExecCall ["RRPServer_perks_updateStats",2];
true