
_this addEventHandler ["HandleDamage", {
	_objHit = _this select 0;
	_hitter = _this select 3;
	if (!(_objHit == _hitter)) then {
		if ((damage _objHit >= 0.39)) then {
			[_objHit, 1] call RRPClient_mut_setDamage;
		} else {
			_weap = currentWeapon _hitter;
			_shotGunsArray = ["bnae_spr220_so_virtual","bnae_spr220_virtual","kozlice_Long_RIMAS","Saiga","Skyline_B95_01_F","Skyline_B95_03_F","Skyline_B95_02_F","bnae_m97_virtual","bnae_m97_camo1_virtual"];
			if (_weap in _shotGunsArray) then {
				_dist = _objHit distance _hitter;
				if (_dist < 7) then {
					[_objHit, 0.005] call RRPClient_mut_setDamage;
					[_objHit, [selectRandom["giant_hurt_0","giant_hurt_1","giant_hurt_2","giant_hurt_3"], 70]] remoteExecCall ["say3D",-2];
				} else {
					if ((_dist < 14)) then {
						[_objHit, 0.002] call RRPClient_mut_setDamage;
					} else {
						[_objHit, 0.00001] call RRPClient_mut_setDamage;
					};
				};
			} else {
				_bulletType	= _this select 4;
				_Bullet = getNumber (configfile >> "CfgAmmo" >> _bulletType >> "hit");
				switch (true) do { 
					case (_Bullet > 12) : {
						[_objHit, [selectRandom["giant_hurt_0","giant_hurt_1","giant_hurt_2","giant_hurt_3"], 70]] remoteExecCall ["say3D",-2];
						[_objHit, 0.04] call RRPClient_mut_setDamage
					}; 
					case (_Bullet > 9) : {[_objHit, 0.007] call RRPClient_mut_setDamage}; 
					case (_Bullet > 7) : {[_objHit, 0.003] call RRPClient_mut_setDamage}; 
					default {[_objHit, 0.00001] call RRPClient_mut_setDamage}; 
				};
			};
		};
	};
}];

_this addEventHandler ["Killed", {
	_creature = _this select 0;
	detach _creature;
	[_creature] call RRPHC_mut_giant_soundDeath;
	[_creature, "PSEUDOGIANT_Death"] remoteExec ["switchMove",-2];
}];