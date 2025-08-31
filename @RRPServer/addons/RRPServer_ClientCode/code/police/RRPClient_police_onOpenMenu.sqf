/*
	Project: Police Systems for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
if !(player call getSide isEqualTo "cop") exitWith {["ErrorTitleOnly", ["Не получилось определить ваш жетон! Доступ заблокирован!"]] call SmartClient_gui_toaster_addTemplateToast;};
true call RRPClient_gui_util_blur;
createDialog "RRPDialogPoliceDatabase";
private _display = uiNamespace getVariable ["RRPDialogPoliceDatabase",displayNull];
{
	_ctrl = _display displayCtrl _x;
	_ctrl ctrlEnable false;
	_ctrl ctrlShow false;
}forEach [7704,7705,7706,7707,7708,7709,7710,7711,7712,7714,7715,7716,7717,7718,7719,7720,7721,7722,7723];

RRPClientPoliceCurrentID = "";
private _type = _display displayCtrl 7701;
lbClear 7701;

_index = _type lbAdd "По ID";
_type lbSetData [_index,"id"];
_index = _type lbAdd "По имени";
_type lbSetData [_index,"name"];
_index = _type lbAdd "Машину";
_type lbSetData [_index,"car"];
_type lbSetCurSel 0;
_hintCtrl = _display displayCtrl 7713;
_hintCtrl ctrlSetBackgroundColor [0.8,0.8,0,0.8];

_drop = _display displayCtrl 7721;
_dropAll = _display displayCtrl 7722;
_active = _display displayCtrl 7723;

if !(('cop' call RRPClient_groups_getSideLevel) >= 8) then 
{
	_dropAll ctrlEnable false;
	_dropAll ctrlSetTooltip "Данная функция недоступна вашему рангу!";
	_drop ctrlEnable false;
	_drop ctrlSetTooltip "Данная функция недоступна вашему рангу!";
	_active ctrlEnable false;
	_active ctrlSetTooltip "Данная функция недоступна вашему рангу!";
};