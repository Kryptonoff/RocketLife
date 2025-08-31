/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36000;

try
{
	if (isNull _display) throw "Display NULL";
	private _group = group player;
	if !(leader _group isEqualTo player) throw "Эта опция достпуна только лидеру!";
	private _result = _this select 1;
	private _statusText = _display displayCtrl 36010;
	private _pinGroup = _display displayCtrl 36019;
	private _pinCode = _group getVariable ["PartyPin",1234];
	if (_result isEqualTo 0) then 
	{
		(group player) setVariable ["openClosed",false,true];
		_statusText ctrlSetText "Открыта";
		_pinGroup ctrlShow false; _pinGroup ctrlEnable false;
	}else{
		(group player) setVariable ["openClosed",true,true];
		_statusText ctrlSetText "Закрыта";
		_pinGroup ctrlShow true; 
		_pinGroup ctrlEnable true;
		(_pinGroup controlsGroupCtrl 36022) ctrlSetText str (_pinCode);

	};
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true