
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !alive _mutant) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};

	[{
		(group _this) setSpeedMode "LIMITED";
		_myNearestEnemy = _this findNearestEnemy _this;
		if ((isNull _myNearestEnemy) or !(alive _myNearestEnemy) or ((_myNearestEnemy distance _this) > 250)) then {
			
			if ((animationState _this == "KROVOSOS_IDLE_3")) then {
				[_this, "KROVOSOS_IDLE"] remoteExec ["switchMove",-2];
			};
			if (uniform _this == "BSI_Ex_Mutant_01") then {
				removeUniform _this; 
				_this forceAddUniform "BS_Ex_Mutant_01";
			};

			[_this] call RRPHC_mut_findNewPos;

			_rndSnd = selectRandom["bloodsucker_idle_0","bloodsucker_idle_1","bloodsucker_idle_2"];
			[_this, [_rndSnd, 30]] remoteExecCall ["say3D",-2];

			_rndOglad = random 100;
			if (_rndOglad >= 60) then {
				[_this, "KROVOSOS_IDLE_3"] remoteExec ["switchMove",-2];

				[{
					if (alive _this) then {
						[_this, "KROVOSOS_IDLE"] remoteExec ["switchMove",-2];
						_rndSnd = selectRandom["bloodsucker_idle_0","bloodsucker_idle_1","bloodsucker_idle_2"];
						[_this, [_rndSnd, 30]] remoteExec ["say3D",-2];
					};
				}, _this, 8] call CBA_fnc_waitAndExecute;
			};
		};
	}, _mutant, random 10] call CBA_fnc_waitAndExecute;

}, 10, _this] call CBA_fnc_addPerFrameHandler;