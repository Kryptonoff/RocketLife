/*
  Project: Aurora Role Play
  Author: FairyTale5571
  License: CC BY-ND

	_parameters - empty
*/

private ["_sessionID","_player","_clanID","_clanHash"];
_sessionID = _this select 0;
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует!";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	format["deleteAllMarker:%1",_clanID] call RRPServer_DB_fireAndForget;
	_clanHash set ["markers",[]];
	_clanHash set ["polys",[]];
	missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
	_clanID call RRPServer_groups_updateMarkers;
	_clanID call RRPServer_groups_updatePolys;
	[_clanID,"marker",getPlayerUID _player,format ["%1 удалил все маркеры",_player call getFullName]] call RRPServer_groups_log;
	["SuccessTitleAndText", ["Организация","Маркеры были удалены!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
