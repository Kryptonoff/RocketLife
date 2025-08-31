/*

	Filename:	RRPClient_mg_pattern.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/

RRPClient_mg_patternAction = {
	if (_this isEqualTo (fl_game_patSequence select fl_game_patClicked)) then {
		(findDisplay 8900) displayCtrl (8906 + fl_game_patClicked) ctrlSetTextColor [0.059, 0.922, 0.024, 1];
		fl_game_patClicked = fl_game_patClicked + 1;
	} else {
		fl_game_patWrong = true;
		fl_game_patEntered = true;
	};
	if (fl_game_patClicked >= fl_game_patToShow) then {
		fl_game_patEntered = true;
		fl_game_patToShow = fl_game_patToShow + 1;
	};
};

disableSerialization;
if !(createDialog "RocketDialogPattern") exitWith {};

private _display = findDisplay 8900;
if (isNull _display) exitWith {hint "дислей нулл паттерн"};

private _firstSigPicture = _display displayCtrl 8901;
private _secondSigPicture = _display displayCtrl 8902;
private _thirdSigPicture = _display displayCtrl 8903;
private _fourthSigPicture = _display displayCtrl 8904;
private _fifthSigPicture = _display displayCtrl 8905;

private _sixthSigPicture = _display displayCtrl 8906;
private _seventhSigPicture = _display displayCtrl 8907;
private _eighthSigPicture = _display displayCtrl 8908;
private _ninethSigPicture = _display displayCtrl 8909;
private _tenthSigPicture = _display displayCtrl 8910;

private _firstButton = _display displayCtrl 8911;
private _secondButton = _display displayCtrl 8912;
private _thirdButton = _display displayCtrl 8913;
private _fourthButton = _display displayCtrl 8914;
private _fifthButton = _display displayCtrl 8915;
private _sixthButton = _display displayCtrl 8916;
private _seventhButton = _display displayCtrl 8917;
private _eighthButton = _display displayCtrl 8918;
private _ninethButton = _display displayCtrl 8919;

private _firstPicture = _display displayCtrl 8921;
private _secondPicture = _display displayCtrl 8922;
private _thirdPicture = _display displayCtrl 8923;
private _fourthPicture = _display displayCtrl 8924;
private _fifthPicture = _display displayCtrl 8925;
private _sixthPicture = _display displayCtrl 8926;
private _seventhPicture = _display displayCtrl 8927;
private _eighthPicture = _display displayCtrl 8928;
private _ninethPicture = _display displayCtrl 8929;

private _buttonSequence = [_firstButton, _secondButton, _thirdButton, _fourthButton, _fifthButton, _sixthButton, _seventhButton, _eighthButton, _ninethButton];
private _pictureSequence = [_firstPicture, _secondPicture, _thirdPicture, _fourthPicture, _fifthPicture, _sixthPicture, _seventhPicture, _eighthPicture, _ninethPicture];
private _pictureShowSigSequence = [_firstSigPicture, _secondSigPicture, _thirdSigPicture, _fourthSigPicture, _fifthSigPicture];
private _pictureEnterSigSequence = [_sixthSigPicture, _seventhSigPicture, _eighthSigPicture, _ninethSigPicture, _tenthSigPicture];

private _fnc_arrayShuffle = {
	private _cnt = count _this;
	for "_i" from 1 to _cnt do {
		_this pushBack (_this deleteAt random _cnt); 
	};
	_this
};

fl_game_won = false;
while {!isNull (findDisplay 8900) AND !(fl_game_won)} do {
	{_x ctrlSetTextColor [0, 0, 0, 0]} forEach _pictureSequence + _pictureShowSigSequence;

	fl_game_patSequence = [0, 1, 2, 3, 4, 5, 6, 7, 8];
	fl_game_patSequence call _fnc_arrayShuffle;
	fl_game_patSequence resize 5;
	
	fl_game_patToShow = 1;
	fl_game_patWrong = false;
	
	while {!(isNull _display) AND fl_game_patToShow < 6 AND !(fl_game_patWrong)} do {
		uiSleep 0.5;
		fl_game_patClicked = 0;
		fl_game_patEntered = false;
		{_x ctrlEnable false} forEach _buttonSequence;
		{_x ctrlSetTextColor [0, 0, 0, 0]} forEach _pictureEnterSigSequence;
		
	   	for "_i" from 0 to (fl_game_patToShow - 1) do {
	   		uiSleep 0.5;
			(_pictureSequence select (fl_game_patSequence select _i)) ctrlSetTextColor [0.267, 0.678, 0.961, 1];
			(_pictureShowSigSequence select _i) ctrlSetTextColor [0.059, 0.922, 0.024, 1];
		};
	
		uiSleep 0.5;
		{_x ctrlEnable true} forEach _buttonSequence;
		{_x ctrlSetTextColor [0, 0, 0, 0]} forEach _pictureSequence;
	
		waitUntil {fl_game_patEntered OR (isNull _display)};
	};
	
	if (!(fl_game_patWrong) AND !(isNull _display)) then {
		{_x ctrlSetTextColor [0.059, 0.922, 0.024, 1]} forEach _pictureSequence;
		fl_game_won = true;
	} else {
		{_x ctrlSetTextColor [0.824, 0.008, 0, 1]} forEach _pictureSequence + _pictureShowSigSequence
	};
	
	uiSleep 1.5;
};
closeDialog 0;