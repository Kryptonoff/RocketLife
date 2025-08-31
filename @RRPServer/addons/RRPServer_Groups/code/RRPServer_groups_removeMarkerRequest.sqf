/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_sessionID", "_parameters", "_player", "_clanID", "_clanHash", "_array", "_markerID", "_markerArray", "_index"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "You do not exist! :)";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	_array = _parameters select 0;
	_markerID = _parameters select 1;
	_markerArray = _clanHash get _array;
	_index = [_markerArray,_markerID] call RRPClient_util_find;
	if (_index isEqualTo -1) throw "Ваша организация не владеет этим маркером! Как вы его видите?";
	format["deleteMarker:%1",_markerID] call RRPServer_DB_fireAndForget;
	_markerArray deleteAt _index;
	_clanHash set [_array,_markerArray];
	missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
	if(_array isEqualTo 11)then
	{
		_clanID call RRPServer_groups_updateMarkers;
	}
	else
	{
		_clanID call RRPServer_groups_updatePolys;
	};
	[_clanID,"marker",getPlayerUID _player,format ["%1 удалил все линии",_player call getFullName]] call RRPServer_groups_log;

	["SuccessTitleAndText", ["Организация","Маркер был удален!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};