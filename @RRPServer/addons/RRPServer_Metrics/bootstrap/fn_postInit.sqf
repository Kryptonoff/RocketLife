/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/
/*
call RRPServer_DB_intercept_createConnection;
_res = ["date"] call RRPServer_DB_intercept_queryConfig; 
format ["Intercept Инициализирован: Сегодняшняя дата: %1  #0101",_res] call RRPServer_util_debugConsole;
*/

call RRPServer_metrics_controlpanelhandlers;
// "МЕТРИКА ВКЛЮЧЕНА  #0101" call RRPServer_util_debugConsole;
// execFSM '\RRPServer_Metrics\bootstrap\monitor.fsm';