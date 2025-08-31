/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

RRPServerVehicleSaveQueue = [];
[getNumber(configFile >> "CfgCleanup" >> "CleanupVehicle" >> "cleanupCycle"), {if (RRPHC_enable) exitWith{
	// format ["Headless enabled, server not save #0101"] call RRPServer_util_debugConsole;
}; call RRPServer_vehicleSaveQueue_thread_saveVehicles}, [], true] call RRPServer_system_thread_addTask;

RRPServerPlayerSaveQueue = [];
[30, {if (RRPHC_enable) exitWith{
	// format ["Headless enabled, server not save #0101"] call RRPServer_util_debugConsole;
}; call RRPServer_playerSaveQueue_savePlayer}, [], true] call RRPServer_system_thread_addTask;

true
