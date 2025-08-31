/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
private ["_vehicle","_CDtime","_condition","_texture","_mod"];
_mod = _this;
_vehicle = vehicle player;
if (_vehicle isEqualTo player) exitWith {};
_CDtime = _vehicle getVariable ["curTime",0];
if ((time - _CDtime) < 60)   exitWith {
  ["ErrorTitleAndText", ["Ошибка!", "Флаг можно устанавливать или прятать с интервалом в 1 минуту!"]] call SmartClient_gui_toaster_addTemplateToast;
};

if (_mod) then {
  {
    _condition = getText (_x >> "condition");
    if (call (compile _condition)) exitWith {_texture = getText (_x >> "texture")};
  } forEach ("true" configClasses (missionConfigFile >> "LifeCfgSettings" >> "setFlagOnVeh"));
  if !(_texture isEqualTo "") then {_vehicle forceFlagTexture _texture};
} else {
  _vehicle forceFlagTexture "";
};
_vehicle setVariable ["curTime", time, true];

