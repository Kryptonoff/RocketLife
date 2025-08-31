/*

	Filename: 	RRPClient_system_getDeathAnimation.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
private _animationState = animationState _unit;

if (EQUAL(_animationState,"ainjpfalmstpsnonwnondf_carried_dead")) exitWith {"Unconscious"};
if (EQUAL(_animationState,"actspknlmstpsnonwnondnon_treatinginjured_nikitindead")) exitWith {"Unconscious"};
if ((typeOf _curTarget) in ["RRPHospitalBed","Rimas_EMS_Stretcher"]) exitWith {"hospitalbed_anim"};

_unit call CBA_fnc_getUnitDeathAnim
