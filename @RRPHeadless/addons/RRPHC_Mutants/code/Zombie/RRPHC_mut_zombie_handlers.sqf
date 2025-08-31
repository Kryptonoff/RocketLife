
_this addEventHandler ["HandleDamage", {
	_objHit = _this select 0;
	_hitter = _this select 3;
	if !(_objHit == _hitter) then {
		if (damage _objHit >= 0.39) then {
			[_objHit, 1] call RRPClient_mut_setDamage;
		} else {
			_weap = currentWeapon _hitter;
			_shotGunsArray = ["Ashot_2035","bnae_spr220_so_virtual","bnae_spr220_virtual","Saiga","Skyline_B95_01_F","Skyline_B95_03_F","Skyline_B95_02_F","bnae_m97_virtual","bnae_m97_camo1_virtual"];
			if (_weap in _shotGunsArray) then {
				_dist = _objHit distance _hitter;
				if (_dist < 13) then {
					[_objHit, 1] call RRPClient_mut_setDamage;
				} else {
					[_objHit, 0.39] call RRPClient_mut_setDamage;
					_rndSnd = selectRandom["zombie_take_damage_1","zombie_take_damage_2","zombie_take_damage_3","zombie_take_damage_4","zombie_take_damage_5","zombie_take_damage_6"];
					[_objHit, _rndSnd, 25] call CBA_fnc_globalSay3d;
					[_objHit] call RRPHC_mut_player_hitAnims;
				};
			} else {
				_bulletType	= _this select 4;
				_Bullet = getNumber (configfile >> "CfgAmmo" >> _bulletType >> "hit");
				_rndSnd = selectRandom["zombie_take_damage_1","zombie_take_damage_2","zombie_take_damage_3","zombie_take_damage_4","zombie_take_damage_5","zombie_take_damage_6"];
				[_objHit, [_rndSnd, 25]] remoteExecCall ["say3D",-2];
				[_objHit] call RRPHC_mut_player_hitAnims;

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
	_creature = _this select 0;
	_hitter = _this select 1;
	[_creature] call RRPHC_mut_zombie_soundDeath;
	_weap = currentWeapon _hitter;
	_shotGunsArray = ["Ashot_2035","bnae_spr220_so_virtual","bnae_spr220_virtual","Saiga","Skyline_B95_01_F","Skyline_B95_03_F","Skyline_B95_02_F","bnae_m97_virtual","bnae_m97_camo1_virtual"];
	_dist = _creature distance _hitter;
	if ((_weap in _shotGunsArray) and (_dist < 13)) then {
		_dir = _creature getRelDir _hitter;
		if (_dir > 270 OR _dir < 90) then {
			[_creature, "FlyFromMutant_backward"] remoteExec ["switchMove",-2];
			_creature setvelocity [-5 * (sin (getdir _creature )), -5 * (cos (getdir _creature)), 3.1];
		} else {
			[_creature, "FlyFromMutant_forward"] remoteExec ["switchMove",-2];
			_creature setvelocity [5 * (sin (getdir _creature )), 5 * (cos (getdir _creature)), 3.1];
		};	
	} else {		
		_creature setVelocity [0,0,0];
		_rndAnim = selectRandom ["Zombie_Unnarmed_death_1","Zombie_Unnarmed_death_2","Zombie_Unnarmed_death_3"];
		[_creature, _rndAnim] remoteExec ["switchMove",-2];
	};
}];