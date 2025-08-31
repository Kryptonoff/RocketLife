/*

	Filename:	RRPClient_mg_calibrationAction.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
params [
	["_progressIdc", -1, [-1]],
	["_buttonIdc", -1, [-1]],
	["_var", "", [""]]
];

private _display = findDisplay 8800;
private _buttonCtrl = _display displayCtrl _buttonIdc;
private _progressCtrl = _display displayCtrl _progressIdc;
private _position = progressPosition _progressCtrl;

if (_position > 0.45 AND _position < 0.55) then {
	missionNamespace setVariable [format ["fl_game_%1Calibrated", _var], true];
	_progressCtrl progressSetPosition 0.5;
	_progressCtrl ctrlSetTextColor [0.059, 0.922, 0.024, 1];
} else {
	_progressCtrl ctrlSetTextColor [0.824, 0.008, 0, 1];
	
	[{
		(_this select 0) ctrlEnable true;
		(_this select 1) ctrlSetTextColor [1, 1, 1, 1];
	}, [_buttonCtrl, _progressCtrl], 0.5] call CBA_fnc_waitAndExecute;
};

_buttonCtrl ctrlEnable false;

if (fl_game_firstCalibrated AND fl_game_secondCalibrated AND fl_game_thirdCalibrated) then {
	fl_game_won = true;
};