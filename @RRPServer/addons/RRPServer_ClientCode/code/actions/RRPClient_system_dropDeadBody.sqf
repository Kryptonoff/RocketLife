/*
	
	Filename: 	RRPClient_system_dropDeadBody.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
if (isNull life_DraggedBody) exitWith {};

detach life_DraggedBody;
player removeWeapon "EXT_FakePrimaryWeapon";
if (NOTINVEH(player) && !(call RRPClient_system_isInterrupted)) then {	
	call RRPClient_system_animDo;
};

[life_DraggedBody,"draggedBy"] call RRPClient_system_clearGlobalVar;
[life_DraggedBody,"unconsciousrevivedefault"] remoteExecCall ["RRPClient_system_animSync",RCLIENT];

life_DraggedBody = ObjNull;

player removeAction life_actions_drag;