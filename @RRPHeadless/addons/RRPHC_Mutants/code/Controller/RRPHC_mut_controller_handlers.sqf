
_this addEventHandler ["HandleDamage", {
	_objHit = _this select 0;
	_hitter = _this select 3;
	if (!(_objHit == _hitter)) then {
		if (_objHit getVariable "canMakeAttack" == 1) then {
			[_objHit, "Controller_psyAttack_break"] remoteExec ["playActionNow",-2];
			{
			  _x setVariable ["IsControlledBy", nil, true];
			} forEach nearestObjects[getPosATL _objHit, ["Man"], 110];
		};
		if (damage _objHit >= 0.39) then {
			[_objHit, 1] call RRPClient_mut_setDamage;
		} else {
			[_objHit, [selectRandom["controller_hit_0","controller_hit_1","controller_hit_2"], 70]] remoteExecCall ["say3D",-2];
			_bulletType = _this select 4;
			_Bullet = getNumber (configfile >> "CfgAmmo" >> _bulletType >> "hit");   	  

			switch (true) do { 
				case (_Bullet > 12) : {[_objHit, 0.2] call RRPClient_mut_setDamage}; 
				case (_Bullet > 9) : {[_objHit, 0.015] call RRPClient_mut_setDamage}; 
				case (_Bullet > 7) : {[_objHit, 0.010] call RRPClient_mut_setDamage}; 
				default {[_objHit, 0.005] call RRPClient_mut_setDamage}; 
			};
		};
	};  
}];

_this addEventHandler ["Killed", {
	_creature = _this select 0;
	detach _creature;
	[_creature] call RRPHC_mut_controller_soundDeath;
	[_creature, "Disable_Gesture"] remoteExec ["playActionNow",-2];
	[_creature, "Controller_death"] remoteExec ["switchMove",-2];
}];