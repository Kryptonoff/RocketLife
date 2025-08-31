/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_sessionID", "_parameters", "_netID", "_player"];
_sessionID = _this select 0;
_parameters = _this select 1;
_netID = _parameters select 0;
_player = objectFromNetId _netID;
if (isNull _player) then 
{
	"Cannot update session for unknown network ID!" call RRPServerNetwork_util_log;
}
else 
{
	[_sessionID, _player] call RRPServer_session_update;
};
true