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

/* private ["_display","_RRPlogo","_Strtext","_BTNcopy","_Bground","_giftName","_giftObj","_Editbox","_promo"];
if !(createDialog 'RRPDialogNY') exitWith {};
 _display = uiNamespace getVariable ['RRPDialogNY',displayNull];
if (isNull _display) exitWith {};
gift = _this;
{
    _giftName = configName _x;
    _promo = getText(missionConfigFile >> 'LifeCfgSettings' >> 'giftsNY' >> _giftName >> 'promo');
    _giftObj  = missionNamespace getVariable [_giftName,objNull];
    if (_giftObj isEqualto gift) exitWith {};

} forEach ('true' configClasses (missionConfigFile >> 'LifeCfgSettings' >> 'giftsNY'));

_Bground = _display ctrlCreate ["RRP_background",2001];
_RRPlogo = _display ctrlCreate ["RscPictureKeepAspect",2002];
_Strtext = _display ctrlCreate ["RRP_RscStructuredText",2003];
_BTNcopy = _display ctrlCreate ["RRP_btn_blue",2004];
_Editbox = _display displayCtrl	2010;
_Editbox ctrlSetText _promo;

_Editbox ctrlSetPosition [0.453594 * safezoneW + safezoneX,0.62 * safezoneH + safezoneY,0.0928125 * safezoneW,0.033 * safezoneH];
_Bground ctrlSetPosition [0.37625 * safezoneW + safezoneX,0.225 * safezoneH + safezoneY,0.2475 * safezoneW,0.55 * safezoneH];
_RRPlogo ctrlSetPosition [0.461328 * safezoneW + safezoneX,0.137 * safezoneH + safezoneY,0.0773438 * safezoneW,0.154 * safezoneH];
_Strtext ctrlSetPosition [0.399453 * safezoneW + safezoneX,0.291 * safezoneH + safezoneY,0.201094 * safezoneW,0.352 * safezoneH];
_BTNcopy ctrlSetPosition [0.426523 * safezoneW + safezoneX,0.687 * safezoneH + safezoneY,0.146953 * safezoneW,0.044 * safezoneH];


{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);

_RRPlogo ctrlSetText "\rimas_agent\assets\loot\imgur.paa";
_Strtext ctrlSetStructuredText parseText format ["<t><t size='1' align='center'  font='RobotoCondensedLight' >
<t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/>
В эту предновогоднюю ночь, мы хотим сказать тебе пару важных слов и не важно выиграешь ты или нет данный промо-код, мы хотим тебя поздравить от чистого сердца и светлой души с наступающим новым годом.
Пусть этот праздник радости и счастья положит начало великим событиям и большим успехам в жизни,
пусть снежинки добра и удачи кружатся над головой, пусть близкие и любимые люди будут всегда с тобой!
С наступающим! А теперь не медли и проверяй промо-код!</t>",(player call getNickName)];
_BTNcopy ctrlSetText 'Закрыть';
_BTNcopy ctrlAddEventHandler ['ButtonClick', 'closeDialog 0;']; */
