/*

	Filename: 	RRPServer_poker_getnextplayer.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params ["_currentPlayerIndex","_table_id","_table_obj"];
private _hands = _table_obj getVariable ["poker_hands",[]];
[_table_obj,format ["GETTING NEXT PLAYER | _currentPlayerIndex - %1, _hands - %2",_currentPlayerIndex,_hands]] call RRPServer_poker_log;

_nextPlayerIndex = [(_currentPlayerIndex + 1), 1] select (_currentPlayerIndex > 5);
_nextPlayer = _table_obj getVariable [format["%1_player_%2",_table_id,_nextPlayerIndex],objNull];

while {(isNull _nextPlayer OR ((_nextPlayer getVariable ["pok_player_status",""]) != "LOADED")) AND (_nextPlayerIndex != _currentPlayerIndex)} do {
	_nextPlayerIndex = [(_nextPlayerIndex + 1), 1] select (_nextPlayerIndex > 5);
	_nextPlayer = _table_obj getVariable [format["%1_player_%2",_table_id,_nextPlayerIndex],objNull];
};

[_table_obj,format ["NEXT PLAYER IS | _nextPlayer - %1, _nextPlayerIndex - %2",_nextPlayer,_nextPlayerIndex]] call RRPServer_poker_log;

_table_obj setVariable ["table_players",([_table_obj,_table_id] call RRPServer_poker_getplayers)];

[_nextPlayer,_nextPlayerIndex]
