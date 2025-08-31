/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private ["_type","_uid","_name","_input","_result","_sessionId","_player"];
_type = param [0, -1];
_sessionId = param [1, "-1"];
_player = _sessionId call RRPServer_session_getPlayerObject;
_uid = getPlayerUID _player;
if ((_type isEqualto -1) OR {_uid isEqualTo "-1"}) exitWith {};
if (_type isEqualTo 0) exitWith {
	_name = name _player;
	_input = param [2, ""];
	if ((_name isEqualTo "") OR {_input isEqualTo ""}) exitWith {};
	format ["insertLotteryTicket:%1:%2:%3",_uid,_name,_input] call RRPServer_DB_fireAndForget;
};
if (_type isEqualTo 1) exitWith {
	if (isNull _player) exitWith {};
	_result = format ["lottery_win:%1",_uid] call RRPServer_DB_selectSingleField;
	format ["dropWinLottery:%1",_uid] call RRPServer_DB_fireAndForget;
	[4,_result] remoteExec ["RRPClient_lottery_checklotteryinput",(owner _player)];
};
true
