/*
	Project: Headless Client for Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_parameters","_query","_result"];
_parameters = _this;
format ["HC: InsertSingle: %1",_this] call RRPHC_util_debugConsole;
_time = diag_tickTime;
_query = [0, call cn32q9wetycbfqwge,_parameters] joinString ":";
_result = parseSimpleArray ("extDB3" callExtension _query);
(_result select 1) select 0
