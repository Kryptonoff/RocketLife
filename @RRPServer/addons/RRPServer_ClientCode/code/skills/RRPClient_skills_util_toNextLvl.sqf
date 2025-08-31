/*
  Project: Rimas Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

private ["_prof","_data","_return","_maxLvl","_nextLevel"];
_prof = _this;
_data = missionNamespace getVariable [_prof,[0,0]];
_data params ["_level","_exp"];
_return = [];
try
{
  if !(isClass (getMissionConfig "CfgSkills" >> _prof)) throw "#404 ";
  _maxLvl = getNumber(getMissionConfig "CfgSkills" >> _prof >> "maxLevel");
  if (_level >= _maxLvl) throw "Вы достигли совершенства! ";
  _nextLevel = 0;
  _nextLevel = _level * (_level - 1) * 1500;
  if (_nextLevel < 1) then {_nextLevel = 1500;};
  _return = [_exp,_nextLevel,_level];
}catch{
  _return = _exception;
};
_return
