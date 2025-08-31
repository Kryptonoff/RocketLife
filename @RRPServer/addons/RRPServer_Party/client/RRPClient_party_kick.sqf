/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
private _mainGroup = _display displayCtrl 24001;
private _slide = _mainGroup controlsGroupCtrl 36000;
private _players = _slide controlsGroupCtrl 36006;
try
{
	private _index = lbCurSel _players;
	private _selected = objectFromNetId (_players lbData _index);
	private _name = _players lbText _index;
	if (isNull _selected) throw "Вы выбрали - НИЧЕГО!";
	if (_selected isEqualTo player) throw "Нельзя выгнать себя же!";
	if !(player isEqualTo (leader group player)) throw "Только лидер может выгнать с тусовки!";
	["InfoTitleOnly",[format["Игрок %1 выгнан с тусовки!",_name]]] call SmartClient_gui_toaster_addTemplateToast;
	[] remoteExecCall ["RRPClient_party_kickMe",_selected];
	_players lbDelete _index;
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};