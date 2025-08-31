
params [
	["_net","1:1",[""]]
];
str _this call RRPServer_util_debugConsole;
_player = objectFromNetId _net;
if (isNull _player) exitWith {"Player undefined" call RRPServer_util_debugConsole;};
private _uid = getPlayerUID _player;
"Ok TG" call RRPServer_util_debugConsole;

private _msgData = format["selectMessageData:%1",_uid] call RRPServer_DB_selectSingle; 
format ["Message array: %1",_msgData] call RRPServer_util_debugConsole;

if (isNil "_msgData") exitWith {
	[] remoteExecCall ["RRPClient_tg_initialize",_player];
};
_msgData remoteExecCall ["RRPClient_tg_initialize",_player];


true
