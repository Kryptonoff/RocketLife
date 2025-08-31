/*

	Filename: 	RRPClient_system_WeaponAssembled.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

params ["_unit","_object"];
if ((typeof _object) isEqualTo "sab_CUAV_UAV_Orange") exitWith {};

_object disableTIEquipment true;