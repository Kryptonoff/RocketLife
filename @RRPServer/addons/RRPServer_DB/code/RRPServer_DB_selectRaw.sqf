private["_parameters","_query","_result"];
_parameters = _this;
_time = diag_tickTime;
if(DB3_DEBUG) then {format ["selectRAW - %1",_parameters] call RRPServer_DB_debug;};
_query = [0, call cn32q9wetycbfqwge,_parameters] joinString ":";
_result = ("extDB3" callExtension _query);
format ["RAW RESULT: %1 #0011",_result] call RRPServer_util_debugConsole;
_result
