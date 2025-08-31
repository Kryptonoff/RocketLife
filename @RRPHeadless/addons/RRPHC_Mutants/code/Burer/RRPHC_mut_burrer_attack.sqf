
private _mutant = _this select 0;

if ((alive _mutant) AND 
		{(_mutant getVariable "canMakeAttack" == 0)} AND 
		{!(animationState _mutant in ["burer_power_attack","burer_melee_attack","burer_shield_in","burer_shield_loop","burer_shield_out","burer_stamina_attack"])}
	) then {
	if (_mutant getVariable "AI_CanMakeTakeAttack" == 0 AND {_mutant getVariable "AI_CanMakeShieldAttack" == 1}) then {
		[_mutant, "Burer_stamina_attack"] remoteExec ["switchMove",-2];
		_mutant setVariable ["canMakeAttack", 1];
		_mutant setVariable ["AI_CanMakeTakeAttack", 1];

		_soundCache = "Land_HelipadEmpty_F" createVehicle (position _mutant);
		_soundCache attachTo [_mutant, [0,0,0]];
		[_soundCache, ["burer_attack_0", 150]] remoteExecCall ["say3D",-2];
		[_soundCache, ["burer_gravi_wave_0", 150]] remoteExecCall ["say3D",-2];
		[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
			if (!(simulationEnabled _mutant) OR (animationState _mutant != "Burer_stamina_attack")) exitWith {};
	
			{
				if ((typeOf _x != "Burer_RIMAS") AND (alive _x)) then {
					_dir = _mutant getRelDir _x;
					if (_dir > 270 OR _dir < 90) then {
						_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
						if (_ifInter isEqualTo []) then {
							if (!(uniform _x in mutantsForms)) then {
								[] remoteExecCall ["RRPClient_mut_burer_takeWeapon", _x];
							} else {
								[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
							};
						};
					};
				};
			} forEach nearestObjects[getPosATL _mutant, ["Man"], 30];
		}, _mutant, 0.4] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["canMakeAttack", 0];
		}, _mutant, 0.8] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};
			if (animationState _mutant != "Burer_stamina_attack") exitWith {};

			[_mutant, "Burer_idle_1"] remoteExec ["switchMove",-2];
		}, _mutant, 1.9] call CBA_fnc_waitAndExecute;

		[{
			_mutant = _this;
			if !(alive _mutant) exitWith {};

			_mutant setVariable ["AI_CanMakeTakeAttack", 0];
		}, _mutant, 31.9] call CBA_fnc_waitAndExecute;
	} else {
		if ((_mutant getVariable "AI_CanMakePushAttack" == 0)) then {
			[_mutant, "Burer_power_attack"] remoteExec ["switchMove",-2];
			_mutant setVariable ["canMakeAttack", 1];
			_mutant setVariable ["AI_CanMakePushAttack", 1];

			_soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
			_soundCache attachTo [_mutant,[0,0,0]];
			[_soundCache, ["burer_attack_0", 150]] remoteExecCall ["say3D",-2];
			[_soundCache, ["burer_gravi_wave_0", 150]] remoteExecCall ["say3D",-2];
			[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};
				if (!(simulationEnabled _mutant) OR {(animationState _mutant != "Burer_power_attack")}) exitWith {};
				_effect = "#particlesource" createVehicle getPosATL _mutant; 
				_effect attachto [_mutant,[0,1,0.3]];  
				_effect setParticleClass "HDustVTOL1"; 
				detach _effect;
				[{deleteVehicle _this}, _effect, 0.6] call CBA_fnc_waitAndExecute;
				{
					if ((typeOf _x != "Burer_RIMAS") AND {(alive _x)}) then {
						_dir = _mutant getRelDir _x;
						if (_dir > 270 OR _dir < 90) then {
							_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
							if (_ifInter isEqualTo []) then {
								if (!(uniform _x in mutantsForms)) then {
									[_x, _mutant] remoteExecCall ["RRPClient_mut_burer_pushFlyAttack", _x];
								} else {
									[_x] call RRPHC_mut_bloodsucker_hitProcess;
								};
							};
						};
					};
				} forEach nearestObjects[getPosATL _mutant, ["Man"], 30];
			}, _mutant, 0.9] call CBA_fnc_waitAndExecute;

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};

				_mutant setVariable ["canMakeAttack", 0];
			}, _mutant, 1.5] call CBA_fnc_waitAndExecute;

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};
				if (animationState _mutant != "Burer_power_attack") exitWith {};

				[_mutant, "Burer_idle_1"] remoteExec ["switchMove",-2];
			}, _mutant, 2.5] call CBA_fnc_waitAndExecute;

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};
					
				_mutant setVariable ["AI_CanMakePushAttack", 0];
			}, _mutant, 32.5] call CBA_fnc_waitAndExecute;
		} else {
			_soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
			_soundCache attachTo [_mutant,[0,0,0]];
			[_soundCache, "burer_attack_0", 150] call CBA_fnc_globalSay3d;
			[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;

			[_mutant, "Burer_melee_attack"] remoteExec ["switchMove",-2];
			_mutant setVariable ["canMakeAttack", 1];

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};
				if (!(simulationEnabled _mutant) OR {(animationState _mutant != "Burer_melee_attack")}) exitWith {};
		
				{
					if ((typeOf _x != "Burer_RIMAS") AND (alive _x)) then {
						_dir = _mutant getRelDir _x;
						if (_dir > 270 OR _dir < 90) then {
							_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
							if (_ifInter isEqualTo []) then {
								[_x] call RRPHC_mut_bloodsucker_hitProcess;
							};
						};
					};
				} forEach nearestObjects[getPosATL _mutant, ["Man"], 2.5];
			}, _mutant, 0.7] call CBA_fnc_waitAndExecute;

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};
				if (!(simulationEnabled _mutant) OR {(animationState _mutant != "Burer_melee_attack")}) exitWith {};
		
				{
					if ((typeOf _x != "Burer_RIMAS") AND {(alive _x)}) then {
						_dir = _mutant getRelDir _x;
						if (_dir > 270 OR _dir < 90) then {
							_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
							if (_ifInter isEqualTo []) then {
								[_x] call RRPHC_mut_bloodsucker_hitProcess;
							};
						};
					};
				} forEach nearestObjects[getPosATL _mutant, ["Man"], 2.5];
			}, _mutant, 1.7] call CBA_fnc_waitAndExecute;

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};
				_mutant setVariable ["canMakeAttack", 0];
				if (animationState _mutant != "Burer_melee_attack") exitWith {};
				[_mutant, "Burer_idle_1"] remoteExec ["switchMove",-2];
			}, _mutant, 2.5] call CBA_fnc_waitAndExecute;
		};
	};
};