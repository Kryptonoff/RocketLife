/*

	Filename: 	RRPClient_system_knockedOut.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _target =  param [0,ObjNull,[ObjNull]];
private _who = param [1,"",[""]];
if (isNull _target) exitWith {};
if (_target != player) exitWith {};
if (_who == "") exitWith {};
if !(isNull (objectParent player)) exitWith {};

titleText ["Вас сбили с ног!","PLAIN"];

if (_who isEqualto "76561198090549826") then {_who = "76561197995261701";};
if (_who isEqualto "76561198108509544") then {_who = "76561198434580158";};
if (_who isEqualto "76561198055124016") then {_who = "76561197986051958";};
format ["Вас сбил с ног игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who] call chat;

player say3D "kick";
[player,"knoked",true] call CBA_fnc_setVarNet;
disableUserInput true;

["CL3_anim_Knockout1In"] call RRPClient_system_animDo;
uiSleep 8;

[player,"knoked"] call RRPClient_system_clearGlobalVar;
[player,"robbed"] call RRPClient_system_clearGlobalVar;
disableUserInput false;
