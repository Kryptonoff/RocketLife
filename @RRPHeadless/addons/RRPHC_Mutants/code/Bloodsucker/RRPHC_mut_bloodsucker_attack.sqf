
params ["_mutant", "_stance"];

if (_stance == 0) then {
	if ((_mutant getVariable "canMakeAttack" == 0) and {(alive _mutant)}) then {
		if (uniform _mutant == "BSI_Ex_Mutant_01") then {
			removeUniform _mutant; 
			_mutant forceAddUniform "BS_Ex_Mutant_01";
		};

		_soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
		_soundCache attachTo [_mutant,[0,0,0]];
		_rndSnd = selectRandom["bloodsucker_attack_hit_0","bloodsucker_attack_hit_1","bloodsucker_attack_hit_2"];
		[_soundCache, _rndSnd, 100] call CBA_fnc_globalSay3d;
		[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;

		_animation = ["KROVOSOS_attack_1", "KROVOSOS_attack_2"] select (animationState _mutant == "KROVOSOS_attack_1");

		[_mutant, _animation] remoteExec ["switchMove",-2];
		_mutant setVariable ["canMakeAttack", 1];

		[{
			params ["_mutant", "_animation"];
			if !(alive _mutant) exitWith {};
			if (!(simulationEnabled _mutant) OR {!(animationState _mutant == _animation)}) exitWith {};
	
			_mutant setVariable ["AI_CanTurn", 1];
			_mutant setvelocity [-2 * (sin (getdir _mutant )), -2 * (cos (getdir _mutant)), 1.1];
	
			{ 
				if (!(uniform _x in ["BS_Ex_Mutant_01","BSI_Ex_Mutant_01"]) and {(alive _x)}) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR {_dir < 90}) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							[_x] call RRPHC_mut_bloodsucker_hitProcess;
						};
					};
				};
			} forEach nearestObjects [getPosATL  _mutant, ["Man"], 2.9];
			_mutant setVariable ["AI_CanTurn", 1];
		}, [_mutant, _animation], 0.3] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
	
			_mutant setVariable ["AI_CanTurn", 0];
			_mutant setVariable ["canMakeAttack", 0];
		}, _mutant, 1] call CBA_fnc_waitAndExecute;

		[{
			params ["_mutant", "_animation"];
			if !(alive _mutant) exitWith {};
			if !(animationState _mutant == _animation) exitWith {};
			
			[_mutant, "KROVOSOS_IDLE"] remoteExec ["switchMove",-2];
		}, [_mutant, _animation], 1.3] call CBA_fnc_waitAndExecute;

	};
} else {
	if ((_mutant getVariable "canMakeAttack" == 0) and {(alive _mutant)} and {!(animationState _mutant == "KROVOSOS_run_attack")}) then {
		if (uniform _mutant == "BSI_Ex_Mutant_01") then {
			removeUniform _mutant; 
			_mutant forceAddUniform "BS_Ex_Mutant_01";
		};

		_soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
		_soundCache attachTo [_mutant,[0,0,0]];
		_rndSnd = selectRandom["bloodsucker_attack_hit_0","bloodsucker_attack_hit_1","bloodsucker_attack_hit_2"];
		[_soundCache, _rndSnd, 100] call CBA_fnc_globalSay3d;
		[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;

		[_mutant, "KROVOSOS_run_attack"] remoteExec ["switchMove",-2];
		_mutant setVariable ["canMakeAttack", 1];
		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
			if (!(simulationEnabled _mutant) OR {!(animationState _mutant == "KROVOSOS_run_attack")}) exitWith {};
		
			{ 
				if (!(uniform _x in ["BS_Ex_Mutant_01","BSI_Ex_Mutant_01"]) and {(alive _x)}) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR {_dir < 90}) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							[_x] call RRPHC_mut_bloodsucker_hitProcess;
						};
					};
				};
			} forEach nearestObjects [getPosATL  _mutant, ["Man"], 3];
			_mutant setVariable ["AI_CanTurn", 1];
		}, _mutant, 0.3] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["canMakeAttack", 0];
			_mutant setVariable ["AI_CanTurn", 0];
			if (animationState _mutant == "KROVOSOS_run_attack") then {
				[_mutant, "KROVOSOS_run"] remoteExec ["switchMove",-2];
			};
		}, _mutant, 0.85] call CBA_fnc_waitAndExecute;
	};
};