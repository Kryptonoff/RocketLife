/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_player",objNull],
	["_side","civ"]
];

_player setVariable ["RRPSide",_side,true];
format ["updateSide:%1:%2",_side,getPlayerUID _player] call RRPServer_DB_fireAndForget;
true
