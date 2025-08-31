
params ["_mutant", "_victim"];

if ((_mutant getVariable "AI_CanGrab" == 0) AND (_mutant getVariable "canMakeAttack" == 0) AND (alive _mutant) AND (alive _victim) AND !(animationState _victim in ["psina_victim_out_killpes", "psina_victim_out", "psina_victim_loop", "psina_victim_in"])) then {
	_mutant setVariable["AI_CanTurn", 1];
	_mutant setVariable["canMakeAttack", 1];

	{
		if (uniform _x in ["Dog_01","Dog_02","Dog_03","Dog_04"]) then {
			_x setVariable ["AI_CanGrab", 1];
			[{_this setVariable ["AI_CanGrab", 0]}, _x, 10] call CBA_fnc_waitAndExecute;
		};
	} forEach nearestObjects[_mutant, ["Man"], 25];

	[_victim, "Disable_Gesture"] remoteExec ["playActionNow",-2];
	_mutant disableAI "ALL";

	[_victim, ((_victim getDir _mutant))] remoteExecCall ["setDir",-2];
	[_victim, "psina_victim_in"] remoteExec ["switchMove",-2];
	
	[_mutant, [selectRandom ["bdog_attack_0","bdog_attack_1","bdog_attack_2","bdog_attack_3"], 40]] remoteExecCall ["say3D",-2];
	
	[_victim, ["dog_supAttack_start", 30]] remoteExecCall ["say3D",-2];
	[selectRandom["player_pre_shot_1", "player_pre_shot_2"]] remoteExecCall ["playSound", _victim];

	[_mutant, "psina_main_in"] remoteExec ["switchMove",-2];
	_mutant attachTo [_victim, [0, 0, 0]];
	[_victim, _mutant] remoteExecCall ["disableCollisionWith", _victim];

	[{
		params ["_mutant", "_victim"];
		if !(alive _victim) exitWith {
			[_victim, "psina_victim_out"] remoteExec ["switchMove",-2]; 
			[_mutant, "psina_main_out"] remoteExec ["switchMove",-2];
			_soundCache = "Land_HelipadEmpty_F" createVehicle position _victim;
			_soundCache attachTo [_victim, [0, 0, 0], "Head"]; 
			detach _soundCache;
			[_soundCache, [selectRandom ["dog_attack_hit_0","dog_attack_hit_1","dog_attack_hit_2","dog_attack_hit_3"], 20]] remoteExecCall ["say3D",-2];
			[{[_this, [selectRandom ["chimera_kill_victim_1","chimera_kill_victim_2","chimera_kill_victim_3","chimera_kill_victim_4"], 20]] remoteExecCall ["say3D",-2]}, _soundCache, 0.2] call CBA_fnc_waitAndExecute;
			[{
				detach _this;
				_this enableAI "ALL";
				_this setVariable["canMakeAttack", 0];
				[_this, "psina_run"] remoteExec["switchMove",-2];
			}, _mutant, 1.5] call CBA_fnc_waitAndExecute;

			[{deleteVehicle _this}, _soundCache, 4.5] call CBA_fnc_waitAndExecute;

		};
		if !(alive _mutant) exitWith {
			[_victim, "psina_victim_out_killPes"] remoteExec ["switchMove",-2]; 
			[_mutant, "psina_main_out_killPes"] remoteExec ["switchMove",-2];
			
			[{
				params ["_mutant", "_victim"];

				detach _mutant;
				if ((currentWeapon _victim == primaryWeapon _victim) and !(currentWeapon _victim == "")) exitWith {[_victim, "AmovPercMstpSrasWrflDnon"] remoteExec ["playMoveNow", _victim]};
				if ((currentWeapon _victim == handgunWeapon _victim) and !(currentWeapon _victim == "")) exitWith {[_victim, "AmovPercMstpSrasWpstDnon"] remoteExec ["playMoveNow", _victim]};
				[_victim, "AmovPercMstpSnonWnonDnon"] remoteExec ["playMoveNow", _victim];
			}, [_mutant, _victim], 4.5] call CBA_fnc_waitAndExecute;
		};

		[_victim, "psina_victim_loop"] remoteExec ["switchMove",-2]; 
		[_mutant, "psina_main_loop"] remoteExec ["switchMove",-2];
		playSound "dog_supAttack_loop";
		[_mutant, [selectRandom ["dog_attack_hit_0","dog_attack_hit_1","dog_attack_hit_2","dog_attack_hit_3"], 20]] remoteExecCall ["say3D",-2];

		[{
			params ["_mutant", "_victim"];
			_victim setVariable ["dog_catch", nil, true];
			[true] remoteExecCall ["RRPClient_mut_dog_attackCatch", _victim];

			[{
				params ["_mutant", "_victim"];
				if ((!(_victim getVariable ["dog_catch", false]) or !(alive _victim)) and (alive _mutant)) then {
					[false] remoteExecCall ["RRPClient_mut_dog_attackCatch", _victim];
					[_victim, "psina_victim_out"] remoteExec ["switchMove",-2]; 
					[_mutant, "psina_main_out"] remoteExec ["switchMove",-2];
					_soundCache = "Land_HelipadEmpty_F" createVehicle position _victim;
					_soundCache attachTo [_victim, [0, 0, 0], "Head"]; 
					detach _soundCache;
					[_soundCache, [selectRandom ["dog_attack_hit_0","dog_attack_hit_1","dog_attack_hit_2","dog_attack_hit_3"], 20]] remoteExecCall ["say3D",-2];
					[{[_this, [selectRandom ["chimera_kill_victim_1","chimera_kill_victim_2","chimera_kill_victim_3","chimera_kill_victim_4"], 20]] remoteExecCall ["say3D",-2]}, _soundCache, 0.2] call CBA_fnc_waitAndExecute;
					[{_this setDamage 1}, _victim, 0.5] call CBA_fnc_waitAndExecute;
					[{
						detach _this;
						_this enableAI "ALL";
						_this setVariable ["canMakeAttack", 0];
						if ((alive _this) and (animationState _this == "psina_main_out")) then {[_this, "psina_run"] remoteExec["switchMove"]};
					}, _mutant, 1.5] call CBA_fnc_waitAndExecute;
			
					[{deleteVehicle _this}, _soundCache, 4.5] call CBA_fnc_waitAndExecute;
				} else {
					[_victim, "psina_victim_out_killPes"] remoteExec ["switchMove",-2]; 
					[_mutant, "psina_main_out_killPes"] remoteExec ["switchMove",-2];
					_soundCache = "Land_HelipadEmpty_F" createVehicle position _victim;
					_soundCache attachTo [_victim, [0, 0, 0], "Head"]; 
					[_soundCache, ["dog_supAttack_out", 40]] remoteExecCall ["say3D",-2];
					[{_this setDamage 1}, _mutant, 2] call CBA_fnc_waitAndExecute;
					[{
						params ["_mutant", "_victim"];
			
						detach _mutant;
						if ((currentWeapon _victim == primaryWeapon _victim) and !(currentWeapon _victim == "")) exitWith {[_victim, "AmovPercMstpSrasWrflDnon"] remoteExec ["playMoveNow", _victim]};
						if ((currentWeapon _victim == handgunWeapon _victim) and !(currentWeapon _victim == "")) exitWith {[_victim, "AmovPercMstpSrasWpstDnon"] remoteExec ["playMoveNow", _victim]};
						[_victim, "AmovPercMstpSnonWnonDnon"] remoteExec ["playMoveNow", _victim];
					}, [_mutant, _victim], 2.5] call CBA_fnc_waitAndExecute;
					[{deleteVehicle _this}, _soundCache, 10.5] call CBA_fnc_waitAndExecute;
				};
			}, [_mutant, _victim], 0.85] call CBA_fnc_waitAndExecute;
		}, [_mutant, _victim], 1] call CBA_fnc_waitAndExecute;
	}, [_mutant, _victim], 1.18] call CBA_fnc_waitAndExecute;
};