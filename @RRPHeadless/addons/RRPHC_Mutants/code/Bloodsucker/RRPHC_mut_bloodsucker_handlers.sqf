
_this addEventHandler ["HandleDamage", {
	_objHit = _this select 0;
	_hitter = _this select 3;
	if (!(_objHit == _hitter)) then {
		if ((damage _objHit >= 0.39)) then {
			[_objHit, 1] call RRPClient_mut_setDamage;
		} else {
			if ((uniform _objHit == "BSI_Ex_Mutant_01") and {(alive _objHit)}) then {
				removeUniform _objHit; 
				_objHit forceAddUniform "BS_Ex_Mutant_01";
				
				[{
					if ((uniform _this == "BS_Ex_Mutant_01") and {(alive _this)}) then {
						removeUniform _this; 
						_this forceAddUniform "BSI_Ex_Mutant_01";
					};
				}, _objHit, 0.5] call CBA_fnc_waitAndExecute;
			};
			_weap = currentWeapon _hitter;
			_shotGunsArray = ["bnae_spr220_so_virtual","bnae_spr220_virtual","kozlice_Long_RIMAS","Saiga","Skyline_B95_01_F","Skyline_B95_03_F","Skyline_B95_02_F","bnae_m97_virtual","bnae_m97_camo1_virtual"];
			if (_weap in _shotGunsArray) then {
				_dist = _objHit distance _hitter;
				if ((_dist < 7)) then {
					[_objHit, 0.04] call RRPClient_mut_setDamage;
				} else {
					[_objHit, [selectRandom["bloodsucker_hit_0","bloodsucker_hit_1","bloodsucker_hit_2"], 70]] remoteExecCall ["say3D",-2];
					if ((_dist < 14)) then {
						[_objHit, 0.008] call RRPClient_mut_setDamage;						
					} else {
						[_objHit, 0.001] call RRPClient_mut_setDamage;
					};
				};
		 	} else {
				_bulletType  = _this select 4;
				[_objHit, [selectRandom["bloodsucker_hit_0","bloodsucker_hit_1","bloodsucker_hit_2"], 70]] remoteExecCall ["say3D",-2];
				_Bullet = getNumber (configfile >> "CfgAmmo" >> _bulletType >> "hit");     

				switch (true) do { 
					case (_Bullet > 12) : {[_objHit, 0.2] call RRPClient_mut_setDamage}; 
					case (_Bullet > 9) : {[_objHit, 0.013] call RRPClient_mut_setDamage}; 
					case (_Bullet > 7) : {[_objHit, 0.009] call RRPClient_mut_setDamage}; 
					default {[_objHit, 0.004] call RRPClient_mut_setDamage}; 
				};
		  	};
		};
 	 };  
}];

_this addEventHandler ["Killed", {
	_creature = _this select 0;
	_hitter = _this select 1;
	detach _creature;
	[_creature] call RRPHC_mut_bloodsucker_soundDeath;
	_weap = currentWeapon _hitter;
	_shotGunsArray = ["Ashot_2035","bnae_spr220_so_virtual","bnae_spr220_virtual","kozlice_Long_RIMAS","Saiga","Skyline_B95_01_F","Skyline_B95_03_F","Skyline_B95_02_F","bnae_m97_virtual","bnae_m97_camo1_virtual"];
	_dist = _creature distance _hitter;

	if ((_weap in _shotGunsArray) and {(_dist < 13)}) then {
		_dir = _creature getRelDir _hitter;
		if (_dir > 270 OR {_dir < 90}) then {
			[_creature, "FlyFromMutant_backward"] remoteExec ["switchMove",-2];
			[_creature, [-5 * (sin (getdir _creature )), -5 * (cos (getdir _creature)), 3.1]] remoteExec ["setvelocity",-2];
		} else {
			[_creature, "FlyFromMutant_forward"] remoteExec ["switchMove",-2];
			[_creature, [5 * (sin (getdir _creature )), 5 * (cos (getdir _creature)), 3.1]] remoteExec ["setvelocity",-2];
		};	
	} else {		
		[_creature, ""] remoteExec ["switchMove",-2];
	};
}];