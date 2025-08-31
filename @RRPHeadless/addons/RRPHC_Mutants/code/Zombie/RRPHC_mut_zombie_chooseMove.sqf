
private _mutant = _this;
if ((_mutant getVariable "IMS_IsAnimPlayed" == 1) OR !(alive _mutant) OR (_mutant getVariable "canMakeAttack" == 1) OR !(isTouchingGround _mutant)) exitWith {};

private _myNearestEnemy = _mutant findNearestEnemy _mutant;
//private _ifInter = lineIntersects [ getPosASL _myNearestEnemy, eyePos _mutant, _myNearestEnemy, _mutant];
//if (_ifInter) exitWith {};

if ((animationState _myNearestEnemy) in ["plagued_armed_melee_noweapon_catch_victim", "plagued_armed_melee_noweapon_catch_victim_behind", "plagued_armed_melee_noweapon_catch_zombie"]) exitWith {};

private _rndTactic = selectRandom ["GoLeft","GoRight","StraightAttack"];

if (_rndTactic == "StraightAttack") then {
	_mutant setVariable ["IMS_IsAnimPlayed", 1];
	_mutant playMoveNow "Zombie_Unnarmed_run";
	[{
		if (_this getVariable "canMakeAttack" == 0) then {
			_this playMoveNow "Zombie_Unnarmed_run";
			[{_this setVariable ["IMS_IsAnimPlayed", 0]}, _this, 0.909] call CBA_fnc_waitAndExecute;
		} else {
			_this setVariable ["IMS_IsAnimPlayed", 0];
		};
	}, _mutant, 0.909] call CBA_fnc_waitAndExecute;
};