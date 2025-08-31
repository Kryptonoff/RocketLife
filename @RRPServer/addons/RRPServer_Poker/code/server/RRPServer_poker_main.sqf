/*

	Filename: 	RRPServer_poker_main.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params [
	["_table_id","",[""]],
	["_table_obj",objNull,[objNull]],
	["_table_bet",100,[100]],
	["_nextDealerIndex",-1,[-1]]
];
private _game_id = format["%1|#%2",_table_id,round random 999999];
_table_obj setVariable ["poker_game_id",_game_id];
[_table_obj,format ["!START POKER MAIN! | _table_bet - %1, _nextDealerIndex - %2",_table_bet,_nextDealerIndex]] call RRPServer_poker_log;

_table_players = [_table_obj,_table_id] call RRPServer_poker_getplayers;
{if (_x getVariable ["stack",0] isEqualTo 0) then {[_table_id,_table_obj,nil,"Вы проиграли стэк!"] remoteExec ["RRPClient_poker_leaveTable", _x]}} forEach _table_players;

waitUntil {
	uiSleep 0.5;
	_table_players = [_table_obj,_table_id] call RRPServer_poker_getplayers;
	_allPlayers = {((_x getVariable ["pok_player_status",""]) != "OFFER")} count _table_players;

	(_allPlayers > 1)
};

_loadedPlayers = {((_x getVariable ["pok_player_status",""]) isEqualTo "LOADED")} count _table_players;
if (_loadedPlayers != (count _table_players)) then {
	for "_i" from 20 to 1 step -1 do {
		_table_players = [_table_obj,_table_id] call RRPServer_poker_getplayers;
		_allPlayers = count _table_players;
		_loadedPlayers = {((_x getVariable ["pok_player_status",""]) in ["LOADED","READY"])} count _table_players;
		if (_allPlayers == _loadedPlayers) exitWith {};
			
		_table_obj setVariable ["poker_status",_i,true];
		uiSleep 1;
	};
};
{if !((_x getVariable ["pok_player_status",""]) in ["LOADED","READY"]) then {[_table_id,_table_obj,nil,"Вы не подтвердили участие!"] remoteExec ["RRPClient_poker_leaveTable", _x]}} forEach _table_players;
_table_players = [_table_obj,_table_id] call RRPServer_poker_getplayers;
if (({(_x getVariable ["pok_player_status",""]) in ["LOADED","READY"]} count _table_players) < 2) exitWith {_this spawn RRPServer_poker_main};

_table_obj setVariable ["poker_status","START",true];
waitUntil {
	uiSleep 0.5;
	_table_players = [_table_obj,_table_id] call RRPServer_poker_getplayers;
	(({(_x getVariable ["pok_player_status",""]) isEqualTo "LOADED"} count _table_players) == (count _table_players))
};
_table_obj setVariable ["poker_status","PLAYING",true];
//Hearts - червы, Diamonds - бубны, Spades - пики, Clubs - трефы
private _cards = [
	[14, "H"], [14, "D"], [14, "S"], [14, "C"], //Туз
	[13, "H"], [13, "D"], [13, "S"], [13, "C"], //Король
	[12, "H"], [12, "D"], [12, "S"], [12, "C"], //Дама
	[11, "H"], [11, "D"], [11, "S"], [11, "C"], //Валет
	[10, "H"], [10, "D"], [10, "S"], [10, "C"], //10
	[9, "H"], [9, "D"], [9, "S"], [9, "C"],
	[8, "H"], [8, "D"], [8, "S"], [8, "C"],
	[7, "H"], [7, "D"], [7, "S"], [7, "C"],
	[6, "H"], [6, "D"], [6, "S"], [6, "C"],
	[5, "H"], [5, "D"], [5, "S"], [5, "C"],
	[4, "H"], [4, "D"], [4, "S"], [4, "C"],
	[3, "H"], [3, "D"], [3, "S"], [3, "C"],
	[2, "H"], [2, "D"], [2, "S"], [2, "C"]
];
_table_players = [_table_obj,_table_id] call RRPServer_poker_getplayers;
{_x setVariable ["totalBet",0]; _x setVariable ["dealer",false,true]; _x setVariable ["madeMove",nil,true];} forEach _table_players;
_table_obj setVariable ["current_bet",_table_bet];
_table_obj setVariable ["pots",[[0,[]]]];
_table_obj setVariable ["table_players",_table_players];

//раздача карт, выкладываем 5 закрытых на стол
private _table = [];
for "_i" from 0 to 4 do {
	_index = floor random ((count _cards) - 1);
	_table pushBack (_cards select _index);
	_cards deleteAt _index;
};
private _hands = [];
{
	_handReturn = [_x];
	_hand = [];
	for "_i" from 0 to 1 do {
		_index = floor random ((count _cards) - 1);
		_hand pushBack (_cards select _index);
		_cards deleteAt _index;
	};
	/*_hand = switch (_forEachIndex) do { 
		case 0 : {[[8, "C"],[8, "S"]]}; 
		case 1 : {[[5, "C"],[9, "C"]]}; 
		default {}; 
	};*/
	_handReturn pushBack _hand;
	_hands pushBack _handReturn;
} forEach _table_players;
_table_obj setVariable ["poker_hands",_hands];

_getDealer = [_nextDealerIndex,_table_id,_table_obj] call RRPServer_poker_getnextplayer;
_currentDealer = _getDealer select 0;
_nextDealerIndex = _getDealer select 1;
_currentDealer setVariable ["dealer",true,true];
[_table_obj,format ["DEALER IS %1, _nextDealerIndex = %2",_currentDealer, _nextDealerIndex]] call RRPServer_poker_log;

[_currentDealer, "dealer"] remoteExecCall ["RRPClient_poker_showMove",_table_players];
[_currentDealer, "gameid", _game_id] remoteExecCall ["RRPClient_poker_showMove",_table_players];

//вскрывем карты игроков
[_table_obj,"===== SHOWING PREFLOP ====="] call RRPServer_poker_log;
[_table,_hands,"PREFLOP"] remoteExecCall ["RRPClient_poker_showTable",_table_players];

//первый круг ставок
[_table_obj,"===== PREFLOP BETS ====="] call RRPServer_poker_log;
[_table_id,_table_obj,_nextDealerIndex,true] call RRPServer_poker_handleMoves;
if ((count _hands == 1) OR (count _table_players == 1) OR ({_x getVariable ["stack",0] != 0} count _table_players < 2)) exitWith {
	[_table,_hands,_nextDealerIndex,_table_obj,_this] call RRPServer_poker_end;
	[_table_obj,format["===== END POKER MAIN count _hands = %1, count _table_players = %2, count stack players = %3 =====",(count _hands),(count _table_players),({_x getVariable ["stack",0] != 0} count _table_players)]] call RRPServer_poker_log;
};

//вскрывем первые три карты
[_table_obj,"===== SHOWING FLOP ====="] call RRPServer_poker_log;
[_table,_hands,"FLOP"] remoteExecCall ["RRPClient_poker_showTable",_table_players];//[[массив карт столв],[[игрок,[его карты]],[игрок,[его карты]],[игрок,[его карты]]]]

//второй круг ставок
[_table_obj,"===== TURN BETS ====="] call RRPServer_poker_log;
[_table_id,_table_obj,_nextDealerIndex,false] call RRPServer_poker_handleMoves;
if ((count _hands == 1) OR (count _table_players == 1) OR ({_x getVariable ["stack",0] != 0} count _table_players < 2)) exitWith {
	[_table,_hands,_nextDealerIndex,_table_obj,_this] call RRPServer_poker_end;
	[_table_obj,format["===== END POKER MAIN count _hands = %1, count _table_players = %2, count stack players = %3 =====",(count _hands),(count _table_players),({_x getVariable ["stack",0] != 0} count _table_players)]] call RRPServer_poker_log;
};

//вскрываем 4ю
[_table_obj,"===== SHOWING TURN ====="] call RRPServer_poker_log;
[_table,_hands,"TURN"] remoteExecCall ["RRPClient_poker_showTable",_table_players];

//третий круг ставок
[_table_obj,"===== RIVER BETS ====="] call RRPServer_poker_log;
[_table_id,_table_obj,_nextDealerIndex,false] call RRPServer_poker_handleMoves;
if ((count _hands == 1) OR (count _table_players == 1) OR ({_x getVariable ["stack",0] != 0} count _table_players < 2)) exitWith {
	[_table,_hands,_nextDealerIndex,_table_obj,_this] call RRPServer_poker_end;
	[_table_obj,format["===== END POKER MAIN count _hands = %1, count _table_players = %2, count stack players = %3 =====",(count _hands),(count _table_players),({_x getVariable ["stack",0] != 0} count _table_players)]] call RRPServer_poker_log;
};

//вскрываем 5ю, river
[_table_obj,"===== SHOWING RIVER ====="] call RRPServer_poker_log;
[_table,_hands,"RIVER"] remoteExecCall ["RRPClient_poker_showTable",_table_players];

//последний круг ставок
[_table_obj,"===== FINAL BETS ====="] call RRPServer_poker_log;
[_table_id,_table_obj,_nextDealerIndex,false] call RRPServer_poker_handleMoves;

[_table,_hands,_nextDealerIndex,_table_obj,_this] call RRPServer_poker_end;