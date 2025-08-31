
private _playerObject = _this;
format ["Russian Roulette: %1 died!", name _playerObject] call RRPServer_util_debugConsole;
_playerObject setVariable ["CurrentPlayer",nil,true];
{
	if (_x isEqualTo _playerObject) exitWith
	{
		RRPServerRussianRouletteDiedPlayers pushBack (name _playerObject);	
		RRPServerRussianRouletteAlivePlayers deleteAt _forEachIndex;
	};
}
forEach RRPServerRussianRouletteAlivePlayers;
if ((count RRPServerRussianRouletteAlivePlayers) isEqualTo 1) then 
{
	(RRPServerRussianRouletteAlivePlayers select 0) call RRPServer_russianRoulette_event_onPlayerWin;
}
else 
{
	call RRPServer_russianRoulette_letNextPlayerFire;
};
