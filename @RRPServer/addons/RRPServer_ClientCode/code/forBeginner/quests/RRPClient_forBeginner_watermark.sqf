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
private _display = (findDisplay 46);
private _text = _this;
if ("delete" isEqualTo _text) exitWith {ctrlDelete (_display displayCtrl 555)};
if !(isNull(_display displayCtrl 555)) then {ctrlDelete (_display displayCtrl 555)};
private _watermark = _display ctrlCreate ["RRP_RscStructuredText", 555];
_watermark ctrlSetBackgroundColor [0.1, 0.1, 0.1,0];
_watermark ctrlSetPosition  [0.407188 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.185625 * safezoneW,0.121 * safezoneH];
_watermark ctrlCommit 0;

if (_text isEqualTo "") then {
    _watermark ctrlSetStructuredText parseText format ["<t align='center' size='2' font='overwatch' color ='#ffffff'>Нажмите INSERT для обучения<br/><t size='0.8'>Все функции игры отроются только после прохождения обучения</t></t>"];
 } else {
    _watermark ctrlSetStructuredText parseText format ["<t align='center' shadow = '1' size='1.1' font='overwatch' color ='#ffffff' >Текущее задание:<br/><t size='0.9' font = 'RobotoCondensed'>%1</t></t>", _text];
};
