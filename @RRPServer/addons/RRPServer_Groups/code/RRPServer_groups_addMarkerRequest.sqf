/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_sessionID", "_parameters", "_player", "_clanID", "_clanHash", "_icon", "_color", "_position", "_iconSize", "_text", "_textSize", "_maxChars", "_alphabet", "_forbiddenCharacter", "_maxAmountOfMarkers", "_data", "_message", "_markerID", "_markers"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player)	throw "Вас не существует!";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if ((count _clanHash) isEqualTo 0) throw "Данные организации повреждены!";

	_icon = _parameters select 0;
	_color = _parameters select 1;
	_position = _parameters select 2;
	_iconSize = _parameters select 3;
	_text = _parameters select 4;
	_textSize = _parameters select 5;
	_maxChars = getNumber (missionConfigFile >> "CfgGroups" >> "maximumIconText");
	if ((count _text) > _maxChars) throw format ["Очень многа букав, МАКС : %1",_maxChars];
	_alphabet = getText (missionConfigFile >> "CfgGroups" >> "allowAlphabet");
	_forbiddenCharacter = [_text, _alphabet] call RRPClient_util_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) throw format ["Нельзя использовать '%1'!",_forbiddenCharacter];
	if !((count _color) isEqualTo 4) throw "FuckOff and die in fire!";
	if !((count _position) isEqualTo 2) throw "FuckOff and die in fire! #2";
	_maxAmountOfMarkers = getNumber(missionConfigFile >> "CfgGroups" >> "maximumIcons");
	_markers = _clanHash getOrDefault ["markers",[]];
	if (count _markers >= _maxAmountOfMarkers) throw "Нельзя установить больше маркеров на карте!";
	_data = [_clanID,_position,_color,_icon,_iconSize,_text,_textSize];
	_message = ["addMarker", _data] call RRPServer_DB_createMessage;
	_markerID = _message call RRPServer_DB_insertSingle;
	_parameters pushback _markerID;
	_markers pushback _parameters;
	_clanHash set ["markers",_markers];
	missionNameSpace setVariable [format["ServerGroupsInfo_%1",_clanID],_clanHash];
	_clanID call RRPServer_groups_updateMarkers;
	[_clanID,"marker",getPlayerUID _player,format ["%1 добавил маркер ""%3"" рядом с локацией %2",_player call getFullName,[_player] call mav_taxi_fnc_nearestLocation, _text]] call RRPServer_groups_log;
	
	["SuccessTitleOnly", ["Маркер добавлен!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner _player];
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Ошибка добавления маркера!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner _player];
};
