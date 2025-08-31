/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_curLimit","_item","_amount"];
_item = param [0, "", [""]];
_amount = param [1, -1, [-1]];

_curLimit = missionNamespace getVariable [format ["shop_limit_%1",_item],0];
missionNamespace setVariable [format ["shop_limit_%1",_item],(_amount + _curLimit),true];
