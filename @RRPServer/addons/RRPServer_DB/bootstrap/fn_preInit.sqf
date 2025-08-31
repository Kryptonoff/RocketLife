/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";
private ["_code", "_function", "_file"];
[
	"RRPServer_DB_lk_fireAndForget",
	"RRPServer_DB_connectToextDB",
	"RRPServer_DB_createMessage",
	"RRPServer_DB_fireAndForget",
	"RRPServer_DB_grc",
	"RRPServer_DB_handleBig",
	"RRPServer_DB_insertSingle",
	"RRPServer_DB_reloadCustom",
	"RRPServer_DB_selectFull",
	"RRPServer_DB_selectRaw",
	"RRPServer_DB_selectSingle",
	"RRPServer_DB_selectSingleField"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_DB\code\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_DB\code\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};
"migrate" callExtension "migrate";
_is_dev call RRPServer_DB_connectToextDB;

true