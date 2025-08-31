
params ["_victim", "_mutant"];
private _notFullDamage = ((_victim distance _mutant) > 2.5);
private _uniformDefend = ((uniform _victim == "Exobronecostum_B_Se_RE_S_CombatUniform") or (vest _victim in ["Exo_BanditPS","Exo_LonerPS","Exo_MercPS","Exo_MonolithPS","Exo_ArmyPS","Exo_FreedomPS","Exo_DutyPS"]) or (hmd _victim == "Exo_Black_Atlas_NVG") or (hmd _victim == "Exo_Army_NVG"));

[_victim, _mutant] remoteExecCall ["disableCollisionWith", _victim];
[] remoteExecCall ["RRPClient_mut_player_hitEffects", _victim];

private _soundCache = "Land_HelipadEmpty_F" createVehicle (position _victim);
_soundCache attachTo [_victim, [0, 0, 0.2], "Spine3"];
if (_uniformDefend OR _notFullDamage) then { 
	[_soundCache, ["fly_kick", 50]] remoteExecCall ["say3D",-2];
	_damage = 0.7;
	if (_notFullDamage) then {_damage = 0.45};
	if (_notFullDamage AND _uniformDefend) then {_damage = 0.2};
	[_victim,  _damage] remoteExecCall ["RRPClient_mut_setDamage", _victim];
} else {
	[_soundCache, [selectRandom ["chimera_kill_victim_1","chimera_kill_victim_2","chimera_kill_victim_3","chimera_kill_victim_4"], 50]] remoteExecCall ["say3D",-2];
	[_victim, "player_scared_breathe", 30] remoteExecCall ["RRPClient_mut_chimera_playerSob", -2];
	[_victim,  1] remoteExecCall ["RRPClient_mut_setDamage", _victim];
};
[_victim, "Disable_Gesture"] remoteExec ["playActionNow",-2];

private _dir = _victim getRelDir _mutant;
private _sleep = 0;
if (_dir > 270 OR _dir < 90) then {
	[_victim, (_victim getDir _mutant)] remoteExecCall ["setDir", _victim];
	[_victim, "FlyFromMutant_backward"] remoteExec ["switchMove",-2];
	[_victim, [-10 * (sin (getdir _victim )), -10 * (cos (getdir _victim)), 4.5]] remoteExecCall ["setvelocity", _victim];
	[{
		params ["_soundCache", "_victim"];

		[_soundCache, ["body_impact", 50]] remoteExecCall ["say3D",-2];
		[_victim, ["body_impact_dam", 20]] remoteExecCall ["say3D",-2];
		[_victim, true] remoteExecCall ["setUnconscious", _victim];
	}, [_soundCache, _victim], 0.72] call CBA_fnc_waitAndExecute;
	
	[{
		[_this, false] remoteExecCall ["setUnconscious", _this];
		[_this, "amovpercmstpsnonwnondnon"] remoteExecCall ["playMoveNow", _this];
	}, _victim, 0.92] call CBA_fnc_waitAndExecute;

	_sleep = 0.92;
} else {
	[_victim, (getDir _mutant)] remoteExecCall ["setDir", _victim];
	[_victim, "FlyFromMutant_forward"] remoteExec ["switchMove",-2];
	[_victim, [10 * (sin(getdir _victim)), 10 * (cos(getdir _victim)), 4.5]] remoteExec ["setvelocity", _victim];
	
	[{
		params ["_soundCache", "_victim"];

		[_soundCache, ["body_impact", 50]] remoteExecCall ["say3D",-2];
		[_victim, ["body_impact_dam", 20]] remoteExecCall ["say3D",-2];
	}, [_soundCache, _victim], 0.9] call CBA_fnc_waitAndExecute;
	[{
		[_this, true] remoteExecCall ["setUnconscious", _this];
	}, _victim, 1.1] call CBA_fnc_waitAndExecute;
	[{
		[_this, false] remoteExecCall ["setUnconscious", _this];
		[_this, "amovpercmstpsnonwnondnon"] remoteExecCall ["playMoveNow", _this];
	}, _victim, 1.3] call CBA_fnc_waitAndExecute;

	_sleep = 1.3;
};

[{
	params ["_victim", "_mutant", "_soundCache"];

	[_victim, _mutant] remoteExecCall ["enableCollisionWith", _victim];
	deleteVehicle _soundCache
}, [_victim, _mutant, _soundCache], _sleep + 2] call CBA_fnc_waitAndExecute;