
private["_playerInfo", "_player", "_currentShot"];
_playerInfo = [];
{
	_player = objectFromNetid (_x select 0);
	_currentShot = 0;
	if !(isNull _player) then 
	{
		_currentShot = (_player getVariable ["RussianRouletteCurrentShot", 0]) + 1;
	};
	_playerInfo pushBack
	[
		_x select 0,
		_x select 1,
		_currentShot
	];
}
forEach RRPServerRussianRoulettePlayers;

RRPClientRouletteTable setVariable ["GameStat",[RRPServerRussianRouletteStatus,RRPServerRussianRoulettePotValue,RRPServerRussianRouletteCurrentShot],true];

{
	[
		RRPServerRussianRouletteStatus,
		RRPServerRussianRoulettePotValue, 
		_playerInfo,
		RRPServerRussianRouletteCurrentPlayerNetId,
		RRPServerRussianRouletteCurrentShot,
		RRPServerRussianRouletteCountDownEndTime
	] remoteExecCall ["RRPClient_russianRoulette_updateRussianRouletteGameStatusRequest",_x]
}
forEach RRPServerRussianRouletteAlivePlayers;
