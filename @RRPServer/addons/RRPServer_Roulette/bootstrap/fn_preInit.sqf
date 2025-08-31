/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";

private _path = "\RRPServer_Roulette\";

//-- Server
[
	"RRPServer_russianRoulette_broadcastGameStatus",
	"RRPServer_russianRoulette_event_onPlayerDied",
	"RRPServer_russianRoulette_event_onPlayerDisconnected",
	"RRPServer_russianRoulette_event_onPlayerJoined",
	"RRPServer_russianRoulette_event_onPlayerLeft",
	"RRPServer_russianRoulette_event_onPlayerWin",
	"RRPServer_russianRoulette_initialize",
	"RRPServer_russianRoulette_initServer",
	"RRPServer_russianRoulette_letNextPlayerFire",
	"RRPServer_russianRoulette_fireRussianRouletteRevolverResponse",
	"RRPServer_russianRoulette_joinRussianRouletteRequest",
	"RRPServer_russianRoulette_leaveRussianRouletteRequest",
	"RRPServer_russianRoulette_requestJoinRussianRouletteDialogRequest",
	"RRPServer_russianRoulette_startGame"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\server\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\server\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code];
};

//-- Client
[
	"RRPClient_joinRussianRouletteDialog_event_onJoinButtonClick",
	"RRPClient_joinRussianRouletteDialog_event_onUnload",
	"RRPClient_russianRoulette_countDownThread",
	"RRPClient_russianRoulette_fire",
	"RRPClient_russianRoulette_hide",
	"RRPClient_russianRoulette_initialize",
	"RRPClient_russianRoulette_fireRussianRouletteRevolverRequest",
	"RRPClient_russianRoulette_joinRussianRouletteResponse",
	"RRPClient_russianRoulette_leaveRussianRouletteResponse",
	"RRPClient_russianRoulette_requestJoinRussianRouletteDialogResponse",
	"RRPClient_russianRoulette_updateRussianRouletteGameStatusRequest",
	"RRPClient_russianRoulette_winRussianRouletteRequest",
	"RRPClient_russianRoulette_requestJoinDialog",
	"RRPClient_russianRoulette_show",
	"RRPClient_russianRoulette_startCountDown",
	"RRPClient_russianRoulette_stopCountDown"
]apply{
	_function = _x;
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format[_path + "code\client\%1.sqf",_function])
	};
	missionNamespace setVariable [_function, _code,true];
};

call RRPServer_russianRoulette_initialize;

true
