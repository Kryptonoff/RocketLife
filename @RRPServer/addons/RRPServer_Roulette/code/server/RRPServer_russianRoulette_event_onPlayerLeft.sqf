
private["_playerObject", "_buyInAmount", "_playerMoney", "_positionBefore", "_directionBefore"];
_playerObject = _this;
_bet = _playerObject getVariable ["PlayerBet",0];
[_playerObject, "atm", "add", _bet] call RRPServer_system_moneyChange; 

_positionBefore = _playerObject getVariable ["SavedRussianRoulettePosition", [0, 0, 0]];
_directionBefore = _playerObject getVariable ["SavedRussianRouletteDirection", 0];
_playerObject setVariable ["IsPlayingRussianRoulette", nil];
_playerObject setVariable ["SavedRussianRoulettePosition", nil];
_playerObject setVariable ["SavedRussianRouletteDirection", nil];
_playerObject setVariable ["RussianRouletteProbabilities", nil];
_playerObject setVariable ["RussianRouletteCurrentShot", nil];
_playerObject setVariable ["CurrentPlayer",nil,true];
format ["Russian Roulette: %1 has left the game.", name _playerObject] call RRPServer_util_debugConsole;
if (alive _playerObject) then 
{
	format ["Russian Roulette: %1 has left the game.", name _playerObject] call RRPServer_util_debugConsole;

	[_positionBefore, _directionBefore] remoteExecCall ["RRPClient_russianRoulette_leaveRussianRouletteResponse",_playerObject];
};
