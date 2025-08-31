/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

private ["_sessionid","_parameters","_data","_player"];
params [
  ["_uid",""],
  ["_data",[]]];
try
{
  if (_uid isEqualTo "") throw "uid is undefined";
  if !(_data isEqualType []) throw "Profs broken";
  if (_data isEqualTo []) throw "Profs is empty";
  format ["Обновляем скиллы для %2, данные %1",_data,_uid] call RRPHC_util_debugConsole;
  format ["updateSkill:%1:%2",_data,_uid] call RRPHC_DB_fireAndForget;
}catch{
  _exception call RRPHC_util_log;
};
