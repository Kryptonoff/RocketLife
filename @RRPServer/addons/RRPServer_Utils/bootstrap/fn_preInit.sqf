/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

[
	"RRPServer_util_logDB",
	"RRPServer_util_get_RE_player"
]apply{
	missionNamespace setVariable [_x,compile preprocessFileLineNumbers (format ["\RRPServer_Utils\code\%1.sqf",_x])];
};


true
