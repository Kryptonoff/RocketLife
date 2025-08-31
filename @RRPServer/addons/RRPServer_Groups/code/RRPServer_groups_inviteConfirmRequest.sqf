/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
private["_sessionID", "_accepted", "_player", "_clanID", "_invitedClanID", "_inviteOwner", "_clanHash", "_members","_slotsAvailable","_membersCount"];
_sessionID = _this select 0;
_accepted = (_this select 1) select 0;
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Чет Вы не Вы!";
	_clanID = _player getVariable ["GroupID",-1];
	if !(_clanID isEqualTo -1) throw "Вы уже находитесь в организации!";
	if !(_player getVariable ["GroupInvitePending",false]) throw "Нет никаких приглашений для Вас!";
	_invitedClanID = _player getVariable ["GroupInviteID",-1];
	if (_invitedClanID isEqualTo -1) throw "С приглашением что-то не так...";
	_inviteOwner = _player getVariable ["GroupInviteOwner",objNull];
	_clanHash = missionNameSpace getVariable [format["ServerGroupsInfo_%1",_invitedClanID],createHashMap];
	_slotsAvailable = _clanHash getOrDefault ["slots",8];
	_membersCount = count (_clanHash getOrDefault ["members",[]]);
	if ( _membersCount >= _slotsAvailable ) throw "В организации не осталось свободных слотов!";
	if ((_player call getSide isEqualTo "reb") and {(_clanHash getOrDefault ["side","civ"]) in ["cop","med"]}) throw "Для поступления на гос.службу у вас должен быть паспорт!";
	if (!((_player call getSide) isEqualTo (_clanHash getOrDefault ["side","civ"])) and {!((_clanHash getOrDefault ["side","civ"]) in ["cop","med"])}) throw "Ваша фракция не соответствует требованиям этой организации!";

	if ( _accepted )then
	{
		if (count _clanHash isEqualTo 0) throw "Хэш пуст!";
		_members = _clanHash getOrDefault ["members",[]];
		_members pushback [getPlayerUID _player,_player call getFullName,1];
		_clanHash set ["members",_members];
		format["setPlayerGroupLink:%1:%2", _invitedClanID, getPlayerUID _player] call RRPServer_DB_fireAndForget;
		missionNameSpace setVariable [format["ServerGroupsInfo_%1",_invitedClanID],_clanHash];
		_player setVariable ["GroupID", _invitedClanID, true];
		_player setVariable ["GroupData", _clanHash];
		_invitedClanID call RRPServer_groups_updateClients;
		
		_player setVariable ["RRPSide",_clanHash get "side",true];
		format ["updateSide:%1:%2",_clanHash get "side",getPlayerUID _player] call RRPServer_DB_fireAndForget;
		[_invitedClanID,"invite",getPlayerUID _player,format ["%1 принял приглашение от %2",_player call getFullName,_inviteOwner call getFullName]] call RRPServer_groups_log;
		
		["InfoTitleOnly", [format ["%1 присоединился к Вашей организации!", _player call getFullName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_inviteOwner];
	}
	else
	{
		["InfoTitleOnly", [format ["%1 отклонил приглашение в организацию!", _player call getNickName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_inviteOwner];
	};
	_player setVariable ["GroupInvitePending",nil];
	_player setVariable ["GroupInviteID",nil];
	_player setVariable ["GroupInviteOwner",nil];
	[_sessionID,"inviteServerResponse",[_accepted]] call RRPServer_system_sendTo;
}
catch
{
	_exception call RRPServer_util_log;
	["ErrorTitleAndText", ["Организация!", _exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
