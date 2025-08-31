/*
** Author: Jack "Scarso" Farhall
** Description: 
*/

if (isServer) exitWith {};
if !(player getVariable ["sessionCompleted",false]) exitWith {};

params [
	["_xp", 1, [0, []]],
	["_reason", "что-то...", [""]],
	["_show",true,[true]],
	["_chance", 100, [0]]
];

if (_xp isEqualType []) then {
	private _min = _xp # 0;
	private _max = _xp # 1;

	_xp = round (random [_min, ((_min + _max) / 2), _max]);
};

if ((random 100) > _chance || { _xp < 1 }) exitWith { false };
if (getNumber(missionConfigFile >> "CfgProgression" >> "Leveling" >> "enableMultiplier") isEqualTo 1) then { _xp = _xp + (_xp * 0.5); };
private _required = [VRP_Level] call RRPClient_perks_getRequiredXP;
private _max = [] call RRPClient_perks_getMaxLevel;

VRP_XP = round(VRP_XP + _xp);

private _previousLevel = VRP_Level;
for "_i" from 0 to 1 step 0 do {
	if (VRP_XP < _required) exitWith {
	};

	if (VRP_XP >= _required) then {
		if (VRP_Level isEqualTo _max) then {
			VRP_XP = _required;
			break;
		} else {
			VRP_XP = VRP_XP - _required;
			VRP_Level = VRP_Level + 1;
			_required = [VRP_Level] call RRPClient_perks_getRequiredXP;
		};
	};
};

// We leveled up...
if !(VRP_Level isEqualTo _previousLevel) then {
	["Перки","Вы подняли уровень!"] call toastInfo;
} else {
	if (_show) then 
	{
		[format["Вы получили <t color='#B92DE0'>%1</t> XP за %2.", [_xp] call RRPClient_util_numberText, _reason]] call toastInfo;
	};
};
call RRPClient_perks_update;
true
