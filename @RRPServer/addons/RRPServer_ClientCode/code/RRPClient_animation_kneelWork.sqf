/*

	Filename: 	RRPClient_animation_kneelWork.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
if (!(ISANIMSTATE("ainvpknlmstpsnonwnondnon_medic_1")) && NOTINVEH(player)) then {
	["ainvpknlmstpsnonwnondnon_medic_1"] call RRPClient_system_animDo;
};