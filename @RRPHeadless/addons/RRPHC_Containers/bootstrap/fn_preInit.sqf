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
[
	"RRPHC_containers_gang_delete",
	"RRPHC_containers_gang_setTexture",
	"RRPHC_containers_gang_loading",
	"RRPHC_containers_gang_manage",
	"RRPHC_containers_gang_openMenu",
	"RRPHC_containers_gang_store",
	"RRPHC_containers_gang_take",
	"RRPHC_containers_gang_upgrade",
	"RRPHC_containers_gang_UpdateDB"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPHC_Containers\code\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPHC_Containers\code\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};
