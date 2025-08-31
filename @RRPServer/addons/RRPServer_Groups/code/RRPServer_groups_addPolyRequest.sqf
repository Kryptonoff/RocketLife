/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_sessionID", "_parameters", "_player", "_clanID", "_clanHash", "_positions", "_color", "_maxAmountOfPolys", "_maxAmountOfPolyLines", "_data", "_extDB2Message", "_polyID", "_polys"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует!";
	
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	
	_positions = _parameters select 0;
	_color = _parameters select 1;
	if !((count _color) isEqualTo 4) throw "FuckOff and burn in fire #5";

	_maxAmountOfPolys = getNumber(missionConfigFile >> "CfgGroups" >> "maximumPolys");
	_polys = _clanHash getOrDefault ["polys",[]];
	if (count _polys >= _maxAmountOfPolys) throw "Уже максимум линий";
	
	_maxAmountOfPolyLines = getNumber(missionConfigFile >> "CfgGroups" >> "maximumPolyNode");
	if (count _positions > _maxAmountOfPolyLines) throw "Максимум линий!";
	
	_data = [_clanID,_positions,_color];
	_extDB2Message = ["addPoly", _data] call RRPServer_DB_createMessage;
	_polyID = _extDB2Message call RRPServer_DB_insertSingle;
	
	
	_parameters pushback _polyID;
	_polys pushback _parameters;
	_clanHash set ["polys",_polys];
	missionNameSpace setVariable [format["ServerGroupsInfo_%1",_clanID],_clanHash];
	
	_clanID call RRPServer_groups_updatePolys;
	[_clanID,"marker",getPlayerUID _player,format ["%1 добавил линии рядом с локацией %2",_player call getFullName,[_player] call mav_taxi_fnc_nearestLocation]] call RRPServer_groups_log;

	["SuccessTitleOnly", ["Линия добавлена!", "Данные успешно обработаны!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Не удалось добавить линию!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
