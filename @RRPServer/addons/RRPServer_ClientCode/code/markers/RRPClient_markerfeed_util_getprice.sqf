/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/

private _return = "";
{
    _x params ["_res","","_sellprice"];
    if (_res isEqualTo _this) exitWith {_return = _sellprice;}
} forEach RRPPublicEconomyArray;
if (_return isEqualTo "") then {_return = "Неопределена"};
_return
