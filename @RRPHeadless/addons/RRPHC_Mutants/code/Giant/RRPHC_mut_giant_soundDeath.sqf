
private _mutant = _this select 0;

private _soundCache = "Land_HelipadEmpty_F" createVehicle getPosATL _mutant;
//_soundCache attachTo [_mutant, [0, 0, 0.2], "Spine3"]; 
[_soundCache, [selectRandom["giant_death_1","giant_death_0"], 120]] remoteExecCall ["say3D",-2];

[{deleteVehicle _this}, _soundCache, 3] call CBA_fnc_waitAndExecute;
[{_this enableSimulation false}, _mutant, 4] call CBA_fnc_waitAndExecute;