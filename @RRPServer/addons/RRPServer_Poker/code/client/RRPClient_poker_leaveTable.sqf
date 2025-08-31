/*

	Filename: 	RRPClient_poker_leaveTable.sqf
	Project: 	Fatum Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://altislife.extremo.club/

*/

params ["_table_id", "_table_obj", ["_player_index",life_poker_index,[-1]], ["_reason","",[""]]];
_display = uiNamespace getVariable ["RRPDialogPoker",displayNull]; 
if !(isNull _display) then {
	_display closeDisplay 1
};

if (!(isNil "PokerTableCamera") AND {!(isNull PokerTableCamera)}) then {
	PokerTableCamera cameraEffect ["terminate", "back"];
	camDestroy PokerTableCamera;
};
if (!(isNil "life_poker_chair") AND {!(isNull life_poker_chair)}) then {
	life_poker_chair setVariable ['occupied',nil,true];
};
player setVariable ['pok_player_status',nil,true];
_table_obj setVariable [(format ["%1_player_%2",_table_id,_player_index]),nil,true];

life_poker_id = -1;
life_poker_index = -1;
life_poker_table = objNull;
life_poker_chair = objNull;
life_poker_accept = false;

private _stack = player getVariable ["stack",0];
if (_stack != 0) then {
	player setVariable ["stack",0,true];
	[player,"atm","add",_stack] remoteExecCall ["RRPServer_system_moneyChange",2];
	_reason = _reason + format["<br/>На ваш банковский счет был переведен остаток вашего стека - $%1",[_stack] call RRPClient_util_numberText];
};

call RRPClient_actions_chairSitingUp;

["Покер",_reason] call toastInfo;
