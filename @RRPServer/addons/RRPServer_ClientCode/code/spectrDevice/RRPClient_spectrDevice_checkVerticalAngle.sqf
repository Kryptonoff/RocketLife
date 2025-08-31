/*
    Сontacts:
      SteamID: 76561198090549826
      Discord: arrra#9745
      cc by-nc-nd
*/

private ["_distance","_vectorPos","_eyePos","_verticalRangePos","_VectorZ","_objectZ","_objectZATL","_maxMissRange","_diffRange","_coef","_positionObjectATL"];
params ["_positionObject"];
_coef = 0;
_positionObjectATL = (ASLToATL _positionObject);
_distance = player distance _positionObjectATL;

_vectorPos = ((player weaponDirection currentWeapon player)  vectorMultiply _distance);
_eyePos = eyePos player;
_verticalRangePos = [(_eyePos # 0) + (_vectorPos # 0),(_eyePos # 1) + (_vectorPos # 1),(_eyePos # 2) + (_vectorPos # 2)];
_VectorZ = (_verticalRangePos select 2);
_objectZ = (_positionObject select 2);
_objectZATL = (_positionObjectATL select 2);
_objectZATL = _distance * 0.4;
private _maxMissRange = _objectZATL;

if  ((_VectorZ > (_objectZ - _maxMissRange/2)) AND (_VectorZ < (_objectZ + _maxMissRange/2))) then {
   _diffRange = abs(_objectZ - _VectorZ);
   _coef = (1 - (1/(_maxMissRange/2) * _diffRange));
};

_coef
