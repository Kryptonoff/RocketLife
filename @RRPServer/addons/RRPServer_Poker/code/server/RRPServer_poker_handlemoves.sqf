/*

	Filename: 	RRPServer_poker_handlemoves.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params ["_table_id","_table_obj","_dealerIndex","_preflop"];
[_table_obj,format ["!START HANDLE MOVES! | _dealerIndex - %1, _preflop - %2",_dealerIndex,_preflop]] call RRPServer_poker_log;

private _raised = false;
private _sidepot_needed = false;
private _firstRound = true;
private _raisedPlayer = objNull;
private _nextPlayer = 0;
private _startingFromIndex = _dealerIndex;

if (_preflop) then {
	_getNextPlayer = [_dealerIndex,_table_id,_table_obj] call RRPServer_poker_getnextplayer;
	_currentPlayer = _getNextPlayer select 0;
	_currentPlayerIndex = _getNextPlayer select 1;
	_current_bet = _table_obj getVariable ["current_bet",0];

	_bet = ["remove",round (_current_bet * 0.5),_table_obj,_currentPlayer] call RRPServer_poker_handlestack;
	[_currentPlayer, "small_b", _bet] remoteExecCall ["RRPClient_poker_showMove",(_table_obj getVariable ["table_players",[]])];

	_getNextPlayer = [_currentPlayerIndex,_table_id,_table_obj] call RRPServer_poker_getnextplayer;
	_currentPlayer = _getNextPlayer select 0;
	_currentPlayerIndex = _getNextPlayer select 1;

	_bet = ["remove",_current_bet,_table_obj,_currentPlayer] call RRPServer_poker_handlestack;
	[_currentPlayer, "big_b", _bet] remoteExecCall ["RRPClient_poker_showMove",(_table_obj getVariable ["table_players",[]])];

	_startingFromIndex = _currentPlayerIndex;
};

private _startingFrom = [_startingFromIndex,_table_id,_table_obj] call RRPServer_poker_getnextplayer;
_table_players = _table_obj getVariable ["table_players",[]];
_startingFrom params ["_currentPlayer","_currentPlayerIndex"];

[_table_obj,format ["!STARTING PLAYER! | _currentPlayer - %1, _currentPlayerIndex - %2",_currentPlayer,_currentPlayerIndex]] call RRPServer_poker_log;

while {true} do {
	if (count _hands == 1) exitWith {[_table_obj,format ["ROUND IS OVER | (count _hands == 1) %1",_hands]] call RRPServer_poker_log};
	if ((_currentPlayer getVariable ["stack",0]) != 0 AND (([_currentPlayer,_hands] call RRPClient_system_index) != -1)) then {
		_betAmount = _table_obj getVariable ["current_bet",0];
	
		[_currentPlayer,_currentPlayerIndex,_betAmount,(_currentPlayer getVariable ["totalBet",0]),_raised,_table_obj,(_currentPlayer getVariable ["stack",0])] remoteExec ["RRPClient_poker_requestMove",_table_players];
		[_table_obj,format ["REQUESTING MOVE | _currentPlayer - %1, _currentPlayerIndex - %2, _betAmount - %3, totalBet - %4, stack - %5 | ==", _currentPlayer,_currentPlayerIndex,_betAmount,(_currentPlayer getVariable ["totalBet",0]),(_currentPlayer getVariable ["stack",0])]] call RRPServer_poker_log;
	
		_timeout = time + 21;
		waitUntil {uiSleep 0.5; !((_currentPlayer getVariable ["madeMove",[]]) isEqualTo []) OR (isNull (_table_obj getVariable [format["%1_player_%2",_table_id,_currentPlayerIndex],objNull])) OR _timeout < time};
		_player_mademove = _currentPlayer getVariable ["madeMove",["default"]];
		[_table_obj,format ["RECEIVING MOVE | _player_mademove - %1, chair - %2",_player_mademove,(_table_obj getVariable [format["%1_player_%2",_table_id,_currentPlayerIndex],objNull])]] call RRPServer_poker_log;

		switch (_player_mademove select 0) do { 
			case "fold" : {
				_hands = _table_obj getVariable ["poker_hands",[]];

				[_table_obj,format ["DELETING HAND | _hands - %1",_hands]] call RRPServer_poker_log;

				_index = [_currentPlayer,_hands] call RRPClient_system_index;
				_hands deleteAt _index;
				_table_obj setVariable ["poker_hands",_hands];
	
				[_table_obj,_hands,"PREFLOP"] remoteExecCall ["RRPClient_poker_showTable",_table_players];
	
				[_table_obj,format ["HAND DELETED | _index - %1",_index]] call RRPServer_poker_log;
				[_currentPlayer, "fold"] remoteExecCall ["RRPClient_poker_showMove",_table_players];
			}; 
			case "check" : {
				[_table_obj,"CHECKING"] call RRPServer_poker_log;
				[_currentPlayer, "check"] remoteExecCall ["RRPClient_poker_showMove",_table_players];
			};
			case "call" : {
				[_table_obj,format ["CALLING | pots - %1, _betAmount = %2 | ==",(_table_obj getVariable ["pots",[]]), _betAmount]] call RRPServer_poker_log;

				_bet = ["remove",(_player_mademove select 1),_table_obj,_currentPlayer] call RRPServer_poker_handlestack;
				[_table_obj,format ["CALLED | pots - %1 | ==",(_table_obj getVariable ["pots",0])]] call RRPServer_poker_log;
				if ((_currentPlayer getVariable ["stack",0]) == 0) then {_sidepot_needed = true;[_table_obj,format ["CREATING SIDE POT FROM CALL | PLAYER - %1",_currentPlayer]] call RRPServer_poker_log};
				
				[_currentPlayer, "call", _bet] remoteExecCall ["RRPClient_poker_showMove",_table_players];
			};
			case "raise" : {
				[_table_obj,format ["RAISING | _raised - %1, _raisedPlayer = %2, pots = %3, totalBet = %4 | ==",_raised, _currentPlayer, (_table_obj getVariable ["pots",[]]), (_currentPlayer getVariable ["totalBet",0])]] call RRPServer_poker_log;
				
				_raised = true;
				_raisedPlayer = _currentPlayer;
				_bet = ["remove",(_player_mademove select 1),_table_obj,_currentPlayer] call RRPServer_poker_handlestack;
				_table_obj setVariable ["current_bet",(_currentPlayer getVariable ["totalBet",0])];
				if ((_currentPlayer getVariable ["stack",0]) == 0) then {_sidepot_needed = true;[_table_obj,format ["CREATING SIDE POT FROM RAISE | PLAYER - %1",_currentPlayer]] call RRPServer_poker_log};

				[_table_obj,format ["RAISED | current_bet - %1, madeMovebet = %2| ==",(_table_obj getVariable ["current_bet",0]), (_player_mademove select 1)]] call RRPServer_poker_log;
				[_currentPlayer, "raise", _bet] remoteExecCall ["RRPClient_poker_showMove",_table_players];
			};
	
			default {
				[_table_obj,format ["DEFAULT MOVE | _timeout - %1, (_timeout < time) = %2 | ==",_timeout, (_timeout < time)]] call RRPServer_poker_log;

				_hands = _table_obj getVariable ["poker_hands",[]];
				
				[_table_obj,format ["DEFAULT MOVE DELETING HAND | _hands - %1 | ==",_hands]] call RRPServer_poker_log;

				_index = [_currentPlayer,_hands] call RRPClient_system_index;
				_hands deleteAt _index;
				_table_obj setVariable ["poker_hands",_hands];
	
				[_table_obj,_hands,"PREFLOP"] remoteExecCall ["RRPClient_poker_showTable",_table_players];
	
				[_table_obj,format ["DEFAULT MOVE HAND DELETED | _index - %1 | ==",_index]] call RRPServer_poker_log;
	
				if (_timeout < time) exitWith {
					[_currentPlayer, "afk"] remoteExecCall ["RRPClient_poker_showMove",_table_players];
					[_table_id,_table_obj,_currentPlayerIndex,"Вы были АФК!"] remoteExec ["RRPClient_poker_leaveTable", _currentPlayer];
					if ((_table_obj getVariable [format["%1_player_%2",_table_id,_currentPlayerIndex],objNull]) isEqualTo _currentPlayer) then {(_table_obj setVariable [format["%1_player_%2",_table_id,_currentPlayerIndex],nil,true])};
				};
				if (isNull (_table_obj getVariable [format["%1_player_%2",_table_id,_currentPlayerIndex],objNull])) exitWith {
					[_currentPlayer, "leave"] remoteExecCall ["RRPClient_poker_showMove",_table_players];
				};
				[_currentPlayer, "defaultfold"] remoteExecCall ["RRPClient_poker_showMove",_table_players];
			}; 
		};
		
		_currentPlayer setVariable ["madeMove",nil,true];
		uiSleep 1;
	} else {[_table_obj,format ["SKIPPING MOVE | _currentPlayer - %1, _currentPlayerIndex = %2, stack = %3, hands index = %4 | ==",_currentPlayer, _currentPlayerIndex,(_currentPlayer getVariable ["stack",0]),([_currentPlayer,_hands] call RRPClient_system_index)]] call RRPServer_poker_log;};

	[_table_obj,format ["ENDING MOVE | _currentPlayer - %1, _currentPlayerIndex = %2 | ==",_currentPlayer, _currentPlayerIndex]] call RRPServer_poker_log;
	if (isNull (_table_obj getVariable [format["%1_player_%2",_table_id,_dealerIndex],objNull])) then {
		[_table_obj,format ["DEALER IS NULL | _dealerIndex - %1, _currentPlayerIndex = %2 | ==",_dealerIndex, _currentPlayerIndex]] call RRPServer_poker_log;
		
		_prevDealerIndex = [(_dealerIndex - 1), 0] select (_dealerIndex > 6);
		_prevDealer = _table_obj getVariable [format["%1_player_%2",_table_id,_prevDealerIndex],objNull];
		while {(isNull _prevDealer OR ((_prevDealer getVariable ["pok_player_status",""]) != "LOADED")) AND (_prevDealerIndex != _dealerIndex)} do {
			_prevDealerIndex = [(_prevDealerIndex - 1), 6] select (_prevDealerIndex < 2);
			_prevDealer = _table_obj getVariable [format["%1_player_%2",_table_id,_prevDealerIndex],objNull];
		};
		_prevDealer setVariable ["dealer",true,true];
		_dealerIndex = _prevDealerIndex;
		_nextDealerIndex = _dealerIndex;
		_currentDealer = _prevDealer;
		[_table_obj,format ["NEW DEALER IS | _dealerIndex - %1, _currentPlayerIndex = %2 | ==",_dealerIndex, _currentPlayerIndex]] call RRPServer_poker_log;
		[_currentDealer, "dealer"] remoteExecCall ["RRPClient_poker_showMove",_table_players];
	};
	if (_startingFromIndex isEqualTo _currentPlayerIndex AND !_raised) exitWith {[_table_obj,format ["ROUND IS OVER | _startingFromIndex == _currentPlayerIndex AND !_raised | ==",_startingFromIndex, _currentPlayerIndex]] call RRPServer_poker_log;};
	_getNextPlayer = [_currentPlayerIndex,_table_id,_table_obj] call RRPServer_poker_getnextplayer;
	if (_currentPlayer isEqualTo (_getNextPlayer select 0)) exitWith {[_table_obj,format ["ROUND IS OVER | (_currentPlayer isEqualTo (_getNextPlayer select 0)) | ==",_currentPlayer, _getNextPlayer]] call RRPServer_poker_log;};
	_currentPlayer = _getNextPlayer select 0;
	_currentPlayerIndex = _getNextPlayer select 1;
	if (_currentPlayer isEqualTo _raisedPlayer) exitWith {[_table_obj,format ["ROUND IS OVER | _currentPlayer == _raisedPlayer | ==",_currentPlayer, _raisedPlayer]] call RRPServer_poker_log;};
};
if (_sidepot_needed) then {
	_pots = _table_obj getVariable ["pots",[]];
	_pots pushBack [0,[]];
	_table_obj setVariable ["pots",_pots];
};
[_table_obj,format ["END HANDLE MOVES | id - %1, _dealerIndex - %2 | ==", _table_id, _dealerIndex]] call RRPServer_poker_log;