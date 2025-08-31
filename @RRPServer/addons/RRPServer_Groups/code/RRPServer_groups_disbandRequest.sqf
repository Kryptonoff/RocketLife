private _sessionID = _this select 0;
private _parameters = _this select 1;
private _player = _sessionID call RRPServer_session_getPlayerObject;

try{
	if (isNull _player) throw "404";
	_groupID = _player getVariable ["GroupID",-1];
	if (_groupID isEqualTo -1) throw "Вы не состоите в организации";
	_groupHash = missionNamespace getVariable [format["ServerGroupsInfo_%1",_groupID],createHashMap];
	if (count _groupHash isEqualTo 0) throw "Организация не найдена";
	private _var = _groupHash get "premialVar";
	if (_var isNotEqualTo "none") throw "Нельзя расформировать официальную организацию";
	_name = _groupHash get "name";
	_members = _groupHash get "members";
	{
		_x params ["_uid","",""];
		_unit = _uid call RRPClient_util_objectFromPlayerUID;
		if (isNull _unit) then {continue};
		_unit setVariable ["GroupID",-1];
		_unit setVariable ["GroupData",nil];

		[_name] remoteExecCall ["RRPClient_groups_disbandResponse",_unit];
	} forEach _members;
	

	format ["disbandGroup:%1",_groupID] call RRPServer_DB_fireAndForget;
	missionNamespace setVariable [format["ServerGroupsInfo_%1",_groupID], nil];

}catch{
	["Организация", _exception] remoteExecCall ["toastError",_player];
};
true