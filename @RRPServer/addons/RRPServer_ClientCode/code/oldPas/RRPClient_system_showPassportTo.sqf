/*
	
	Filename: 	RRPClient_system_showPassportTo.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_info","_ret"];
_ret = param [0,ObjNull,[ObjNull]];

if (isNull _ret) exitWith {};

_info = call RRPClient_system_getPassportText;
_data = profileNamespace getVariable ["PRNS_Achs_allKnowMeUIDS",[]];
if !(getPlayerUID _ret in _data) then
{
	['allKnowMe',1] call RRPClient_ach_gateway;
	_data pushBackUnique (getPlayerUID _ret);
	profileNamespace setVariable ["PRNS_Achs_allKnowMeUIDS",_data];
	saveProfileNamespace;
};
[_info,steamid,(call RRPClientPlayerID)] remoteExecCall ["RRPClient_system_lookPassport",_ret];
