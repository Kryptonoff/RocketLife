/*

	Filename:	RRPClient_mg_calibration.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
disableSerialization;
if !(createDialog "RocketDialogCalibration") exitWith {};

private _display = findDisplay 8800;
if (isNull _display) exitWith {hint "дислей нулл свайп"};

private _firstProgressCtrl = _display displayCtrl 8801;
private _secondProgressCtrl = _display displayCtrl 8803;
private _thirdProgressCtrl = _display displayCtrl 8805;

fl_game_firstCalibrated = false;
private _firstP = random 1;
private _firstPosNum = (random 0.05) max 0.01;
private _firstNegNum = (random 0.05) max 0.01;
private _firstPAdding = selectRandom [true, false];

fl_game_secondCalibrated = false;
private _secondP = random 1;
private _secondPosNum = (random 0.05) max 0.01;
private _secondNegNum = (random 0.05) max 0.01;
private _secondPAdding = selectRandom [true, false];

fl_game_thirdCalibrated = false;
private _thirdP = random 1;
private _thirdPosNum = (random 0.05) max 0.01;
private _thirdNegNum = (random 0.05) max 0.01;
private _thirdPAdding = selectRandom [true, false];

fl_game_won = false;
while {!(isNull _display) AND !(fl_game_won)} do {
	if !(fl_game_firstCalibrated) then {
		if (_firstPAdding) then {
			_firstP = _firstP + _firstPosNum;
			if (_firstP > 0.99) then {_firstPAdding = false; _firstNegNum = (random 0.05) max 0.01};
		} else {
			_firstP = _firstP - _firstNegNum;
			if (_firstP < 0.01) then {_firstPAdding = true; _firstPosNum = (random 0.05) max 0.01};
		};
		_firstProgressCtrl progressSetPosition _firstP;
	};

	if !(fl_game_secondCalibrated) then {
		if (_secondPAdding) then {
			_secondP = _secondP + _secondPosNum;
			if (_secondP > 0.99) then {_secondPAdding = false; _secondNegNum = (random 0.05) max 0.01};
		} else {
			_secondP = _secondP - _secondNegNum;
			if (_secondP < 0.01) then {_secondPAdding = true; _secondPosNum = (random 0.05) max 0.01};
		};
		_secondProgressCtrl progressSetPosition _secondP;
	};

	if !(fl_game_thirdCalibrated) then {
		if (_thirdPAdding) then {
			_thirdP = _thirdP + _thirdPosNum;
			if (_thirdP > 0.99) then {_thirdPAdding = false; _thirdNegNum = (random 0.05) max 0.01};
		} else {
			_thirdP = _thirdP - _thirdNegNum;
			if (_thirdP < 0.01) then {_thirdPAdding = true; _thirdPosNum = (random 0.05) max 0.01};
		};
		_thirdProgressCtrl progressSetPosition _thirdP;
	};
	uiSleep 0.01;
};
closeDialog 0;