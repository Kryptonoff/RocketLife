/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];

[
	"RRPServer_ambient_ny23",
	"RRPServer_ambient_hallowen",
	"RRPServer_ambient_heliCrashes",
	"RRPServer_ambient_flySanta",
	"RRPServer_ambient_4x4roads",
	"RRPServer_ambient_4x4_23",
	"RRPServer_ambient_4x4_24",
	"RRPServer_ambient_labirint"
]apply
{
	_x params["_function"];
	missionNamespace setVariable[_x, compileFinal preprocessFileLineNumbers format["RRPServer_Events\code\events\%1.sqf",_x]];
};


[
	"RRPServer_events_init",
	"RRPServer_events_thread"
]apply
{
	_x params["_function"];
	missionNamespace setVariable[_x, compileFinal preprocessFileLineNumbers format["RRPServer_Events\code\%1.sqf",_x]];
};

true
