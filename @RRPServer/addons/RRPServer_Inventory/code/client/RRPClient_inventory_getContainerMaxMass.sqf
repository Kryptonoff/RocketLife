/*

	Filename: 	RRPClient_inventory_getContainerMaxMass.sqf
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
if (_container isEqualTo (backpackContainer player)) exitWith {
	_mass = getContainerMaxLoad uniform player + getContainerMaxLoad vest player + getContainerMaxLoad backpack player;
	// if (["Muscleman"] call perk) then {_mass = round(_mass * 1.25)};
	_mass
};

switch (true) do {
	case ((typeOf _container) isEqualTo "Land_LuggageHeap_03_F"): {(LIFE_SETTINGS(getNumber,"life_inventoryMax")) * (_container GVAR ["house_box_slots",0])};
	case ((typeOf _container) isEqualTo LIFE_SETTINGS(getText,"life_trunkClass")): {(LIFE_SETTINGS(getNumber,"life_trunkInventoryWeight")) * (_container GVAR ["slots",0])};
	case ((typeOf _container) isEqualTo "Land_FirstAidKit_01_closed_F"): {1000};
	case (_container getVariable ["shelter_container", false]): {getNumber(missionConfigFile >> "LifeCfgShelter" >> "Container" >> (format["level_%1", sr_shelter_container]) >> "containerInventoryWeight")};
	case (_container getVariable ["safe_container", false]): {getNumber(missionConfigFile >> "LifeCfgSafe" >> "safeInventoryWeight") * sr_safe_slots};

	default {getNumber(configFile >> "CfgVehicles" >> typeOf _container >> "maximumLoad")};
};