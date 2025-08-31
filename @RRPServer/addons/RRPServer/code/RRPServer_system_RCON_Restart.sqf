/*
	Project: Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

if !(canSuspend) exitWith {_this spawn RRPServer_system_RCON_Restart};
_restarttimes = ["04:00:00","08:00:00","12:00:00","16:00:00","20:00:00","24:00:00"]; //HH:MM:SS
private _password = getText(configFile >> "RCON" >> "password");

_checkTimeRange =
{
	_gottime = true;
	{
		_hardServerTime = _x splitString ":";
		_hardServerTimeHour = parseNumber (_hardServerTime select 0);
		_hardServerTimeMin  = parseNumber (_hardServerTime select 1);
		_hardServerTimeSec  = parseNumber (_hardServerTime select 2);

		_hardSecondsTime = (_hardServerTimeHour * 3600);
		_hardSecondsTime = (_hardSecondsTime + (_hardServerTimeMin * 60));
		_hardSecondsTime = (_hardSecondsTime + _hardServerTimeSec);

		_currentTimestamp = systemTime;
		_nowServerTimeHour = _currentTimestamp select 3;
		_nowServerTimeMin  = _currentTimestamp select 4;
		_nowServerTimeSec  = _currentTimestamp select 5;

		_nowSecondsTime = (_nowServerTimeHour * 3600);
		_nowSecondsTime = (_nowSecondsTime + (_nowServerTimeMin * 60));
		_nowSecondsTime = (_nowSecondsTime + _nowServerTimeSec);

		if( _nowSecondsTime < _hardSecondsTime ) then {
			if (_gottime) then{
				RESTART_difftime = _hardSecondsTime - _nowSecondsTime;
				_gottime = false;
			};
		};
	} forEach _restarttimes;
	RESTART_difftime
};

diag_log format ["[SERVER RESTART] -> RESTART TIMES ARE %1 - Next Restart in %2 Secounds", _restarttimes, "" call _checkTimeRange];

_sendMessage = {
	
	[
		format["<t color='#8a00ff'><t size='2'><t align='center'>Сообщение от метеорологического центра<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>Гидромет<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_this],
		"info"
	] remoteExecCall ["hints",-2];
};

_120minCheck = false; _60minCheck = false; _30minCheck = false; _15minCheck = false; _10minCheck = false; _5minCheck = false; _3minCheck = false; _2minCheck = false; _1minCheck = false;
_msg = "";
while {true} do
{
	switch true do
	{
		case (( '' call _checkTimeRange <= (30*60) ) && {!_30minCheck}) :
		{
			_30minCheck = true;
			_msg = "Гидромет: Предупреждаем что через 30 мин. приближается буря";
			_msg call _sendMessage;
		};
		case (( '' call _checkTimeRange <= (15*60) ) && {!_15minCheck}) :
		{
			_30minCheck = true; _15minCheck = true;
			_msg = "Гидромет: Предупреждаем что через 15 мин. приближается буря";
			_msg call _sendMessage;
		};
		case (( '' call _checkTimeRange <= (10*60) ) && {!_10minCheck}) :
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true;
			_msg = "Гидромет: Предупреждаем что через 10 мин. приближается буря";
			_msg call _sendMessage;
		};
		case (( '' call _checkTimeRange <= (5*60) ) && {!_5minCheck}) :
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true; _5minCheck = true;
			_msg = "Гидромет: Предупреждаем что через 5 мин. приближается буря Все магазины закрыты.";
			_msg call _sendMessage;

			"#lock" call RRPServer_DB_sendRconCommand;
			server_restartSoon = true;
			publicVariable "server_restartSoon";
		};
		case (( '' call _checkTimeRange <= (2*60) ) && {!_3minCheck}):
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true; _5minCheck = true; _3minCheck = true;
			_msg = "Гидромет: Предупреждаем что через 1 мин. приближается буря. Все жители заморожены! Не покидайте остров!";
			_msg call _sendMessage;
	
		};
		case (( '' call _checkTimeRange <= (1*60) ) && {!_1minCheck}):
		{
			_30minCheck = true; _15minCheck = true; _10minCheck = true; _5minCheck = true; _3minCheck = true; _1minCheck = true;
			[] remoteExecCall ["RRPClient_system_logoutOnRestrart",-2];
			call RRPServer_system_prepareToRestart;
		};
	};
	uiSleep 30;
};
