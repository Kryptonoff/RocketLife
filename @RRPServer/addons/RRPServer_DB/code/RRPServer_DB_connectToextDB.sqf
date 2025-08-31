/*
	Project: Async functions for extDB3
	Author: FairyTale5571
	License: CC BY-ND
*/

#define CONSTVAR(var) var = compileFinal (if (var isEqualType "") then {var} else {str(var)})
private _isDev = _this;
private _timeStamp = diag_tickTime;
diag_log "---------------------------------------------------------------------------------------------------- #0101" call RRPServer_util_debugConsole;
diag_log "---------------------------------- Starting Initializing to extDB3 --------------------------------- #0101" call RRPServer_util_debugConsole;
diag_log "------------------------------------------ Version 1032 --------------------------------------------- #0101" call RRPServer_util_debugConsole;
diag_log "---------------------------------------------------------------------------------------------------- #0101" call RRPServer_util_debugConsole;

private["_isConnected","_error","_result"];
_isConnected = false;
_error_locked = false;
try
{
	_result = "extDB3" callExtension "9:VERSION";
	format ["Installed extDB3 version: %1", _result] call RRPServer_DB_log;
	if ((parseNumber _result) < 1.032) then
	{
		throw format ["Error Required extDB3 Version 1.032 or higher: %1", _result];
	};
	_result = parseSimpleArray ("extDB3" callExtension "9:LOCK_STATUS") select 0;
	if (_result isEqualTo 1) then
	{
		_error_locked = true;
		throw "Error extDB3 is already setup & locked !!!";
	};
	_result = parseSimpleArray ("extDB3" callExtension "9:ADD_DATABASE:altislife");
	if (_result select 0 isEqualTo 0) throw format ["Could not add database 'altislife': %1", _result];

	_result = parseSimpleArray ("extDB3" callExtension "9:ADD_DATABASE:lkDatabase");
	if (_result select 0 isEqualTo 0) throw format ["Could not add database 'lkDatabase': %1", _result];
	
	private _grc = "grc" callExtension "connectDB";
	if (_grc isNotEqualTo "connected") throw format ["grc not connected: %1",_grc];

	"Connected to database! #0101" call RRPServer_util_debugConsole;

    lkvcj34qrgh = round(random(9999));
    CONSTVAR(lkvcj34qrgh);
    uiNamespace setVariable ["lkvcj34qrgh",call lkvcj34qrgh];
	_result = parseSimpleArray ("extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:lkDatabase:SQL_CUSTOM:%1:lk.ini",call lkvcj34qrgh]);
	if ((_result select 0) isEqualTo 0) then {throw format ["extDB3: Error with Database Connection with SQL_CUSTOM lk.ini - %1",_result]};

    cn32q9wetycbfqwge = round(random(9999));
    CONSTVAR(cn32q9wetycbfqwge);
    uiNamespace setVariable ["cn32q9wetycbfqwge",call cn32q9wetycbfqwge];
	_result = parseSimpleArray ("extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:altislife:SQL_CUSTOM:%1:al_custom.ini",call cn32q9wetycbfqwge]);
	if ((_result select 0) isEqualTo 0) then {throw format ["extDB3: Error with Database Connection with SQL_CUSTOM al_custom.ini - %1",_result]};

	ServerStartTime = systemTime;
	publicVariable "ServerStartTime";

	"Database protocol initialized! #0101" call RRPServer_util_debugConsole;
	if (_isDev) then 
	{
		"extDB3" callExtension "9:LOCK:aerc3e";
		"extDB3 can be unlocked! Remove password if it not dev server immediatly! #1001" call RRPServer_util_debugConsole;
	}else {
		"extDB3" callExtension "9:LOCK";
	};
	_isConnected = true;
}
catch
{
	if (!_error_locked) then
	{
		"MySQL connection error! #1001" call RRPServer_util_debugConsole;
		"Make sure [Database] in the extdb3-conf.ini is set to [altislife] unless you have a different database setup!!!!! #1001" call RRPServer_util_debugConsole;
		"Please have a look at @extDB3/logs/ to find out what went wrong. #1001" call RRPServer_util_debugConsole;
		format ["MySQL Error: %1 #1001", _exception]  call RRPServer_util_debugConsole;
		"Server will locked now :( #1001" call RRPServer_util_debugConsole;
		"#lock" call RRPServer_DB_sendRconCommand;
	}
	else
	{
		format ["extDB3: %1", _exception] call RRPServer_DB_log;
		"Check your server rpt for errors, your mission might be stuck a loop restarting #1001" call RRPServer_util_debugConsole;
	};
};
diag_log "---------------------------------------------------------------------------------------------------- #0101" call RRPServer_util_debugConsole;
diag_log format["               End of Init extDB3 :: Total Execution Time %1 seconds  #0101",(diag_tickTime) - _timeStamp] call RRPServer_util_debugConsole;
diag_log "---------------------------------------------------------------------------------------------------- #0101" call RRPServer_util_debugConsole;

_isConnected
