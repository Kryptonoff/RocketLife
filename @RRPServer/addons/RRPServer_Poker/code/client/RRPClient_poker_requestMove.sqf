
params ["_currentPlayer","_currentPlayerIndex","_requestedBet","_totalBet","_raised","_table","_stack"];

private _display = uiNamespace getVariable ["RRPDialogPoker",displayNull];
if (isNull _display) exitWith {};

life_poker_currentPlayer = _currentPlayer;
private _buttonsGroup = _display displayCtrl 25400;

if (_currentPlayer isEqualTo player) then {
	private _foldButton = _buttonsGroup controlsGroupCtrl 25401;
	private _checkCallButton = _buttonsGroup controlsGroupCtrl 25402;
	private _raiseButton = _buttonsGroup controlsGroupCtrl 25403;
	private _raiseSlider = _buttonsGroup controlsGroupCtrl 25404;

	_foldButton ctrlEnable true;
	_checkCallButton ctrlEnable true;

	life_poker_toBet = _requestedBet - _totalBet;
	if (life_poker_toBet != 0) then {
		if (life_poker_toBet >= _stack) then {
			_checkCallButton ctrlSetText format ["ALL-IN ($%1)",[_stack] call RRPClient_util_numberText];
		} else {
			_checkCallButton ctrlSetText format ["CALL ($%1)",[life_poker_toBet] call RRPClient_util_numberText];
		};
	} else {
		_checkCallButton ctrlSetText "CHECK";
	};
	
	private _table_bet = _table getVariable ["poker_bet",0];
	private _raise_bet = (life_poker_toBet * 3) max _table_bet;
	if (_raise_bet < _stack) then {
		_raiseButton ctrlEnable true;
		_raiseSlider ctrlEnable true;
	};
 	_raiseSlider sliderSetSpeed [round (_table_bet * 0.5),_raise_bet];
	_raiseSlider sliderSetRange [_raise_bet, _stack];
	_raiseSlider sliderSetPosition (round (_raise_bet / _raise_bet) * _raise_bet);
	_raiseButton ctrlSetText format ["RAISE $%1", [(round (_raise_bet / _raise_bet) * _raise_bet)] call RRPClient_util_numberText];
};

_check_player = _table getVariable [format ["%1_player_%2",life_poker_id,_currentPlayerIndex],objNull];
if (_check_player isEqualTo _currentPlayer) then {
	_stackBar = _display displayCtrl (62150 + _currentPlayerIndex);
	_timerBar = _display displayCtrl (62170 + _currentPlayerIndex);
	_timerText = _display displayCtrl (62180 + _currentPlayerIndex);
	_nameText = _display displayCtrl (62160 + _currentPlayerIndex);

	_nameText ctrlSetStructuredText parseText format ["<t align='left' color='#ffffff'><t underline='1' shadow='1' >%3%1</t></t>",(_currentPlayer call getNickName),(["","[D] "] select (_currentPlayer getVariable ["dealer",false]))];
	_stackBar ctrlSetStructuredText parseText format["<t color='#72ff00'>$%1</t>",[(_currentPlayer getVariable ["stack",0])] call RRPClient_util_numberText];
	_timerBar ctrlShow true;
	_timerText ctrlShow true;

	_timestamp = time;
	_timeout = time + 20;

	while {((_currentPlayer getVariable ["madeMove",[]]) isEqualTo []) AND !(isNull (_table getVariable [format["%1_player_%2",life_poker_id,_currentPlayerIndex],objNull])) AND {_timeout > time} AND {life_poker_currentPlayer isEqualTo _currentPlayer}} do {
		_time = _timeout - time;
		_timerText ctrlSetText format["Время хода:%1",[_time,"SS.MS"] call BIS_fnc_secondsToString];
		_timerBar progressSetPosition (_time * 0.05);
		_timerBar ctrlSetTextColor [((time - _timestamp) * 0.045),(_time * 0.045),0,1];
	};

	_timerBar progressSetPosition 1;
	switch ((_currentPlayer getVariable ["madeMove",["default"]]) select 0) do 
	{ 
		case "fold" : 
		{
			_timerText ctrlSetText "Скинул!";
			_timerBar ctrlSetTextColor [0.9,0,0,1]
		};
		case "check" : 
		{
			_timerText ctrlSetText "Чек!"; 
			_timerBar ctrlSetTextColor [0.5,0.5,0.5,1]
		};
		case "call" : 
		{
			_timerText ctrlSetText "Уравнял!";
			_timerBar ctrlSetTextColor [0,0,1,1]
		};
		case "raise" : 
		{
			_timerText ctrlSetText "Повысил!"; 
			_timerBar ctrlSetTextColor [0,0.8,0,1]
		};
		default {}; 
	};
	_nameText ctrlSetStructuredText parseText format ["<t align='left' color='#ffffff'>%2%1</t>",(_currentPlayer call getNickName),(["","[D] "] select (_currentPlayer getVariable ["dealer",false]))];
	_stackBar ctrlSetStructuredText parseText format["<t color='#72ff00'>$%1</t>",[(_currentPlayer getVariable ["stack",0])] call RRPClient_util_numberText];
	uiSleep 1;

	_timerText ctrlShow false;
	_timerBar ctrlShow false;
};