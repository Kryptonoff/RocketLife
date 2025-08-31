/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";
[
	"RRPServer_resource_capture_capturePay",
	"RRPServer_resource_capture_endBattle",
	"RRPServer_resource_capture_initBattle",
	"RRPServer_resource_capture_initCaptures",
	"RRPServer_resource_capture_loadEnabledCaptures",
	"RRPServer_resource_capture_manageApplicants"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_ResourceCapture\code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_ResourceCapture\code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

[
	"RRPClient_resource_capture_Info",
	"RRPClient_resource_capture_Manage",
	"RRPClient_resource_capture_Menu",
	"RRPClient_resource_capture"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_ResourceCapture\code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_ResourceCapture\code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};

true
