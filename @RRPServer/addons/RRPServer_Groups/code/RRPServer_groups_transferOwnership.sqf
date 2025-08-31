/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_sessionID","_parameters","_player","_clanID","_clanHash","_members","_deputys"];
private _sessionID = _this select 0;
private _parameters = _this select 1;
try
{
	_parameters params ["_newLeader"];
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует!";

	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";

	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	_leader = _clanHash get "leader";
	if (getPlayerUID _player isNotEqualTo _leader) throw "Вы не можете переназначить лидера организации!";

	format["updateLeader:%1:%2",_newLeader,_clanID] call RRPServer_DB_fireAndForget;
	_clanHash set ["leader",_newLeader];
	missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
	["SuccessTitleAndText", ["Организация","Назначен новый руководитель!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	_clanID call RRPServer_groups_updateClients;
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
true
