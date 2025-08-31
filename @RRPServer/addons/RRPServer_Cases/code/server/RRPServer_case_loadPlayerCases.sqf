
private _player = param [0,objNull];
try{
	_response = format["loadOwnedCases:%1",getPlayerUID _player] call RRPServer_DB_selectFull;
	if (_response isEqualTo []) throw "Нет доступных кейсов";
	["success",_response] remoteExecCall ["RRPClient_tablet_app_caseStore_fieldCases",_player];
}catch{
	["error",_exception] remoteExecCall ["RRPClient_tablet_app_caseStore_fieldCases",_player];
};
true
