/*

	Filename: 	RRPClient_system_plateColor.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
_target = cursorTarget;
_dbInfo = _target getVariable ["dbInfo",[]];
if (isNull cursorTarget) exitwith {};
if (!alive cursorTarget) exitwith {};

if (EQUAL(_dbInfo,[])) exitWith {};
_ret = format ["<t align='center' size='1.5'>Номер транспортного средства: <br/></t><t align='center' color='#FFD700' size='1.25'> %1</t>",_dbInfo select 1];
[_ret] call hints;
