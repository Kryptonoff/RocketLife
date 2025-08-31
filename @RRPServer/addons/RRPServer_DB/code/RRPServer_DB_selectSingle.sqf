/*
	Project: Async functions for extDB3
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_parameters","_query","_result"];
_parameters = _this;
_time = diag_tickTime;
if(DB3_DEBUG) then {format ["SelSingle - %1",_parameters] call RRPServer_DB_debug;};
_query = [0, call cn32q9wetycbfqwge,_parameters] joinString ":";
_result = parseSimpleArray ("extDB3" callExtension _query);
switch (_result select 0) do
{
	case 0:
	{
		(format["Database Error: %1", (_result select 1)]) call RRPServer_DB_log;
	};
	case 2:
	{
		_result = (_result select 1) call RRPServer_DB_handleBig;
	};
};
if(DB3_DEBUG) then {format ["SelSingle - Result Time:%1",(diag_tickTime) - _time] call RRPServer_DB_debug;};

(_result select 1) select 0
