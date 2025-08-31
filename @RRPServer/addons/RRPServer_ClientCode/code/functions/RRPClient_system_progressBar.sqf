/*
	
	Filename: 	RRPClient_system_progressBar.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
params [
	["_pos",0,[0]],
	["_type","action",[""]]	
];

if (isNull (GVAR_UINS ["life_progress",displayNull])) then {	
	["life_progress","PLAIN"] call RRPClient_gui_CreateRscLayer;
	((GVAR_UINS ["life_progress",displayNull]) displayCtrl 38201) ctrlSetText format["\rimas_pb\img\%1.paa",_type];
};

_pos = round(_pos * 100);
private _counter = round(_pos / 5);

((GVAR_UINS ["life_progress",displayNull]) displayCtrl 38202) ctrlSetText format["\rimas_pb\counter\%1.paa",_counter];