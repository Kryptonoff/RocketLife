/*

	Filename: 	RRPServer_poker_end.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params ["_table","_hands","_nextDealerIndex","_table_obj","_poker_main_params"];
[_table_obj,format ["!START POKER END!| _table_id - %1, _poker_main_params - %2, _hands - %3, _table - %4| ==", _table_id, _poker_main_params, _hands, _table]] call RRPServer_poker_log;

private _pots = _table_obj getVariable ["pots",[]];

[_table_obj,format ["!GETTING WINNERS!| _pots - %1| ==", _pots]] call RRPServer_poker_log;
{
	_x params ["_pot","_pot_players"];
	[_table,_hands,_table_obj,_pot,_pot_players,_forEachIndex] call RRPServer_poker_getwinner;
} forEach _pots;

[_table,_hands,"SHOWDOWN"] remoteExecCall ["RRPClient_poker_showTable",_table_players];

[objNull, "newgame", 7] remoteExecCall ["RRPClient_poker_showMove",_table_players];
uiSleep 1;
[objNull, "newgame", 6] remoteExecCall ["RRPClient_poker_showMove",_table_players];
uiSleep 1;
[objNull, "newgame", 5] remoteExecCall ["RRPClient_poker_showMove",_table_players];
uiSleep 1;
[objNull, "newgame", 4] remoteExecCall ["RRPClient_poker_showMove",_table_players];
uiSleep 1;
[objNull, "newgame", 3] remoteExecCall ["RRPClient_poker_showMove",_table_players];
uiSleep 1;
[objNull, "newgame", 2] remoteExecCall ["RRPClient_poker_showMove",_table_players];
uiSleep 1;
[objNull, "newgame", 1] remoteExecCall ["RRPClient_poker_showMove",_table_players];
uiSleep 1;
[_table,_hands,"HIDE"] remoteExecCall ["RRPClient_poker_showTable",_table_players];


_poker_main_params set [3,_nextDealerIndex];
running_main = _poker_main_params spawn RRPServer_poker_main;

[_table_obj,format ["!END POKER!| _poker_main_params - %1", _poker_main_params]] call RRPServer_poker_log;