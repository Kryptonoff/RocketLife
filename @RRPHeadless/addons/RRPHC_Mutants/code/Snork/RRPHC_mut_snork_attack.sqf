
private _mutant = _this select 0;

if ((alive _mutant) AND !(animationState _mutant in ["snork_attack_1", "snork_attack_2_1", "snork_attack_2_2"]) AND (_mutant getVariable "canMakeAttack" == 0)) then {
	if (_mutant getVariable "AI_CanMakePushAttack" == 0) then {
		_mutant setVariable["canMakeAttack", 1];
		_mutant setVariable["AI_CanMakePushAttack", 1];
		[_mutant, "SNORK_attack_2_1"] remoteExec ["switchMove",-2];

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			[_mutant, [selectRandom["snork_attack_0", "snork_attack_1"], 80]] remoteExecCall ["say3D",-2];
			[_mutant, "SNORK_attack_2_2"] remoteExec ["switchMove",-2];

			if (!(simulationEnabled _mutant)) exitWith {};

			{
				if (!(uniform _x in ["Snork_Ex_Mutant_01"]) AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							[_x, _mutant] call RRPHC_mut_snork_hitProcess;
						};
					};
				};
			} forEach nearestObjects[getPosATL _mutant, ["Man"], 3.2];

		}, _mutant, 0.75] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable["AI_CanTurn", 1];
			_nearEnemy = _mutant findNearestEnemy _mutant;
			if ((getPosATL _nearEnemy select 2) >= 0.55) then { 
				_mutant setVelocity [12 * (sin (getdir _mutant )), 12 * (cos (getdir _mutant)), 3];
			} else {
				_mutant setVelocity [12 * (sin (getdir _mutant )), 12 * (cos (getdir _mutant)), 1.6];
			};
		}, _mutant, 1.05] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
			if (!(simulationEnabled _mutant) OR !(animationState _mutant == "SNORK_attack_2_2")) exitWith {};

			{
				if (!(uniform _x in ["Snork_Ex_Mutant_01"]) AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							[_x, _mutant] call RRPHC_mut_snork_hitProcess;
						};
					};
				};
			} forEach nearestObjects[getPosATL _mutant, ["Man"], 2.9];
		}, _mutant, 1.75] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
			if (!(simulationEnabled _mutant)) exitWith {};

			{
				if (!(uniform _x in ["Snork_Ex_Mutant_01"]) AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							[_x, _mutant] call RRPHC_mut_snork_hitProcess;
						};
					};
				};
			} forEach nearestObjects[getPosATL _mutant, ["Man"], 2.9];
		}, _mutant, 1.25] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant enableAI "ANIM";
			_mutant enableAI "MOVE";
			_mutant enableAI "PATH";
			if !(animationState _mutant == "SNORK_attack_2_2") exitWith {};

		    _mutant setVariable["AI_CanTurn", 0];
			_mutant setVariable["canMakeAttack", 0];
			_mutant enableAI "MOVE";
			_mutant enableAI "PATH";
			[_mutant, "SNORK_idle"] remoteExec ["switchMove",-2];
			[{_this setVariable["AI_CanMakePushAttack", 0]}, _mutant, 10] call CBA_fnc_waitAndExecute;
		}, _mutant, 2.56] call CBA_fnc_waitAndExecute;

	} else {
		[_mutant, "SNORK_attack_1"] remoteExec ["switchMove",-2];
		_mutant setVariable ["canMakeAttack", 1];
		[_mutant, [selectRandom["snork_attack_0", "snork_attack_1"], 70]] remoteExecCall ["say3D",-2];

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["AI_CanTurn", 1];
			if (!(simulationEnabled _mutant) OR !(animationState _mutant == "SNORK_attack_1")) exitWith {};

			{
				if (!(uniform _x in ["Snork_Ex_Mutant_01"]) AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							[_x, _mutant] call RRPHC_mut_snork_hitProcess;
						};
					};
				};
			} forEach nearestObjects[getPosATL _mutant, ["Man"], 3];

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};

				_mutant setVariable["AI_CanTurn", 0];
				_mutant setVariable["canMakeAttack", 0];

				if (animationState _mutant == "SNORK_attack_1") then {
					[_mutant, "SNORK_idle"] remoteExec ["switchMove",-2];
				};
			}, _mutant, 0.609] call CBA_fnc_waitAndExecute;
		}, _mutant, 0.3] call CBA_fnc_waitAndExecute;
	};
};