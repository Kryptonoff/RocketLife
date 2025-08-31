/*

	Filename:	RRPClient_mg_cardSwipe.sqf
	Project:	Fatum Reborn
	Author:		Kaboom
	E-mail:		e-mail@placeholder.com
	Web:		placeholder.com

*/
disableSerialization;
if !(createDialog "RocketDialogCardSwipe") exitWith {};

private _display = findDisplay 8700;
if (isNull _display) exitWith {hint "дислей нулл свайп"};

private _cardTextCtrl = _display displayCtrl 8701;
private _cardPictureCtrl = _display displayCtrl 8702;
private _cardReaderTextCtrl = _display displayCtrl 8703;

/*_cardPictureCtrl ctrlSetPosition [-0.2,0.01,0.4,0.5];
_cardPictureCtrl ctrlCommit 0;

_display = findDisplay 46 createDisplay "RscDisplayEmpty";

_cardTextCtrl = _display ctrlCreate ["RscButton", 8701];
_cardTextCtrl ctrlSetPosition [0.1, 0.06, 0.4, 0.24];
_cardTextCtrl ctrlSetBackgroundColor [0, 0, 0, 0];
_cardTextCtrl ctrlSetActiveColor [0, 0, 0, 0];
_cardTextCtrl ctrlSetText "";
_cardTextCtrl ctrlCommit 0;

_cardReaderPictureCtrl = _display ctrlCreate ["RscPicture", 8700];
_cardReaderPictureCtrl ctrlSetPosition [-0.5, -0.25, 2, 1.5];
_cardReaderPictureCtrl ctrlSetBackgroundColor [1, 1, 1, 1];
_cardReaderPictureCtrl ctrlSetText "\rimas_agent\assets\minigames\minigamebg.paa";
_cardReaderPictureCtrl ctrlCommit 0;

_cardReaderPictureCtrl = _display ctrlCreate ["RscPicture", 8700];
_cardReaderPictureCtrl ctrlSetPosition [0.1, 0.05, 0.8, 1];
_cardReaderPictureCtrl ctrlSetBackgroundColor [1, 1, 1, 1];
_cardReaderPictureCtrl ctrlSetText "\rimas_agent\assets\minigames\cardreader_bottom.paa";
_cardReaderPictureCtrl ctrlCommit 0;

_cardPictureCtrl = _display ctrlCreate ["RscPicture", 8702];
_cardPictureCtrl ctrlSetPosition [0.1,0.03,0.4,0.5];
_cardPictureCtrl ctrlSetBackgroundColor [1, 1, 1, 1];
_cardPictureCtrl ctrlSetText "\rimas_agent\assets\minigames\card.paa";
_cardPictureCtrl ctrlCommit 0;

_cardReaderPictureCtrl = _display ctrlCreate ["RscPicture", 8702];
_cardReaderPictureCtrl ctrlSetPosition [0.1, -0.15, 0.8, 1];
_cardReaderPictureCtrl ctrlSetBackgroundColor [1, 1, 1, 1];
_cardReaderPictureCtrl ctrlSetText "\rimas_agent\assets\minigames\cardreader_top.paa";
_cardReaderPictureCtrl ctrlCommit 0;

_cardReaderTextCtrl = _display ctrlCreate ["RscText", 8704];
_cardReaderTextCtrl ctrlSetPosition [0.15, -0.11, 0.6, 0.05];
_cardReaderTextCtrl ctrlSetBackgroundColor [0, 0, 0, 0];
_cardReaderTextCtrl ctrlSetText "ПРОВЕДИТЕ КАРТОЙ";
_cardReaderTextCtrl ctrlSetFont "LCD14";
_cardReaderTextCtrl ctrlCommit 0;
*/

_cardTextCtrl ctrlAddEventHandler ["MouseButtonDown", { 
_this spawn {
	params ["_cardTextCtrl", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	
	private _display = findDisplay 8700;
	private _cardPictureCtrl = _display displayCtrl 8702;
	private _cardReaderTextCtrl = _display displayCtrl 8703;

	private _cardPictureCtrlPosition = ctrlPosition _cardPictureCtrl;
	private _cardTextCtrlPosition = ctrlPosition _cardTextCtrl;
	private _cardTextCtrlPositionX = _cardTextCtrlPosition select 0;
	setMousePosition [_cardTextCtrlPositionX, _cardTextCtrlPosition#1];
	
	fl_game_dragging = true;
	_cardMinTime = 1.25 + random [0.1, 0.15, 0.2];
	_cardMaxTime = 1.75 - random [0.1, 0.15, 0.2];
	_cardStart = diag_tickTime;
	
	while {fl_game_dragging} do {
		_posX = (ctrlPosition _cardTextCtrl) select 0;
		_posXPicture = (ctrlPosition _cardPictureCtrl) select 0;
		if (_posX > 0.89) exitWith {
			_cardFinishTime = diag_tickTime - _cardStart;
			
			if (_cardFinishTime < _cardMaxTime AND _cardFinishTime > _cardMinTime) exitWith {fl_game_won = true; _cardReaderTextCtrl ctrlSetText "Доступ разрешен"; player say2D "CardAccepted"};
			if (_cardFinishTime > _cardMaxTime) exitWith {_cardReaderTextCtrl ctrlSetText "Слишком медленно"; player say2D "CardDenied"};
			if (_cardFinishTime < _cardMinTime) exitWith {_cardReaderTextCtrl ctrlSetText "Слишком быстро"; player say2D "CardDenied"};
 		};

		_mousePos = getMousePosition;
		_cardTextCtrl ctrlSetPositionX (_mousePos select 0) max _cardTextCtrlPositionX;
		_cardTextCtrl ctrlCommit 0;
		_cardPictureCtrl ctrlSetPositionX (_mousePos select 0) max _cardTextCtrlPositionX;
		_cardPictureCtrl ctrlCommit 0;
	};

	fl_game_dragging = false;
	_cardTextCtrl ctrlSetPosition _cardTextCtrlPosition;
	_cardTextCtrl ctrlCommit 0;
	_cardPictureCtrl ctrlSetPosition _cardPictureCtrlPosition;
	_cardPictureCtrl ctrlCommit 0;
}
}];

_cardTextCtrl ctrlAddEventHandler ["MouseButtonUp", {
	params ["_display", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	
	fl_game_dragging = false;
}];

fl_game_won = false;
waitUntil {(isNull _display) OR (fl_game_won)};
closeDialog 0;