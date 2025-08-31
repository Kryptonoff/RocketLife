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
	"RRPServer_containers_gang_delete",
	"RRPServer_containers_gang_setTexture",
	"RRPServer_containers_gang_loading",
	"RRPServer_containers_gang_manage",
	"RRPServer_containers_gang_openMenu",
	"RRPServer_containers_gang_store",
	"RRPServer_containers_gang_take",
	"RRPServer_containers_gang_upgrade",
	"RRPServer_containers_gang_UpdateDB"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Containers\code\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Containers\code\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};
