/*

	Filename: 	RRPClient_loadout_medic.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
call RRPClient_util_stripDownPlayer;

player forceAddUniform "med_intern";
player addBackpack "med_back";

player addItem "Medikit";
player addItem "extItem_ItemRepairKit";
player addItem "extItem_defibrillator";

player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_microdagr";
player assignItem "tf_microdagr";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "tf_fadak";
player assignItem "tf_fadak";

call RRPClient_system_saveGear;