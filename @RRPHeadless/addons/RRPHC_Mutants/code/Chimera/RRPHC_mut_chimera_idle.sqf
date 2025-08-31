
[{
	params ["_mutant", "_pfhHandle"];
	if (isNull _mutant OR !alive _mutant) exitWith {[_pfhHandle] call CBA_fnc_removePerFrameHandler};

	[{
		(group _this) setSpeedMode "LIMITED";
		_myNearestEnemy = _this findNearestEnemy _this;
		if ((isNull _myNearestEnemy) or !(alive _myNearestEnemy) or ((_myNearestEnemy distance _this) > 200)) then {
		
			if (animationState _this in ["chimera_eat", "chimera_check_corpse", "chimera_idle_2"]) then {
				[_this, "Chimera_idle_1"] remoteExec ["switchMove",-2];
			};
		
			[_this] call RRPHC_mut_findNewPos;
			[_this, [selectRandom ["chimera_idle_1","chimera_idle_2","chimera_idle_3"], 25]] remoteExecCall ["say3D",-2];

			_randomAction = random 100;
			switch (true) do { 
				case (_randomAction < 30) : {	
					[_this, "Chimera_check_corpse"] remoteExec ["switchMove",-2];
					[{
						if (alive _this AND (animationState _this == "Chimera_check_corpse")) then {
							[_this, "Chimera_eat"] remoteExec ["switchMove",-2];
							[_this, ["boar_eat_2", 35]] remoteExecCall ["say3D",-2];
							[_this, ["boar_eat_3", 35]] remoteExecCall ["say3D",-2];
							[_this, ["boar_eat_2", 35]] remoteExecCall ["say3D",-2];
							[_this, ["boar_eat_3", 35]] remoteExecCall ["say3D",-2];
							[_this, ["boar_eat_2", 35]] remoteExecCall ["say3D",-2];
							[_this, ["boar_eat_3", 35]] remoteExecCall ["say3D",-2];
						};
					}, _this, 6.5] call CBA_fnc_waitAndExecute;}; 
				case (_randomAction < 25) : {
					[_this, "Chimera_idle_2"] remoteExec ["switchMove",-2];
					[{
						if (alive _this AND (animationState _this == "Chimera_idle_2")) then {[_this, "Chimera_idle_1"] remoteExec ["switchMove",-2]}
					}, _this, 6.7] call CBA_fnc_waitAndExecute;
				}; 
				default {}; 
			};

		};
	}, _mutant, random 10] call CBA_fnc_waitAndExecute;

}, 10, _this] call CBA_fnc_addPerFrameHandler;