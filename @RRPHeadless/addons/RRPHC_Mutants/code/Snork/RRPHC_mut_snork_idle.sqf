
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !alive _mutant) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};

	[{
		(group _this) setSpeedMode "LIMITED";
		_myNearestEnemy = _this findNearestEnemy _this;
		if ((isNull _myNearestEnemy) or !(alive _myNearestEnemy) or ((_myNearestEnemy distance _this) > 200)) then {
		
			if ((animationState _this == "SNORK_idle_2")) then {
				[_this, "SNORK_idle"] remoteExec ["switchMove",-2];
			};
		
		
			[_this] call RRPHC_mut_findNewPos;
			_rndSnd = selectRandom["snork_idle_0","snork_idle_1"];
			[_this, [_rndSnd, 25]] remoteExecCall ["say3D",-2];

			_rndOglad = random 100;
			if (_rndOglad >= 70) then {
				[_this, "SNORK_idle_2"] remoteExec ["switchMove",-2];
				
				[{
					if (alive _this) then {[_this, "SNORK_idle"] remoteExec ["switchMove",-2]}
				}, _this, 5] call CBA_fnc_waitAndExecute;
			};
		};
	}, _mutant, random 10] call CBA_fnc_waitAndExecute;

}, 10, _this] call CBA_fnc_addPerFrameHandler;