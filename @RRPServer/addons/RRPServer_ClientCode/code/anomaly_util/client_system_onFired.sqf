/*
	Filename: 	client_system_onFired.sqf
	Project: 	Empyrean Life RPG
	Author:		Empyrean Team
	E-mail:		support@empyrean.club
	Web:		https://empyrean.club
*/
#include "..\..\macros.hpp"
params ["_unit","_weapon","_muzzle","_mode","_ammoType","_magazine","_projectile","_gunner"];

if ([player] call client_system_isInputBlocked) exitWith {deleteVehicle _projectile};

switch (true) do {
	//Болт
	case (_ammoType isEqualTo life_anomalyBoltAmmo) : {
        [_projectile] call client_system_grenadeBolt;
	};
	default {};
};
