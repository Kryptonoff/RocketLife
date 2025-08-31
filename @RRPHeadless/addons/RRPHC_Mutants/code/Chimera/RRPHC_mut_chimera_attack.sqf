
private _mutant = _this select 0;

if ((alive _mutant) and (_mutant getVariable "canMakeAttack" == 0) and !(animationState _mutant in ["chimera_attack_1", "chimera_attack_2", "chimera_attack_3"])) then {
	_mutant setVariable ["canMakeAttack", 1];

	[_mutant, "Chimera_attack_1"] remoteExec ["switchMove",-2];///1.428
	
	_soundCache = "Land_HelipadEmpty_F" createVehicle (position _mutant);
	_soundCache attachTo [_mutant, [0,0,0]];
	[_soundCache, [selectRandom ["chimera_attack_1","chimera_attack_2","chimera_attack_hit_1","chimera_attack_hit_2"], 120]] remoteExecCall ["say3D",-2];
	[{deleteVehicle _this}, _soundCache, 7] call CBA_fnc_waitAndExecute;
	
	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Chimera_attack_1")) exitWith {};

		{
			if (!(uniform _x in ["Chimera_Rimas"]) AND (alive _x) AND !(animationState _x in ["flyfrommutant_forward", "flyfrommutant_backward"])) then {
				_dir = _mutant getRelDir _x;
				if (_dir > 270 OR _dir < 90) then {
					_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
					if (_ifInter isEqualTo []) then {
						if (!(uniform _x in mutantsForms)) then {
							[_x, _mutant, false] call RRPHC_mut_chimera_hitProcess;
						} else {
							[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
						};
					};
				};
			};
		} forEach nearestObjects[getPosATL _mutant, ["Man"], 3.4];
	}, _mutant, 0.3] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Chimera_attack_1")) exitWith {};

		{
			if (!(uniform _x in ["Chimera_Rimas"]) AND (alive _x) AND !(animationState _x in ["flyfrommutant_forward", "flyfrommutant_backward"])) then {
				_dir = _mutant getRelDir _x;
				if (_dir > 270 OR _dir < 90) then {
					_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
					if (_ifInter isEqualTo []) then {
						if (!(uniform _x in mutantsForms)) then {
						[_x, _mutant, false] call RRPHC_mut_chimera_hitProcess;
						} else {
							[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
						};
					};
				};
			};
		} forEach nearestObjects[getPosATL _mutant, ["Man"], 3.4];
	}, _mutant, 0.5] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Chimera_attack_1")) exitWith {};

		[_mutant, "Chimera_attack_2"] remoteExec ["switchMove",-2];//1.428
		{
			if (!(uniform _x in ["Chimera_Rimas"]) AND (alive _x) AND !(animationState _x in ["flyfrommutant_forward", "flyfrommutant_backward"])) then {
				_dir = _mutant getRelDir _x;
				if (_dir > 270 OR _dir < 90) then {
					_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
					if (_ifInter isEqualTo []) then {
						if (!(uniform _x in mutantsForms)) then {
							[_x, _mutant] call RRPHC_mut_chimera_hitProcess;
						} else {
							[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
						};
					};
				};
			};
		} forEach nearestObjects[getPosATL _mutant, ["Man"], 3.4];
	}, _mutant, 0.75] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		_mutant setVariable ["AI_CanTurn", 1];
		if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Chimera_attack_2")) exitWith {};

		{
			if (!(uniform _x in ["Chimera_Rimas"]) AND (alive _x) AND !(animationState _x in ["flyfrommutant_forward", "flyfrommutant_backward"])) then {
				_dir = _mutant getRelDir _x;
				if (_dir > 270 OR _dir < 90) then {
					_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
					if (_ifInter isEqualTo []) then {
						if (!(uniform _x in mutantsForms)) then {
							[_x, _mutant] call RRPHC_mut_chimera_hitProcess;
						} else {
							[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
						};
					};
				};
			};
		} forEach nearestObjects[getPosATL _mutant, ["Man"], 3.4];
	}, _mutant, 1.1] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Chimera_attack_2")) exitWith {};

		{
			if (!(uniform _x in ["Chimera_Rimas"]) AND (alive _x) AND !(animationState _x in ["flyfrommutant_forward", "flyfrommutant_backward"])) then {
				_dir = _mutant getRelDir _x;
				if (_dir > 270 OR _dir < 90) then {
					_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
					if (_ifInter isEqualTo []) then {
						if (!(uniform _x in mutantsForms)) then {
							[_x, _mutant] call RRPHC_mut_chimera_hitProcess;
						} else {
							[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
						};
					};
				};
			};
		} forEach nearestObjects[getPosATL _mutant, ["Man"], 3.4];
	}, _mutant, 1.4] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};
		if (!(simulationEnabled _mutant) OR !(animationState _mutant == "Chimera_attack_2")) exitWith {};

		[_mutant, "Chimera_attack_3"] remoteExec ["switchMove",-2];//1
		{
			if (!(uniform _x in ["Chimera_Rimas"]) AND (alive _x) AND !(animationState _x in ["flyfrommutant_forward", "flyfrommutant_backward"])) then {
				_dir = _mutant getRelDir _x;
				if (_dir > 270 OR _dir < 90) then {
					_ifInter = lineIntersectsSurfaces [eyePos _x, eyePos _mutant, _x, _mutant, true, 1, "GEOM", "NONE"];
					if (_ifInter isEqualTo []) then {
						if (!(uniform _x in mutantsForms)) then {
							[_x, _mutant] call RRPHC_mut_chimera_hitProcess;
						} else {
							[_x, 1] remoteExecCall ["RRPClient_mut_setDamage", _x];
						};
					};
				};
			};
		} forEach nearestObjects[getPosATL _mutant, ["Man"], 3.2];
	}, _mutant, 1.6] call CBA_fnc_waitAndExecute;

	[{
		_mutant = _this;
		if !(alive _mutant) exitWith {};

		_mutant enableAI "ANIM";
		_mutant enableAI "MOVE";
		_mutant enableAI "PATH";
		_mutant setVariable ["AI_CanTurn", 1];
		_mutant setVariable ["canMakeAttack", 1];
		if ((animationState _mutant == "Chimera_attack_3") and (alive _mutant)) then {
			_rndDovorot = random 100;
			if (_rndDovorot < 20) then {
				_mutant setVariable ["AI_CanTurn", 0];
				_rndAnim = selectRandom ["Chimera_jump_l","Chimera_jump_r"];
				[_mutant, _rndAnim] remoteExec ["switchMove",-2]; 
				[{
					doStop _this;
					_this setVariable ["canMakeAttack", 0];
					[_this, "Chimera_run"] remoteExec ["switchMove",-2];
					_nearEnemy = _this findNearestEnemy _this; 
					_this doMove [(getPosATL _nearEnemy select 0) + random 1,(getPosATL _nearEnemy select 1) + random 1, 0];
				}, _mutant, 1.1] call CBA_fnc_waitAndExecute;
			} else {
				[_mutant, "Chimera_run"] remoteExec ["switchMove",-2];
				group _mutant setSpeedMode "FULL";
				doStop _mutant;
				_mutant doMove (_mutant modelToWorld [0,35.8,0]);
				_mutant doMove (_mutant modelToWorld [0,35.8,0]);
				[{
					group _this setSpeedMode "FULL";
					_this doMove (_this modelToWorld [0,35.8,0]);
					_this doMove (_this modelToWorld [0,35.8,0]);
				}, _mutant, 1] call CBA_fnc_waitAndExecute;
				[{
					group _this setSpeedMode "FULL";
					_this doMove (_this modelToWorld [0,35.8,0]);
					_this doMove (_this modelToWorld [0,35.8,0]);
				}, _mutant, 2] call CBA_fnc_waitAndExecute;
				[{
					group _this setSpeedMode "FULL";
					_this doMove (_this modelToWorld [0,35.8,0]);
					_this doMove (_this modelToWorld [0,35.8,0]);
				}, _mutant, 3] call CBA_fnc_waitAndExecute;
				[{
					group _this setSpeedMode "FULL";
					_this doMove (_this modelToWorld [0,35.8,0]);
					_this doMove (_this modelToWorld [0,35.8,0]);
				}, _mutant, 4] call CBA_fnc_waitAndExecute;
				[{
					_this setVariable ["AI_CanTurn", 0];
					_this setVariable ["canMakeAttack", 0];
				}, _mutant, 9] call CBA_fnc_waitAndExecute;
			};
		};
	}, _mutant, 2.65] call CBA_fnc_waitAndExecute;
};