/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_terminal","_varname","_config"];
_terminal = param [0,objNull,[objNull]];
_varname = vehicleVarName _terminal;
try
{
	if (isNull _terminal) throw "Терминал не обнаружен";
	_config = getMissionConfig "CfgCCTV" >> _varname;
	if !(isPipEnabled) throw "Необходимо включить PIP в настройках игры";
	if !(isClass _config) throw "Терминал не настроен, обратитесь к администратору";
	if !(call compile(getText(_config >> "condition"))) throw "У вас нет доступа к этому терминалу";
	createDialog "RRPDialogCCTV";
	RRPCameraSystemBase = _terminal;
	true call RRPClient_gui_util_blur;
	call RRPClient_CCTV_onLoad;
}catch{
	["ErrorTitleAndText",["CCTV",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
