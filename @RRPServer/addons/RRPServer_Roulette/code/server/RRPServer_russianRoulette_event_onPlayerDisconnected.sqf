
private["_playerObject"];
format ["Russian Roulette: %1 disconnected while playing!", name _this] call RRPServer_util_debugConsole;
format ["Russian Roulette: Ending game..."] call RRPServer_util_debugConsole;
{
	_playerObject = objectFromNetid (_x select 0);
	if !(isNull _playerObject) then 
	{
		_playerObject call RRPServer_russianRoulette_event_onPlayerLeft;
	};
}
forEach RRPServerRussianRoulettePlayers;
call RRPServer_russianRoulette_initialize;
