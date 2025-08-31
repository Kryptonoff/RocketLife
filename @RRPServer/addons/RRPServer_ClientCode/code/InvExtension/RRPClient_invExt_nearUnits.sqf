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
private ["_near_units","_indexInIds","_comboInv","_display","_comboMoney","_index"];
_display = findDisplay 602;
_comboInv = _display displayCtrl 2105;
_comboMoney = _display displayCtrl 3003;

_near_units = [];
{
  if (player distance _x < 10) then {_near_units pushBack _x};
} foreach playableUnits;

if !(_near_units isEqualTo []) then {
  {
    _indexInIds = [(getPlayerUID _x),life_ids] call RRPClient_system_index;
    if ((!isNull _x) and (alive _x) and ((player distance _x) < 10) and (_x != player) and (_x getVariable ["realname",""] != "") and ((!(_indexInIds isEqualTo -1)) or (_x in (units group player)))) then {

      _index = _comboMoney lbAdd (_x getVariable ["realname",""]);
      _comboMoney lbSetData [_index,(netId _x)];

      _index = _comboInv lbAdd (_x getVariable ["realname",""]);
      _comboInv lbSetData [_index,(netId _x)];
    };
  } foreach _near_units;
} else {
  _index = _comboMoney lbAdd "Некому передавать";
};
