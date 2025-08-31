/*
	Project: Headless Client for Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

"start - fn_preInit" call RRPHC_util_log;
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";
[
	"RRPHC_skills_saveXP",
	"RRPHC_ach_save",
	"RRPHC_system_keyManagement",
	"RRPHC_system_logIt",
	"RRPHC_system_moneyChange",
	"RRPHC_DB_addBan",
	"RRPHC_DB_bool",
	"RRPHC_DB_connectToextDB",
	"RRPHC_DB_createMessage",
	"RRPHC_DB_debug",
	"RRPHC_DB_fireAndForget",
	"RRPHC_DB_handleBig",
	"RRPHC_DB_insertSingle",
	"RRPHC_DB_lk_fireAndForget",
	"RRPHC_DB_log",
	"RRPHC_DB_mresString",
	"RRPHC_DB_selectFull",
	"RRPHC_DB_selectSingle",
	"RRPHC_DB_selectSingleField",
	"RRPHC_DB_updatePartial",
	"RRPHC_DB_updateRequest",
	"RRPHC_doc_addDocuments",
	"RRPHC_doc_buyDocuments",
	"RRPHC_doc_deleteDocument",
	"RRPHC_doc_getDocuments",
	"RRPHC_msg_msgRequest",
	"RRPHC_util_tinyIntConverter",
	"RRPHC_util_logDB",
	"RRPHC_system_postInit",
	"RRPHC_system_preInit",
	"RRPHC_util_debug",
	"RRPHC_util_debugConsole",
	"RRPHC_util_get_RE_player",
	"RRPHC_util_log"
]apply{
	_function = _x;
	_code = if (_is_dev) then {
			compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPHC\code\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPHC\code\%1.sqf",_function])
		};
	missionNamespace setVariable [_function, _code];
};
RRPHC_DB_logItDb = compileFinal 'params ["_player","_log","_type"];format ["insertAHLog:%1:%2:%3:%4:%5",serverid,name _player,getPlayerUID _player,_type,_log] call RRPServer_DB_lk_fireAndForget;';

call RRPHC_system_preInit;

true
