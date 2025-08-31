/*

	Filename: 	RRPClient_system_say3D.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\..\script_macros.hpp"
private["_object","_sound"];
_object = param [0,ObjNull,[ObjNull]];
_sound = param [1,"",[""]];

if(isNull _object OR _sound == "") exitWith {};
if (_object distance player > 10) exitWith {};

_object say3D _sound;