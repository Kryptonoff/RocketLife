
private["_chair", "_deadBodies"];
RRPServerRussianRouletteStatus = 1;
_chair = RRPClientRouletteChairs select 0;
"Russian Roulette: Game starts!" call RRPServer_util_debugConsole;
["InfoTitleAndText",["Русская рулетка","Игра началась!"]] remoteExecCall ["toast",-2];
RRPServerRussianRouletteCurrentShot = 0;
RRPServerRussianRouletteAlivePlayers = RRPServerRussianRouletteAlivePlayers call BIS_fnc_arrayShuffle;
call RRPServer_russianRoulette_letNextPlayerFire;
RRPServerRussianRouletteStartGameCountDownThread = nil;
