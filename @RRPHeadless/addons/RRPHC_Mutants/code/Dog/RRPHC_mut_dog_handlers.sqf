
_this addEventHandler ["HandleDamage", {
	_objHit = _this select 0;
	_hitter = _this select 3;
	if !(_objHit == _hitter) then {
		_objHit setVariable ["AI_IsDogAngry", 1];
		_myNearestEnemy = _objHit findNearestEnemy _objHit;

		if (((_myNearestEnemy distance _objHit) > 30)) then {
			group _objHit setSpeedMode "FULL";
			_pos = getPos _objHit;
			_objHit doMove [(_pos select 0) + random 50, (_pos select 1) + random 50, (_pos select 2)];
		};

		_rndAnim = random 100;
		if ((_rndAnim <= 20) and !(animationState _objHit in ["psina_main_in", "psina_main_loop", "psina_main_out", "psina_victim_out_killpes"])) then {
			if (animationState _objHit != "Boar_criticalHit" AND {alive _mutant}) then {
				[_objHit, "psina_hit"] remoteExec ["switchMove",-2];
			};

			[{
				_mutant = _this;
				if !(alive _mutant) exitWith {};
		
				[_mutant, "psina_run"] remoteExec ["switchMove",-2];
			}, _objHit, 1.2] call CBA_fnc_waitAndExecute;
		};

		if (damage _objHit >= 0.39) then {
			[_objHit, 1] call RRPClient_mut_setDamage;
		} else {
			_weap = currentWeapon _hitter;
			_shotGunsArray = ["Ashot_2035","bnae_spr220_so_virtual","bnae_spr220_virtual","Saiga","Skyline_B95_01_F","Skyline_B95_03_F","Skyline_B95_02_F","bnae_m97_virtual","bnae_m97_camo1_virtual"];
			if (_weap in _shotGunsArray) then {
				[_objHit, 1] call RRPClient_mut_setDamage;
			} else {
				_bulletType	= _this select 4;
				_Bullet = getNumber (configfile >> "CfgAmmo" >> _bulletType >> "hit");
				_rndSnd = selectRandom ["bdog_hurt_0","bdog_hurt_1","bdog_hurt_2","bdog_hurt_3"];
				[_objHit, [_rndSnd, 70]] remoteExecCall ["say3D",-2];

				switch (true) do { 
					case (_Bullet > 12) : {[_objHit, 1] call RRPClient_mut_setDamage}; 
					case (_Bullet > 9) : {[_objHit, 0.39] call RRPClient_mut_setDamage}; 
					case (_Bullet > 7) : {[_objHit, 0.19] call RRPClient_mut_setDamage}; 
					default {[_objHit, 0.09] call RRPClient_mut_setDamage}; 
				};
			};
		};
	};
}];


_this addEventHandler ["Killed", {
	_mutant = _this select 0;

	if !(animationState _mutant in ["psina_main_in", "psina_main_out_killpes", "psina_main_loop", "psina_main_out"]) then {
		detach _mutant;
		[_mutant] call RRPHC_mut_dog_soundDeath;
		[_mutant, "psina_death"] remoteExec ["switchMove"];
	};
}];

_this addEventHandler ["FiredNear", {
	_mutant = _this select 0;
	_mutant setVariable ["AI_IsDogAngry", 1];
	{ 
		_mutant reveal [_x, 4]; 
	} forEach nearestObjects [_mutant, ["Man"], 75]; 
}];