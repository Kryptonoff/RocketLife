/*

	Filename: 	RRPClient_loadout_cop.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
call RRPClient_util_stripDownPlayer;

player forceAddUniform "vvv_traje_policia_1";
player addVest "ExtremoPolice_vest_Bulletproof";
player addBackpack "14k_Belt";


player addItem "pmc_earpiece";
player assignItem "NVGoggles_mas_h";
player AddWeapon "Binocular";

/* ПРЕДМЕТЫ */
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_microdagr";
player assignItem "tf_microdagr";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "tf_anprc152";
player assignItem "tf_anprc152";
player addItem "Medikit";
player addItem "extItem_ItemRepairKit";

/* ОРУЖИЕ */
player addMagazine "DDOPP_6Rnd_X26";
player addMagazine "DDOPP_6Rnd_X26";
player addWeapon "DDOPP_X26_b";

/* ОРУЖИЕ ПО РАНГАМ*/
/*
if (EQUAL(('cop' call RRPClient_groups_getSideLevel),1)) then {
};
*/
call RRPClient_system_saveGear;