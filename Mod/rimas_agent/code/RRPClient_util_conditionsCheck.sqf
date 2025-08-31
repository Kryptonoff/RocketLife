/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    License: cc by-nc-nd
*/

private ["_return","_argument"];
_argument =_this # 0;
try {
  if (isNil "_argument") throw "No argument passed to system_conditionsCheck";
  if !(_argument isEqualType "") throw "Неверный тип данных!";
  if (_argument isEqualTo "") then {_argument = "true"};
  _return = (call (compile _argument));
  if (isNil "_return") throw "Неккоректо указанно условие!";
  if !(_return isEqualType false) throw "Неккоректо указанно условие!";
} catch {
  [format["Player %1 (%2) find wrong|mistake condition %3",name player, getPlayerUID player, _argument],"Test_Conditions"] remoteExecCall ["RRPServer_system_logIt",2];
  
  private _text = [_exception,(format ["%1: %2",_exception,_argument])] select (call life_adminlevel > 0);
  if (call life_adminlevel > 0) then {
    ["ErrorTitleAndText", ["ERROR CONDITION!!!", _text]] call SmartClient_gui_toaster_addTemplateToast;
  };
  _text call RRPClient_system_log;
  _return = false;
};

_return