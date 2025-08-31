/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_parameters", "_netId", "_player", "_existingSessionID", "_sessionId"];
_parameters = _this select 1;
_netId = _parameters select 0;
try 
{
	_player = objectFromNetId _netId;
	if (isNull _player) then 
	{
		throw "Cannot start session for unknown network ID!";
	};
	_existingSessionID = _player getVariable ["SessionID",-1];
	if !(_existingSessionID isEqualTo -1) then 
	{
		throw "Trying to get a second session ID!";
	};
	_sessionId = _player call RRPServer_session_begin;
	[_sessionId, "startSessionResponse", [_sessionId]] call RRPServer_system_sendTo;
}
catch
{
	_exception call RRPServerNetwork_util_log;
};
true