
params ["_unit", "_mutant", ["_fullDamage", true]];

[_unit, _mutant] remoteExecCall ["disableCollisionWith", _unit];

_soundCache = "Land_HelipadEmpty_F" createVehicle (position _unit);
_soundCache attachTo [_unit, [0, 0, 0.2], "Spine3"]; 

if ((vest _unit in ["Exo_BanditPS","Exo_LonerPS","Exo_MercPS","Exo_MonolithPS","Exo_ArmyPS","Exo_FreedomPS","Exo_DutyPS"]) or (hmd _unit in ["Exo_Black_Atlas_NVG","Exo_Army_NVG"])) then { 
	_soundCache = "Land_HelipadEmpty_F" createVehicle (position _unit);
	_soundCache attachTo [_unit, [0, 0, 0.2], "Spine3"]; 
	[_soundCache, ["fly_kick", 50]] remoteExecCall ["say3D",-2];
	[_unit,  0.25] remoteExecCall ["RRPClient_mut_setDamage", _unit];
} else {
	if (_fullDamage) then {
		_soundCache = "Land_HelipadEmpty_F" createVehicle (position _unit);
		_soundCache attachTo [_unit, [0, 0, 0.2], "Spine3"]; 
		[_unit, 1] remoteExecCall ["RRPClient_mut_setDamage", _unit];
		[_soundCache, [selectRandom ["chimera_kill_victim_1","chimera_kill_victim_2","chimera_kill_victim_3","chimera_kill_victim_4"], 50]] remoteExecCall ["say3D",-2];
	} else {
		[_unit, 0.5] remoteExecCall ["RRPClient_mut_setDamage", _unit];
	};
	[_unit, "player_scared_breathe", 30] remoteExecCall ["RRPClient_mut_chimera_playerSob",-2];
};

[_unit, "Disable_Gesture"] remoteExec ["playActionNow",-2];

private _dir = _mutant getRelDir _unit;
private _sleep = 0;
if (_dir > 270 OR _dir < 90) then {
	[_unit, ((_unit getDir _mutant) + 40)] remoteExecCall ["setDir", _unit];
	[_unit, "FlyFromMutant_backward"] remoteExec["switchMove",-2];
	[_unit, [-9 * (sin(getdir _unit)), -9 * (cos(getdir _unit)), 3]] remoteExec ["setvelocity", _unit];
	
	[{
		params ["_soundCache", "_unit"];

		[_soundCache, ["body_impact", 50]] remoteExecCall ["say3D",-2];
		[_unit, ["body_impact_dam", 20]] remoteExecCall ["say3D",-2];
		[_unit, true] remoteExecCall ["setUnconscious", _unit];
	}, [_soundCache, _unit], 0.72] call CBA_fnc_waitAndExecute;
	
	[{
		[_this, false] remoteExecCall ["setUnconscious", _this];
		[_this, "amovpercmstpsnonwnondnon"] remoteExecCall ["playMoveNow", _this];
	}, _unit, 0.92] call CBA_fnc_waitAndExecute;

	_sleep = 0.92;
} else {
	[_unit, ((getDir _mutant) + 40)] remoteExecCall ["setDir", _unit];
	[_unit, "FlyFromMutant_forward"] remoteExec["switchMove",-2];
	[_unit, [9 * (sin(getdir _unit)), 9 * (cos(getdir _unit)), 3]] remoteExec ["setvelocity", _unit];
	
	[{
		params ["_soundCache", "_unit"];

		[_soundCache, ["body_impact", 50]] remoteExecCall ["say3D",-2];
		[_unit, ["body_impact_dam", 20]] remoteExecCall ["say3D",-2];
	}, [_soundCache, _unit], 0.9] call CBA_fnc_waitAndExecute;
	[{
		[_this, true] remoteExecCall ["setUnconscious", _this];
	}, _unit, 1.1] call CBA_fnc_waitAndExecute;
	[{
		[_this, false] remoteExecCall ["setUnconscious", _this];
		[_this, "amovpercmstpsnonwnondnon"] remoteExecCall ["playMoveNow", _this];
	}, _unit, 1.3] call CBA_fnc_waitAndExecute;

	_sleep = 1.3;
};

[{
	params ["_unit", "_mutant", "_soundCache"];

	[_unit, _mutant] remoteExecCall ["enableCollisionWith", _unit];
	deleteVehicle _soundCache
}, [_unit, _mutant, _soundCache], _sleep] call CBA_fnc_waitAndExecute;
