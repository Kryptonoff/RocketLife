/*

	Filename: 	RRPClient_system_knockoutAction.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _target =  param [0,ObjNull,[ObjNull]];

//Error checks
if (isNull _target) exitWith {};
if !(vehicle player isEqualto player) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};
if ((animationState player find "unconscious") isNotEqualTo -1) exitWith {};

if (([player] call RRPClient_system_isShopNear) && (player call getSide != "cop")) exitWith {["Нельзя сбивать с ног рядом с продавцами"] call hints};
life_knockout = true;
["CL3_anim_PunchRandom"] call RRPClient_system_animDo;

uiSleep 0.5;
player say3D "kick";

[_target,steamid] remoteExec ["RRPClient_system_knockedOut",_target];
uiSleep 3;
life_knockout = false;
