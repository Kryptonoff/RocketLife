
private["_sessionID", "_parameters", "_playerObject"];
_sessionID = _this select 0;
_playerObject = _sessionID call RRPServer_session_getPlayerObject;
try
{
	if (isNull _playerObject) throw "404";
	if !(_playerObject getVariable ["IsPlayingRussianRoulette", false]) throw "Вы и так не играете";
	if ((count RRPServerRussianRoulettePlayers) > 1) throw "Уже обратной дороги нет...";
	_playerObject call RRPServer_russianRoulette_event_onPlayerLeft;
	call RRPServer_russianRoulette_initialize;
}
catch
{
	["ErrorTitleAndText",["Русская рулетка",_exception]] remoteExecCall ["toast",_playerObject];
	_exception call RRPServer_util_debugConsole;
};
