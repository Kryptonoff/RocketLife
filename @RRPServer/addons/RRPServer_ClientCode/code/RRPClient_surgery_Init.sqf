/*
	
	Filename: 	RRPClient_surgery_Init.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
if (EQUAL(life_myIdentity,"")) exitWith {};

if !(EQUAL(face player,life_myIdentity)) then {
	[player,life_myIdentity] remoteExec ["setFace",RANY,netId player];
};