/*
	
	Filename: 	RRPClient_system_searchClient.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _cop = param [0,Objnull,[objNull]];
if (isNull _cop) exitWith {};

private _inv = [];
private "_val";
{	
	_val = ITEM_VALUE(_x select 0);
	if (_val > 0) then {
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call RRPClient_system_handleInv;
	};
} foreach RRPPublicEconomyIlegalItems;

private _dcash = 0;
if (DCASH > 0) then {
	_dcash = DCASH;	
	[[player,"dcash","drop",DCASH],"system_moneyChange"] call RRPClient_system_hcExec;

	
	_log = format ["searchClient: dcash (drop) %3 to NAME:%1 (%2)",name player,steamid,_value];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
};

life_tempHouses = [];
[player,_inv,_dcash] remoteExecCall ["RRPClient_system_copSearch",_cop];