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
	"RRPHC_anomaly_create",
	"RRPHC_anomaly_delete",
	"RRPHC_anomaly_getList",
	"RRPHC_anomaly_init",
	"RRPHC_anomaly_vibros"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPHC_Zone\code\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPHC_Zone\code\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

true
