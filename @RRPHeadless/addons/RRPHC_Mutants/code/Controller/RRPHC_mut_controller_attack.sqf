
private _mutant = _this select 0;

if ((alive _mutant) and (_mutant getVariable "canMakeAttack" == 0)) then {
	_mutant playActionNow "Controller_psyAttack";
	_mutant playActionNow "Controller_psyAttack";
	_mutant setVariable ["canMakeAttack", 2];

	_soundCache = "Land_HelipadEmpty_F" createVehicle position _mutant;
	_soundCache attachTo [_mutant, [0,0,0]];
	[_soundCache, [selectRandom["controller_attack_0","controller_attack_1"], 100]] remoteExecCall ["say3D",-2];
	[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if !(simulationEnabled _mutant) exitWith {};
		if !(_mutant getVariable "canMakeAttack" == 2) exitWith {};

		_soundCache = "Land_HelipadEmpty_F" createVehicle (position _mutant);
		_soundCache attachTo [_mutant, [0,0,0]];
		[_soundCache, ["controller_hit_first", 100]] remoteExecCall ["say3D",-2];
		[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;

		{
			if ((typeOf _x != "Controller_Ex_Mutant_01") AND (alive _x)) then {
				_dir = _mutant getRelDir _x;
				if (_dir > 270 OR _dir < 90) then {
					_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
					if (_ifInter isEqualTo []) then {
						if (!(uniform _x in mutantsForms)) then {
							[_x, _mutant] remoteExec ["RRPClient_mut_controller_hitProcess",_x];
						} else {
							[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
						};
					};
				};
			};
		} forEach nearestObjects[getPosATL _mutant, ["Man"], 100];
	}, _mutant, 1.1] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if !(simulationEnabled _mutant) exitWith {};
		if !(_mutant getVariable "canMakeAttack" == 2) exitWith {};

		_soundCache = "Land_HelipadEmpty_F" createVehicle (position _mutant);
		_soundCache attachTo [_mutant, [0,0,0]];
		[_soundCache, ["controller_hit_last", 100]] remoteExecCall ["say3D",-2];
		[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;
	}, _mutant, 3.05] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if !(simulationEnabled _mutant) exitWith {};
		if !(_mutant getVariable "canMakeAttack" == 2) exitWith {};

		_mutant playActionNow "Controller_psyAttack_hold";
		_mutant setVariable ["canMakeAttack", 1];
	}, _mutant, 3.50] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if !(simulationEnabled _mutant) exitWith {};
		if !(_mutant getVariable "canMakeAttack" == 1) exitWith {};

		_mutant setVariable ["canMakeAttack", 0];
		_mutant playActionNow "Disable_Gesture";
	}, _mutant, 9.50] call CBA_fnc_waitAndExecute;
};