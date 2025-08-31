/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_player","_clanID","_clanHash"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_parameters params ["_cost"];
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вы не определены";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	if (_player getVariable ["RRPPoint",0] < _cost) throw "У вас недостаточно средств!";
	[_player,"point","take",_cost] call RRPServer_system_moneyChange;
	_clanHash set ["slots",(_clanHash get "slots") + 1];
	missionNamespace setVariable [format["ServerGroupsInfo_%1",_clanID],_clanHash];
	_clanID call RRPServer_groups_updateClients;
	format ["updateGroupSlots:%1:%2",_clanHash get "slots",_clanID] call RRPServer_DB_fireAndForget;
	["SuccessTitleAndText",["Организация","Слот успешно добавлен!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner _player];
	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name _player,getPlayerUID _player,"upgradeGroupSlot",_cost,format ["Апгрейд орг. %1",_clanHash get "name"]] call RRPServer_DB_lk_fireAndForget;
	//-- TODO: Logs
}catch{
	["ErrorTitleAndText",["Организация",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner _player];
};
true
