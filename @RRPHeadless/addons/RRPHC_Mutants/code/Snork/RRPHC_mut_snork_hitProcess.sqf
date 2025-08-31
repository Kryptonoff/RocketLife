
params ["_victim", "_hitter"];

[_victim, _hitter] remoteExecCall ["disableCollisionWith", _victim];
[] remoteExecCall ["RRPClient_mut_player_hitEffects", _victim];

if ((damage _victim) >= 0.8) then {
	_victim setVelocity [0,0,0];
	if !(uniform _victim in mutantsForms) then {
		[_victim, selectRandom ["Zombie_Unnarmed_death_1","Zombie_Unnarmed_death_2","Zombie_Unnarmed_death_3"]] remoteExec ["switchMove",-2];
	};
	[_victim, 0.9] call RRPClient_mut_setDamage;
} else {
	[_victim, 0.07] remoteExecCall ["RRPClient_mut_setDamage",_victim];
	[_victim] call RRPHC_mut_player_hitAnims;
};

private _soundCache = "Land_HelipadEmpty_F" createVehicle (position _victim);
_soundCache attachTo [_victim, [0, 0, 0.2], "Spine3"]; 
[_soundCache, [selectRandom["flesh_attack_hit_0","flesh_attack_hit_1"], 60]] remoteExecCall ["say3D",-2];

[{_this remoteExecCall ["enableCollisionWith", _this select 0]}, [_victim, _hitter], 0.6] call CBA_fnc_waitAndExecute;
[{deleteVehicle _this}, _soundCache, 3.1] call CBA_fnc_waitAndExecute;