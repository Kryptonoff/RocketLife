/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_id","_parameters"];
_player = _id call RRPServer_session_getPlayerObject;
try
{
	if (isNull _player) throw "Вас не существует";
	_groupID = _player getVariable ["GroupID",-1];
	if (_groupID isEqualTo -1) throw "Оранизация не определена";
	_hash = missionNamespace getVariable [format["ServerGroupsInfo_%1",_groupID],createHashMap];
	if (count _hash isEqualTo 0) throw "Проблема с данными организации";
	_ranks = _hash getOrDefault ["ranks",[]];
	{
		_rank = _ranks select _forEachIndex;
		_rank set [2,[]];
	}forEach _ranks;
	_groupID call RRPServer_groups_updateClients;
	format["updateGroupTitles:%1:%2",(_hash getOrDefault ["ranks",[]]),_groupID] call RRPServer_DB_fireAndForget;
	["Настройки сброшены","",10, [0.247,0.831,0.988,1]] remoteExec ["RRPClient_gui_baguetteExt_show",owner _player]; 
	[_groupID,"dropPerms",getPlayerUID _player,format ["%1 сбросил все настройки званий!",_player call getFullName]] call RRPServer_groups_log;
	//-- TODO: Logs

}catch{
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
true
