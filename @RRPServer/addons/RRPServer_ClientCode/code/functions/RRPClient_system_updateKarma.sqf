/*

	Filename: 	RRPClient_system_updateKarma.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
private ["_modifier","_amount"];
_modifier = param [0,"",[""]];
_amount = param [1,0,[0]];

switch (_modifier) do {
	case "up": {life_karma = life_karma + _amount};
	case "down": {life_karma = life_karma - _amount};
};

if (life_karma < 0) then {life_karma = 0};
player setVariable ["karma",life_karma,true];
[["life_karma",life_karma,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;