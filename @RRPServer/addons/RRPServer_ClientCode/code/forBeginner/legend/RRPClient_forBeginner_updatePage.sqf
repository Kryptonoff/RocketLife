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
private ["_display","_ctrlGroup","_ctrlStrText","_curSlider","_image","_title","_text","_usePresets","_ctrlBtnStartQuest","_actualQuest"];
_display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
if (isNull _display) exitWith {};
_ctrlGroup = _display displayCtrl 1020;
_ctrlStrText = _ctrlGroup controlsGroupCtrl 1022;
_curSlider = (curSlider - 1);

_usePresets = ((infoListForSlider select _curSlider) select 0);

[_display, _ctrlStrText, ctrlPosition _ctrlStrText, 1, 0] call RRPClient_gui_util_animateAllCtrl;
[_display, _ctrlStrText, ctrlPosition _ctrlStrText, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
if (_usePresets) then {
  _image = ((infoListForSlider select _curSlider) select 1);
  _title = ((infoListForSlider select _curSlider) select 2);
  _text = ((infoListForSlider select _curSlider) select 3);
  _ctrlStrText ctrlSetStructuredText parseText format ["<t size='1' color='#FFFFFF' align='center' valign='middle'  font='RobotoCondensedLight' ><img color='#FFFFFF' size='8' align = 'center' image='%1'></img><br/> <t size='1.2'  align='center' valign='middle'font='overwatch' ><br/>%2</t><br/>%3</t>",_image, _title, _text];
  [_ctrlStrText, 0, 0] call BIS_fnc_ctrlFitToTextHeight;
  } else {
    _ctrlBtnStartQuest = (_display displayCtrl 2001);
  _ctrlStrText ctrlSetStructuredText parseText ((infoListForSlider select _curSlider) select 1);
  _actualQuest = (((player getVariable ["rrpvar_questsList",[]]) findIf {_x isEqualTo 0}) + 1);
    if ((_actualQuest isEqualTo curSlider) and !(missionNamespace getVariable ["activeQuest",false])) then {
      _ctrlBtnStartQuest  ctrlEnable true;
      _ctrlBtnStartQuest ctrlSetText "Начать";
      } else {
        _ctrlBtnStartQuest  ctrlEnable false;
        if (_actualQuest > curSlider) then {
          _ctrlBtnStartQuest ctrlSetText "Уже выполненно >>";
          _ctrlBtnStartQuest ctrlSetTooltip "Вы уже выполнили это задание!";
        };
        if (_actualQuest < curSlider) then {
          _ctrlBtnStartQuest ctrlSetText "<< Выполните предыдущее";
          _ctrlBtnStartQuest ctrlSetTooltip "Проходить задания нужно по очереди";
        };
        if ((missionNamespace getVariable ["activeQuest",false])) then {
          _ctrlBtnStartQuest ctrlSetText "Уже запущено!";
          _ctrlBtnStartQuest ctrlSetTooltip "Проходить задания нужно по очереди";
        };
        if (_actualQuest isEqualTo 0) then {
          _ctrlBtnStartQuest ctrlSetText "Все задания выполнены";
        };
      };
  };
