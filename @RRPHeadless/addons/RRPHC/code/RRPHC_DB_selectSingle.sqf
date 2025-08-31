private["_parameters","_query","_result"];
_parameters = _this;
format ["HC: SelectSingle: %1",_parameters ] call RRPHC_util_debugConsole;
_time = diag_tickTime;
_query = [0, call cn32q9wetycbfqwge,_parameters] joinString ":";
_result = parseSimpleArray ("extDB3" callExtension _query);
switch (_result select 0) do
{
	case 0:
	{
		(format["Database Error: %1", (_result select 1)]) call RRPHC_DB_log;
	};
	case 2:
	{
		_result = (_result select 1) call RRPHC_DB_handleBig;
	};
};

(_result select 1) select 0
