/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = 			uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
private _membersListbox = 	_display displayCtrl 9418;
private _selectedUid = 		_membersListbox lbData (lbCursel _membersListbox);
private _playerName = 		_membersListbox lbText (lbCursel _membersListbox);

try
{
	if (_selectedUid isEqualTo "") throw "Вы никого не выбрали!";
	
	_action = [format ["Вы уверены что хотите назначить %1 руководителем компании? После подтверждения вы лишитесь доступа к управлению компанией!",_playerName],"Назначить?","Да","Нет"] call BIS_fnc_guiMessage;
	if (_action) then
	{
		[_selectedUid,player,(RRPClientLTDsData select 0)] remoteExecCall ["RRPServer_ltd_leaderRequest",2];
	}else{};
}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};