/*

	file: fn_cleanupMessages.sqf
	Author: Silex

	Description: Deletes all messages that belongs to the given id.
*/

private ["_player","_query"];
_player = _this;

if(isNull _player) exitWith {};

format ["cleanupMessages:%1",getPlayerUID _player] call RRPServer_DB_fireAndForget;
