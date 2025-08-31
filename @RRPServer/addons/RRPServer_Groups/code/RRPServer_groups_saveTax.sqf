
private ["_sessionID","_parameters","_player","_clanID","_clanHash","_members","_title"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_parameters params ["_taxes"];
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует!";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	_clanHash = (missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap]);
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	_clanHash set ["taxes",_taxes];

	format["updateGroupTaxes:%1:%2",(_clanHash get "taxes"),_clanID] call RRPServer_DB_fireAndForget;
	missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
	["SuccessTitleAndText", ["Организация",format["Настройки налогов сохранены!",_name]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	["saveTitleResponse",[_clanHash]] call RRPServer_system_sendTo;
	_clanID call RRPServer_groups_updateClients;
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};