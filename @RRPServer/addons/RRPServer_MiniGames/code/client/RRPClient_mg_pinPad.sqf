/*

	Filename:	RRPClient_mg_pinPad.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com
	
*/
RRPClient_mg_pinPadAction = {
	switch (_this) do { 
		case "cancel": {
			closeDialog 0;
			["Вы вытащили карточку из банкомата"] call toastError;
		};
		case "clear": {fl_game_pinEntered = []};
		case "enter": {fl_game_pinCheck = true};
		default {fl_game_pinEntered pushBack _this};
	};
};

disableSerialization;
if !(createDialog "RocketDialogAtmPinpad") exitWith {};
fl_game_pin = _this;

fl_game_pinCheck = false;
fl_game_pinEntered = [];
fl_game_won = false;

waitUntil {isNull (findDisplay 9400) OR (fl_game_pinCheck)};
fl_game_won = fl_game_pinEntered isEqualTo fl_game_pin;

closeDialog 0;