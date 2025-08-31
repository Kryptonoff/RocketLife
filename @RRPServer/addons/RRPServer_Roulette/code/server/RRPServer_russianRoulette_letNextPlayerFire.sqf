
private["_playerObject", "_currentShot", "_probabilities", "_nextShotIsFatal"];
_playerObject = RRPServerRussianRouletteAlivePlayers select 0;
RRPServerRussianRouletteAlivePlayers deleteAt 0;
RRPServerRussianRouletteAlivePlayers pushBack _playerObject;
{_x setVariable ["CurrentPlayer",nil,true]} forEach RRPServerRussianRouletteAlivePlayers;
format ["Russian Roulette: %1 is asked to fire next.", name _playerObject] call RRPServer_util_debugConsole;
RRPServerRussianRouletteCountDownEndTime = serverTime + getNumber(getMissionConfig "CfgRussianRoulette" >> "timeBetwenToShot");
RRPServerRussianRouletteCurrentPlayerNetId = netId _playerObject;
RRPServerRussianRouletteCurrentShot = RRPServerRussianRouletteCurrentShot + 1;
_currentShot = _playerObject getVariable ["RussianRouletteCurrentShot", -1];
_currentShot = _currentShot + 1;
_playerObject setVariable ["RussianRouletteCurrentShot", _currentShot];
_probabilities = _playerObject getVariable ["RussianRouletteProbabilities", [true, true, true, true, true, true]];
_nextShotIsFatal = _probabilities select _currentShot;
_playerObject setVariable ["CurrentPlayer",true,true];
call RRPServer_russianRoulette_broadcastGameStatus;
[_nextShotIsFatal] remoteExecCall ["RRPClient_russianRoulette_fireRussianRouletteRevolverRequest",_playerObject];
