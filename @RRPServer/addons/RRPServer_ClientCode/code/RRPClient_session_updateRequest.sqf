/*

	Filename: 	RRPClient_session_updateRequest.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
if (isNil "life_loading_completed") exitWith {};
if !(life_loading_completed) exitWith {};

[4] call RRPClient_session_updatePartial;
private _packet = [steamid,player call getSide];

call RRPClient_system_saveGear;

_packet pushBack life_tmp_tax;
_packet pushBack life_tmp_selled;
['nalog',life_tmp_tax] call RRPClient_ach_gateway;
life_tmp_tax = 0;
life_tmp_selled = [];

[_packet,"session_updateRequest"] call RRPClient_system_hcExec;
