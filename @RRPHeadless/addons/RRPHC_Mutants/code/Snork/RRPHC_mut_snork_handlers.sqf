
_this addEventHandler ["HandleDamage", {
	_objHit = _this select 0;
	_hitter = _this select 3;
	if (!(_objHit == _hitter)) then {
		if ((damage _objHit >= 0.39)) then {
			[_objHit, 1] call RRPClient_mut_setDamage;
		} else {
			_bulletType	= _this select 4;
			_Bullet = getNumber (configfile >> "CfgAmmo" >> _bulletType >> "hit");	

			switch (true) do { 
				case (_Bullet > 12) : {[_objHit, 1] call RRPClient_mut_setDamage}; 
				case (_Bullet > 9) : {[_objHit, 0.39] call RRPClient_mut_setDamage}; 
				case (_Bullet > 7) : {[_objHit, 0.19] call RRPClient_mut_setDamage}; 
				default {[_objHit, 0.09] call RRPClient_mut_setDamage}; 
			};
		};
	};	
}];

_this addEventHandler ["Killed", {
	_creature = _this select 0;
	detach _creature;
	[_creature] call RRPHC_mut_snork_soundDeath;

	if ((speed _creature > 0)) then {
		[_creature, "SNORK_run_death"] remoteExec ["switchMove",-2];
	} else {
		[_creature, "SNORK_idle_death"] remoteExec ["switchMove",-2];
	};
}];