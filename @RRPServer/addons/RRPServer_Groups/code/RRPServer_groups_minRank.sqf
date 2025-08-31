/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_sessionID","_parameters","_playerSel","_player","_clanID","_clanHash","_members","_index","_curLevel","_new"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
  _parameters params ["_uidSel"];
  _player = _sessionID call RRPServer_session_getPlayerObject;
  if (isNull _player) throw "Вас не существует!";
  _clanID = _player getVariable ["GroupID",-1];
  if (_clanID isEqualTo -1) throw "Вы не в организации!";
	if !(_clanID call RRPClient_groups_isPayed) throw "У вас не оплачена аренда, оплатить можно в личном кабинете lk.rocket-rp.fun";
  _clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
  if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
  _members = _clanHash getOrDefault ["members",[]];
  _index = [_members,_uidSel] call RRPClient_util_find;
  _curLevel = (_members select _index) select 2;
  _new = _curLevel - 1;
  if (1 > _new) throw "Выбранный член организации уже достиг минимального уровня!";
  (_members select _index) set [2,_new];
  format["updateRank:%1:%2",_new,_uidSel] call RRPServer_DB_fireAndForget;
  missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
  _playerSel = _uidSel call RRPClient_util_objectFromPlayerUID;
  if !(isNull _playerSel) then {[_playerSel,"updatePlayerRank",[_clanHash,_new,"понижены"]] call RRPServer_system_sendTo};
  ["SuccessTitleAndText", ["Организация","Выбраный член организации был понижен!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
  _clanID call RRPServer_groups_updateClients;
	[_clanID,"rank",getPlayerUID _player,format ["%1 понизил %2 до уровня %3",_player call getFullName,((_members select _index) select 1),_new]] call RRPServer_groups_log;

  //-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
