
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !(alive _mutant)) exitWith {/*("Мутан умер" + str time) remoteExecCall ['hint'];*/[_pfhHandle] call CBA_fnc_removePerFrameHandler};
	if (_mutant getVariable ["AI_BLCK", false]) exitWith {/*("Блок" + str time) remoteExecCall ['hint'];*/};

	_nearEnemy = _mutant findNearestEnemy _mutant;
	if (!(isNull _nearEnemy) AND (alive _nearEnemy)) then {
		if ((_mutant distance _nearEnemy > 120) OR {!((lineIntersectsSurfaces[getPosASL _nearEnemy, eyePos _mutant, _nearEnemy, _mutant, true, 1, "GEOM", "FIRE"]) isEqualTo [])}) then {
			_mutant enableAI "PATH";
			_mutant enableAI "ANIM";
			group _mutant setSpeedMode "FULL";
			_mutant setVariable ["IMS_IsAnimPlayed", 0];
			if (!(isNull _nearEnemy) AND ((_nearEnemy distance _mutant) <= 200)) then {
				_mutant doMove (getPosATL _nearEnemy);

				_mutant setVariable ["AI_BLCK", true];
				[{_this setVariable ["AI_BLCK", false]}, _mutant, 1] call CBA_fnc_waitAndExecute;
				//("Coming for ya! >:c" + str time) remoteExecCall ['hint'];
			};
		} else {
			_mutant disableAI "PATH";
			_mutant disableAI "ANIM";
			group _mutant setSpeedMode "LIMITED";
			if ((_mutant getVariable "AI_CanTurn" == 0) AND (isTouchingGround _mutant)) then {
				if (_mutant distance _nearEnemy > 10) then {
					_mutant call RRPHC_mut_controller_chooseMove;
				} else {
					_mutant playMoveNow "Controller_idle";
					_mutant playMoveNow "Controller_idle";
				};
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