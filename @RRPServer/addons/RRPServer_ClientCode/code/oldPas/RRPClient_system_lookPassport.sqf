/*

	Filename: 	RRPClient_system_lookPassport.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP
	
*/
#include "..\..\script_macros.hpp"
private["_info","_pid","_indexInIds"];

_info = param [0,"",[""]];
_pid = param [1,"",[""]];
_PassID = _this select 2;

_indexInIds = [_pid,life_ids] call RRPClient_system_index;

if (_indexInIds isEqualTo -1) then {
	life_ids pushBack [_pid,time];
} else {
	life_ids set [_indexInIds,[_pid,time]];
};


private _data = profileNamespace getVariable ["PRNS_Achs_iKnowAll",[]];
if !(_PassID in _data) then
{
	['iKnowAll',1] call RRPClient_ach_gateway;
	_data pushBackUnique _PassID;
	profileNamespace setVariable ["PRNS_Achs_iKnowAll",_data];
	saveProfileNamespace;
};

hintSilent parseText (_this select 0);
