
private["_sessionID", "_playerObject"];
_sessionID = _this select 0;
_playerObject = _sessionID call RRPServer_session_getPlayerObject;
format ["Russian Roulette: %1 has fired a dry shot.", name _playerObject] call RRPServer_util_debugConsole;
call RRPServer_russianRoulette_letNextPlayerFire;
