
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !(alive _mutant)) exitWith {/*("Мутан умер" + str time) remoteExecCall ['hint'];*/[_pfhHandle] call CBA_fnc_removePerFrameHandler};
	if (_mutant getVariable ["AI_BLCK", false]) exitWith {/*("Блок" + str time) remoteExecCall ['hint'];*/};

	_nearEnemy = _mutant findNearestEnemy _mutant;
	if (!(isNull _nearEnemy) AND (alive _nearEnemy)) then {
		[_mutant, selectRandom ["giant_threaten_1","giant_threaten_0","giant_breath_2","giant_breath_1","giant_breath_0"], 8] call RRPHC_mut_AggresiveSound;
		_enemyPosATL = getPosATL _nearEnemy;

		if ((_mutant distance _nearEnemy > 50) OR ((_enemyPosATL select 2) >= 1.45) OR {!((lineIntersectsSurfaces[getPosASL _nearEnemy, eyePos _mutant, _nearEnemy, _mutant, true, 1, "GEOM", "FIRE"]) isEqualTo [])}) then {
			_mutant enableAI "PATH";
			_mutant enableAI "ANIM";
			group _mutant setSpeedMode "FULL";
			_mutant setVariable ["IMS_IsAnimPlayed", 0];
			if (!(isNull _nearEnemy) AND ((_nearEnemy distance _mutant) <= 200)) then {
				if ((_enemyPosATL select 2) >= 1.45) then {
					_pos = _mutant getVariable "UnitPos_MUT";
					_mutant doMove [(_pos select 0) + random 50, (_pos select 1) + random 50, (_pos select 2)];

					_mutant setVariable ["AI_BLCK", true];
					[{_this setVariable ["AI_BLCK", false]}, _mutant, 1] call CBA_fnc_waitAndExecute;
					//("I am running awaaaaay!" + str time) remoteExecCall ['hint'];
				} else {
					_mutant doMove _enemyPosATL;

					_mutant setVariable ["AI_BLCK", true];
					[{_this setVariable ["AI_BLCK", false]}, _mutant, 1] call CBA_fnc_waitAndExecute;
					//("Coming for ya! >:c" + str time) remoteExecCall ['hint'];
				};
			};
		} else {
			_mutant disableAI "PATH";
			_mutant disableAI "ANIM";
			_mutant doMove [getPosATL _nearEnemy select 0,getPosATL _nearEnemy select 1, 0];
			if ((_mutant getVariable "AI_CanTurn" == 0) AND (isTouchingGround _mutant)) then {
				_mutant call RRPHC_mut_giant_chooseMove;
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
	} else {
		_mutant enableAI "PATH";
		_mutant enableAI "ANIM";
		group _mutant setSpeedMode "FULL";
		_mutant setVariable ["IMS_IsAnimPlayed", 0];
		//("Врагов нет" + str time) remoteExecCall ['hint'];
	};
}, 0.1, _this] call CBA_fnc_addPerFrameHandler;