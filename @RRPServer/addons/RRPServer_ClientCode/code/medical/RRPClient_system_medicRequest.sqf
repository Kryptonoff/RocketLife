/*
	Filename: 	RRPClient_system_medicRequest.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_caller","_callerName"];
_caller = param [0,ObjNull,[ObjNull]];
_callerName = param [1,"Unknown Player",[""]];
if (isNull _caller) exitWith {};

player reveal _caller;

["MedicalRequestEmerg",[format["%1 вызывает медика",_callerName]]] call BIS_fnc_showNotification;