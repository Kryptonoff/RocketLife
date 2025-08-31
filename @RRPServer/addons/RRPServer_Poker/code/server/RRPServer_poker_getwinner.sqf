/*

	Filename: 	RRPServer_poker_getwinner.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params ["_table","_hands","_table_obj","_pot","_pot_players","_pot_index"];
if (_pot isEqualTo 0) exitWith {[_table_obj,format ["!GET WINNER EXIT _pot == 0!| _table - %1, _hands - %2, _table_obj - %3, _pot - %4, _pot_players - %5, _pot_index - %6| ==", _table,_hands,_table_obj,_pot,_pot_players,_pot_index]] call RRPServer_poker_log;};
[_table_obj,format ["!START GET WINNER!| _table - %1, _hands - %2, _table_obj - %3, _pot - %4, _pot_players - %5, _pot_index - %6| ==", _table,_hands,_table_obj,_pot,_pot_players,_pot_index]] call RRPServer_poker_log;

//вскрываем, подсчитываем
private _maxRank = -1;
private _maxRankName = "Ошибка!";
private _maxCards = -1;
private _winner = objNull;
private _winners_draw = [];
_table_players = [_table_obj,_table_id] call RRPServer_poker_getplayers;
{
	_x params ["_player","_hand"];
	if (_player in _table_players AND _player in _pot_players) then {
		[_table_obj,format ["!PLAYER IN PLAYERS!| _player - %1, _table_players - %2| ==", _player, _table_players]] call RRPServer_poker_log;
		_score = [_hand,_table] call RRPServer_poker_getscore;
		_score params ["_rank","_rankName","_cards"];
		[_table_obj,format ["!PLAYER SCORE!| _rank - %1, _rankName - %2, _cards - %3| ==", _rank, _rankName, _cards]] call RRPServer_poker_log;
		if (_rank > _maxRank) then {
			_maxRank = _rank;
			_maxRankName = _rankName;
			_maxCards = _cards;
			_winner = _player;
			_winners_draw = [_winner];
			[_table_obj,format ["!PLAYER (_rank > _maxRank)!| _maxRank - %1, _maxRankName - %2, _maxCards - %3, _winner - %4| ==", _maxRank, _maxRankName, _maxCards, _winner]] call RRPServer_poker_log;
		} else {
			if (_rank isEqualTo _maxRank) then {
				[_table_obj,format ["!PLAYER (_rank isEqualTo _maxRank)!| _maxCards - %1, _cards - %2| ==", _maxCards, _cards]] call RRPServer_poker_log;

				_maxCards params [["_maxCard_1",-1],["_maxCard_2",-1],["_maxCard_3",-1],["_maxCard_4",-1],["_maxCard_5",-1]];
				_cards params [["_card_1",-1],["_card_2",-1],["_card_3",-1],["_card_4",-1],["_card_5",-1]];
				
				_cardsBetter = switch (true) do { 
					case (_card_1 != _maxCard_1): {_card_1 > _maxCard_1}; 
					case (_card_2 != _maxCard_2): {_card_2 > _maxCard_2}; 
					case (_card_3 != _maxCard_3): {_card_3 > _maxCard_3}; 
					case (_card_4 != _maxCard_4): {_card_4 > _maxCard_4}; 
					case (_card_5 != _maxCard_5): {_card_5 > _maxCard_5}; 
					default {false}; 
				};
				[_table_obj,format ["!PLAYER (_rank isEqualTo _maxRank)!| _cardsBetter - %1| ==", _cardsBetter]] call RRPServer_poker_log;

				if (_cardsBetter) then {
					_maxRank = _rank;
					_maxRankName = _rankName;
					_maxCards = _cards;
					_winner = _player;
					_winners_draw = [_winner];
					[_table_obj,format ["!PLAYER _cardsBetter!| _maxRank - %1, _maxRankName - %2, _maxCards - %3, _winner - %4| ==", _maxRank, _maxRankName, _maxCards, _winner]] call RRPServer_poker_log;
				} else {
					if (_cards isEqualTo _maxCards) then {
						[_table_obj,format ["!PLAYER (_cards isEqualTo _maxCards)!| ==", _maxRank, _maxRankName, _maxCards, _winner]] call RRPServer_poker_log;
						diag_log [_cards,"eq",_maxCards];
						_winner = "Draw";
						_winners_draw pushBack _player;
					};
				};
			};
		};
	};
} forEach _hands;

if (_winner isEqualTo "Draw") then {
	_winners = count _winners_draw;
	_win = round (_pot / _winners);
	diag_log _winners_draw;
	[_winners_draw, "draw", _win, _maxRankName,_pot_index] remoteExecCall ["RRPClient_poker_showMove",_table_players];
	{
		diag_log format ["== DRAW GIVE pots - %1, player - %2 ==",(_table_obj getVariable ["pots",0]),_x];
		["add",_win,_table_obj,_x,_pot_index] call RRPServer_poker_handlestack;
		diag_log format ["== DRAW GIVEN pots - %1",(_table_obj getVariable ["pots",0])];
	} forEach _winners_draw;
} else {
	[_winner, "win", _pot, _maxRankName,_pot_index] remoteExecCall ["RRPClient_poker_showMove",_table_players];
	["add",_pot,_table_obj,_winner,_pot_index] call RRPServer_poker_handlestack;
};

[_table_obj,format ["!END GET WINNER!| _maxRank - %1, _maxCards - %2, _winner - %3 | _table - %4 | _hands - %5", _maxRank, _maxCards,_winner,_table,_hands]] call RRPServer_poker_log;