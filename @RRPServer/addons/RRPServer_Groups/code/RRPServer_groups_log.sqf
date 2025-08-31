/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	"_groupId",
	"_type",
	"_uid",
	"_log"
];

format ["logsGroups:%1:%2:%3:%4",_groupId,_type,_uid,[_log] call RRPClient_util_stripChars] call RRPServer_DB_fireAndForget;
