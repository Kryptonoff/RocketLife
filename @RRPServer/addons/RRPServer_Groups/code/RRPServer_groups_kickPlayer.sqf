/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_sessionID","_parameters","_playerSel","_player","_clanID","_clanHash","_members","_index","_findInDeps","_deputys"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_parameters params ["_uidSel"];
	_playerSel = _uidSel call RRPClient_util_objectFromPlayerUID;
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует!";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	if ((_clanHash get "leader") isEqualTo _uidSel) throw "Для начала вы должны передать права на организацию!";
	_deputys = _clanHash getOrDefault ["deputys",[]];
	_members = _clanHash getOrDefault ["members",[]];
	_index = [_members,_uidSel] call RRPClient_util_find;
	
	if (_index isEqualTo -1) throw "Не нашли кого выгнать!";
	_members deleteAt _index;
	_findInDeps = _deputys find _uidSel;
	if !(_findInDeps isEqualTo -1) then {_deputys deleteAt _findInDeps};
	format["kickPlayerGroupLink:%1",_uidSel] call RRPServer_DB_fireAndForget;
	_playerSel setVariable ["GroupID",nil,true];
	_playerSel setVariable ["GroupData",nil];
	missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
	if !(isNull _playerSel) then {
		if ((_clanHash get "side") in ["cop","med"]) then {[_playerSel,"civ"] call RRPServer_system_setPlayerSide};
		[_playerSel,"kickMePlz",[]] call RRPServer_system_sendTo;
	}else{
		if ((_clanHash get "side") in ["cop","med"]) then {format ["updateSide:%1:%2","civ",_uidSel] call RRPServer_DB_fireAndForget};
	};
	[_clanID,"kick",getPlayerUID _player,format ["%1 выгнал %2",_player call getFullName,((_members select _index) select 1)]] call RRPServer_groups_log;
	
	["SuccessTitleOnly", ["Вы выгнали игрока с организации!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	_clanID call RRPServer_groups_updateClients;
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
