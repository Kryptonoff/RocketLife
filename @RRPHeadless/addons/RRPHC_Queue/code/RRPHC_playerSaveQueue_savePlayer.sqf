/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private "_playerObject";
if !(RRPServerPlayerSaveQueue isEqualTo []) then
{
	{
		_playerObject = _x;
		if (!isNull _playerObject) then
		{
			[_playerObject] call RRPHC_playerSaveQueue_playerUpdate;
		};
	} 
	forEach RRPServerPlayerSaveQueue;
	RRPServerPlayerSaveQueue = [];
};
true
