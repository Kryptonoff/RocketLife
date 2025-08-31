
params ["_mutant"];
if (isNull _mutant) exitWith {};
_randomPosAroundMutant = [[[position _mutant, 25]],["water"]] call BIS_fnc_randomPos;
_mutant move _randomPosAroundMutant;
_mutant setVariable ["UnitPos_MUT",_randomPosAroundMutant];
