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
private ["_display","_bg","_strText","_logo","_exitBtn","_exitImg","_promo","_buttonGoLK"];
if !(createDialog 'RRPDialogEmpty') exitWith {};
_display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
_buttonGoLK = (_display displayCtrl 1001);
_buttonGoLK ctrlEnable true;

true call RRPClient_gui_util_blur;
_display displayAddEventHandler ["unload","uiNamespace setVariable ['RRPDialogEmpty', displayNull]; false call RRPClient_gui_util_blur;"];

_bg = _display ctrlCreate ["RRP_background", 1001];
_bg ctrlSetBackgroundColor [0.1, 0.1, 0.1,0.5];
_bg ctrlSetPosition [0.295039 * safezoneW + safezoneX,0.225 * safezoneH + safezoneY,0.409922 * safezoneW,0.55 * safezoneH];

_strText = _display ctrlCreate ["RRP_RscStructuredText", 1002];
_strText ctrlSetBackgroundColor [0.1, 0.1, 0.1,0.8];
_strText ctrlSetPosition [0.306641 * safezoneW + safezoneX,0.277 * safezoneH + safezoneY,0.386719 * safezoneW,0.44 * safezoneH];

_logo = _display ctrlCreate ["RscPictureKeepAspect", 1003];
_logo ctrlSetBackgroundColor [0.1, 0.1, 0.1,1];
_logo ctrlSetText "rimas_agent\texture\mod\icon.paa";
_logo ctrlSetPosition [0.465195 * safezoneW + safezoneX,0.126 * safezoneH + safezoneY,0.0696094 * safezoneW,0.154 * safezoneH];

_exitBtn = _display ctrlCreate ['RscPictureButtonMenu', 1004];
_exitBtn ctrlAddEventHandler ['ButtonClick', 'closeDialog 0'];
_exitBtn ctrlSetPosition [0.469062 * safezoneW + safezoneX,0.73 * safezoneH + safezoneY,0.061875 * safezoneW,0.033 * safezoneH];

_exitImg = _display ctrlCreate ['RscPictureKeepAspect', 1005];
_exitImg ctrlSetText 'rimas_gui\data\v3\button_close.paa';
_exitImg ctrlSetPosition [0.469062 * safezoneW + safezoneX,0.73 * safezoneH + safezoneY,0.061875 * safezoneW,0.033 * safezoneH];

_strText ctrlSetStructuredText parseText format ["<t size = '1' align = 'center' color='#FFFFFF' ><t size = '1.6'>Обучение пройдено!</t><br/><br/>Вы прошли все задания и теперь владеете базовыми навыками для дальнейшей игры. Если вы что либо забудете, Вы всегда сможете подсмотреть в инфопанель. В качестве благодарности за пройденные задания мы вам дарим 1650 RC. Забрать их можно в тайнике!<br/><t underline = '1'>RC(Rocket Coins)</t> - Это редкая валюта которую невозможно заработать занимаясь обычным заработком, она выдается во время различных мероприятий или праздников администрацией или же выдается как благодарность за поддержку проекта. Зайдите в личный кабинет и получите RC, которые можно обменять на различные бонусы в личном кабинете. Так же в личном кабинете вы сможете просмотреть полностью весь прогресс вашего аккаунта. Перейти в него, нажав на кнопку ниже!<br/><br/></t>"];
_strText ctrlEnable false;

_buttonGoLK ctrlSetPosition [0.438125 * safezoneW + safezoneX,0.645 * safezoneH + safezoneY,0.12375 * safezoneW,0.044 * safezoneH];
_buttonGoLK ctrlSetBackgroundColor [0,0,0,1];
_buttonGoLK ctrlSetText 'Перейти в ЛК';

{
  [_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
  [_display, _x, ctrlPosition _x, 0, 0.4] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);
