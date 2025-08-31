/*

	Filename: 	RRPServer_poker_handlestack.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/
params [
	["_modifier","",[""]],
	["_amount",0,[0]],
	["_table_obj",objNull,[objNull]],
	["_player",objNull,[objNull]],
	["_pot_index",-1,[-1]]
];
[_table_obj,format ["HANDLING STACK | _modifier - %1, _amount - %2, _player - %3, totalbet - %4, pots - %5, _pot_index - %6| ==", _modifier, _amount, _player, (_player getVariable ["totalBet",0]),(_table_obj getVariable ["pots",[]]),_pot_index]] call RRPServer_poker_log;

private _stack = _player getVariable ["stack",0];
private _pots = _table_obj getVariable ["pots",[]];
private _current_pot_selection = [((count _pots) - 1),_pot_index] select (_pot_index != -1);
private _pot = (_pots select _current_pot_selection) select 0;
private _pot_players = (_pots select _current_pot_selection) select 1;

switch (_modifier) do { 
	case "add" : {
		_player setVariable ["stack",(_stack + _amount),true];

		_pot = _pot - _amount;
		_pot_players = [];
	}; 
	case "remove" : {
		if (_amount >= _stack) then {
			_amount = _stack;
			[_player, "allin", _amount] remoteExecCall ["RRPClient_poker_showMove",(_table_obj getVariable ["table_players",[]])];
		};
		_player setVariable ["totalBet",((_player getVariable ["totalBet",0]) + _amount)];
		_player setVariable ["stack",(_stack - _amount),true];
		_pot = _pot + _amount;
		if !(_player in _pot_players) then {_pot_players pushBack _player};
	}; 
	default {};
};
_pots set [_current_pot_selection,[_pot,_pot_players]];
_table_obj setVariable ["pots",_pots];
[_table_obj,format ["STACK HANDLED | _stack (old) - %1, _stack (new) - %2, _amount - %3, _player - %4, totalBet - %5, pots - %6, _pot_index - %7| ==", _stack, (_player getVariable ["stack",0]), _amount, _player, (_player getVariable ["totalBet",0]),(_table_obj getVariable ["pots",[]]),_pot_index]] call RRPServer_poker_log;

[_player,_pot,_pots] remoteExecCall ["RRPClient_poker_showStack",(_table_obj getVariable ["table_players",[]])];

_amount