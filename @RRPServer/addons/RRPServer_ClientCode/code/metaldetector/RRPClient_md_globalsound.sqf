/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

params[["_object", objNull, [objNull]], ["_sound", "", [""]], ["_distance", 50, [0]], ["_pitch", 1, [0]]];
if (isNull _object || {_sound isEqualTo ""}) exitWith {};
if (_distance < 0) then {
    _distance = 50
};
_object say3D[_sound, _distance, _pitch];