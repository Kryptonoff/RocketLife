
private _mutant = _this;
if ((_mutant getVariable "IMS_IsAnimPlayed" == 1) OR !(alive _mutant) OR (_mutant getVariable "canMakeAttack" == 1) OR !(isTouchingGround _mutant)) exitWith {};

//private _myNearestEnemy = _mutant findNearestEnemy _mutant;
//private _ifInter = lineIntersects [ getPosASL _myNearestEnemy, eyePos _mutant, _myNearestEnemy, _mutant];
//if (_ifInter) exitWith {};

private _rndTactic = selectRandom ["StraightAttack"];
_mutant setVariable ["IMS_IsAnimPlayed",1];

switch (_rndTactic) do { 
	case "StraightAttack" : {
		_mutant playMoveNow "Chimera_run";
		[{
			if (_this getVariable "canMakeAttack" == 0) then {
				_this playMoveNow "Chimera_run";
				[{_this setVariable ["IMS_IsAnimPlayed", 0]}, _this, 1.428] call CBA_fnc_waitAndExecute;
			} else {
				_this setVariable ["IMS_IsAnimPlayed", 0];
			};
		}, _mutant, 1.428] call CBA_fnc_waitAndExecute;
	};

	default {}; 
};