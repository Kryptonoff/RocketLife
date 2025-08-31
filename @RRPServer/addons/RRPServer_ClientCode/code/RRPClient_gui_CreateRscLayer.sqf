/*

	Filename: 	RRPClient_gui_CreateRscLayer.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
params [
	["_resource","",[""]],
	["_type","PLAIN",[""]],
	["_speed",0,[0]],
	["_showOnMap",false,[false]]
];

if ([_resource] call RRPClient_gui_HasDisplay) then {
	[_resource] call RRPClient_gui_DestroyRscLayer;
};

(_resource call BIS_fnc_rscLayer) cutRsc [_resource,_type,_speed,_showOnMap];