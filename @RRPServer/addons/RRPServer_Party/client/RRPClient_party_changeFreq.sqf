/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _mode = param [0,"dv",[""]];
private _tfarInfo = (group player) getVariable ["TFAR_Freq",[]];

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36000;

private _highFreq = _slide controlsGroupCtrl 36012;
private _lowFreq = 	_slide controlsGroupCtrl 36015;
try
{
	if (_mode isEqualTo "dv") then
	{
		if (parseNumber(ctrlText _lowFreq) > 87) throw "Максимальная частота для ДВ 87 MHz";
		if (parseNumber(ctrlText _lowFreq) < 30) throw "Минимальная частота для ДВ 30 MHz";
		_tfarInfo set [0,parseNumber(ctrlText _lowFreq)];
		["SuccessTitleAndText",["ДВ частоты обновлены!",format ["Новая частота %1 MHz",ctrlText _lowFreq]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",group player];
	}else{
		if (parseNumber(ctrlText _highFreq) > 512) throw "Максимальная частота для КВ 512 MHz";
		if (parseNumber(ctrlText _highFreq) < 30) throw "Минимальная частота для КВ 30 MHz";
		_tfarInfo set [1,parseNumber(ctrlText _highFreq)];
		(group player) setVariable ["TFAR_Freq",_tfarInfo,true];
		["SuccessTitleAndText",["КВ частоты обновлены!",format ["Новая частота %1 MHz",ctrlText _highFreq]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",group player];
	};
	[(group player),"TFAR_Freq",_tfarInfo] call CBA_fnc_setVarNet;
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
