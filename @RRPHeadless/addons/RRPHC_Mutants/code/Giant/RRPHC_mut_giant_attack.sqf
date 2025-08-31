
private _mutant = _this select 0;

if ((alive _mutant) AND (_mutant getVariable "canMakeAttack" == 0) AND !(animationState _mutant in ["snork_attack_1", "pseudogiant_attack_stomp", "pseudogiant_attack_1", "pseudogiant_attack_2", "pseudogiant_attack_3"])) then {
	if ((_mutant getVariable "AI_CanMakePushAttack" == 0) and (alive _mutant)) then {
		_mutant setVariable ["canMakeAttack", 1];
		_mutant setVariable ["AI_CanMakePushAttack", 1];
		[_mutant, "Pseudogiant_attack_stomp"] remoteExec ["switchMove",-2];

		_soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
		_soundCache attachTo [_mutant, [0,0,0]];
		[_soundCache, [selectRandom["giant_aggressive_0","giant_aggressive_1"], 200]] remoteExecCall ["say3D",-2];
		[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;
		
		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
			if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Pseudogiant_attack_stomp")) exitWith {};

			_snd = "#particlesource" createVehicle getPosATL _mutant; 
			_snd attachto [_mutant, [0,1,0.3]];  
			_effect = "#particlesource" createVehicle getPosATL _mutant; 
			_effect attachto [_mutant, [0,1,0.3]];  
			_effect setParticleClass "HDustVTOL1"; 
			detach _effect;
			[_snd, ["giant_stomp_0", 200]] remoteExecCall ["say3D",-2];
			[{deleteVehicle _this}, _effect, 0.6] call CBA_fnc_waitAndExecute;
			[{deleteVehicle _this}, _snd, 1.1] call CBA_fnc_waitAndExecute;
			{
				if ((typeOf _x != "Pseudo_RIMAS") AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							if (!(uniform _x in mutantsForms)) then {
								[_x, _mutant] call RRPHC_mut_giant_hitProcess;
							} else {
								[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
							};
						};
					};
				};
			} forEach nearestObjects[getPosATL _mutant, ["Man"], 10];
		}, _mutant, 1.5] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
			_mutant enableAI "ANIM";
			_mutant enableAI "MOVE";
			_mutant enableAI "PATH";
			if !(animationState _mutant == "Pseudogiant_attack_stomp") exitWith {};

		    _mutant setVariable ["AI_CanTurn", 0];
			_mutant setVariable ["canMakeAttack", 0];
			_mutant enableAI "MOVE";
			_mutant enableAI "PATH";
			[_mutant, "Pseudogiant_idle_1"] remoteExec ["switchMove",-2];
			[{_this setVariable ["AI_CanMakePushAttack", 0]}, _mutant, 20] call CBA_fnc_waitAndExecute;
		}, _mutant, 3.7] call CBA_fnc_waitAndExecute;

	} else {
		[_mutant, selectRandom ["Pseudogiant_attack_1","Pseudogiant_attack_2","Pseudogiant_attack_3"]] remoteExec ["switchMove",-2];
		_mutant setVariable ["canMakeAttack", 1];
		[_mutant, [selectRandom["giant_attack_0", "giant_attack_1"], 70]] remoteExecCall ["say3D",-2];

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
			_mutant setVariable ["AI_CanTurn", 1];
			if !(simulationEnabled _mutant) exitWith {};

			{
				if ((typeOf _x != "Pseudo_RIMAS") AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							[_x, _mutant] call RRPHC_mut_snork_hitProcess;
						};
					};
				};
			} forEach nearestObjects[getPosATL _mutant, ["Man"], 2.7];
		}, _mutant, 0.5] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["AI_CanTurn", 0];
			_mutant setVariable ["canMakeAttack", 0];
			[_mutant, "Pseudogiant_idle_1"] remoteExec ["switchMove",-2];
		}, _mutant, 1.5] call CBA_fnc_waitAndExecute;
	};
};