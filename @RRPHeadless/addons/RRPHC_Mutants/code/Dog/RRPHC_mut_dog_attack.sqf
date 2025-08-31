
private _mutant = _this;

if ((alive _mutant) and !(animationState _mutant in ["psina_attack_1", "psina_attack_2"]) and (_mutant getVariable "canMakeAttack" == 0)) then {
	[_mutant, selectRandom["psina_attack_1", "psina_attack_2"]] remoteExec ["switchMove",-2];
	_mutant setVariable ["canMakeAttack", 1];
	[_mutant, (selectRandom["dog_attack_hit_0", "dog_attack_hit_1", "dog_attack_hit_2", "dog_attack_hit_3"]), 70] call CBA_fnc_globalSay3d;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};

		_mutant setVariable ["AI_CanTurn", 1];
		_myNearestEnemy = _mutant findNearestEnemy _mutant;
		if (((_myNearestEnemy distance _mutant) <= 2.3) and {(alive _myNearestEnemy)} and {(alive _mutant)} and {(simulationEnabled _mutant)}) then {
			_dir = _mutant getRelDir _myNearestEnemy;
			if (_dir > 270 OR _dir < 90) then {
				if !(lineIntersects[eyePos _mutant, eyePos _myNearestEnemy, _mutant, _myNearestEnemy]) then {
					[_myNearestEnemy] call RRPHC_mut_dog_hitProcess;
				};
			};
		};
	}, _mutant, 0.3] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};

		_mutant setVariable ["AI_CanTurn", 0];
		_mutant setVariable ["canMakeAttack", 0];
		[_mutant, "psina_idle_1"] remoteExec ["switchMove",-2];
	}, _mutant, 0.95] call CBA_fnc_waitAndExecute;
};