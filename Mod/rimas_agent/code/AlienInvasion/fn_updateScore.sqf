#include "common_defines.inc"
disableSerialization;

private _getNumber = 
{
	private _res = [];
	if (_this < 10) then {_this = "0" + str _this} else {_this = str _this};
	{ _res pushBack ("Sprites\Numbers\" + _x + "_ca.paa") } forEach (_this splitString "");
	_res
};

AlienInvasion getVariable "Catcher" params ["_score", "_lives"];
private _size = UIGetVal(UIInterfaceSize);

private _scoreDigits = _score call _getNumber;
UIGetVal(UICatcherScoreNumber1Ctrl) ctrlSetText (_scoreDigits select 0);
UIGetVal(UICatcherScoreNumber2Ctrl) ctrlSetText (_scoreDigits select 1);
if (count _scoreDigits > 2) then { UIGetVal(UICatcherScoreNumber3Ctrl) ctrlSetText (_scoreDigits select 2) };

private _livesDigits = _lives call _getNumber;
UIGetVal(UICatcherLivesNumber1Ctrl) ctrlSetText (_livesDigits select 0);
UIGetVal(UICatcherLivesNumber2Ctrl) ctrlSetText (_livesDigits select 1);

if (_lives <= 0) exitWith { SIMSetVal(SIMRunning, false); true };

if (_score >= ESCALATION_SCORE4) exitWith { SIMSetVal(SIMMaxAliens, 5); false };
if (_score >= ESCALATION_SCORE3) exitWith { SIMSetVal(SIMMaxAliens, 4); false };
if (_score >= ESCALATION_SCORE2) exitWith { SIMSetVal(SIMMaxAliens, 3); false };
if (_score >= ESCALATION_SCORE1) exitWith { SIMSetVal(SIMMaxAliens, 2); false };

