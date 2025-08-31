/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_sessionId"];
_sessionId = call RRPServer_session_createId;
SessionIDs pushBack _sessionId;
[_sessionId, _this] call RRPServer_session_update;
format ["Starting session for '%1' with ID '%2'...", name _this, _sessionId] call RRPServerNetwork_util_log;
_sessionId