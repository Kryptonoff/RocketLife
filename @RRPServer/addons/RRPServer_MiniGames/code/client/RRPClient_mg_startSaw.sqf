/*

	Filename:	RRPClient_mg_saw.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
disableSerialization;
if (runSaw) exitWith {hint "Болгарка уже работает"};

private _dialog = findDisplay 9700;
private _t_bar = _dialog displayCtrl 9701;
private _p_bar = _dialog displayCtrl 9702;
private _p_barText = _dialog displayCtrl 9703;

private _runTime = 10;
runSaw = true;
stopSaw = false;

private _startBtn = _dialog displayCtrl 9704;
private _stopBtn = _dialog displayCtrl 9705;

_startBtn ctrlEnable false;
_stopBtn ctrlEnable true;

private _p_count = progressPosition _p_bar;
private _t_count = progressPosition _t_bar;
private _t_step = selectRandom [0.04, 0.05, 0.07];
while {true} do {
	if (stopSaw) exitWith {runSaw = false};

	uiSleep 0.01;
	_p_count = _p_count + (0.01/_runTime);
	_t_count = _t_count + (_t_step/_runTime);
	_p_bar progressSetPosition _p_count;
	_t_bar progressSetPosition _t_count;
	_p_barText ctrlSetText format["%1%2", round (_p_count * 100), "%"];
	_t_bar ctrlSetTextColor [_t_count, 0, 1 - _t_count,1];

	if (isNull _dialog) exitWith {};
	if (_p_count >= 1) exitWith {rp_game_won = true};
	if (_t_count >= 1) exitWith {rp_game_lose = true; "Болгарка перегрелась и сломалась!" call toastError};
};	