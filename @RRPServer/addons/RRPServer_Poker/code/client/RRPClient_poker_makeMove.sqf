/*

	Filename: 	RRPClient_poker_makeMove.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params ["_type"];
_display = uiNamespace getVariable ["RRPDialogPoker",displayNull];
if (isNull _display) exitWith {};

private _buttonsGroup = _display displayCtrl 25400;
private _foldButton = _buttonsGroup controlsGroupCtrl 25401;
private _checkCallButton = _buttonsGroup controlsGroupCtrl 25402;
private _raiseButton = _buttonsGroup controlsGroupCtrl 25403;
private _raiseSlider = _buttonsGroup controlsGroupCtrl 25404;

private _move = [];

switch (_type) do { 
	case "fold": {_move = ["fold", 0]}; 
	case "checkcall": {
		if (life_poker_toBet != 0) then {
			_move = ["call", life_poker_toBet]
		} else {
			_move = ["check", 0]
		};
	};
	case "raise": {
		_small_blind = round ((life_poker_table getVariable ["poker_bet",0]) * 0.5);
		_bet = (round ((sliderPosition _raiseSlider) / _small_blind) * _small_blind);
		_move = ["raise", _bet]
	}; 
	default {_move = ["default", 0]}; 
};

player setVariable ["madeMove",_move,true];

_foldButton ctrlEnable false;
_checkCallButton ctrlEnable false;
_raiseButton ctrlEnable false;
_raiseSlider ctrlEnable false;