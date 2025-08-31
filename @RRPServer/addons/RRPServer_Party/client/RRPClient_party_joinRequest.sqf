/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36300;

private _list = _slide controlsGroupCtrl 36303;
private _pinEdit = _slide controlsGroupCtrl 36311;
private _index = lbCurSel _list;
private _group = groupFromNetId (_list lbData _index);
try
{
	if (isNull _group) throw "Что-то не так с тусовкой!";
	if (_group getVariable ["openClosed",false]) then 
	{
		if !(count (ctrlText _pinEdit) isEqualTo 4) throw "PIN-Код должен состоять из 4х цифр";
		if !([(ctrlText _pinEdit)] call RRPClient_system_isnumber) throw "PIN-Код должен состоять только из цифр";

		private _pinEntered = parseNumber(ctrlText _pinEdit); 
		private _pin = _group getVariable ["PartyPin",0000];
		if !(_pin isEqualTo _pinEntered) throw "Это закрытая тусовка! Вам нужно приглашение или PIN-Код чтобы вступить в эту тусовку!";
	};
	
	if (player in (units _group)) throw "Нельзя присоединиться к тусовке, пока вы не покинули текущую!";
	[
		_group,
		netId player
	] remoteExecCall ["RRPServer_party_joinRequest",2];	
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
