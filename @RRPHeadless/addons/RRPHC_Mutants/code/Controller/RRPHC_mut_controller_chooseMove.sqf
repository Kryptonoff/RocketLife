
private _mutant = _this;
if ((_mutant getVariable "IMS_IsAnimPlayed" == 1) OR !(alive _mutant) OR (_mutant getVariable "canMakeAttack" == 1) OR !(isTouchingGround _mutant)) exitWith {};

//private _myNearestEnemy = _mutant findNearestEnemy _mutant;
//private _ifInter = lineIntersects [ getPosASL _myNearestEnemy, eyePos _mutant, _myNearestEnemy, _mutant];
//if (_ifInter) exitWith {};

_mutant setVariable ["IMS_IsAnimPlayed", 1];
_mutant playMoveNow "Controller_walk";
[{
	if (_this getVariable "canMakeAttack" == 0) then {
		_this playMoveNow "Controller_walk";
		[{_this setVariable ["IMS_IsAnimPlayed", 0]}, _this, 1] call CBA_fnc_waitAndExecute;
	} else {
		_this setVariable ["IMS_IsAnimPlayed", 0];
	};
}, _mutant, 1] call CBA_fnc_waitAndExecute;