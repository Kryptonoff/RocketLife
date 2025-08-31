/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_sessionId", "_player"];
_sessionId = _this select 0;
_player = _this select 1;
_player setVariable ["SessionID", _sessionId];
missionNamespace setVariable [format["SessionPlayerObject%1", _sessionId], _player];