
_creature = _this select 0;

_soundCache = "Land_HelipadEmpty_F" createVehicle position _creature;
_soundCache attachTo [_creature, [0, 0, 0.2], "Spine3"]; 
[_soundCache, [selectRandom["zombie_die_0","zombie_die_1","zombie_die_2","zombie_die_3","zombie_die_4","zombie_die_5","zombie_die_6","zombie_die_7","zombie_die_8","zombie_die_9"], 25]] remoteExecCall ["say3D",-2];

[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;