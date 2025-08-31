/*
	Project: Aurora Role Play
	Author: FaityTale5571
	License: CC BY-ND
*/

//-- Client
[
	"RRPClient_zones_drawMap"
]apply {
  missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["\RRPServer_Zones\client\%1.sqf",_x],true];
};

//-- Server
[
	"RRPServer_zones_loadPage"
] apply
{
  missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["\RRPServer_Zones\code\%1.sqf",_x]];
};
true
