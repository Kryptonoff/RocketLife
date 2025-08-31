
params ["_obj", "_snd", "_dst"];

_soundCache = "Land_HelipadEmpty_F" createVehicle position _obj;
_soundCache attachTo [_obj,[0,0,0]];
[_soundCache, [_snd, _dst]] remoteExecCall ["say3D",-2];
[{deleteVehicle _this}, _soundCache, 60] call CBA_fnc_waitAndExecute;