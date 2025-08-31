/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _player = objectFromNetId _this;
private _id = getPlayerUID _player;
private _trunk = _player getVariable ["plrTrunk",[]];
format ["updateTrunkPlayer:%1:%2",_trunk,_id] call RRPHC_DB_fireAndForget;