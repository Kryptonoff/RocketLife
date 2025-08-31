/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

format ["DeletePlayerData %1",_this] call RRPHC_util_debugConsole;
private _uid = _this;
if (isNil "_uid") exitWith {format ["Error delete player!"] call RRPHC_util_log};
format ["deletePlayerData:%1",_uid] call RRPHC_DB_fireAndForget;

true
