/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];
[
	
]apply
{
	_x params["_function"];
	missionNamespace setVariable[_x, compileFinal preprocessFileLineNumbers format["RRPServer_Economy\code\%1.sqf",_x]];
};

true
