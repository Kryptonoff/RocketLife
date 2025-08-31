
params ["_mutant", "_victim"];

if ((_mutant getVariable "AI_CanGrab" == 0) and 
		{(_mutant getVariable "canMakeAttack" == 0)} and 
		{(alive _mutant)} and 
		{!(animationState _mutant in ["krovosos_catch_start_main", "krovosos_catch_loop_main", "krovosos_catch_end_main", "krovosos_catch_end_suck_main", "krovosos_attack_1", "krovosos_attack_2", "krovosos_run_attack"])}
	) then {
	_mutant setVariable ["AI_CanTurn", 1];
	_mutant setVariable ["canMakeAttack", 1];
	_mutant setVariable ["AI_CanGrab", 1];
	_mutant setVariable ["AI_GrabbedPerson", _victim];

	_krovosForms = ["BS_Ex_Mutant_01","BSI_Ex_Mutant_01"];
	removeUniform _mutant; 
	_mutant forceAddUniform "BS_Ex_Mutant_01";

	{
		if ((typeOf _x) == "BS_Ex_Mutant_01") then {
			_x setVariable ["AI_CanGrab", 1];
			[{_this setVariable ["AI_CanGrab", 0]}, _x, 30] call CBA_fnc_waitAndExecute;
		};
	} forEach nearestObjects [_mutant, ["Man"], 25];

	[_victim, "Disable_Gesture"] remoteExec ["playActionNow",-2];
	[_mutant, "Disable_Gesture"] remoteExec ["playActionNow",-2];

	_mutant disableAI "ALL";
	[_victim, ((_victim getDir _mutant))] remoteExec ["setDir", _victim];

	[_victim, "KROVOSOS_catch_start_victim"] remoteExec ["switchMove",-2];
	[_mutant, "KROVOSOS_catch_start_main"] remoteExec ["switchMove",-2];

	_mutant attachTo [_victim, [0,-0.1,0]]; 
	[_victim, _mutant] remoteExecCall ["disableCollisionWith", -2, _victim]; 
	
	[{
		params ["_mutant", "_victim"];
		if !(alive _mutant) exitWith {};

		[_victim, "catch_hand", 50] call RRPHC_mut_playSound;
	}, [_mutant, _victim], 0.35] call CBA_fnc_waitAndExecute;

	[{
		params ["_mutant", "_victim"];
		if !(alive _mutant) exitWith {};

		[_victim, "catch_fly", 50] call RRPHC_mut_playSound;
		removeUniform _mutant; 
		_mutant forceAddUniform "BS_Ex_Mutant_01";
		[_victim, [-25 * (sin (getdir _victim )), -25 * (cos (getdir _victim)), 13]] remoteExecCall ["setvelocity", _victim];
		{[_victim, _x] remoteExecCall ["disableCollisionWith", _victim]} forEach nearestTerrainObjects [_victim, ["TREE","SMALL TREE","BUSH"], 50]; 

		[{
			if (!(alive _this) OR {(isTouchingGround _this)}) exitWith {};
	
			[_this, [21 * (sin (getdir _this )), 21 * (cos (getdir _this)), -15]] remoteExecCall ["setvelocity", _this];
		}, _victim, 10] call CBA_fnc_waitAndExecute;
	}, [_mutant, _victim], 0.7] call CBA_fnc_waitAndExecute;

	[{
		params ["_mutant", "_victim"];
		if !(alive _mutant) exitWith {};

		[_victim, "KROVOSOS_catch_loop_victim"] remoteExec ["switchMove",-2];
		[_mutant, "KROVOSOS_catch_loop_main"] remoteExec ["switchMove",-2];
		removeUniform _mutant; 
		_mutant forceAddUniform "BS_Ex_Mutant_01";
	}, [_mutant, _victim], 0.85] call CBA_fnc_waitAndExecute;
	//в следующем к слипу +0.1 потому что не успевает взлететь
	[{
		params ["_mutant", "_victim"];
		if !(alive _mutant) exitWith {};

		[{isTouchingGround (_this select 1)}, 
		{
			params ["_mutant", "_victim"];
			if !(alive _mutant) exitWith {};

			{[_victim, _x] remoteExecCall ["enableCollisionWith", _victim]} forEach nearestTerrainObjects [_victim, ["TREE","SMALL TREE","BUSH"], 100]; 
			
			[_victim, "catch_ground", 70] call RRPHC_mut_playSound;
			if ((damage _mutant) >= 0.1) then {
				[_victim, "KROVOSOS_catch_end_suck_victim"] remoteExec ["switchMove",-2];
				[_mutant, "KROVOSOS_catch_end_suck_main"] remoteExec ["switchMove",-2];
				_electra = "#particlesource" createVehicle position _victim; 
				_electra setParticleClass "HDustVTOL1"; 
				_electra attachto [_victim,[0,0,2]];  
				detach _electra;
				[{deleteVehicle _this}, _electra, 0.3] call CBA_fnc_waitAndExecute;

				[{
					params ["_mutant", "_victim"];
					if !(alive _mutant) exitWith {};

					[_mutant, "bloodsucker_eat_0", 70] call RRPHC_mut_playSound;
					[_mutant, "bloodsucker_vampire_hit", 70] call RRPHC_mut_playSound;
					[_mutant, 0] call RRPClient_mut_setDamage;
				}, [_mutant, _victim], 1.3] call CBA_fnc_waitAndExecute;
				
				[{
					params ["_mutant", "_victim"];
					if !(alive _mutant) exitWith {};

					_mutant setVariable ["canMakeAttack", 0];
					removeUniform _mutant; 
					_mutant forceAddUniform "BSI_Ex_Mutant_01";
					[_victim, 1] call RRPClient_mut_setDamage;
					[_victim, true] remoteExec ["setCaptive",-2];
				}, [_mutant, _victim], 5.8] call CBA_fnc_waitAndExecute;
				
				[{
					params ["_mutant", "_victim"];
					if !(alive _mutant) exitWith {};

					_mutant setVariable ["AI_GrabbedPerson", objNull];
					detach _mutant;
					[_victim, true] remoteExec ["setUnconscious",-2];
					_mutant setVariable ["AI_CanTurn", 0];
					[_mutant, "KROVOSOS_RUN"] remoteExec ["switchMove",-2];
					[_mutant, "KROVOSOS_RUN"] remoteExec ["playMoveNow",-2];
					[{[_this, false] remoteExec ["setUnconscious",-2]; [_this, false] remoteExec ["setCaptive",-2]}, _victim, 10] call CBA_fnc_waitAndExecute;
					[{_this setVariable ["AI_CanGrab", 0]}, _mutant, 10] call CBA_fnc_waitAndExecute;
				}, [_mutant, _victim], 6] call CBA_fnc_waitAndExecute;
			} else {
				[_victim, "KROVOSOS_catch_end_victim"] remoteExec ["switchMove",-2];
				[_mutant, "KROVOSOS_catch_end_main"] remoteExec ["switchMove",-2];
				_electra = "#particlesource" createVehicle position _victim; 
				_electra setParticleClass "HDustVTOL1"; 
				_electra attachto [_victim,[0,0,2]];  
				detach _electra;
				[{deleteVehicle _this}, _electra, 0.3] call CBA_fnc_waitAndExecute;

				[{
					params ["_mutant", "_victim"];
					if !(alive _mutant) exitWith {};

					_mutant setVariable ["canMakeAttack", 0];
					removeUniform _mutant; 
					_mutant forceAddUniform "BSI_Ex_Mutant_01";
					[_victim, true] remoteExec ["setCaptive",-2];	
				}, [_mutant, _victim], 2.3] call CBA_fnc_waitAndExecute;

				[{
					params ["_mutant", "_victim"];
					if !(alive _mutant) exitWith {};

					_mutant setVariable ["AI_GrabbedPerson", objNull];
					detach _mutant;
					[_victim, true] remoteExec ["setUnconscious",-2];
					_mutant setVariable ["AI_CanTurn", 0];
					[_mutant, "KROVOSOS_RUN"] remoteExec ["switchMove",-2];
					[_mutant, "KROVOSOS_RUN"] remoteExec ["playMoveNow",-2];
					[{[_this, false] remoteExec ["setUnconscious",-2]; [_this, false] remoteExec ["setCaptive",-2]}, _victim, 10] call CBA_fnc_waitAndExecute;
					[{_this setVariable ["AI_CanGrab", 0]}, _mutant, 10] call CBA_fnc_waitAndExecute;
				}, [_mutant, _victim], 2.5] call CBA_fnc_waitAndExecute;
			};		
		}, _this] call CBA_fnc_waitUntilAndExecute;
	}, [_mutant, _victim], 0.95] call CBA_fnc_waitAndExecute;
};