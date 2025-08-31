
params ["_mutant", "_victim"];

if ((_mutant getVariable "AI_CanGrab" == 0) AND (_mutant getVariable "canMakeAttack" == 0) AND (alive _mutant) AND (alive _victim) AND !((animationState _victim) in ["plagued_armed_melee_noWeapon_catch_victim", "plagued_armed_melee_noWeapon_catch_zombie"])) then {
	_mutant setVariable ["AI_CanTurn", 1];
	_mutant setVariable ["canMakeAttack", 1];

	{
		if ((typeOf _x) == "Zombie_Ex_Mutant_01") then {
			_x setVariable ["AI_CanGrab", 1];
			[{_this setVariable ["AI_CanGrab", 0]}, _x, 10] call CBA_fnc_waitAndExecute;
		};
	} forEach nearestObjects [_mutant, ["Man"], 25];

	[_victim, "Disable_Gesture"] remoteExec ["playActionNow",-2];
	[_mutant, "Disable_Gesture"] remoteExec ["playActionNow",-2];
	_mutant disableAI "ALL";

	_dir = _victim getRelDir _mutant;
	
	if (_dir > 270 OR _dir < 90) then {
		[_victim, (_victim getDir _mutant)] remoteExecCall ["setDir", _victim];
		[_victim, "plagued_armed_melee_noWeapon_catch_victim"] remoteExec ["switchMove",-2];
	} else {
		[_victim, (_victim getDir _mutant) ] remoteExecCall ["setDir", _victim];
		[_victim, "plagued_armed_melee_noWeapon_catch_victim_behind"] remoteExec ["switchMove",-2];
	};

	[_mutant, "plagued_armed_melee_noWeapon_catch_zombie"] remoteExec ["switchMove",-2];
	_mutant attachTo [_victim, [0, 0.75, 0]];
	[_victim, _mutant] remoteExecCall ["disableCollisionWith", _victim];
	[_mutant, [selectRandom["zombie_attack_1","zombie_attack_2","zombie_attack_3","zombie_attack_4","zombie_attack_5","zombie_attack_6","zombie_attack_7","zombie_attack_8","zombie_attack_9","zombie_attack_10"], 45]] remoteExecCall ["say3D",-2];
	
	[{
		params ["_mutant", "_victim"];
		if (!(alive _mutant) or !(alive _victim)) exitWith {
			detach _mutant;
			[_victim, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove",-2];
			if !(alive _mutant) then {
				[_mutant, ""] remoteExec ["switchMove",-2];
			} else {
				[_mutant, "Zombie_Unnarmed_idle"] remoteExec ["switchMove",-2];
			};
		};
		_soundCache = "Land_HelipadEmpty_F" createVehicle position _victim;
		_soundCache attachTo [_victim, [0, 0, 0.2], "Spine3"];
		[_soundCache, [selectRandom["flesh_attack_hit_0", "flesh_attack_hit_1"], 60]] remoteExecCall ["say3D",-2];
		[{
			params ["_mutant", "_victim"];
			detach _mutant;
			_victim setvelocity [-7 * (sin(getdir _victim)), -7 * (cos(getdir _victim)), 1.2];
			[_victim,  0.2] remoteExecCall ["RRPClient_mut_setDamage", _victim];
	
		}, _this, 0.15] call CBA_fnc_waitAndExecute;
		[{
			params ["_mutant", "_victim"];
			[_victim, _mutant] remoteExecCall ["enableCollisionWith", _victim];
			deleteVehicle _soundCache;
			[_victim, "AmovPercMstpSnonWnonDnon"] remoteExec ["switchMove",-2];
			if (alive _mutant) then {
				[_mutant, "Zombie_Unnarmed_idle"] remoteExec ["switchMove",-2];
				_mutant setDir (getDir _mutant - 180);
				_mutant enableAI "ALL";
				_mutant setVariable ["canMakeAttack", 0];
				_mutant setVariable ["AI_CanTurn", 0];
			};
	
		}, _this, 1.25] call CBA_fnc_waitAndExecute;
	}, [_mutant, _victim], 1.75] call CBA_fnc_waitAndExecute;
};