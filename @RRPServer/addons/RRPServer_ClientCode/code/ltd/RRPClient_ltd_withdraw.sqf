/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
try
{
	RRPClientLTDsData params ["_id","_name"];
	_dataCompany = missionNamespace getVariable [format["ltdData_%1",_id],[]];
	_dataCompany params ["_owner","_name","_bank","_members"];
	
	if !((getPlayerUID player) isEqualTo _owner) throw "Обналичить средства может только руководитель компании";
	if (_bank < 1000) throw "Обналичить средства можно от $1000";
	
	["InfoTitleOnly", ["Отправляем запрос главному серверу..."]] call SmartClient_gui_toaster_addTemplateToast;
	[player,_id] remoteExecCall ["RRPServer_ltd_withdraw",2];

}catch{
	["ErrorTitleOnly", [_exception]] call SmartClient_gui_toaster_addTemplateToast;
};