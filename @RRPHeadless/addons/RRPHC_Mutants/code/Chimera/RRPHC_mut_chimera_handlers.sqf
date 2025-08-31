
_this addEventHandler ["HandleDamage", {
	_objHit = _this select 0;
	_hitter = _this select 3;
	if (!(_objHit == _hitter)) then {
		if ((damage _objHit >= 0.39)) then {
			[_objHit, 1] call RRPClient_mut_setDamage;
		} else {
			_bulletType  = _this select 4;
			_Bullet = getNumber (configfile >> "CfgAmmo" >> _bulletType >> "hit");
			[_objHit, [selectRandom["chimera_hit_1","chimera_hit_2","chimera_hit_3","chimera_hit_4","chimera_hit_5"], 70]] remoteExecCall ["say3D",-2];

		  	switch (true) do { 
				case (_Bullet > 12) : {[_objHit, 0.03] call RRPClient_mut_setDamage}; 
				case (_Bullet > 9) : {[_objHit, 0.007] call RRPClient_mut_setDamage}; 
				case (_Bullet > 7) : {[_objHit, 0.003] call RRPClient_mut_setDamage}; 
				default {[_objHit, 0.0005] call RRPClient_mut_setDamage}; 
			};
		};
	};  
}];


_this addEventHandler ["Killed", {
	_creature = _this select 0;
	detach _creature;
	diag_log [_creature, "KILLED"];
	[_creature] call RRPHC_mut_chimera_death;
	[_creature, "Chimera_death"] remoteExec ["switchMove",-2];
}];