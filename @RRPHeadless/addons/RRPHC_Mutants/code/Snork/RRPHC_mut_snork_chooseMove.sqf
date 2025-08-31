
private _mutant = _this;
if ((_mutant getVariable "IMS_IsAnimPlayed" == 1) OR !(alive _mutant) OR (_mutant getVariable "canMakeAttack" == 1) OR !(isTouchingGround _mutant)) exitWith {};

//private _myNearestEnemy = _mutant findNearestEnemy _mutant;
//private _ifInter = lineIntersects [ getPosASL _myNearestEnemy, eyePos _mutant, _myNearestEnemy, _mutant];
//if (_ifInter) exitWith {};

private _rndTactic = selectRandom ["GoLeft","GoRight","StraightAttack","StraightAttack"];
_mutant setVariable ["IMS_IsAnimPlayed",1];

switch (_rndTactic) do { 
	case "StraightAttack" : {
		_mutant playMoveNow "SNORK_run";
		[{
			if (_this getVariable "canMakeAttack" == 0) then {
				_this playMoveNow "SNORK_run";
				[{_this setVariable ["IMS_IsAnimPlayed", 0]}, _this, 1.176] call CBA_fnc_waitAndExecute;
			} else {
				_this setVariable ["IMS_IsAnimPlayed", 0];
			};
		}, _mutant, 1.176] call CBA_fnc_waitAndExecute;
	};

	case "GoLeft" : {
		_mutant playMoveNow "SNORK_run_l";
		[{
			if (_this getVariable "canMakeAttack" == 0) then {
				_this playMoveNow "SNORK_run_l";
				[{
					if (_this getVariable "canMakeAttack" == 0) then {
						_this playMoveNow "SNORK_run_l";
						[{_this setVariable ["IMS_IsAnimPlayed", 0]}, _this, 1.176] call CBA_fnc_waitAndExecute;
					} else {
						_this setVariable ["IMS_IsAnimPlayed", 0];
					};
				}, _this, 1.176] call CBA_fnc_waitAndExecute;
			} else {
				_this setVariable ["IMS_IsAnimPlayed", 0];
			};
		}, _mutant, 1.176] call CBA_fnc_waitAndExecute;
	};

	case "GoRight" : {
		_mutant playMoveNow "SNORK_run_r";
		[{
			if (_this getVariable "canMakeAttack" == 0) then {
				_this playMoveNow "SNORK_run_r";
				[{
					if (_this getVariable "canMakeAttack" == 0) then {
						_this playMoveNow "SNORK_run_r";
						[{_this setVariable ["IMS_IsAnimPlayed", 0]}, _this, 1.176] call CBA_fnc_waitAndExecute;
					} else {
						_this setVariable ["IMS_IsAnimPlayed", 0];
					};
				}, _this, 1.176] call CBA_fnc_waitAndExecute;
			} else {
				_this setVariable ["IMS_IsAnimPlayed", 0];
			};
		}, _mutant, 1.176] call CBA_fnc_waitAndExecute;
	};

	default {}; 
};