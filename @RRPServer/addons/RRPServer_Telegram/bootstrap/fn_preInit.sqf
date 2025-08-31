/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];

[
	"RRPClient_tg_acceptFriends",
	"RRPClient_tg_addFriends",
	"RRPClient_tg_checkFriends",
	"RRPClient_tg_create_array_dedicated_channels",
	"RRPClient_tg_deleteFriends",
	"RRPClient_tg_initialize",
	"RRPClient_tg_main",
	"RRPClient_tg_receiveClient",
	"RRPClient_tg_saveConversation"
]apply
{
	_x params["_function"];
	missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["RRPServer_Telegram\code\client\%1.sqf",_function],true];
};

[
	"checkTFRCall",
	"clickCall",
	"getAllTheSounds",
	"getVolumePhone",
	"hungUp",
	"phoneCall",
	"phoneCallEnd",
	"phoneCallTake",
	"phoneCallTo",
	"sendFrequencyInfo2"
]apply
{
	_x params ["_function"];
	_fnc = format ["TFAR_fnc_%1", _function];
	missionNamespace setVariable[_fnc, compile preprocessFileLineNumbers format["RRPServer_Telegram\code\TFR\%1.sqf",_function],true];
};

[
	"RRPServer_tg_request",
	"RRPServer_tg_updateMessage"
]apply
{
	_x params["_function"];
	missionNamespace setVariable[_x, compile preprocessFileLineNumbers format["RRPServer_Telegram\code\server\%1.sqf",_function]];
};

true
