/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_sessionID", "_parameters", "_hunger", "_thirst", "_alcohol", "_temperature", "_wetness", "_player"];
_player = _this select 0;
if (!isNull _player) then
{
	if !(_player in RRPServerPlayerSaveQueue) then
	{
		RRPServerPlayerSaveQueue pushBack _player;
	};
};
true