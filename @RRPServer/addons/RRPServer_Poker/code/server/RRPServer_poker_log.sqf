/*

	Filename: 	RRPServer_poker_log.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params ["_table_obj","_log"];
private _game_id = _table_obj getVariable ["poker_game_id",-1];

diag_log format ["[POKERLOG %1] - %2",_game_id,_log];