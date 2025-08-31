/*
	Filename: 	RRPClient_system_packupSpikes.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_spikes"];
_spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if (isNil "_spikes") exitWith {};

if (["extItem_MetalWire"] call RRPClient_inventory_addItemToInventory) then {
	titleText["Вы подняли шипы.","PLAIN"];
	player removeAction life_action_spikeStripPickup;
	life_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
} else {
	["Ваш инвентарь переполнен."] call hints;
};