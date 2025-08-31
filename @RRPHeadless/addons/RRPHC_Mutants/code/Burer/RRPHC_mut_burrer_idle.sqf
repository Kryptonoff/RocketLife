
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !alive _mutant) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};

	[{
		(group _this) setSpeedMode "LIMITED";
		_myNearestEnemy = _this findNearestEnemy _this;
		if ((isNull _myNearestEnemy) OR !(alive _myNearestEnemy) OR ((_myNearestEnemy distance _this) > 200)) then {		
			[_this] call RRPHC_mut_findNewPos;
			[_this, [selectRandom["burer_idle_0","burer_idle_1","burer_idle_2"], 45]] remoteExecCall ["say3D",-2];
		};
	}, _mutant, random 10] call CBA_fnc_waitAndExecute;

}, 10, _this] call CBA_fnc_addPerFrameHandler;