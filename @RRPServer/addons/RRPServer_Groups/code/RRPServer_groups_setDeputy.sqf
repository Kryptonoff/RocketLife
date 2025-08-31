/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_sessionID","_parameters","_player","_clanID","_clanHash","_members","_deputys"];
private _sessionID = _this select 0;
private _parameters = _this select 1;
try
{
  _parameters params ["_uid","_invite"];
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует!";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	if !((_clanHash get "deputys") isEqualTo (getPlayerUID _player)) throw "Вы не можете назначать замов!";
	_deputys = format ["getDeputys:%1",_clanID] call RRPServer_DB_selectSingleField;
	_members = _clanHash get "members";
	_index = [_members,_uid] call RRPClient_util_find;
	
	if (_invite) then
	{
		if (count _deputys > 2) throw "Заместителей может быть не более 3х человек!";
		[_clanID,"rank",getPlayerUID _player,format ["%1 назначил заместителем %2",_player call getFullName,(_members select _index) select 1]] call RRPServer_groups_log;
		_deputys pushBackUnique _uid;
	}else{
		[_clanID,"rank",getPlayerUID _player,format ["%1 убрал с заместителя %2",_player call getFullName,(_members select _index) select 1]] call RRPServer_groups_log;
		_deputys deleteAt (_deputys find _uid);
	};
	_clanHash set ["deputys",_deputys];
	format["updateDeputy:%1:%2",_deputys,_clanID] call RRPServer_DB_fireAndForget;
	missionNameSpace setVariable [format ["ServerGroupsInfo_%1",_clanID],_clanHash];
	["SuccessTitleAndText", ["Организация","Назначен новый заместитель!"]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	_clanID call RRPServer_groups_updateClients;
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
true