/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_selected","_player","_clanID","_clanHash","_clanIdSelected","_slotsAvailable","_membersCount"];
params ["_sessionID","_parameters"];
_parameters params [["_selectedID","",[""]]];
try
{
  if (_selectedID isEqualTo "") throw "NetID игрока пустой!";
  _selected = objectFromNetId _selectedID;
  if (isNull _selected) throw "Выбранный игрок Null";
  _player = _sessionID call RRPServer_session_getPlayerObject;
  if (isNull _player) throw "Вы Null";
  _clanID = _player getVariable ["GroupID",-1];
  if (_clanID isEqualTo -1) throw "Вы не в организации!";
	if !(_clanID call RRPClient_groups_isPayed) throw "У вас не оплачена аренда, оплатить можно в личном кабинете lk.rocket-rp.fun";
  _clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
  if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
  _clanIdSelected = _selected getVariable ["GroupID",-1];
  if !(_clanIdSelected isEqualTo -1) throw "Выбранный игрок уже состоит в другой организации!";
  if (_selected getVariable ["GroupInvitePending",false]) throw "Выбранный игрок уже получил приглашение!";
  _slotsAvailable = _clanHash getOrDefault ["slots",8];
  _membersCount = count (_clanHash getOrDefault ["members",[]]);
  if (_membersCount >= _slotsAvailable) throw "У вас не осталось свободных слотов!";

  if ((_selected call getSide isEqualTo "reb") and {(RRPClientGroupInfo get "side") in ["cop","med"]}) throw "У него нет паспорта! Возможно, он его сжег...";
  if ((_selected call getSide) isEqualTo (RRPClientGroupInfo get "side") and {!((RRPClientGroupInfo get "side") in ["cop","med"])}) throw "Фракция не соответствует вашей организации";

  _selected setVariable ["GroupInvitePending",true];
  _selected setVariable ["GroupInviteID",_clanID];
  _selected setVariable ["GroupInviteOwner",_player];
  [_selected,"inviteMe",[_player call getNickName,_clanHash get "name"]] call RRPServer_system_sendTo;
  ["ErrorTitleAndText", ["Организация", "Приглашение было отправлено!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
}catch{
  ["ErrorTitleAndText", ["Организация", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
