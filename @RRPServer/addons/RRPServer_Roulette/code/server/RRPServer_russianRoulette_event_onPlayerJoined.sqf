
private["_playerObject", "_bet", "_chairIndex", "_chairInfo", "_chair", "_probabilities"];
_playerObject = _this select 0;
_bet = _this select 1;
[_playerObject, "atm", "take", _bet] call RRPServer_system_moneyChange;
RRPServerRussianRoulettePotValue = RRPServerRussianRoulettePotValue + _bet;
_chairIndex = count RRPServerRussianRoulettePlayers;
_chairInfo = RRPClientRouletteChairPositions select _chairIndex;
_chair = RRPClientRouletteChairs select _chairIndex;
_chair setVectorDirAndUp (_chairInfo select 1);
_chair setPosWorld (_chairInfo select 0);
_chair disableCollisionWith _playerObject;
_chair setOwner (owner _playerObject); 
_probabilities = [false, false, false, false, false, true] call BIS_fnc_arrayShuffle;
_playerObject setVariable ["SavedRussianRoulettePosition", getPosASL _playerObject];
_playerObject setVariable ["SavedRussianRouletteDirection", getDir _playerObject];
_playerObject setVariable ["IsPlayingRussianRoulette", true];
_playerObject setVariable ["RussianRouletteProbabilities", _probabilities];
_playerObject setVariable ["RussianRouletteCurrentShot", -1];
_playerObject setVariable ["PlayerBet",_bet];

RRPServerRussianRoulettePlayers pushBack [netId _playerObject, name _playerObject];
RRPServerRussianRouletteAlivePlayers pushBack _playerObject;
[netID _chair] remoteExecCall ["RRPClient_russianRoulette_joinRussianRouletteResponse",_playerObject];

format ["Russian Roulette: %1 joined the game.", name _playerObject] call RRPServer_util_debugConsole;
switch (count RRPServerRussianRoulettePlayers) do 
{	
	case 2:
	{
		RRPServerRussianRouletteCountDownEndTime = serverTime + (getNumber(getMissionConfig "CfgRussianRoulette" >> "timeToStart"));
		["InfoTitleAndText",["Русская рулетка!","Раунд начинается через 2 минуты!"]] remoteExecCall ["toast",-2];
		"Russian Roulette: Game starts in two minutes." call RRPServer_util_debugConsole;
		RRPServerRussianRouletteStartGameCountDownThread = [] spawn 
		{
			while {serverTime < RRPServerRussianRouletteCountDownEndTime} do 
			{
				uiSleep 1;
			};
			call RRPServer_russianRoulette_startGame;
		};
		call RRPServer_russianRoulette_broadcastGameStatus;
	};
	case 6:
	{
		if !(isNil "RRPServerRussianRouletteStartGameCountDownThread") then 
		{
			terminate RRPServerRussianRouletteStartGameCountDownThread;
			RRPServerRussianRouletteStartGameCountDownThread = nil;
		};
		call RRPServer_russianRoulette_startGame; 
	};
	default 
	{
		call RRPServer_russianRoulette_broadcastGameStatus;
	};
};
