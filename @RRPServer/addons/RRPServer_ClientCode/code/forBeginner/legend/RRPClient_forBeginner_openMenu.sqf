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
private ["_background","_btn","_display","_idc","_xCoord","_imgExit","_ctrlExit","_ctrlGroup","_ctrlStrText","_ctrlLB","_height"];
if !(isNull (uiNamespace getVariable ['RRPDialogEmpty',displayNull])) exitWith {};
if !(createDialog 'RRPDialogEmpty') exitWith {};
_display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
if (isNull _display) exitWith {};

true call RRPClient_gui_util_blur;
false call RRPClient_forBeginner_WaterMarkReminder;
_display displayAddEventHandler ["unload","
uiNamespace setVariable ['RRPDialogEmpty', displayNull]; 
false call RRPClient_gui_util_blur; 
if ((isNil 'activeQuest') and {(0 in (player getVariable [""rrpvar_questsList"",[0,0,0,0,0,0,0,0]]))}) then 
{
  true call RRPClient_forBeginner_WaterMarkReminder
} else {
  false call RRPClient_forBeginner_WaterMarkReminder
};"];

_background = _display ctrlCreate ["RRP_background", 1011];
_background ctrlSetPosition [0.256367 * safezoneW + safezoneX,0.225 * safezoneH + safezoneY,0.487266 * safezoneW,0.55 * safezoneH];
_background ctrlCommit 0;

_xCoord = [(ctrlPosition _background),7,0.064,0.06] call RRPClient_gui_util_alignCtrl;
{
  _idc = 0011 + 1;
  _btn = _display ctrlCreate ["RRP_btn_blue", _idc];
  _btn ctrlSetText (_x select 0);
  _btn ctrlSetPosition [_xCoord * safezoneW + safezoneX,0.258 * safezoneH + safezoneY,0.06 * safezoneW,0.033 * safezoneH];
  _btn ctrlAddEventHandler ["ButtonClick", format [" '%1' call RRPClient_forBeginner_createTab",(_x select 1)]];
  _xCoord = _xCoord + 0.064;
} forEach [
  ["Обучение","quests"],
  ["Новичку","freshpawn"],
  ["Управление","control"],
  ["Фракции","fraction"],
  ["Заработок","farm"],
  ["Выживание","survival"],
  ["Бизнес","busines"]
];

_imgExit = _display ctrlCreate ['RscPictureKeepAspect', 1018];
_imgExit ctrlSetText 'rimas_gui\data\v3\button_close.paa';
_imgExit ctrlSetPosition [0.727 * safezoneW + safezoneX,0.23 * safezoneH + safezoneY,0.0154688 * safezoneW,0.033 * safezoneH];

_ctrlExit = _display ctrlCreate ['RscPictureButtonMenu', 1019];
_ctrlExit ctrlSetPosition [0.727 * safezoneW + safezoneX,0.23 * safezoneH + safezoneY,0.0154688 * safezoneW,0.033 * safezoneH];
_ctrlExit ctrlAddEventHandler ['ButtonClick', 'closeDialog 0'];

_ctrlGroup = _display ctrlCreate ['RscControlsGroupNoScrollbars', 1020];
_xCoord = [(ctrlPosition _background),1,0.412431] call RRPClient_gui_util_alignCtrl;
_ctrlGroup ctrlSetPosition [_xCoord * safezoneW + safezoneX,0.31 * safezoneH + safezoneY,0.412431 * safezoneW,0.429118 * safezoneH];

_ctrlStrText = _display ctrlCreate ['RRP_RscStructuredText', 1022, _ctrlGroup];
_ctrlStrText ctrlSetStructuredText parseText "<t><br/><t size='1.2' color='#FFFFFF' align='left' valign='middle'  font='RobotoCondensedLight' > <t size='2.5' align='left' font='RobotoCondensedLight' > Привет.</t><br/><br/>Добро пожаловать на сервер Rocket Life, заходя на наш сервер вы попадаете в огромную песочницу с настоящими игроками «жителями» с которыми вам придется взаимодействовать. Конкретной цели нет, на старте мы вас снабжаем стартовыми деньгами и базовыми знаниями, которые вы получите в процессе прохождения обучающих заданий. И по окончанию прохождения, решать только вам, какую социальную нишу вы займете в этом многогранном виртуальном мире...
</t>";
_height = [_ctrlStrText, 0, 0] call BIS_fnc_ctrlFitToTextHeight;
_ctrlStrText ctrlSetPosition [0.0135 * safezoneW,0.0220054 * safezoneH,0.386654 * safezoneW,_height];

_ctrlLB = _display ctrlCreate ['RscListBox_controlsFB', 1023];
_ctrlLB ctrlSetPosition [0.329844 * safezoneW + safezoneX,0.302 * safezoneH + safezoneY,0.348047 * safezoneW,0.407 * safezoneH];
_ctrlLB ctrlCommit 0;

{
  [_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _x, ctrlPosition _x, 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);
