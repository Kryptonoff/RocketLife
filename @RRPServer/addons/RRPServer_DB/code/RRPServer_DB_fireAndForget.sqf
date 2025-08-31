/*
	Project: Async functions for extDB3
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_parameters","_query"];
_parameters = _this;
_time = diag_tickTime;
if(DB3_DEBUG) then { format ["fire&Forget - %1",_parameters] call RRPServer_DB_debug;};
_query = [1,call cn32q9wetycbfqwge,_parameters] joinString ":";
"extDB3" callExtension _query;
if(DB3_DEBUG) then {format ["fire&Forget - Result Time:%1",(diag_tickTime) - _time] call RRPServer_DB_debug;};
true
