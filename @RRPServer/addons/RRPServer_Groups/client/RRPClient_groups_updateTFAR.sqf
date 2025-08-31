/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _pageSettings = _display displayCtrl 1040;
private _dvBox = _pageSettings controlsGroupCtrl 14036;
private _kvBox = _pageSettings controlsGroupCtrl 14037;
try
{
	if !("tfarRead" call RRPClient_groups_util_permCheck) throw "У вас нет на это разрешения!";
	if !("tfarChange" call RRPClient_groups_util_permCheck) throw "У вас нет на это разрешения!";
	if (parseNumber(ctrlText _dvBox) > 87) throw "Максимальная частота для ДВ 87 kHz";
	if (parseNumber(ctrlText _dvBox) < 30) throw "Минимальная частота для ДВ 30 kHz";
	if (parseNumber(ctrlText _kvBox) > 512) throw "Максимальная частота для КВ 512 mHz";
	if (parseNumber(ctrlText _kvBox) < 30) throw "Минимальная частота для КВ 30 mHz";

    ["updateTFARSettings",[[ctrlText _dvBox,ctrlText _kvBox]]] call RRPClient_system_send;
}catch{
	["ErrorTitleAndText",["Организация",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
