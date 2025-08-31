/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private["_events"];
_events = getArray (configFile >> "CfgEvents" >> "enabled");
if (_events isEqualTo []) exitWith {"Event System disabled, active events array is empty" call RRPServer_util_log};
{
	missionNamespace setVariable [format ["Event%1LastExecutedAt", _x], 0];
}
forEach _events;
EventThreadID = [60, RRPServer_events_thread, [], true] call RRPServer_system_thread_addtask;
"Event System Enabled #1011" call RRPServer_util_debugConsole;