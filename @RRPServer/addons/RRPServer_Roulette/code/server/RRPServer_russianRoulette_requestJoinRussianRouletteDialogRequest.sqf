
private["_sessionID", "_buyInAmount"];


_sessionID = _this select 0;
_playerObject = _sessionID call RRPServer_session_getPlayerObject;
str _playerObject call RRPServer_util_debugConsole;
_buyInAmount = getNumber (missionConfigFile >> "CfgRussianRoulette" >> "buyIn");
if (serverTime > 1000000) then 
{
	[2, _buyInAmount] remoteExecCall ["RRPClient_russianRoulette_requestJoinRussianRouletteDialogResponse",_playerObject];
}
else 
{
	[RRPServerRussianRouletteStatus, _buyInAmount] remoteExecCall ["RRPClient_russianRoulette_requestJoinRussianRouletteDialogResponse",_playerObject];	
};