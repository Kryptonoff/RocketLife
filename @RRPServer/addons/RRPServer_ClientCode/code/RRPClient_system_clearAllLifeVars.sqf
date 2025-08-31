/*

	Filename: 	RRPClient_system_clearAllLifeVars.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {};

_unit SVAR ["tf_sendingDistanceMultiplicator",3.0];

[_unit,"steam64id",steamid] call CBA_fnc_setVarNet;
[_unit,"clientID",clientOwner] call CBA_fnc_setVarNet;
[_unit,"unitSide",player call getSide] call CBA_fnc_setVarNet;

{
	[_unit,_x] call RRPClient_system_clearGlobalVar;
} forEach ["draggedBy","robbed","surrender","knoked","reviving","medicStatus","realtitle","realname","slave","pvp","lvl","copLevel","medrank","inPBfight","restrained","inDrink","houseRaid","karma"];

call RRPClient_system_saveGear;