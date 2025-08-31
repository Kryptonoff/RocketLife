
params ["_victim"];

[] remoteExecCall ["RRPClient_mut_hitEffects", _victim];
[_victim] call RRPHC_mut_player_hitAnims;
[_victim, 0.2] remoteExecCall ["RRPClient_mut_setDamage",_victim];

private _soundCache = "Land_HelipadEmpty_F" createVehicle (position _victim);
_soundCache attachTo [_victim, [0, 0, 0.2], "Spine3"]; 
[_soundCache, [selectRandom["flesh_attack_hit_0","flesh_attack_hit_1"], 60]] remoteExecCall ["say3D",-2];

[{deleteVehicle _this}, _soundCache, 3] call CBA_fnc_waitAndExecute;