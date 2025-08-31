
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !(alive _mutant)) exitWith {/*("Мутан умер" + str time) remoteExecCall ['hint'];*/[_pfhHandle] call CBA_fnc_removePerFrameHandler};

	_nearEnemy = _mutant findNearestEnemy _mutant;
	if (!(isNull _nearEnemy) and (alive _nearEnemy) and ((_nearEnemy distance _mutant) <= 30)) then {
		if (animationState _mutant in ["psina_idle_dig", "psina_idle_smellaround", "psina_idle_smell"]) then {
			[_mutant, "psina_idle_1"] remoteExec ["switchMove",-2];
		};
		if (animationState _mutant in ["psina_sit_to_lie", "psina_lie_idle"]) then {
			[_mutant, "psina_lie_to_idle"] remoteExec ["switchMove",-2];
			[{
				if (alive _this) then {
					[_this, "psina_idle_1"] remoteExec ["switchMove",-2];
				}
			}, _mutant, 1] call CBA_fnc_waitAndExecute;
		};
		if (animationState _mutant in ["psina_sit_idle", "psina_idle_to_sit"]) then {
			[_mutant, "psina_sit_to_idle"] remoteExec ["switchMove",-2];
			[{
				if (alive _this) then {
					[_this, "psina_idle_1"] remoteExec ["switchMove",-2];
				}
			}, _mutant, 0.8] call CBA_fnc_waitAndExecute;
		};

		group _mutant setSpeedMode "FULL";
		_mutant setVariable ["IMS_IsAnimPlayed", 0];
		if (!(isNull _nearEnemy) and ((_nearEnemy distance _mutant) <= 30)) then {
			if ((getPosATL _nearEnemy select 2) >= 1.45) then {
				_pos = _mutant getVariable "UnitPos_MUT";
				_mutant doMove _pos;
			} else {
				group _mutant setSpeedMode "FULL";
				_mutant doMove [(getPos _nearEnemy select 0),(getPos _nearEnemy select 1), 0];
				_mutant reveal [_nearEnemy, 4]; 

				if !(animationState _mutant in ["psina_main_out_killpes", "psina_main_in", "psina_main_loop"]) then {
					if (_mutant getVariable "AI_IsDogAngry" == 0) then {
						[_mutant, selectRandom ["bdog_groan_0","bdog_groan_1","bdog_groan_2","bdog_groan_3"], 3.5] call RRPHC_mut_AggresiveSound;
						if !(animationState _mutant in ["psina_idle_growl", "psina_walk_growl"]) then {_mutant playMoveNow "psina_walk_growl"};
					} else {
						[_mutant, selectRandom ["bdog_idle_0","bdog_idle_1","bdog_idle_2","bdog_idle_3"], 3.5] call RRHC_mut_AggresiveSound;
						if (animationState _mutant in ["psina_idle_growl", "psina_walk_growl"]) then {_mutant playMoveNow "psina_run"};
					};
				};
			};
		};
	} else {
		group _mutant setSpeedMode "LIMITED";
	};
}, 0.7, _this] call CBA_fnc_addPerFrameHandler;