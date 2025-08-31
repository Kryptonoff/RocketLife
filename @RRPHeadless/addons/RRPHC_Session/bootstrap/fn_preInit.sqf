/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

[
	"RRPHC_session_updatePlayTime",
	"RRPHC_session_updateRequest",
	"RRPHC_session_updatePartial",
	"RRPHC_session_deletePlayerData",
	"RRPHC_session_updatePlrTrunk",
	"RRPHC_session_updateSettings",
	"RRPHC_session_insertNewPlayer",
	"RRPHC_session_updateStats"
]apply{
	missionNamespace setVariable [_x,compile preprocessFileLineNumbers (format ["\RRPHC_Session\code\%1.sqf",_x])];
};

true
