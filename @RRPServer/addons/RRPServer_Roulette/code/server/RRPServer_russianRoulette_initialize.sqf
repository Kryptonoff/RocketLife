
private["_chair"];
if !(isNil "RRPServerRussianRouletteStartGameCountDownThread") then 
{
	terminate RRPServerRussianRouletteStartGameCountDownThread;
	RRPServerRussianRouletteStartGameCountDownThread = nil;
};
RRPServerRussianRouletteStatus = 0;
RRPServerRussianRoulettePlayers = [];
RRPServerRussianRouletteAlivePlayers = [];
RRPServerRussianRouletteDiedPlayers = [];
RRPServerRussianRouletteCurrentShot = -1;
RRPServerRussianRoulettePotValue = 0;
RRPServerRussianRouletteCountDownEndTime = -1;
RRPServerRussianRouletteCurrentPlayerNetId = "";
call RRPServer_russianRoulette_initServer;
if (isNil "RRPClientRouletteChairPositions") exitWith
{
	"There are no Russian Roulette chairs defined. Russian Roulette will not work!" call RRPServer_util_debugConsole;
	RRPServerRussianRouletteStatus = 1;
	RRPClientRouletteChairs = [];
	RRPClientRouletteChairPositions = [];
};
RRPClientRouletteTable setVariable ["GameStat",nil,true];
"Russian Roulette: Game initialized." call RRPServer_util_debugConsole;
