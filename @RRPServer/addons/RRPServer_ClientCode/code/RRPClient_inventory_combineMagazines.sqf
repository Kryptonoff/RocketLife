/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _equippedMagazines = magazines player;
private _repackedMagazines = [];
{
	if !(_x in _repackedMagazines) then
	{
		[player, _x, 0] call RRPClient_util_repackMagazines;
		_repackedMagazines pushBack _x;
	};
}
forEach _equippedMagazines;
true