/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

[
	"RRPServer_session_updatePlayTime",
	"RRPServer_session_updatePartial",
	"RRPServer_session_updateRequest",
	"RRPServer_session_deletePlayerData",
	"RRPServer_session_loadPlayer",
	"RRPServer_session_updateSettings",
	"RRPServer_session_updatePlrTrunk",
	"RRPServer_session_insertNewPlayer",
	"RRPServer_session_updateStats"
]apply{
	missionNamespace setVariable [_x,compile preprocessFileLineNumbers (format ["\RRPServer_Session\code\%1.sqf",_x])];
};

[
	"RRPClient_session_loadPlayer"
]apply{
	missionNamespace setVariable [_x,compile preprocessFileLineNumbers (format ["\RRPServer_Session\client\%1.sqf",_x]), true];
};

true
