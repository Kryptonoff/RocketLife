/*

	Filename: 	RRPServer_poker_getscore.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/
	
	[[[14, "D"],[9, "D"],[7, "H"],[5, "H"],[4, "D"]],[[3, "D"],[2, "H"]]] call RRPServer_poker_getscore
*/
params [
	["_hand",[],[[]]],
	["_table",[],[[]]]
];
private _game_cards = _hand + _table; //hand + table // [14, "D"],[9, "D"],[7, "H"],[5, "H"],[4, "D"],[3, "D"],[2, "H"]
_game_cards sort false;
_hand sort false;

private _checkStraightFlush = {
	private _return = [0,0];
	private _cards_array = _this;
	private _ace_selection = [14,_cards_array] call RRPClient_system_index;
	if (_ace_selection != -1) then {_cards_array = _cards_array + [[1,(_cards_array select _ace_selection) select 1]]};
	{
		_card = _x select 0;
		_suit = _x select 1;
		_amount = 0;
		_nextCard = 0;
		{
			_nextCard = _nextCard + 1;
			_amount = _amount + 1;
			if (_cards_array findIf {_x isEqualTo [(_card - _nextCard),_suit]} isEqualTo -1) exitWith {};
			if (_amount isEqualTo 5) exitWith {};
		} forEach _cards_array;

		if (_amount isEqualTo 5) exitWith {_return = [9,"Стрит-Флэш",_card]};

	} forEach _cards_array;

	_return
};//стрит-флеш 9

private _checkFourOfAKind = {
	private _return = [0,0];
	private _quadrupletCard = -1;
	{
		_card = _x select 0;
		_count = {(_x select 0) isEqualTo _card} count _this;

		if (_count isEqualTo 4) exitWith {_quadrupletCard = _card};
	} forEach _this;

	if (_quadrupletCard isEqualTo -1) exitWith {[0,0]};

	
	{
		if ((_x select 0) != _quadrupletCard) exitWith {_return = [8,"Каре",[_quadrupletCard,(_x select 0)]]};
	} forEach _this;

	_return
};//каре 8

private _checkFullHouse = {
	private _return = [0,0];
	private _tripletCard = -1;
	{
		_card = _x select 0;
		_count = {(_x select 0) isEqualTo _card} count _this;

		if (_count isEqualTo 3) exitWith {_tripletCard = _card};
	} forEach _this;

	if (_tripletCard isEqualTo -1) exitWith {[0,0]};

	{
		_card = _x select 0;
		if (_card != _tripletCard) then {
			_count = {(_x select 0) isEqualTo _card} count _this;

			if (_count > 1) exitWith {_return = [7,"Фулл-хаус",[_tripletCard,_card]]};
		};
	} forEach _this;

	_return
};//фул-хаус 7

private _checkFlush = {
	private _return = [0,0];
	private _flushSuit = "";
	{
		private _suit = _x select 1;
		_amount = {_x select 1 == _suit} count _this;
		if (_amount > 4) exitWith {_flushSuit = _suit};
	} forEach _this;

	if (_flushSuit isEqualTo "") exitWith {[0,0]};

	private _cards = [];
	{
		if ((_x select 1) == _flushSuit) then {_cards pushBack (_x select 0)};
		if (count _cards >= 5) exitWith {_return = [6,"Флэш",_cards]};
	} forEach _this;

	_return
};//флэш 6

private _checkStraight = {
	private _return = [0,0];
	private _cards_array = _this;
	private _ace_selection = [14,_cards_array] call RRPClient_system_index;
	if (_ace_selection != -1) then {_cards_array = _cards_array + [[1,(_cards_array select _ace_selection) select 1]]};
	{
		_card = _x select 0;
		_amount = 0;
		_nextCard = 0;
		{
			_nextCard = _nextCard + 1;
			_amount = _amount + 1;
			if (_cards_array findIf {(_x select 0) isEqualTo (_card - _nextCard)} isEqualTo -1) exitWith {};
			if (_amount isEqualTo 5) exitWith {};
		} forEach _cards_array;

		if (_amount isEqualTo 5) exitWith {_return = [5,"Стрит",_card]};

	} forEach _cards_array;

	_return
};//стрит 5

private _checkThreeOfAKind = {
	private _return = [0,0];
	private _tripletCard = -1;
	{
		_card = _x select 0;
		_count = {(_x select 0) isEqualTo _card} count _this;

		if (_count isEqualTo 3) exitWith {_tripletCard = _card};
	} forEach _this;

	if (_tripletCard isEqualTo -1) exitWith {[0,0]};

	private _cards = [_tripletCard];
	{
		if ((_x select 0) != _tripletCard) then {_cards pushBack (_x select 0)};
		if (count _cards >= 3) exitWith {_return = [4,"Сет",_cards]};
	} forEach _this;

	_return
};//сет 4

private _checkTwoPair = {
	private _return = [0,0];
	private _firstPairCard = -1;
	{
		_card = _x select 0;
		_count = {(_x select 0) isEqualTo _card} count _this;

		if (_count isEqualTo 2) exitWith {_firstPairCard = _card};
	} forEach _this;
	
	if (_firstPairCard isEqualTo -1) exitWith {[0,0]};

	private _secondPairCard = -1;
	{
		_card = _x select 0;
		_count = {(_x select 0) isEqualTo _card && _card != _firstPairCard} count _this;
	
		if (_count isEqualTo 2) exitWith {_secondPairCard = _card};
	} forEach _this;
	
	if (_secondPairCard isEqualTo -1) exitWith {[0,0]};
		
	{
		if !((_x select 0) in [_firstPairCard,_secondPairCard]) exitWith {_return = [3,"Две пары",[_firstPairCard,_secondPairCard,(_x select 0)]]};
	} forEach _this;

	_return
};//две пары 3

private _checkOnePair = {
	private _return = [0,0];
	private _pairCard = -1;
	{
		_card = _x select 0;
		_count = {(_x select 0) isEqualTo _card} count _this;

		if (_count isEqualTo 2) exitWith {_pairCard = _card};
	} forEach _this;
	

	if (_pairCard isEqualTo -1) exitWith {[0,0]};

	private _cards = [_pairCard];
	{
		if ((_x select 0) != _pairCard) then {_cards pushBack (_x select 0)};
		if (count _cards >= 4) exitWith {_return = [2,"Одна пара",_cards]};
	} forEach _this;
	_return
};//пара 2 

private _checkHighCard = {
	[1,"Старшая карта",[(_hand select 0) select 0,(_hand select 1) select 0]]
};//высшая карта 1

_result = _game_cards call _checkStraightFlush;
if !(_result isEqualTo [0,0]) exitWith {_result};

_result = _game_cards call _checkFourOfAKind;
if !(_result isEqualTo [0,0]) exitWith {_result};

_result = _game_cards call _checkFullHouse;
if !(_result isEqualTo [0,0]) exitWith {_result};

_result = _game_cards call _checkFlush;
if !(_result isEqualTo [0,0]) exitWith {_result};

_result = _game_cards call _checkStraight;
if !(_result isEqualTo [0,0]) exitWith {_result};

_result = _game_cards call _checkThreeOfAKind;
if !(_result isEqualTo [0,0]) exitWith {_result};

_result = _game_cards call _checkTwoPair;
if !(_result isEqualTo [0,0]) exitWith {_result};

_result = _game_cards call _checkOnePair;
if !(_result isEqualTo [0,0]) exitWith {_result};

_result = _game_cards call _checkHighCard;
if !(_result isEqualTo [0,0]) exitWith {_result};

[0,0]