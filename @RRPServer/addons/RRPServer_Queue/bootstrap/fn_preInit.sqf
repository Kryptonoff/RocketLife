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
	"RRPServer_playerSaveQueue_addPlayer",
	"RRPServer_playerSaveQueue_playerUpdate",
	"RRPServer_playerSaveQueue_savePlayer",
	"RRPServer_vehicleSaveQueue_addVehicle",
	"RRPServer_vehicleSaveQueue_removeVehicle",
	"RRPServer_vehicleSaveQueue_saveVehicle",
	"RRPServer_vehicleSaveQueue_thread_saveVehicles"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Queue\code\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Queue\code\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

true
