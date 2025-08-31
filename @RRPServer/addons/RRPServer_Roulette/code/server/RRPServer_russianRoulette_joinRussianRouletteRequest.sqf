
private["_sessionID", "_playerObject", "_buyInAmount", "_playerMoney"];
_sessionID = _this select 0;
_bet = _this select 1;
_playerObject = _sessionID call RRPServer_session_getPlayerObject;
try
{
	if (isNull _playerObject) throw "404";
	if !(alive _playerObject) throw "Вы мертвы";
	if !(isNull (objectParent _playerObject)) throw "Покиньте транспорта";
	if ((_playerObject getVariable ["lifeState",""]) isNotEqualTo "HEALTHY") throw "Вы не в состоянии играть";
	if (RRPServerRussianRouletteStatus isNotEqualTo 0) throw "Игра уже идет!";
	
	[_playerObject,_bet] call RRPServer_russianRoulette_event_onPlayerJoined;
}
catch
{
	["ErrorTitleAndText",["Русская рулетка",_exception]] remoteExecCall ["toast",_playerObject];
	_exception call RRPServer_util_debugConsole;
};
