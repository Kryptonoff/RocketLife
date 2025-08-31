/*
      SteamID: 76561198090549826
      Discord: arrra#9745
      cc by-nc-nd


*/
params ["_posObj","_posPlayer"];
_posObj set [2,(_posObj # 2) + 3];
_posPlayer set [2,(_posPlayer # 2) + 3];

private _result = [1,0];
if (terrainIntersectASL[_posObj, _posPlayer]) then {
  _posPlayer set [2,_posObj # 2];
  for "_i" from 0 to 40 step 1 do {
    _posObj set [2,(_posObj # 2) + 10];
    _posPlayer set [2,(_posPlayer # 2) + 10];
    if !(terrainIntersectASL[_posObj, _posPlayer]) exitWith {
      _result = [(1 - _i/40),(_i * 10)];
    };
  };
};

_result
