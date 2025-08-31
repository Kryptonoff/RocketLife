/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_code", "_function", "_file"];
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";

[
	"RRPServer_don_query"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_DoN\code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_DoN\code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

[
	"RRPClient_don_add",
	"RRPClient_don_cashout",
	"RRPClient_don_init",
	"RRPClient_don_main",
	"RRPClient_don_update"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_DoN\code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_DoN\code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};
true