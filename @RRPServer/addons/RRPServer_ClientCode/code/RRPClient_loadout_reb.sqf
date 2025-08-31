/*

	Filename: 	RRPClient_loadout_reb.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
call RRPClient_util_stripDownPlayer;

player forceAddUniform "TRYK_U_B_TANOCP_R_CombatUniformTshirt";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_microdagr";
player assignItem "tf_microdagr";

call RRPClient_system_saveGear;