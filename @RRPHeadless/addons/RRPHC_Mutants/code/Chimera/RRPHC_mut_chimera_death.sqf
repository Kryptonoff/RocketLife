
private _mutant = _this select 0;
private _soundCache = "Land_HelipadEmpty_F" createVehicle (getPosATL _mutant);
//_soundCache attachTo [_mutant, [0, 0, 0.2], "Spine3"]; 
[_soundCache, ["chimera_death_1", 90]] remoteExecCall ["say3D",-2];
[{
	[_this, ["chimera_death_fall", 40]] remoteExecCall ["say3D",-2];
	[{deleteVehicle _this}, _this, 5.4] call CBA_fnc_waitAndExecute;
}, _soundCache, 0.6] call CBA_fnc_waitAndExecute;

[{_this enableSimulationGlobal false}, _mutant, 2] call CBA_fnc_waitAndExecute;