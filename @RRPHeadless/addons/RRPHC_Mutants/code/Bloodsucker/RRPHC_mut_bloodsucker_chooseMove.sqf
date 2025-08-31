
private _mutant = _this;
if ((_mutant getVariable "IMS_IsAnimPlayed" == 1) OR {!(alive _mutant)} OR {(_mutant getVariable "canMakeAttack" == 1)} OR {!(isTouchingGround _mutant)}) exitWith {};

//private _myNearestEnemy = _mutant findNearestEnemy _mutant;
//private _ifInter = lineIntersects [ getPosASL _myNearestEnemy, eyePos _mutant, _myNearestEnemy, _mutant];
//if (_ifInter) exitWith {};

if (uniform _mutant == "BS_Ex_Mutant_01") then {
	removeUniform _mutant; 
	_mutant forceAddUniform "BSI_Ex_Mutant_01";
	_rndSnd = selectRandom ["bloodsucker_invisible","bloodsucker_invisible_2"];
	[_mutant, _rndSnd, 40] call RRPHC_mut_playSound;
};

private _rndTactic = selectRandom ["StraightAttack"];

if (_rndTactic == "StraightAttack") then {
	_mutant setVariable ["IMS_IsAnimPlayed", 1];
	_mutant playMoveNow "KROVOSOS_run";
	[{
		if (_this getVariable "canMakeAttack" == 0) then {
			_this playMoveNow "KROVOSOS_run";
			[{_this setVariable ["IMS_IsAnimPlayed", 0]}, _this, 1.162] call CBA_fnc_waitAndExecute;
		} else {
			_this setVariable ["IMS_IsAnimPlayed", 0];
		};
	}, _mutant, 1.162] call CBA_fnc_waitAndExecute;
};