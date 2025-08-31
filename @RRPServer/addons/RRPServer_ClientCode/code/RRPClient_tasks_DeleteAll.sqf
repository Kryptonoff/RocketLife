/*

	Filename: 	RRPClient_tasks_DeleteAll.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _tasks = [player] call BIS_fnc_tasksUnit;
{
	format["Task %1 deleted",_x] call RRPClient_system_log;
	[_x] call BIS_fnc_deleteTask;
} forEach _tasks;