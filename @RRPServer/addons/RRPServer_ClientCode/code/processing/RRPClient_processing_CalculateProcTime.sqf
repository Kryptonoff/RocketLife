/*
    Author(s):
    Arrra (original)
    ----
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private ["_allamount","_deletedItems","_donatLvl","_time","_amount","_coef"];
_deletedItems = _this select 0;
_donatLvl = _this select 1;
_coef = _this select 2;

_time = 0;
_allamount = 0;
{
  _amount = _x select 1;
  _allamount   = _allamount + _amount;
} forEach _deletedItems;

_time = _allamount * _coef;

_time
