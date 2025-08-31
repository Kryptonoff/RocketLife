/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_sessionID","_parameters","_player","_clanID","_clanHash","_members","_title"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_parameters params ["_text"];
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует!";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	_clanHash = (missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap]);
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	_day = _clanHash get "massage_day";
	_clanHash set ["massage_day",_text];
	format["updateDayText:%1:%2",(_clanHash get "massage_day"),_clanID] call RRPServer_DB_fireAndForget;
	missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
	_clanID call RRPServer_groups_updateClients;

	[_clanID,"message",getPlayerUID _player,format ["%1 обновил сообщение дня: ""%2""",_player call getFullName,[toString _text] call RRPClient_util_stripChars]] call RRPServer_groups_log;
	
	["response",_text] remoteExecCall ["RRPClient_groups_editDayText",owner _player];
	[_clanID,{["Обновлено сообщение дня!", "Прочтите его, в главном меню организации!",10, [0.247,0.831,0.988,1]] call RRPClient_gui_baguetteExt_show}] call RRPServer_groups_executeOnEveryMembers; 
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
