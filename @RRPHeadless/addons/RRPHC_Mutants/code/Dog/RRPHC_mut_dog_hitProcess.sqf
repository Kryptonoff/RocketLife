
params ["_victim"];
diag_log 'hitporce';
[] remoteExecCall ["RRPClient_mut_player_hitEffects", _victim];
if ((damage _victim) >= 0.89) then {
	_victim setVelocity [0, 0, 0];
	if (!(uniform _victim in mutantsForms) and !(animationState _victim in ["psina_victim_out_killpes", "psina_victim_out", "psina_victim_loop", "psina_victim_in"])) then {
		[_victim, (selectRandom["Zombie_Unnarmed_death_1", "Zombie_Unnarmed_death_2", "Zombie_Unnarmed_death_3"])] remoteExec ["switchMove",-2]
	};
	[_victim, 1] remoteExecCall ["RRPClient_mut_setDamage", _victim];
} else {
	if !(animationState _victim in ["psina_victim_out_killpes", "psina_victim_out", "psina_victim_loop", "psina_victim_in"]) then {
		[_victim, 0.1] remoteExecCall ["RRPClient_mut_setDamage", _victim];
		[_victim] call RRPHC_mut_player_hitAnims;
	} else {
		[_victim, 0.04] remoteExecCall ["RRPClient_mut_setDamage", _victim];
	};
};
private _soundCache = "Land_HelipadEmpty_F" createVehicle position _victim;
_soundCache attachTo [_victim, [0, 0, 0.2], "Spine3"];
[_soundCache, (selectRandom["flesh_attack_hit_0", "flesh_attack_hit_1"])] remoteExecCall ["say3D",-2];

[{deleteVehicle _this}, _soundCache, 3] call CBA_fnc_waitAndExecute;