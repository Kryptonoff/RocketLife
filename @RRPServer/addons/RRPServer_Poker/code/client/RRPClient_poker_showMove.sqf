
params ["_player","_type","_bet","_handName","_pot_index"];
private _display = uiNamespace getVariable ["RRPDialogPoker",displayNull];

if (isNull _display) exitWith {};
private _group = _display displayCtrl 25100;
private _actionsList = _group controlsGroupCtrl 25101;

private _message = "";
switch (_type) do { 
	case "flop": {_message = "Вскрываем флоп!"}; 
	case "turn": {_message = "Вскрываем тёрн!"}; 
	case "river": {_message = "Вскрываем ривер!"}; 
	case "fold": {_message = format ["%1 сбросил карты",_player call getNickName]}; 
	case "check": {_message = format ["%1 чекнул",_player call getNickName]}; 
	case "call": {_message = format ["%1 заколлировал на $%2",_player call getNickName,[_bet] call RRPClient_util_numberText]};
	case "small_b": {_message = format ["%1 поставил малый блайнд $%2",_player call getNickName,[_bet] call RRPClient_util_numberText]};
	case "big_b": {_message = format ["%1 поставил большой блайнд на $%2",_player call getNickName,[_bet] call RRPClient_util_numberText]};
	case "raise": {_message = format ["%1 повысил до $%2",_player call getNickName,[_bet] call RRPClient_util_numberText]};
	case "dealer": {_message = format ["Новый дилер - %1 ",_player call getNickName]};
	case "gameid": {_message = format ["[ID игры - %1]",_bet]};
	case "allin": {_message = format ["%1 идет ва-банк! ($%2)",_player call getNickName,[_bet] call RRPClient_util_numberText]};
	case "leave": {_message = format ["%1 вышел из за стола",_player call getNickName]}; 
	case "afk": {_message = format ["%1 вышел из за стола (АФК)",_player call getNickName]}; 
	case "defaultfold": {_message = format ["%1 сбросил карты. Произошла ошибка defaultfold! Сообщите администрации!",_player call getNickName]}; 
	case "win": {_message = format ["%1 выиграл банк размером $%2 (%3)",_player call getNickName,[_bet] call RRPClient_util_numberText,_handName]}; 
	case "newgame": {_message = format ["Новая игра начнется через %1!",_bet];};
	case "draw": {
		_actionsList lbAdd format["Общая комбинация (%1)! Выиграли по $%2!",_handName,[_bet] call RRPClient_util_numberText];
		{
			_actionsList lbAdd format["%1 - $%2!",(_x call getNickName),[_bet] call RRPClient_util_numberText]
		} forEach _player; 
	}; 
	default {_message = str _this}; 
};
if (_type isEqualTo "draw") exitWith {};
if (_type isEqualTo "clear") exitWith {lbClear _actionsList};

for "_i" from 1 to 6 do 
{
	_player = life_poker_table getVariable [format ["%1_player_%2",life_poker_id,_i],objNull];
	if !(isNull _player) then 
	{
		(_display displayCtrl (62160 + _i)) ctrlSetStructuredText 
			parseText 
				format ["<t align='left' color='#ffffff'>%2%1</t>",
					(_player call getNickName),
					(["","[D] "] select (_player getVariable ["dealer",false]))
				];
		(_display displayCtrl (62150 + _i)) ctrlSetStructuredText parseText format [
			"<t color='#72ff00'>$%1</t>",[(_player getVariable ["stack",0])] call RRPClient_util_numberText
		];
	};
};
if (_type in ["win","draw"]) then {_actionsList lbAdd (["Розыгрыш основного банка!", format["Розыгрыш побочного банка #%1!",_pot_index]] select (_pot_index != 0))};
_actionsList lbAdd _message;
_actionsList ctrlSetScrollValues [1,0];
