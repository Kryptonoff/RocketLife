/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd

     _mod = "promo";
    _text = format ["<t align='center' ><t size='1' align='center'  font='RobotoCondensedLight' ><t><t size='2' align='center'  font='gtav' >Дорогой %1</t><br/><br/><t size='1,2' font = 'RobotoCondensedBold' align='center' >Поздравляем, Вы выиграли промо-код!</t><br/><t color='#fe3d13' size='0.7' align='center' font='RobotoCondensed' >Не кому не показывайте и не сообщайте его! Активировать можно в личном кабинете</t></t>",(name player),_textNY,_gift];
    _gift = "ASD123ASd4124asdasd";
*/
params
[
  ["_mod", "", [""]],
  ["_text", "", [""]],
  ["_gift", "", [""]]
];

private ["_display","_RRPlogo","_Strtext","_BTNcopy","_Editbox"];
if !(createDialog 'RRPDialogNY') exitWith {};
 _display = uiNamespace getVariable ['RRPDialogNY',displayNull];
if (isNull _display) exitWith {};
_text = parseText _text;

_RRPlogo = _display ctrlCreate ["RscPictureKeepAspect",2002];
_Strtext = _display ctrlCreate ["RRP_RscStructuredText",2003];
_BTNcopy = _display ctrlCreate ["RRP_btn_blue",2004];
_Editbox = _display displayCtrl	2010;

if (_mod isEqualTo "promo") then {
  _Editbox ctrlSetText _gift;
  _BTNcopy ctrlSetText 'Копировать!';
  _BTNcopy ctrlAddEventHandler ['ButtonClick',format ['"%1" call RRPClient_util_copyToClipboard;["SuccessTitleOnly",["Промокод скопирован!"]] call SmartClient_gui_toaster_addTemplateToast;', _gift]];
  _gift call RRPClient_util_copyToClipboard;
  ["SuccessTitleAndText", ["Промокод скопирован!","Сохраните его или запишите!" ]] call SmartClient_gui_toaster_addTemplateToast;
} else {
  _BTNcopy ctrlEnable false;
  _BTNcopy ctrlShow false;

  _Editbox ctrlEnable false;
  _Editbox ctrlShow false;
};

_Editbox ctrlSetPosition [0.453594 * safezoneW + safezoneX,0.44 * safezoneH + safezoneY,0.0928125 * safezoneW,0.033 * safezoneH];
_RRPlogo ctrlSetPosition [0.461328 * safezoneW + safezoneX,0.137 * safezoneH + safezoneY,0.0773438 * safezoneW,0.154 * safezoneH];
_Strtext ctrlSetPosition [0.399453 * safezoneW + safezoneX,0.291 * safezoneH + safezoneY,0.201094 * safezoneW,0.352 * safezoneH];
_BTNcopy ctrlSetPosition [0.449727 * safezoneW + safezoneX,0.48 * safezoneH + safezoneY,0.100547 * safezoneW,0.033 * safezoneH];

{
	[_display, _x, ctrlPosition _x, 1, 0] call RRPClient_gui_util_animateAllCtrl;
	[_display, _x, ctrlPosition _x, 0, 0.5] call RRPClient_gui_util_animateAllCtrl;
} forEach (allControls _display);

_RRPlogo ctrlSetText "\rimas_agent\assets\loot\imgur.paa";
_Strtext ctrlSetStructuredText _text;
