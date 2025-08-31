/*
	Project: Async functions for extDB3
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_parameters","_query"];
_parameters = _this;
_query = [1,call lkvcj34qrgh,_parameters] joinString ":";
"extDB3" callExtension _query;
format ["DB_LK: FPS %2: %1 ",_query,round diag_fps] call RRPHC_util_debugConsole;
true
