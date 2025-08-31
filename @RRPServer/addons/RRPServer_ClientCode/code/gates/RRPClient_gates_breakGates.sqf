/*
  author: Arrra
  steamID: 76561198090549826
  discord: arrra#9745
  cc by-nc-nd
*/
try
{
  private ["_gen","_complete","_condition","_conditionMsg","_breakingObject","_curGate","_objectsSound"];
  _gen = (vehicleVarName curTarget);
  _condition = getText(missionConfigFile >> "cfg_genaratos" >> _gen >> "conditionForBreak");
  _conditionMsg = getText(missionConfigFile >> "cfg_genaratos" >> _gen >> "conditionForBreakMSG");
  _breakingObject = getArray(missionConfigFile >> "cfg_genaratos" >> _gen >> "breakingObject");
  _objectsSound = getArray(missionConfigFile >> "cfg_genaratos" >> _gen >> "objectSound");

  {
    _curGate = missionNamespace getVariable [_x,objNull];
    if (isNull _curGate) throw 'Ворота не определены!';
    if (_curGate getVariable ["isBreaking",false]) throw "Ворота уже взломаны!";
  } forEach _breakingObject;

  _condition = if (_condition isEqualTo "") then {true} else {call compile (_condition)};
  if !(_condition) throw _conditionMsg;

  _complete = [
    "Взламываем ворота",
    { ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player) and ((player distance (missionNamespace getVariable [_gen, objNull])) < 4)},
    true,
    (if ((call life_adminlevel) > 0) then {10} else {300}),
    false,
    true,
    {['alarm',_objectsSound,15] call RRPClient_gates_bell}
  ] call RRPClient_system_newProgressBar;
  if (isNil "_complete") throw "Действие прервано";
  if !(_complete) throw "Действие прервано!";

  {
    _curGate = missionNamespace getVariable [_x,objNull];
    if !(isNull _curGate) then {
      _curGate setVariable ["isBreaking",true,true];
      _curGate animate ["barier", 1];
      _curGate animate ["Gate", 1];
      _curGate animate ["window", 0];
      _curGate animate ["door", 0];
    };
  } forEach _breakingObject;
  ["InfoTitleAndText", ["Защита отключена!", "Главный вход открыт!"]] call SmartClient_gui_toaster_addTemplateToast;
  [25,"взлом генератора"] call addXP;
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
