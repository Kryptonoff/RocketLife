/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_alphabet", "_generateNewSessionId", "_sessionId", "_i"];
_alphabet = "zyxwvutsrqponmlkjihgfedcba";
_generateNewSessionId = true;
_sessionId = "";
while {_generateNewSessionId} do
{
	_sessionId = "";
	for "_i" from 1 to 8 do 
	{
		_sessionId = _sessionId + (_alphabet select [floor (random 25), 1]);
	};
	if !(_sessionId call RRPServer_session_isRegisteredId) then
	{
		_generateNewSessionId = false;
	};
};
_sessionId