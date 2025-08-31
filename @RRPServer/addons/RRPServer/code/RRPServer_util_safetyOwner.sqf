/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	['_owner',-10,[0]],
	['_name','',['']]
];
if (_owner isEqualTo 0) exitWith {format ["Error Owner Safety - %1 - Exec on -1",_name] call RRPServer_util_debugConsole;-1};
[-1,_owner] select (_owner > 2)