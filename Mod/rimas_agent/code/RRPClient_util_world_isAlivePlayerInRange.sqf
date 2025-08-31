/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_position", "_range", "_hasPlayersInRange"];
_position = _this select 0;
_range = _this select 1;
_hasPlayersInRange = false;
{
	if (alive _x && {(_x distance2D _position) <= _range}) exitWith
	{
		_hasPlayersInRange = true;
	};
}
forEach allPlayers;
_hasPlayersInRange