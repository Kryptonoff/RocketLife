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
private ["_display","_ctrlWaterMark"];
_display = findDisplay 46;
if (_this) then {
  ctrlDelete (_display displayCtrl 556);
  _ctrlWaterMark = _display ctrlCreate ["RRP_RscStructuredText", 556];
  _ctrlWaterMark ctrlSetBackgroundColor [0.1, 0.1, 0.1,0];
  _ctrlWaterMark ctrlSetPosition [0.685625 * safezoneW + safezoneX,0.71 * safezoneH + safezoneY,0.239766 * safezoneW,0.055 * safezoneH];
  _ctrlWaterMark ctrlSetStructuredText parseText "<t color='#b5b5b5' shadow = '1' size = '1' font  = 'RobotoCondensedBold' align = 'center'> <t size = '1.35'>Вы не прошли обучение!</t><br/>Нажмите клавишу INSERT что бы узнать подробности<t/>";
  _ctrlWaterMark ctrlSetFade 0.35;
  _ctrlWaterMark ctrlCommit 0;
} else {
  ctrlDelete (_display displayCtrl 556);
};
