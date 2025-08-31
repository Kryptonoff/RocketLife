/*

	Filename: 	RRPClient_inventory_getContainerMaxMassVirt.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_container", objNull, [objNull]]
];
if (isNull _container) exitWith {0};

switch (true) do {
	case ((typeOf _container) isEqualTo "Land_LuggageHeap_03_F"): {(LIFE_SETTINGS(getNumber,"life_virtualMax")) * (_container GVAR ["house_box_slots",0])};
	case ((typeOf _container) isEqualTo (LIFE_SETTINGS(getText,"life_trunkClass"))): {(LIFE_SETTINGS(getNumber,"life_trunkVirtualWeight")) * (_container GVAR ["slots",1])};
	case ((typeOf _container) isEqualTo (LIFE_SETTINGS(getText,"life_vaultBoxClass"))): {15000};
	case ((typeOf _container) isEqualTo (ARC_SETTINGS(getArray,"spawnItem") select 0)): {120};
	case ((typeOf _container) isEqualTo "WeaponHolderSimulated_Scripted"): {240};
	case ((typeOf _container) isEqualTo "C_supplyCrate_F"): {1000};
	case (_container getVariable ["shelter_container", false]): {getNumber(missionConfigFile >> "LifeCfgShelter" >> "Container" >> (format["level_%1", sr_shelter_container]) >> "containerVirtualWeight")};
	case (_container getVariable ["safe_container", false]): {getNumber(missionConfigFile >> "LifeCfgSafe" >> "safeVirtualWeight") * sr_safe_slots};
	case (isClass(missionConfigFile >> "LifeCfgVehicles" >> typeOf _container)): {getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _container >> "vItemSpace") + (100 * (_container getVariable ["adacBoxes",0]))};
	default {120};
};