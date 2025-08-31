diag_log "RRPServer_Network - fn_preInit";
private ["_code", "_function", "_file"];
_path = "\RRPServer_Network\code";
[
	["RRPClient_system_dispatchIncomingMessage",true],
	["RRPClient_system_send",true],
	["RRPServerNetwork_util_log"],
	["RRPServer_session_begin"],
	["RRPServer_session_createId"],
	["RRPServer_session_end"],
	["RRPServer_session_getPlayerObject"],
	["RRPServer_session_isRegisteredId"],
	["RRPServer_session_startSessionRequest"],
	["RRPServer_session_update"],
	["RRPServer_system_dispatchIncomingMessage"],
	["RRPServer_system_sendTo"],
	["RRPServer_session_updateSessionRequest"],
	["RRPServer_system_send_broadcast"]
]apply{
	_x params["_function",["_broadcast",false,[false]]];
	missionNamespace setVariable[_function, compileFinal preprocessFileLineNumbers format["%1\%2.sqf",_path,_function], _broadcast];
};
true