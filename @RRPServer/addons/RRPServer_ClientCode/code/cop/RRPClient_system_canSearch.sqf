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

private ["_zonesArray","_isNearby","_location","_marker","_radius","_result"];
_zonesArray = getArray (missionConfigFile >> "LifeCfgSettings" >> "zonesForSearhing");
_isNearby = false;
{
  _marker = _x select 0;
  _radius = _x select 1;
  if ([player,_marker] call CBA_fnc_getDistance < _radius) exitWith {_isNearby = true};
} forEach _zonesArray;

_location = "";
if (_isNearby) then {_location = markerText _marker;
  } else {
    {
      _location = _location + (markerText (_x select 0)) + "<br/>";
    } forEach _zonesArray;
  };

[_isNearby,_location]