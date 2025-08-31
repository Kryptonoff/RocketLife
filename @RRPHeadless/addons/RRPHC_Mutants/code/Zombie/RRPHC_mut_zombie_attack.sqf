
private _mutant = _this select 0;

if ((_mutant getVariable "canMakeAttack" == 0) AND (alive _mutant)) then {
	[_mutant, [selectRandom["zombie_attack_1","zombie_attack_2","zombie_attack_3","zombie_attack_4","zombie_attack_5","zombie_attack_6","zombie_attack_7","zombie_attack_8","zombie_attack_9","zombie_attack_10"], 45]] remoteExecCall ["say3D",-2];
	if (animationState _mutant == "Zombie_Unnarmed_attack_1") then {
		[_mutant, "Zombie_Unnarmed_attack_2"] remoteExec ["switchMove",-2];
		_mutant setVariable ["canMakeAttack", 1];

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["AI_CanTurn", 1];
			_mutant setvelocity [5 * (sin (getdir _mutant)), 5 * (cos (getdir _mutant)), 1.1]; 
			
			if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Zombie_Unnarmed_attack_2")) exitWith {};
			{
				if ((typeOf _x != "Zombie_Ex_Mutant_01") AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_isBehindGeometry = lineIntersects [eyePos _mutant, eyePos _x, _mutant, _x];
						if !(_isBehindGeometry) then {
							[_x] call RRPHC_mut_zombie_hitProcess;
						};
					};
				};
			} forEach nearestObjects [getPosATL _mutant, ["Man"], 2.9];
		}, _mutant, 0.1] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["AI_CanTurn", 0];
			_mutant setVariable ["canMakeAttack", 0];
		}, _mutant, 1.1] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			if (animationState _mutant == "Zombie_Unnarmed_attack_2") then {
				[_mutant, "Zombie_Unnarmed_idle"] remoteExec ["switchMove",-2];
			};
		}, _mutant, 1.5] call CBA_fnc_waitAndExecute;
	} else {
		[_mutant, "Zombie_Unnarmed_attack_1"] remoteExec ["switchMove",-2];
		_mutant setVariable ["canMakeAttack", 1];
		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["AI_CanTurn", 1];
			_mutant setvelocity [5 * (sin (getdir _mutant)), 5 * (cos (getdir _mutant)), 1.1]; 
			
			if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Zombie_Unnarmed_attack_1")) exitWith {};
			{
				if ((typeOf _x != "Zombie_Ex_Mutant_01") AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_isBehindGeometry = lineIntersects [eyePos _mutant, eyePos _x, _mutant, _x];
						if !(_isBehindGeometry) then {
							[_x] call RRPHC_mut_zombie_hitProcess;
						};
					};
				};
			} forEach nearestObjects [getPosATL _mutant, ["Man"], 2.9];
		}, _mutant, 1.2] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["AI_CanTurn", 0];
			_mutant setVariable ["canMakeAttack", 0];
		}, _mutant, 2] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			if (animationState _mutant == "Zombie_Unnarmed_attack_1") then {
				[_mutant, "Zombie_Unnarmed_idle"] remoteExec ["switchMove",-2];
			};
		}, _mutant, 2.7] call CBA_fnc_waitAndExecute;
	};
};
