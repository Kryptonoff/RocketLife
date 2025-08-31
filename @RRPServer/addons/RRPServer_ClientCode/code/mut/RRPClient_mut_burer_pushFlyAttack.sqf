
params ["_victim", "_mutant"];
_victim disableCollisionWith _mutant;

private _effect = "#particlesource" createVehicleLocal getPosATL _victim; 
_effect attachto [_victim,[0,1,0.3]];  
_effect setParticleClass "HDustVTOL1"; 

private _effect1 = "#particlesource" createVehicleLocal position _victim; 
_effect1 setParticleCircle [6, [-2, -2, 2]];
_effect1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_effect1 setParticleParams [["\A3\data_f\cl_leaf3", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 2, 11, 7.9, 0.075, [6, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _victim];
_effect1 setDropInterval 0.04;
_effect1 attachto [_victim,[0,1,0.3]]; 

private _soundCache = "Land_HelipadEmpty_F" createVehicle position _victim;
_soundCache attachTo[_victim, [0, 0, 0.2], "Spine3"];
[_soundCache, ["controller_hit_first", 100]] remoteExecCall ["say3D",-2];
[_soundCache, ["burer_gravi_wave_0", 100]] remoteExecCall ["say3D",-2];

[_victim, 0.25] call RRPClient_mut_setDamage;
[_victim, "Disable_Gesture"] remoteExec ["playActionNow",-2];

playSound selectRandom["player_after_shot_1", "player_after_shot_2"];

private _dir = _victim getRelDir _mutant;
private _sleep = 0;
if (_dir > 270 OR _dir < 90) then {
	_victim setDir (_victim getDir _mutant);
	[_victim, "FlyFromMutant_backward"] remoteExec ["switchMove",-2];
	_victim setvelocity [-12 * (sin (getdir _victim )), -12 * (cos (getdir _victim)), 4];

	[{
		params ["_soundCache", "_victim"];

		[_soundCache, ["body_impact", 50]] remoteExecCall ["say3D",-2];
		[_victim, ["body_impact_dam", 20]] remoteExecCall ["say3D",-2];
		_victim setUnconscious true;
	}, [_soundCache, _victim], 0.72] call CBA_fnc_waitAndExecute;
	
	[{
		_this setUnconscious false;
		_this playMoveNow "amovpercmstpsnonwnondnon";
	}, _victim, 0.92] call CBA_fnc_waitAndExecute;

	_sleep = 0.92;
} else {
	_victim setDir (getDir _mutant);
	[_victim, "FlyFromMutant_forward"] remoteExec ["switchMove",-2];
	_victim setvelocity [12 * (sin(getdir _victim)), 12 * (cos(getdir _victim)), 4];
	
	[{
		params ["_soundCache", "_victim"];

		[_soundCache, ["body_impact", 50]] remoteExecCall ["say3D",-2];
		[_victim, ["body_impact_dam", 20]] remoteExecCall ["say3D",-2];
	}, [_soundCache, _victim], 0.9] call CBA_fnc_waitAndExecute;

	[{
		_this setUnconscious true;
	}, _victim, 1.1] call CBA_fnc_waitAndExecute;

	[{
		_this setUnconscious false;
		_this playMoveNow "amovpercmstpsnonwnondnon";
	}, _victim, 1.3] call CBA_fnc_waitAndExecute;

	_sleep = 1.3;
};

[{
	deleteVehicle (_this select 0);
	deleteVehicle (_this select 1);
}, [_effect, _effect1], _sleep] call CBA_fnc_waitAndExecute;

[{
	params ["_victim", "_mutant", "_soundCache"];

	_victim enableCollisionWith _mutant;
	deleteVehicle _soundCache;
}, [_victim, _mutant, _soundCache], _sleep + 2] call CBA_fnc_waitAndExecute;