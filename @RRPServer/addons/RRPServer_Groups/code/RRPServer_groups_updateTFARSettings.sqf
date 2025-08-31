/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_clanHash","_members","_sessionID", "_parameters", "_player", "_clanID", "_clanHash"];
_sessionID = _this select 0;
_parameters = _this select 1;
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует! :)";
	_clanID = _player getVariable ["GroupID",-1];
	if (_clanID isEqualTo -1) throw "Вы не в организации!";
	if !(_clanID call RRPClient_groups_isPayed) throw "У вас не оплачена аренда, оплатить можно в личном кабинете lk.rocket-rp.fun";
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_clanID],createHashMap];
	if (count _clanHash isEqualTo 0) throw "Данные организации повреждены!";
	private _tfar = _parameters select 0;
	private _dv = parseNumber(_tfar select 0);
	private _kv = parseNumber(_tfar select 1);
	_clanHash set ["tfar",[_dv,_kv]];
	missionNameSpace setVariable [format["ServerGroupsInfo_%1",_clanID],_clanHash];
	if !(count _clanHash isEqualTo 0)then
	{
		_members = _clanHash call RRPClient_groups_getMembers;
		if !(_members isEqualTo []) then
		{
			{
				if !(isNull _x) then
				{
				[_x,"updateTFARResponse",[_player call getFullName,[_dv,_kv]]] call RRPServer_system_sendTo;
				};
			}
			forEach _members;
		};
	};
	format ["updateTfarSettings:%1:%2",[_dv,_kv],_clanID] call RRPServer_DB_fireAndForget;
	[_clanID,"radio",getPlayerUID _player,format ["%1 обновил частоты: КВ: %1 ДВ: %2",_player call getFullName,_kv,_dv]] call RRPServer_groups_log;
	
	//-- TODO: Logs
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Ошибка обновления частот!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
