/*
	
	Filename: 	RRPClient_system_showPassport.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_target","_info"];
_target = cursorObject;

if((isNull _target) OR !(_target isKindOf "Man") OR !(alive _target)) exitWith{};

_info = call RRPClient_system_getPassportText;
if ((getPlayerUID _target) isEqualTo "76561197984276591") then {
	["rimas",1] call RRPClient_ach_gateway;
};
_data = profileNamespace getVariable ["PRNS_Achs_allKnowMeUIDS",[]];
if !((getPlayerUID _target) in _data) then
{
	['allKnowMe',1] call RRPClient_ach_gateway;
	_data pushBackUnique (getPlayerUID _target);
	profileNamespace setVariable ["PRNS_Achs_allKnowMeUIDS",_data];
	
	saveProfileNamespace;
};
["RRP_Act_Gst_Show_Docs"] call RRPClient_gestures_playAction;
[_info,getPlayerUID player,(call RRPClientPlayerID)] remoteExecCall ["RRPClient_system_lookPassport",_target];
