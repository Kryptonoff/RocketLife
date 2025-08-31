/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

RRPServerVehicleSaveQueue = [];
[getNumber(configFile >> "CfgCleanup" >> "CleanupVehicle" >> "cleanupCycle"), RRPHC_vehicleSaveQueue_thread_saveVehicles, [], true] call RRPHC_system_thread_addTask;

RRPServerPlayerSaveQueue = [];
[30, RRPHC_playerSaveQueue_savePlayer, [], true] call RRPHC_system_thread_addTask;

true
