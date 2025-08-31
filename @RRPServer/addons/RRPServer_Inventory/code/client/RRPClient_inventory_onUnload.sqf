/*

	Filename: 	RRPClient_inventory_onUnload.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params ["_display", "_exitCode"];

if (typeOf fl_inv_currentContainer in getArray(missionConfigFile >> "LifeCfgSettings" >> "life_lootBoxes") + ["WeaponHolderSimulated_Scripted", "Box_Wps_F"] AND {[weaponCargo fl_inv_currentContainer, itemCargo fl_inv_currentContainer, magazineCargo fl_inv_currentContainer, backpackCargo fl_inv_currentContainer] isEqualTo [[],[],[],[]] AND (fl_inv_currentContainer GVAR ["Trunk",[[],0]] select 0 isEqualTo [])}) then {
	deleteVehicle (attachedTo fl_inv_currentContainer);
	deleteVehicle fl_inv_currentContainer;
};
[fl_inv_currentContainer, "openedByUnit"] call RRPClient_system_clearGlobalVar;

fl_inv_dragging = false;
fl_inv_backpackDragInfo = nil;
fl_inv_slotDragInfo = nil;
fl_inv_externalDragInfo = nil;
fl_inv_currentContainer = objNull;