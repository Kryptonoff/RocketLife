
[{
	params ["_mutants", "_pfhHandle"];
	_mutants params ["_mutant", "_mainDog"];
	if (isNull _mutant OR !alive _mutant) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};
	if (isNull _mainDog OR !alive _mainDog) exitWith {_mutant call RRPHC_mut_dog_idle; [_pfhHandle] call CBA_fnc_removePerFrameHandler};

	[{
		(group _this) setSpeedMode "LIMITED";
		_myNearestEnemy = _this findNearestEnemy _this;
		if ((isNull _myNearestEnemy) or !(alive _myNearestEnemy) or ((_myNearestEnemy distance _this) > 30)) then {
			if (_mutant distance _mainDog > 15) then {
				_mutant doMove (getPos _mainDog);
			} else {
				group _mutant setSpeedMode "LIMITED";
				if (animationState _mutant in ["psina_idle_dig", "psina_idle_smellaround", "psina_idle_smell"]) then {
					[_mutant, "psina_idle_1"] remoteExec ["switchMove",-2];
				};
				if (animationState _mutant in ["psina_sit_to_lie", "psina_lie_idle"]) then {
					[_mutant, "psina_lie_to_idle"] remoteExec ["switchMove",-2];
	
					[{
						if (alive _this) then {[_this, "psina_idle_1"] remoteExec ["switchMove",-2]}
					}, _mutant, 1] call CBA_fnc_waitAndExecute;
				};
				if ((animationState _mutant == "psina_sit_idle") or (animationState _mutant == "psina_idle_to_sit")) then {
					[_mutant, "psina_sit_to_idle"] remoteExec ["switchMove",-2];

					[{
						if (alive _this) then {[_this, "psina_idle_1"] remoteExec ["switchMove",-2]}
					}, _mutant, 0.8] call CBA_fnc_waitAndExecute;
				};
			
				_randomPosAroundMutant = [[[position _mainDog, 8]],["water"]] call BIS_fnc_randomPos;
				_mutant move _randomPosAroundMutant;
				_mutant setVariable ["UnitPos_MUT", _randomPosAroundMutant];
				
				_rndAction = selectRandom ["Sleep","psina_idle_dig","psina_idle_smell","psina_idle_smellAround","Sit","NONE","NONE","NONE"];
				if (_rndAction == "Sleep") then {
					if (alive _mutant) then {[_mutant, "psina_idle_to_sit"] remoteExec ["switchMove",-2]};
	
					[{
						if (alive _this) then {[_this, "psina_sit_to_lie"] remoteExec ["switchMove",-2]}
					}, _mutant, 1] call CBA_fnc_waitAndExecute;
	
					[{
						if (alive _this) then {[_this, "psina_lie_idle"] remoteExec ["switchMove",-2]}
					}, _mutant, 1.6] call CBA_fnc_waitAndExecute;
	
					//тут был слип 60
				} else {
					if (_rndAction == "Sit") then {
						if (alive _mutant) then {[_mutant, "psina_idle_to_sit"] remoteExec ["switchMove",-2]};
						[{
							if (alive _this) then {[_this, "psina_sit_idle"] remoteExec ["switchMove",-2]}
						}, _mutant, 1] call CBA_fnc_waitAndExecute;
						
						//тут слип 10
					} else {
						if !(_rndAction == "NONE") then {
							[_mutant, _rndAction] remoteExec ["switchMove",-2];
						};
					};
				};
			};
		};
	}, _mutant, random 10] call CBA_fnc_waitAndExecute;

}, 10, _this] call CBA_fnc_addPerFrameHandler;