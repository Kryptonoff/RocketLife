
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !(alive _mutant)) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};
	if (_mutant getVariable ["AI_BLCK", false]) exitWith {};

	_nearEnemy = _mutant findNearestEnemy _mutant;
	if (!(isNull _nearEnemy) AND (alive _nearEnemy)) then {
		[_mutant, selectRandom["zombie_attack_1", "zombie_attack_2", "zombie_attack_3", "zombie_attack_4", "zombie_attack_5", "zombie_attack_6", "zombie_attack_7", "zombie_attack_8", "zombie_attack_9", "zombie_attack_10"], 8] call RRPHC_mut_AggresiveSound;
		_enemyPosATL = getPosATL _nearEnemy;

		if ((_mutant distance _nearEnemy > 40) OR ((_enemyPosATL select 2) >= 1.45) OR !((lineIntersectsSurfaces[getPosASL _nearEnemy, eyePos _mutant, _nearEnemy, _mutant, true, 1, "GEOM", "FIRE"]) isEqualTo [])) then {
			_mutant enableAI "PATH";
			_mutant enableAI "ANIM";
			group _mutant setSpeedMode "FULL";
			_mutant setVariable ["IMS_IsAnimPlayed", 0];
			if ((_nearEnemy distance _mutant) <= 80) then {
				if ((((_enemyPosATL select 2) - (getPosATL _mutant select 2)) >= 1.45) AND ((_nearEnemy distance2D _mutant) <= 5)) then {
					if !(animationState _mutant == "plagued_armed_idle_noWeapon_cantReach") then {
						_mutant playMoveNow "plagued_armed_idle_noWeapon_cantReach";
						[_mutant, [selectRandom["zombie_idle_1", "zombie_idle_2", "zombie_idle_3", "zombie_idle_4", "zombie_idle_5", "zombie_idle_6", "zombie_idle_7", "zombie_idle_8", "zombie_idle_9", "zombie_idle_10", "zombie_idle_11", "zombie_idle_12", "zombie_idle_13", "zombie_idle_14", "zombie_idle_15", "zombie_idle_16", "zombie_idle_17"], 25]] remoteExecCall ["say3D",-2]
					};
					_mutant doWatch _nearEnemy;
					_mutant lookAt _nearEnemy;
					_mutant glanceAt _nearEnemy;
					_mutant disableAI "MOVE";

					_mutant setVariable ["AI_BLCK", true];
					[{_this setVariable ["AI_BLCK", false]}, _mutant, 1] call CBA_fnc_waitAndExecute;
				} else {
					if ((animationState _mutant == "plagued_armed_idle_noWeapon_cantReach")) then {
						_mutant playMoveNow "Zombie_Unnarmed_run";
					};
					_mutant enableAI "MOVE";
					_mutant doMove [_enemyPosATL select 0, _enemyPosATL select 1, 0];

					_mutant setVariable ["AI_BLCK", true];
					[{_this setVariable ["AI_BLCK", false]}, _mutant, 1] call CBA_fnc_waitAndExecute;
				};
			};
		} else {
			_mutant disableAI "PATH";
			_mutant disableAI "ANIM";
			if ((_mutant getVariable "AI_CanTurn" == 0) AND (isTouchingGround _mutant)) then {
				_mutant call RRPHC_mut_zombie_chooseMove;
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
			};
		};
	} else {
		_mutant enableAI "PATH";
		_mutant enableAI "ANIM";
		_mutant setVariable ["IMS_IsAnimPlayed", 0];
	};
}, 0.1, _this] call CBA_fnc_addPerFrameHandler;