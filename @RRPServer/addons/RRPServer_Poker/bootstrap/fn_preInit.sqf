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

private _path = "\RRPServer_Poker\";

//-- Server
[
	"RRPServer_poker_end",
	"RRPServer_poker_getnextplayer",
	"RRPServer_poker_getplayers",
	"RRPServer_poker_getscore",
	"RRPServer_poker_getwinner",
	"RRPServer_poker_handlemoves",
	"RRPServer_poker_handlestack",
	"RRPServer_poker_init",
	"RRPServer_poker_log",
	"RRPServer_poker_main",
	"RRPServer_poker_spawntable"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

//-- Client
[
	"RRPClient_actions_chairSiting",
	"RRPClient_actions_chairSitingUp",
	"RRPClient_poker_joinTable",
	"RRPClient_poker_leaveTable",
	"RRPClient_poker_makeMove",
	"RRPClient_poker_requestMove",
	"RRPClient_poker_showMove",
	"RRPClient_poker_showStack",
	"RRPClient_poker_showTable"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};

true
