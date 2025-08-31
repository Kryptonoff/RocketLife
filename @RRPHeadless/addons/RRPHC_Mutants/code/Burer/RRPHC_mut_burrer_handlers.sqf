
_this addEventHandler ["HandleDamage", {
	_objHit = _this select 0;
	_hitter = _this select 3;
	if (!(_objHit == _hitter) and {!(animationState _objHit == "Burer_shield_loop")} and {!(animationState _objHit == "Burer_shield_in")} and 
	{!(animationState _objHit == "Burer_shield_out")}) then {
		if (_objHit getVariable "AI_CanMakeShieldAttack" == 0) then {
			_objHit setVariable ["AI_CanMakeShieldAttack", 1];
			_objHit setVariable ["canMakeAttack", 1];
			[_objHit, "Burer_shield_in"] remoteExec ["switchMove",-2];
			[_objHit] remoteExecCall ["RRPClient_mut_burrer_createParticleShield", -2, false];
			[_objHit, ["burer_telekinetic_0", 150]] remoteExecCall ["say3D",-2];

			[{
				if ((animationState _this == "Burer_shield_in") and {(alive _this)}) then {
					[_this, "Burer_shield_loop"] remoteExec ["switchMove",-2];
					[_this, ["burer_tele_hold", 150]] remoteExecCall ["say3D",-2];
				};
			}, _objHit, 1.24] call CBA_fnc_waitAndExecute;

			[{
				if ((animationState _this == "Burer_shield_loop") and {(alive _this)}) then {
					[_this, "Burer_shield_out"] remoteExec ["switchMove",-2];
				};
			}, _objHit, 11.24] call CBA_fnc_waitAndExecute;

			[{
				if ((animationState _this == "Burer_shield_out") and {(alive _this)}) then {
					_this setVariable ["canMakeAttack", 0];
					[_this, "Burer_idle_1"] remoteExec ["switchMove",-2];
				};
			}, _objHit, 12.44] call CBA_fnc_waitAndExecute;

			[{
				_this setVariable ["AI_CanMakeShieldAttack", 0];
			}, _objHit, 42.44] call CBA_fnc_waitAndExecute;

		} else {
			if ((damage _objHit >= 0.39)) then {
				_objHit removeAllEventHandlers "HandleDamage";
				[_objHit, 1] call RRPClient_mut_setDamage;
			} else {
				_bulletType  = _this select 4;
				_Bullet = getNumber (configfile >> "CfgAmmo" >> _bulletType >> "hit");   	  

				switch (true) do { 
					case (_Bullet > 12) : {[_objHit, 0.2] call RRPClient_mut_setDamage}; 
					case (_Bullet > 9) : {[_objHit, 0.015] call RRPClient_mut_setDamage}; 
					case (_Bullet > 7) : {[_objHit, 0.010] call RRPClient_mut_setDamage}; 
					default {[_objHit, 0.005] call RRPClient_mut_setDamage}; 
				};
			};
		};
	};  
}];

_this addEventHandler ["Killed", {
	_creature = _this select 0;
	[_creature, "Burer_die"] remoteExec ["switchMove",-2];
	detach _creature;
	[_creature] call RRPHC_mut_burrer_soundDeath;
	_creature removeAllEventHandlers "Killed";
}];