/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND
*/

private ["_sessionID","_parameters","_player","_clanID","_clanHash","_members","_title"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_parameters params ["_index","_name","_permissions"];
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует!";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	if !(_clanID call RRPClient_groups_isPayed) throw "У вас не оплачена аренда, оплатить можно в личном кабинете lk.rocket-rp.fun";
	_clanHash = (missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap]);
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	_title = ((_clanHash get "ranks") select _index);
	_title set [1,_name];
	_title set [2,_permissions];

	format["updateGroupTitles:%1:%2",(_clanHash get "ranks"),_clanID] call RRPServer_DB_fireAndForget;
	missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
	["SuccessTitleAndText", ["Организация",format["Настройки звания '%1' успешно сохранены!",_name]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	["saveTitleResponse",[_clanHash]] call RRPServer_system_sendTo;
	_clanID call RRPServer_groups_updateClients;
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
