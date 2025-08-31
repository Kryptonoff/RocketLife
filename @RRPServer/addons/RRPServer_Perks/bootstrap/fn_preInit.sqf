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
	"RRPServer_perks_updateStats",
	"RRPServer_perks_buyXP"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Perks\code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Perks\code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

[
	"RRPClient_perks_buyXp",
	"RRPClient_perks_buyXpDone",
	"RRPClient_perks_update",
	"RRPClient_perks_addXP",
	"RRPClient_perks_canPrestige",
	"RRPClient_perks_getMaxLevel",
	"RRPClient_perks_getRequiredXP",
	"RRPClient_perks_prestige",
	"RRPClient_perks_activatePerk",
	"RRPClient_perks_addPerkXP",
	"RRPClient_perks_getPerkBonus",
	"RRPClient_perks_getPerkLevel",
	"RRPClient_perks_getPerkLimit",
	"RRPClient_perks_getPerkRequirement",
	"RRPClient_perks_hasPerk",
	"RRPClient_perks_initPerks",
	"RRPClient_perks_togglePerk",
	"RRPClient_tablet_app_perksUp_onOpen",
	"RRPClient_perks_initClient"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Perks\code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Perks\code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};
true