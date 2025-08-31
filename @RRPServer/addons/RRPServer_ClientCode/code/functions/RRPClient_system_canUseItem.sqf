/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: merkava#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
    ----
*/
private ["_item","_canUse","_condition"];
_item = param [0,"",[""]];
_canUse = if (_item isEqualTo "") exitWith {};
_condition = "";


if (isClass(missionConfigFile >> "LifeCfgItems" >> _item)) then {
	_condition = getText(missionConfigFile >> "LifeCfgItems" >> _item >> "condition_use");
};


if (isClass(missionConfigFile >> "clothing_settings" >> _item)) then {
	_condition = getText(missionConfigFile >> "clothing_settings" >> _item >> "condition_use");
};


_canUse = [_condition] call RRPClient_util_conditionsCheck;

_canUse
