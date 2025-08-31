/*
	Project: Aurora Role Play
	Author: FairyTale#5571
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
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Fed\code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Fed\code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

[
	"RRPClient_fed_returnAward",
	"RRPClient_fed_hackNotebook",
	"RRPClient_fed_lockBox",
	"RRPClient_fed_unlockBox",
	"RRPClient_fed_unlockDome",
	"RRPClient_fed_unlockOffice"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Fed\code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Fed\code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};
true