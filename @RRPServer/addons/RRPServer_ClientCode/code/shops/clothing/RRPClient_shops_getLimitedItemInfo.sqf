/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_maxLimit","_curLimit","_item"];
_item = param [0, "", [""]];
_maxLimit = -1;
_curLimit = -1;

{
    if ((configName _x)  isEqualTo _item) exitWith {
        _maxLimit = getNumber(_x >> "limit");
        _curLimit = missionNamespace getVariable [format ["shop_limit_%1",_item],0];
    };
} forEach ('true' configClasses (missionConfigFile >> 'config_limitedItems'));

[_maxLimit,_curLimit]
