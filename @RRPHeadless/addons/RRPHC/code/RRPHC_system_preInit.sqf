/*
	Project: Headless Client for Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/
_timeStamp = diag_tickTime;
"---------------------------------------------------------------------------------------------------- #1111" call RRPHC_util_debugConsole;
format ["                 Start of Altis Life HC Init :: #1111"] call RRPHC_util_debugConsole;
"---------------------------------------------------------------------------------------------------- #1111" call RRPHC_util_debugConsole;

"Headless connected" call RRPHC_util_log;

call RRPHC_DB_connectToExtDB;
RRPHCmonitorReportRate = 300;
[] spawn RRPHC_util_debug;

"---------------------------------------------------------------------------------------------------- #1111"  call RRPHC_util_debugConsole;
format ["                 End of Altis Life HC Init :: Total Execution Time %1 seconds #1111",(diag_tickTime) - _timeStamp] call RRPHC_util_debugConsole;
"---------------------------------------------------------------------------------------------------- #1111" call RRPHC_util_debugConsole;
