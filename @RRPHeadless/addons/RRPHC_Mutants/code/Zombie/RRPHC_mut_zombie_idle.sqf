
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !alive _mutant) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};

	[{
		(group _this) setSpeedMode "LIMITED";
		_myNearestEnemy = _this findNearestEnemy _this;
		if ((isNull _myNearestEnemy) or !(alive _myNearestEnemy) or ((_myNearestEnemy distance _this) > 80)) then {
				
			[_this] call RRPHC_mut_findNewPos;
			_rndSnd = selectRandom["zombie_idle_1","zombie_idle_2","zombie_idle_3","zombie_idle_4","zombie_idle_5","zombie_idle_6","zombie_idle_7","zombie_idle_8","zombie_idle_9","zombie_idle_10","zombie_idle_11","zombie_idle_12","zombie_idle_13","zombie_idle_14","zombie_idle_15","zombie_idle_16","zombie_idle_17"];
			[_this, [_rndSnd, 25]] remoteExecCall ["say3D",-2];
		};
	}, _mutant, random 10] call CBA_fnc_waitAndExecute;

}, 10, _this] call CBA_fnc_addPerFrameHandler;