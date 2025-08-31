/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (true) exitWith {};
private _binConfigPatches = configFile >> "CfgPatches";
private _missingPatches = "isClass _x && !((configName _x) in RRPServerPatchesAddons)" configClasses _binConfigPatches;
_missingPatches = _missingPatches apply {configName _x};

if !(_missingPatches isEqualTo []) exitWith {
	[format ["%1 (%2) конфликтующий аддон(ы) %3",profileName,getPlayerUID player,(str _missingPatches)], "SpyGlass_Log"] remoteExecCall ["RRPServer_system_logIt",2];
	failMission "SpyGlassAddonsMissed";
};
