
private _mutant = _this select 0;

private _cloakParticleNano = "#particlesource" createVehicleLocal (getPosATL _mutant);   
_cloakParticleNano setParticleCircle [0, [0.1, 0.1, 0.1]];  
_cloakParticleNano setParticleRandom [0, [0, 0.1, 1], [0.1, 0, 0.1], 0, 0.1, [0, 0, 0, 0.1], 0, 0];  
_cloakParticleNano setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.5], 9, 10, 7.9, 0.1, [0.6, 1, 0.9, 0.8], [[0.1, 0.1, 0.1, 1], [16, 16, 16, 32], [0.5, 0.5, 0.5, 0]], [0, 0.1, 0.2, 0.5, 0.1, 0.1], 0, 0, "", "", _mutant];  
_cloakParticleNano setDropInterval 0.01;  
_cloakParticleNano attachTo [_mutant,[0,0,0]];   
[{deleteVehicle _this}, _cloakParticleNano, 10] call CBA_fnc_waitAndExecute;