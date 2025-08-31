private["_parameters","_query"];
_parameters = _this;
format ["HC: Fire_Forget: %1",_parameters ] call RRPHC_util_debugConsole;
_time = diag_tickTime;
_query = [1,call cn32q9wetycbfqwge,_parameters] joinString ":";
"extDB3" callExtension _query;
true
