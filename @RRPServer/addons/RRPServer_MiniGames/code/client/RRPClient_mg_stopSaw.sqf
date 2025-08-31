/*

	Filename:	RRPClient_mg_saw.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
disableSerialization;
if (stopSaw) exitWith {"Вы уже остановили болгарку" call toastError};

private _dialog = findDisplay 9700;
private _t_bar = _dialog displayCtrl 9701;
private _p_bar = _dialog displayCtrl 9702;

private _runTime = 40;
runSaw = false;
stopSaw = true;

private _startBtn = _dialog displayCtrl 9704;
private _stopBtn = _dialog displayCtrl 9705;

_startBtn ctrlEnable true;
_stopBtn ctrlEnable false;

private _t_count = progressPosition _t_bar;
while {true} do {
	if (runSaw) exitWith {stopSaw = false};

	uiSleep 0.01;
	_t_count = _t_count - (0.1/_runTime);
	_t_bar progressSetPosition _t_count;
	_t_bar ctrlSetTextColor [_t_count, 0, 1 - _t_count,1];
	if (isNull _dialog) exitWith {};
	if (_t_count >= 1) exitWith {rp_game_lose = true; "Болгарка перегрелась и сломалась!" call toastError};
};	