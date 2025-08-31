
_creature = _this select 0;

_rndSnd = selectRandom["snork_dead_1","snork_dead_2"];
_soundCache = "Land_HelipadEmpty_F" createVehicle position _creature;
_soundCache attachTo [_creature, [0, 0, 0.2], "Spine3"]; 
[_soundCache, [_rndSnd, 120]] remoteExecCall ["say3D",-2];

[{deleteVehicle _this}, _soundCache, 3] call CBA_fnc_waitAndExecute;