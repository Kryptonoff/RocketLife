/*
	pre-set's
		//Шмотки
		shop = "clothing"
		type = "vest"

		shop = "clothing"
		type = "headgear"

		shop = "clothing"
		type = "goggles"

		shop = "clothing"
		type = "vests"

		shop = "clothing"
		type = "backpacks"


		//Техника
		shop = "vehicle"
		type = "land"

		shop = "clothing"
		type = "air"

		shop = "clothing"
		type = "sea"

		//Оружие
		shop = "weapon"
		type = ""
*/
class secret_shop_items_groups {
	class bundle_drop1
	{
		displayName = "Комплект вещей #1";
		items[] = {
			"DROP01_Helmet_1",
			"DROP01_Uniform_1",
			"DROP01_Vest_1"
		};
	};
	class bundle_drop2
	{
		displayName = "Комплект вещей #2";
		items[] = {
			"DROP01_Helmet_1",
			"DROP01_Uniform_2",
			"DROP01_Vest_2"
		};
	};
	class bundle_drop3
	{
		displayName = "Комплект вещей #3";
		items[] = {
			"DROP01_Helmet_1",
			"DROP01_Uniform_3",
			"DROP01_Vest_3"
		};
	};
};

class secret_shop_items {

	class AK12_BL
	{
		shop = "weapon";
		items[] = {
			{"RRPWeapon_AK12_lk_BLACK",1 }
		};
	};
	class AK12U_BL
	{
		shop = "weapon";
		items[] = {
			{"RRPWeapon_AK12U_BLACK",1 }
		};
	};
	class FN_FAL_02
	{
		shop = "weapon";
		items[] = {
			{"Skyline_Fal_02_F",1 }
		};
	};
	class GALIL
	{
		shop = "weapon";
		items[] = {
			{"arifle_Galat_RRPw",1 }
		};
	};
	class MX_F
	{
		shop = "weapon";
		items[] = {
			{"arifle_MX_F",1 }
		};
	};
	class ZBROYAR
	{
		shop = "weapon";
		items[] = {
			{"RRPWeapon_ZBROYAR_lk_1",1 }
		};
	};
	class LMG_LIM
	{
		shop = "weapon";
		items[] = {
			{"LMG_03_F",1 }
		};
	};
	class LMG_ZAFIR
	{
		shop = "weapon";
		items[] = {
			{"LMG_Zafir_F",1 }
		};
	};
	class RPG7_Pack
	{
		shop = "weapon";
		items[] = {
			{"RRPWeapon_RPG_7",1 },
			{"RRPWeapon_RPG_7_1",1 },
			{"RRPWeapon_RPG_7_2",1 },
			{"RRPWeapon_RPG_7_3",1 },
			{"RRPWeapon_RPG_7_4",1 }
		};
	};
	class adr_pack
	{
		shop = "weapon";
		items[] = {
			{"SMG_03_TR_black",1 },
			{"SMG_03_TR_camo",1 },
			{"SMG_03_TR_hex",1 },
			{"SMG_03_TR_khaki",1 }
		};
	};

	class adr_pack_trx
	{
		shop = "weapon";
		items[] = {
			{"SMG_03_black",1 },
			{"SMG_03_camo",1 },
			{"SMG_03_hex",1 },
			{"SMG_03_khaki",1 }
		};
	};
	
	class Plus200_Inventory
	{
		shop = "none";
		type = "func";
		executeCode = "['plusVirtSlots',200] call RRPClient_p2w_init";
	};
	class RRPVehicle_B_Heli_Light_01_F
	{
		shop = "vehicle";
		type = "Air";
		items[] =
		{
			{"B_Heli_Light_01_F", "true" , "true", "false"}
		};
	};
	class dc_pack {
		shop = "vehicle";
		type = "Land";
		items[] =
		{
			{"RRPVehicle_civ_evo9_dc", "true" , "true", "false"},
			{"RRPVehicle_civ_kitt_dc", "true" , "true", "false"},
			{"RRPVehicle_civ_locrall_dc", "true" , "true", "false"},
			{"RRPVehicle_bmw_m4_dc", "true" , "true", "false"},
			{"RRPVehicle_civ_dodgesrt_dc", "true" , "true", "false"},
			{"RRPVehicle_civ_sstuning_dc", "true" , "true", "false"}
		};
	};
	class drift_pack {
		shop = "vehicle";
		type = "Land";
		items[] = {
			{"RRPVehicle_civ_ae86_drift_pack", "true" , "true", "false"},
			{"RRPVehicle_civ_nsx_drift_pack", "true" , "true", "false"},
			{"RRPVehicle_civ_evo9_drift_pack", "true" , "true", "false"},
			{"RRPVehicle_civ_240sx_drift_pack", "true" , "true", "false"},
			{"RRPVehicle_civ_jdm_drift_pack", "true" , "true", "false"},
			{"RRPVehicle_civ_370z_drift_pack", "true" , "true", "false"}
		};
	};
	class cp_pack {
		shop = "vehicle";
		type = "Land";
		items[] = {
			{"RRPVehicle_civ_mustang18_cp", "true" , "true", "false"},
			{"RRPVehicle_rs4_13_cp", "true" , "true", "false"},
			{"RRPVehicle_am_vantage_cp", "true" , "true", "false"},
			{"RRPVehicle_civ_porsche91182_cp", "true" , "true", "false"},
			{"RRPVehicle_civ_javelin_cp", "true" , "true", "false"}
		};
	};
	class mk_bundle {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK18_lk_WHITE",1 },
			{"RRPWeapon_MK18_lk_BLACK",1 },
			{"RRPWeapon_MK14_lk_CLASSIK",1 },
			{"RRPWeapon_MK14_lk_NATO",1 },
			{"RRPWeapon_MK14_lk_CAMO",1 },
			{"RRPWeapon_MK1_BLACK",1 },
			{"RRPWeapon_MK1_GREEN",1 },
			{"RRPWeapon_MK1_SAND",1 },
			{"RRPWeapon_MK1_WOODLAND",1 },
			{"RRPWeapon_MK1_MULTICAM",1 }
		};
	};

	class aim2x_bandle {
		shop = "weapon";
		items[] = {
			{"optic_Hamr",1 },
			{"optic_Hamr_khk_F",1 },
			{"optic_Arco",1 },
			{"optic_Arco_lush_F",1 },
			{"optic_Arco_arid_F",1 },
			{"optic_Arco_blk_F",1 },
			{"optic_Arco_AK_lush_F",1 },
			{"optic_Arco_AK_arid_F",1 },
			{"optic_Arco_AK_blk_F",1 },
			{"optic_ERCO_snd_F",1 },
			{"optic_ERCO_khk_F",1 },
			{"optic_ERCO_blk_F",1 }
		};
	};

	class mrco_bundle {
		shop = "weapon";
		items[] = {
			{"optic_MRCO",1 }
		};
	};

	class aim12x_bandle {
		shop = "weapon";
		items[] = {
			{"optic_KHS_hex",1 },
			{"optic_KHS_tan",1 },
			{"optic_KHS_old",1 },
			{"optic_KHS_blk",1 },
			{"optic_SOS",1 },
			{"optic_SOS_khk_F",1 },
			{"optic_AMS",1 },
			{"optic_AMS_khk",1 },
			{"optic_AMS_snd",1 }
		};
	};

	class rangefinder {
		shop = "weapon";
		items[] =
		{
			{"Rangefinder",1 }
		};
	};

	class Ghillie {
		shop = "clothing";
		type = "headgear";
		items[] =
		{
			{"TRYK_H_ghillie_over"},
			{"TRYK_H_ghillie_over_green"}
		};
	};

	class HelmetBOSS {
		shop = "clothing";
		type = "headgear";
		items[] =
		{
			{"RRPHeadgear_Boss_01" },
			{"RRPHeadgear_Boss_02" },
			{"RRPHeadgear_Boss_03" }
		};
	};

	class MaskPack {
		shop = "clothing";
		type = "headgear";
		items[] =
		{
			{"aot_mask_alien" },
			{"aot_mask_angrysm" },
			{"aot_mask_bfskarl" },
			{"aot_mask_bfs" },
			{"aot_mask_bionicle" },
			{"aot_mask" },
			{"aot_mask_clemc" },
			{"aot_mask_t_desert" },
			{"aot_mask_devilscartel" },
			{"aot_mask_f_blue" },
			{"aot_mask_f_green" },
			{"aot_mask_f_red" },
			{"aot_mask_grumpy" },
			{"aot_mask_japanese" },
			{"aot_mask_line" },
			{"aot_mask_mouth" },
			{"aot_mask_rio" },
			{"aot_mask_salem" },
			{"aot_mask_spawn" },
			{"aot_mask_t_steel" },
			{"aot_mask_t_wood" }
		};
	};

	class RRPClothing_vest_black {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPClothing_vest_black" },
			{"RRPVest_Boss_lk0622_01" },
			{"RRPVest_Boss_lk0622_02" },
			{"RRPVest_Boss_lk0622_03" }
		};
	};

	class RRPClothing_bossform_black
	{
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPClothing_bossform_black" },
			{"RRPUniform_Boss_lk0622_01" },
			{"RRPUniform_Boss_lk0622_02" },
			{"RRPUniform_Boss_lk0622_03" }
		};
	};
	class RRP_belt_stage_1 {
		shop = "clothing";
		type = "backpack";
		items[] =
		{
			{"RRPBackpack_Mollusk_Stage_01" },
			{"RRPBackpack_lk0622_Mollusk_01_Stage_01" },
			{"RRPBackpack_lk0622_Mollusk_02_Stage_01" },
			{"RRPBackpack_lk0622_Mollusk_03_Stage_01" }
		};
	};
	class RRP_belt_stage_2 {
		shop = "clothing";
		type = "backpack";
		items[] =
		{
			{"RRPBackpack_Mollusk_Stage_02" },
			{"RRPBackpack_lk0622_Mollusk_01_Stage_02" },
			{"RRPBackpack_lk0622_Mollusk_02_Stage_02" },
			{"RRPBackpack_lk0622_Mollusk_03_Stage_02" }
		};
	};
	class RRP_belt_stage_3 {
		shop = "clothing";
		type = "backpack";
		items[] = {
			{"RRPBackpack_Mollusk_Stage_03" },
			{"RRPBackpack_lk0622_Mollusk_01_Stage_03" },
			{"RRPBackpack_lk0622_Mollusk_02_Stage_03" },
			{"RRPBackpack_lk0622_Mollusk_03_Stage_03" }
		};
	};
	class RRPVehicle_maz_black {
		shop = "vehicle";
		type = "Land";
		items[] =
		{
			{ "RRPVehicle_knur_lk", "true" , "true", "false" }
		};
	};
	class panamera_speedhunters {
		shop = "vehicle";
		type = "Land";
		items[] =
		{
			{ "RRPVehicle_civ_panamera_speedhunters", "true" , "true", "false" }
		};
	};
	class RRPVehicle_lk_kamaz49255 {
		shop = "vehicle";
		type = "Land";
		items[] =
		{
			{ "RRPVehicle_lk_kamaz49255", "true" , "true", "false" }
		};
	};
	class RRPVehicle_lk_camry {
		shop = "vehicle";
		type = "Land";
		items[] =
		{
			{ "RRPVehicle_lk_camry", "true" , "true", "false" }
		};
	};
	class RRPVehicle_lk_cruiser200 {
		shop = "vehicle";
		type = "Land";
		items[] =
		{
			{ "RRPVehicle_lk_cruiser200", "true" , "true", "false" }
		};
	};
	class RRPVehicle_HURON_default {
		shop = "vehicle";
		type = "Air";
		items[] =
		{
			{ "RRPVehicle_huron_lk", "true" , "true", "false" }
		};
	};
	class backpack_viper {
		shop = "clothing";
		type = "backpack";
		items[] =
		{
			{"RRPBackpack_Viper_01" }
		};
	};
	class mxsw_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MXSW_lk_BLACK",1 },
			{"RRPWeapon_MXSW_lk_GREEN",1 },
			{"RRPWeapon_MXSW_lk_SAND",1 }
		};
	};
	class rpk_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_RPK12_lk_BLACK",1 },
			{"RRPWeapon_RPK12_lk_GREEN",1 },
			{"RRPWeapon_RPK12_lk_SAND",1 }
		};
	};
	class rpg_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_RPG_7",1 },
			{"RRPWeapon_RPG_7_1",1 },
			{"RRPWeapon_RPG_7_2",1 },
			{"RRPWeapon_RPG_7_3",1 },
			{"RRPWeapon_RPG_7_4",1 }
		};
	};
	class spar_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_SPAR16_lk_BLACK",1 },
			{"RRPWeapon_SPAR16_lk_GREEN",1 },
			{"RRPWeapon_SPAR16_lk_SAND",1 }
		};
	};
	class fnfall_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_FNFAL_NEW",1 },
			{"RRPWeapon_FNFAL_OLD",1 }
		};
	};
	class zbroyar_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_ZBROYAR",1 }
		};
	};
	class hk_pack {
		shop = "weapon";
		items[] = {
		};
	};
	class adr97_pack {
		shop = "weapon";
		items[] = {
			{"SMG_03_TR_camo",1 },
			{"SMG_03_TR_khaki",1 },
			{"SMG_03_TR_black",1 },
			{"SMG_03_TR_hex",1 }
		};
	};
	class ak12_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_AK12_lk_BLACK",1 },
			{"RRPWeapon_AK12_lk_GREEN",1 },
			{"RRPWeapon_AK12_lk_SAND",1 },
			{"RRPWeapon_AK12U_lk_BLACK",1 },
			{"RRPWeapon_AK12U_lk_GREEN",1 },
			{"RRPWeapon_AK12U_lk_SAND",1 }
		};
	};

	class svu_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_SVU",1 },
			{"RRPWeapon_SVU_Dragon",1 },
			{"RRPWeapon_SVU_USA",1 },
			{"RRPWeapon_SVU_greenCamo",1 },
			{"RRPWeapon_SVU_redLine",1 },
			{"RRPWeapon_SVU_dl",1 },
			{"RRPWeapon_SVU_Multicam",1 },
			{"RRPWeapon_SVU_hunter",1 },
			{"RRPWeapon_SVU_berezka",1 },
			{"RRPWeapon_SVU_multicam_berezka",1 },
			{"RRPWeapon_SVU_multicam_stratis",1 },
			{"RRPWeapon_SVU_stage_1",1 },
			{"RRPWeapon_SVU_winter_stage_1",1 },
			{"RRPWeapon_SVU_multicam_stage_1",1 }
		};
	};
	class svu_stage_pack {
		shop = "weapon";
		items[] = {
		};
	};
	class awp_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_AWM_lk_BLACK",1 },
			{"RRPWeapon_AWM_lk_SAND",1 },
			{"RRPWeapon_AWM_lk_GREEN",1 },
			{"RRPWeapon_AWMs_lk_BLACK",1 },
			{"RRPWeapon_AWMs_lk_SAND",1 },
			{"RRPWeapon_AWMs_lk_GREEN",1 }
		};
	};
	class svd_pack {
		shop = "weapon";
		items[] = {
			{"Skyline_SVD_01_F",1 },
			{"Skyline_optic_PSO1",1 }
		};
	};
	class spar17_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_SPAR17_lk_BLACK",1 },
			{"RRPWeapon_SPAR17_lk_GREEN",1 },
			{"RRPWeapon_SPAR17_lk_SAND",1 }
		};
	};
	class mk18_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK18_lk_WHITE",1 },
			{"RRPWeapon_MK18_lk_BLACK",1 }
		};
	};
	class mk14_pack {
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK14_lk_CLASSIK",1 },
			{"RRPWeapon_MK14_lk_NATO",1 },
			{"RRPWeapon_MK14_lk_CAMO",1 }
		};
	};

	class supressor762 {
		shop = "weapon";
		items[] = {
			{"muzzle_snds_B",1 },
			{"muzzle_snds_B_lush_F",1 },
			{"muzzle_snds_B_snd_F",1 },
			{"muzzle_snds_B_arid_F",1 },
			{"muzzle_snds_B_khk_F",1 }
		};
	};
	class supressor65_556_9 {
		shop = "weapon";
		items[] = {
			{"muzzle_snds_M",1 },
			{"muzzle_snds_m_snd_F",1 },
			{"muzzle_snds_m_khk_F",1 },
			{"muzzle_snds_L",1 },
			{"muzzle_snds_acp",1 },
			{"muzzle_snds_H",1 },
			{"muzzle_snds_H_snd_F",1 },
			{"muzzle_snds_H_khk_F",1 },
			{"muzzle_snds_65_TI_hex_F",1 },
			{"muzzle_snds_65_TI_ghex_F",1 },
			{"muzzle_snds_65_TI_blk_F",1 }
		};
	};
	class dms {
		shop = "weapon";
		items[] = {
			{"optic_DMS",1 },
			{"optic_DMS_ghex_F",1 },
			{"optic_DMS_weathered_F",1 },
			{"optic_DMS_weathered_Kir_F",1 }
		};
	};
	class nvs {
		shop = "weapon";
		items[] = {
			{"optic_NVS",1 },
		};
	};
	class ams {
		shop = "weapon";
		items[] = {
			{"optic_AMS",1 },
			{"optic_AMS_khk",1 },
			{"optic_AMS_snd",1 }
		};
	};
	class mos {
		shop = "weapon";
		items[] = {
			{"optic_SOS",1 },
			{"optic_SOS_khk_F",1 }
		};
	};
	class lprs {
		shop = "weapon";
		items[] = {
			{"optic_LRPS",1 },
			{"optic_LRPS_ghex_F",1 },
			{"optic_LRPS_tna_F",1 }
		};
	};
	class khs {
		shop = "weapon";
		items[] = {
			{"optic_KHS_hex",1 },
			{"optic_KHS_tan",1 },
			{"optic_KHS_old",1 },
			{"optic_KHS_blk",1 }
		};
	};

	class DROP01_Helmet_1 {
		shop = "clothing";
		type = "headgear";
		items[] =
		{
			{"RRPHeadgear_HelmetDrop_01" }
		};
	};
	class DROP01_Uniform_1 {
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPUniform_Drop_1_101" }
		};
	};
	class DROP01_Vest_1 {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPVest_Drop_1_01" }
		};
	};
	class DROP01_Uniform_2 {
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPUniform_Drop_1_201" }
		};
	};
	class DROP01_Vest_2 {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPVest_Drop_1_02" }
		};
	};
	class DROP01_Uniform_3 {
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPUniform_Drop_1_301" }
		};
	};
	class DROP01_Vest_3 {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPVest_Drop_1_03" }
		};
	};
	class DROP01_Uniform_4 {
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPUniform_Drop_1_401" }
		};
	};
	class DROP01_Vest_4 {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPVest_Drop_1_04" }
		};
	};
	class DROP01_Uniform_5 {
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPUniform_Drop_1_501" }
		};
	};
	class DROP01_Vest_5 {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPVest_Drop_1_05" }
		};
	};
	class DROP01_Uniform_6 {
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPUniform_Drop_1_601" }
		};
	};
	class DROP01_Vest_6 {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPVest_Drop_1_06" }
		};
	};
	class DROP01_Uniform_7 {
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPUniform_Drop_1_701" }
		};
	};
	class DROP01_Vest_7 {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPVest_Drop_1_07" }
		};
	};
	class DROP01_Uniform_8 {
		shop = "clothing";
		type = "uniform";
		items[] =
		{
			{"RRPUniform_Drop_1_801" }
		};
	};
	class DROP01_Vest_8 {
		shop = "clothing";
		type = "vest";
		items[] =
		{
			{"RRPVest_Drop_1_08" }
		};
	};
	class DROP01_Weapon_M1_1 {
		displayName = "Mk-I EMR #101";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_101",1 }
		};
	};
	class DROP01_Weapon_M1_2 {
		displayName = "Mk-I EMR #102";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_102",1 }
		};
	};
	class DROP01_Weapon_M1_3 {
		displayName = "Mk-I EMR #103";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_103",1 }
		};
	};
	class DROP01_Weapon_M1_4 {
		displayName = "Mk-I EMR #104";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_104",1 }
		};
	};
	class DROP01_Weapon_M1_5 {
		displayName = "Mk-I EMR #105";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_105",1 }
		};
	};
	class DROP01_Weapon_M1_6 {
		displayName = "Mk-I EMR #106";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_106",1 }
		};
	};
	class DROP01_Weapon_M1_7 {
		displayName = "Mk-I EMR #107";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_107",1 }
		};
	};
	class DROP01_Weapon_M1_8 {
		displayName = "Mk-I EMR #108";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_108",1 }
		};
	};
	class DROP01_Weapon_M1_9 {
		displayName = "Mk-I EMR #109";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MK1_Drop_109",1 }
		};
	};
	class DROP01_Weapon_HKMP7_1 {
		displayName = "HK MP7 #101";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_HKMP7_1",1 }
		};
	};
	class DROP01_Weapon_HKMP7_2 {
		displayName = "HK MP7 #102";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_HKMP7_2",1 }
		};
	};
	class DROP01_Weapon_HKMP7_3 {
		displayName = "HK MP7 #103";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_HKMP7_3",1 }
		};
	};
	class DROP01_Weapon_HKMP7_4 {
		displayName = "HK MP7 #104";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_HKMP7_4",1 }
		};
	};
	class DROP01_Weapon_AK12_1 {
		displayName = "AK-12 #101";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_AK12_Drop_101",1 }
		};
	};
	class DROP01_Weapon_AK12_2 {
		displayName = "AK-12 #102";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_AK12_Drop_102",1 }
		};
	};
	class DROP01_Weapon_AK12_3 {
		displayName = "AK-12 #103";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_AK12_Drop_103",1 }
		};
	};
	class DROP01_Weapon_AK12_4 {
		displayName = "AK-12 #104";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_AK12_Drop_104",1 }
		};
	};
	class DROP01_Weapon_MXM_1 {
		displayName = "MXM #101";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MXM_Drop_101",1 }
		};
	};
	class DROP01_Weapon_MXM_2 {
		displayName = "MXM #102";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MXM_Drop_102",1 }
		};
	};
	class DROP01_Weapon_MXM_3 {
		displayName = "MXM #103";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MXM_Drop_103",1 }
		};
	};
	class DROP01_Weapon_MXM_4 {
		displayName = "MXM #104";
		shop = "weapon";
		items[] = {
			{"RRPWeapon_MXM_Drop_104",1 }
		};
	};
};
