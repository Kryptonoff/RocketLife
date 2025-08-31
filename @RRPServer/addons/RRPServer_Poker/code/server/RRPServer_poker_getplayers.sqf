/*

	Filename: 	RRPServer_poker_getplayers.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params ["_table_obj","_table_id"];
private _players = [];
for "_i" from 1 to 6 do {
	_player = _table_obj getVariable [format["%1_player_%2",_table_id,_i],objNull];
	if (!(isNull _player)) then {_players pushBack _player};
};

_players