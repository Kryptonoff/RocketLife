/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
	private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
	private _mainGroup = _display displayCtrl 24001;	
	private _slide = _mainGroup controlsGroupCtrl 36000;
	
	private _pinGroup = _slide controlsGroupCtrl 36019; 
	private _pin = _pinGroup controlsGroupCtrl 36022;
	private _new = ctrlText _pin;
	if !(count _new isEqualTo 4) throw "PIN-Код должен состоять из 4х цифр";
	if !([_new] call RRPClient_system_isnumber) throw "PIN-Код должен состоять только из цифр";
	(group player) setVariable ["PartyPin",parseNumber _new,true];
	["SuccessTitleAndText",["Тусовка",format ["%1 обновил PIN-Код: %2",player call getNickName, _new]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",group player];
}catch{
	["ErrorTitleAndText",["Тусовка",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
