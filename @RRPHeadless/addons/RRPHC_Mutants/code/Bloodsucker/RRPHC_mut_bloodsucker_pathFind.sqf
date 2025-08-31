
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR {!(alive _mutant)}) exitWith {/*("Мутан умер" + str time) remoteExecCall ['hint'];*/[_pfhHandle] call CBA_fnc_removePerFrameHandler};
	if (_mutant getVariable ["AI_BLCK", false]) exitWith {/*("Блок" + str time) remoteExecCall ['hint'];*/};

	_nearEnemy = _mutant findNearestEnemy _mutant;
	if (!(isNull _nearEnemy) AND 
			{(alive _nearEnemy)} AND 
			{!(animationState _mutant in ["krovosos_catch_start_main", "krovosos_catch_loop_main", "krovosos_catch_end_main", "krovosos_catch_end_suck_main"])}
		) then {
		if (animationState _mutant == "KROVOSOS_IDLE_3") then {[_mutant, "KROVOSOS_IDLE"] remoteExec ["switchMove",-2]};
		if (speed _mutant > 0) then {[_mutant, "sucker_breath_mix_0", 6.9] call RRPHC_mut_AggresiveSound};

		_enemyPosATL = getPosATL _nearEnemy;

		if ((_mutant distance _nearEnemy > 120) OR {((_enemyPosATL select 2) >= 1.45)} OR {!((lineIntersectsSurfaces[getPosASL _nearEnemy, eyePos _mutant, _nearEnemy, _mutant, true, 1, "GEOM", "FIRE"]) isEqualTo [])}) then {
			_mutant enableAI "PATH";
			_mutant enableAI "ANIM";
			group _mutant setSpeedMode "FULL";
			_mutant setVariable ["IMS_IsAnimPlayed", 0];
			if (!(isNull _nearEnemy) AND {((_nearEnemy distance _mutant) <= 200)}) then {
				if ((_enemyPosATL select 2) >= 1.45) then {
					_pos = _mutant getVariable "UnitPos_MUT";
					_mutant doMove [(_pos select 0) + random 50, (_pos select 1) + random 50, (_pos select 2)];
					
					if ((uniform _mutant == "BS_Ex_Mutant_01")) then {
						removeUniform _mutant; 
						_mutant forceAddUniform "BSI_Ex_Mutant_01";
						[_mutant, selectRandom ["bloodsucker_invisible","bloodsucker_invisible_2"], 40] call RRPHC_mut_playSound;
					};

					_mutant setVariable ["AI_BLCK", true];
					[{_this setVariable ["AI_BLCK", false]}, _mutant, 1] call CBA_fnc_waitAndExecute;
					//("I am running awaaaaay!" + str time) remoteExecCall ['hint',-2];
				} else {
					_mutant doMove _enemyPosATL;

					_mutant setVariable ["AI_BLCK", true];
					[{_this setVariable ["AI_BLCK", false]}, _mutant, 1] call CBA_fnc_waitAndExecute;
					//("Coming for ya! >:c" + str time) remoteExecCall ['hint',-2];
				};
			};
		} else {
			_mutant disableAI "PATH";
			_mutant disableAI "ANIM";
			group _mutant setSpeedMode "LIMITED";
			if ((_mutant getVariable "AI_CanTurn" == 0) AND {(isTouchingGround _mutant)}) then {
				if !(animationState _mutant in ["krovosos_attack_1", "krovosos_attack_2", "krovosos_roar", "krovosos_run_attack"]) then {
					_mutant call RRPHC_mut_bloodsucker_chooseMove;
					_dir = [[0, 1, 0], -(_mutant getDir _nearEnemy)] call BIS_fnc_rotateVector2D;
					_mutant setVelocityTransformation[
						getPosASL _mutant,
						getPosASL _mutant, [0, 0, (velocity _mutant select 2) - 1], [(velocity _mutant select 0), (velocity _mutant select 1), (velocity _mutant select 2) - 1],
						vectorDir _mutant,
						_dir,
						vectorUp _mutant,
						vectorUp _mutant,
						1
					];
					//("Докрутка" + str time) remoteExecCall ['hint'];
				};
			};
		};
	} else {
		_mutant enableAI "PATH";
		_mutant enableAI "ANIM";
		group _mutant setSpeedMode "FULL";
		_mutant setVariable ["IMS_IsAnimPlayed", 0];
		//("Врагов нет" + str time) remoteExecCall ['hint'];
	};
}, 0.1, _this] call CBA_fnc_addPerFrameHandler;