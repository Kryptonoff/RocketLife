/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

disableSerialization;
private _display = 		uiNamespace getVariable ["RRPDialogCompanyMenu",displayNull];
private _allPlr = 		_display displayCtrl 9409;
private _netID =	 	_allPlr lbData (lbCursel _allPlr);
private _playerName = 	_allPlr lbText (lbCursel _allPlr);
private _invited = 		objectFromNetId _netID;
RRPClientLTDsData params ["_id","_name"];

try
{
	_hash = missionNamespace getVariable [format ["ltdData_%1",_id],[]];
	if (_hash isEqualTo []) throw "С компанией какие-то проблемы... #9523";
	_hash params ["_owner","_name","_bank","_members"];
	if !((getPlayerUID player) isEqualTo _owner) throw "Вы не руководитель компании!";
	
	_uidInvited = getPlayerUID _invited;
	if (_uidInvited isEqualTo _owner) throw "Вы не можете пригласить сами себя!";
	_index = [_members,_uidInvited] call RRPClient_util_find;
	if !(_index isEqualTo -1) throw "Выбранный игрок уже ваш сотрудник";
	_action = [format["Пригласить в компанию %1",_invited call getNickName],"Пригласить","Да","Нет"] call BIS_fnc_guiMessage;
	if (_action) then
	{
		[player,_name,_id] remoteExec ["RRPClient_ltd_inviteToLtd",_invited];
		["InfoTitleOnly", ["Отправляем приглашение..."]] call SmartClient_gui_toaster_addTemplateToast;
		
	}else{};
	
}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
