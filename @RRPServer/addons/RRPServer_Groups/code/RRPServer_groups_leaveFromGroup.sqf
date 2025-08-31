/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private ["_player","_groupID","_uid","_hash","_deputys","_members"];
params ["_sessionID","_parameters"];
try
{
	_player = _sessionID call RRPServer_session_getPlayerObject;
	if (isNull _player) throw "Вас не существует";
	_groupID = _player getVariable ["GroupID",-1];
	if (_groupID isEqualTo -1) throw "Вы не состоите ни в какой организации!";
	_uid = getPlayerUID _player;
	_hash = missionNamespace getVariable [format["ServerGroupsInfo_%1",_groupID],createHashMap];
	_deputys = _hash get "deputys";
	_members = _hash get "members";
	if (_uid in _deputys) then 
	{
		_index = _deputys find _uid;
		_deputys deleteAt _index;
	};
	_indexMembers = [_members,_uid] call RRPClient_util_find;
	_members deleteAt _indexMembers;
	missionNamespace setVariable [format["ServerGroupsInfo_%1",_groupID],_hash];
	format ["kickPlayerGroupLink:%1",_uid] call RRPServer_DB_fireAndForget;
	_player setVariable ["GroupID",nil, true];
	_player setVariable ["GroupData",nil];
	_groupID call RRPServer_groups_updateClients;
	if ((_hash get "side") in ["cop","med"]) then
	{
		[_player,"civ"] call RRPServer_system_setPlayerSide;
	};
	[_groupID,"kick",getPlayerUID _player,format ["%1 покинул организацию самостоятельно",_player call getFullName]] call RRPServer_groups_log;
	[format["Вы успешно покинули организацию %1!",_hash get "name"]] remoteExecCall ["RRPClient_groups_leaveResponse",owner _player];
	//-- TODO: Logs
}catch{
	["ErrorTitleAndText",["Организация",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",owner _player];
};
true
