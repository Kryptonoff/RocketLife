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

private _path = "\RRPServer_Cases\";

//-- Server
[
	"RRPServer_case_add",
	"RRPServer_case_giveWin",
	"RRPServer_case_requestOpenOwned",
	"RRPServer_case_loadAll",
	"RRPServer_case_loadPlayerCases"
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
	"RRPClient_cases_openCase",
	"RRPClient_cases_openSlide",
	"RRPClient_cases_wheel",
	"RRPClient_tablet_app_caseFaq_onOpen",
	"RRPClient_tablet_app_caseOpen_onOpen",
	"RRPClient_tablet_app_caseStore_fieldCases",
	"RRPClient_tablet_app_caseStore_fieldCasesStore",
	"RRPClient_tablet_app_caseStore_onOpen",
	"RRPClient_tablet_app_myCase_onOpen"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};

true
