
private _mutant = _this select 0;
private _soundCache = "Land_HelipadEmpty_F" createVehicle (getPosATL _mutant);
_soundCache attachTo [_mutant, [0, 0, 0.2]]; 
[_soundCache, [selectRandom["bdog_die_0","bdog_die_1","bdog_die_2"], 60]] remoteExecCall ["say3D",-2];

[{deleteVehicle _this}, _soundCache, 9] call CBA_fnc_waitAndExecute;