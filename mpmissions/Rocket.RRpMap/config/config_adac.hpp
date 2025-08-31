#define true 1
#define false 0

class LifeCfgAdac
{
	class AdacSettings
	{
		condition = "true";
		class boxes
		{
			levels = 2;
			item = "RRPItem_adacBox";
			displayName = "Ящики для груза";
			tooltip = "Позволяет расширить багажник для ресурсов";
			condition = "";
			type = "INT";
			variable = "adacBoxes";
		};
		class nitro
		{
			levels = 1;
			item = "RRPItem_adacNitro";
			displayName = "Закись азота";
			tooltip = "Кратко временное ускорение техники";
			condition = "";
			type = "BOOL";
			variable = "adacNitroUsed";
		};
		class tracker
		{
			levels = 1;
			item = "RRPItem_GPSTracker";
			displayName = "GPS-трекер";
			tooltip = "Отображение на карте владельцу местоположение транспорта";
			condition = "";
			type = "BOOL";
			variable = "adacGPSTracker";
		};
		class breaking
		{
			levels = 1;
			item = "RRPItem_AntiStole";
			displayName = "Антиперебивка";
			tooltip = "Запрещает перебить транспорт на другого, но не продать на свалке";
			condition = "";
			type = "BOOL";
			variable = "adacAntiBreaking";
		};
		class seatbelt
		{
			levels = 1;
			item = "RRPItem_SeatBelt";
			displayName = "Ремни безопасности";
			tooltip = "Позволяет уменьшить получение урона от удара";
			condition = "";
			type = "BOOL";
			variable = "adacSeatBelt";
		};
		class cruize
		{
			levels = 1;
			item = "RRPItem_SeatBelt";
			displayName = "Круиз-контроль";
			tooltip = "Позволяет удерживать скорость без жатия на педаль газа";
			condition = "";
			type = "BOOL";
			variable = "adacCruize";
		};
		class lpg
		{

			levels = 1;
			item = "RRPItem_SeatBelt";
			displayName = "LPG";
			tooltip = "Установка LPG позволит сократить расход топлива вдвое";
			condition = "";
			type = "BOOL";
			variable = "adacLPG";
		};
	};
	class C_Van_01_transport_F
	{
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "vtt_w", "" },
			{ "vtt_r", "" }
		};
		materials[] = {};
	};
	class C_Offroad_01_F {
		boxes = 1;
		nitro = true;
		textures[] = {
			{ "ffrd_r", "" },
			{ "ffrd_y", "" },
			{ "ffrd_w", "" },
			{ "ffrd_b", "" },
			{ "ffrd_br", "" },
			{ "ffrd_bw", "" },
			{ "rgb_cy", "" },
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class C_Hatchback_01_sport_F {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "htchbs_r", "" },
			{ "htchbs_br", "" },
			{ "htchbs_o", "" },
			{ "htchbs_bw", "" },
			{ "htchbs_t", "" },
			{ "htchbs_g", "" },
			{ "htchbs_va", "" },
			{ "htchbs_vme", "" },
			{ "htchbs_h", "" },
			{ "htchbs_s", "" }
		};
		materials[] = {"glossy","matte","metallic"};
	};
	class C_Hatchback_01_F {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "htchb_bs", "" },
			{ "htchb_g", "" },
			{ "htchb_bl", "" },
			{ "htchb_bbl", "" },
			{ "htchb_y", "" },
			{ "htchb_w", "" },
			{ "htchb_gr", "" },
			{ "htchb_b", "" }
		};
		materials[] = {"glossy","matte","metallic"};
	};
	class C_SUV_01_F {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "suv_br", "" },
			{ "suv_b", "" },
			{ "suv_s", "" },
			{ "suv_o", "" },
			{ "suv_vx6", "(call life_donator) > 0" },
			{ "suv_vd", "(call life_donator) > 0" },
			{ "suv_vnc", "(call life_donator) > 0" },
			{ "suv_vo", "(call life_donator) > 0" },
			{ "suv_vs", "(call life_donator) > 0" },
			{ "suv_vpm", "(call life_donator) > 0" },
			{ "suv_vme", "(call life_donator) > 0" },
			{ "suv_vgr", "(call life_donator) > 0" },
			{ "suv_vsw", "(call life_donator) > 0" },
			{ "suv_vcx", "(call life_donator) > 0" },
			{ "suv_vfs", "(call life_donator) > 0" },
			{ "suv_vme2", "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic"};
	};

	class B_Heli_Light_01_F {
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "humm_bl", "" },
			{ "humm_r", "" },
			{ "humm_vme", "(call life_donator) > 0" },
			{ "humm_bln", "" },
			{ "humm_llp", "" },
			{ "humm_fr", "" },
			{ "humm_bj", "" },
			{ "humm_rl", "" },
			{ "humm_sn", "" },
			{ "humm_vrn", "" },
			{ "humm_wv", "" },
			{ "humm_reb", "" }
		};
		materials[] = {};
	};

	class C_Heli_Light_01_civil_F {
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "humm_bln", "" },
			{ "humm_reb", "" },
			{ "humm_llp", "" },
			{ "humm_fr", "" },
			{ "humm_gra", "" },
			{ "humm_bj", "" },
			{ "humm_lg", "" },
			{ "humm_shd", "" },
			{ "humm_shr", "" },
			{ "humm_rl", "(call life_donator) > 0" },
			{ "humm_sn", "(call life_donator) > 0" },
			{ "humm_vrn", "" },
			{ "humm_wsp", "(call life_donator) > 0" },
			{ "humm_wv", "" }
		};
		materials[] = {};
	};

	class O_MRAP_02_F {
		boxes = 0;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class I_MRAP_03_F: O_MRAP_02_F {};
	class I_MRAP_03_hmg_F: O_MRAP_02_F {};
	class O_MRAP_02_hmg_F: O_MRAP_02_F {};
	class B_MRAP_01_hmg_F: O_MRAP_02_F {};
	class RRPVehicle_lk_MRAP: O_MRAP_02_F {};

	class I_Truck_02_transport_F {
		boxes = 1;
		nitro = false;
		textures[] = {
			{ "itcc_or", "" },
			{ "itc_cm", "" }
		};
		materials[] = {};
	};

	class I_Truck_02_covered_F {
		boxes = 1;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_transport_F: I_Truck_02_covered_F {};
	class O_Truck_03_covered_F: I_Truck_02_covered_F {};

	class I_Truck_02_covered_CIV_F {
		boxes = 1;
		nitro = false;
		textures[] = {
			{"itcc_or", "" },
			{"itcc_r", "(call life_donator) > 0" },
			{"itcc_s", "(call life_donator) > 0" },
			{"itcc_w", "(call life_donator) > 0" },
			{"itcc_y", "(call life_donator) > 0" }
		};
		materials[] = {};
	};

	class B_Truck_01_transport_F {
		boxes = 1;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};

	class Mrshounka_megane_rs_2015_noir {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_bbr", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" },
			{ "shnk_b", "" },
			{ "shnk_vr", "(call life_donator) > 0" },
			{ "shnk_vg", "(call life_donator) > 0" },
			{ "shnk_vbl", "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class C_Offroad_02_unarmed_F {
		boxes = 1;
		nitro = true;
		textures[] = {
			{"codu_w", "" },
			{"codu_r", "" },
			{"codu_o", "" },
			{"codu_bl", "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class RRPVehicle_civ_raptor2 {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_bbr", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" },
			{ "shnk_b", "" },
			{ "shnk_vfc", "(call life_donator) > 0" },
			{ "shnk_vuc", "(call life_donator) > 0" },
			{ "shnk_vdc", "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};

	class shounka_a3_mantgs_2_in {
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_bbr", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" },
			{ "shnk_b", "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class sedan
	{
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" }
		};
		materials[] = {"glossy","metallic","chrome"};
	};
	class newyear
	{
		boxes = 0;
		nitro = true;
		textures[] = {};
		materials[] = {"glossy","metallic","chrome"};
	};
	class battle
	{
		boxes = 0;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class bike
	{
		boxes = 0;
		nitro = true;
		textures[] = {};
		materials[] = {};
	};
	class pren_truck
	{
		boxes = 0;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class helli_min
	{
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" }
		};
		materials[] = {};
	};
	class helli_big
	{
		boxes = 1;
		nitro = false;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" }
		};
		materials[] = {};
	};
	class truk_min
	{
		boxes = 1;
		nitro = false;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" }
		};
		materials[] = {};
	};
	class truk_big
	{
		boxes = 2;
		nitro = false;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" }
		};
		materials[] = {};
	};

	class RRPVehicle_bmw_m8: sedan {};
	class RRPVehicle_bmw_m8_cop: sedan {};
	class RRPVehicle_bmw_m8_unm: sedan {};
	class RRPVehicle_bmw_m4: sedan {};
	class RRPVehicle_osk_honda_nsx_AIMGAIN: sedan {};
	class RRPVehicle_osk_honda_nsx_purpure: sedan {};
	class RRPVehicle_osk_honda_nsx_chameleon: sedan {};
	class RRPVehicle_nissan_370Z: sedan {};
	class RRPVehicle_civ_quattro83: sedan {};
	class RRPVehicle_osk_Mercedes_w140_01: sedan {};

	class RRP_RZ_Buran_1: sedan {};
	class RRP_RZ_Buran_2: sedan {};
	class RRP_RZ_Buran_3: sedan {};

	class RRPVehicle_civ_f93HAMM19: sedan {};
	class RRPVehicle_civ_bolide: sedan {};
	class RRPVehicle_civ_bolide_2: sedan {};
	class RRPVehicle_civ_hornet54: sedan {};
	class RRPVehicle_civ_GTMANS17: sedan {};
	class RRPVehicle_civ_mustang18: sedan {};
	class RRPVehicle_civ_Furai: sedan {};
	class RRPVehicle_civ_terzo18: sedan {};
	class RRPVehicle_lk_xsar1: sedan {};
	class RRPVehicle_civ_divooff: sedan {};
	class RRPVehicle_civ_divo: sedan {};

	class RRPVehicle_civ_dubsta6x6vip: sedan {};
	class RRPVehicle_civ_paragonsport: sedan {};
	class osk_Windsor_sedan: sedan {};
	class RRPVehicle_civ_ram: sedan {};
	class osk_ultrainsurgent_tracked_civ: sedan {};
	class RRPVehicle_civ_f90offroad: sedan {};
	class RRPVehicle_civ_gt63offroad: sedan {};
	class RRPVehicle_lk_AURUSsenat: sedan {};
	class RRPVehicle_lk_e34tundrift: sedan {};
	class RRPVehicle_lk_nsx: sedan {};
	class RRPVehicle_lk_bentayga: sedan {};
	class RRPVehicle_lk_abrer: sedan {};
	class RRPVehicle_lk_wraithMANS: sedan {};
	class RRPVehicle_lk_mclaren: sedan {};
	class RRPVehicle_lk_C63AMG: sedan {};
	class RRPVehicle_lk_HuayraRoadster: sedan {};
	class RRPVehicle_lk_scaldarsi: sedan {};
	class RRPVehicle_lk_roosevelt: sedan {};

	class RRPVehicle_civ_hummer2_guber: sedan {};
	class RRPVehicle_civ_escalade_guber: sedan {};
	class RRPVehicle_civ_c63amg_1_guber: sedan {};
	class RRPVehicle_civ_f90_guber: sedan {};

	class RRPVehicle_civ_rx7tun: sedan {};
	class RRPVehicle_civ_rx7tun_drift: sedan {};
	class RRPVehicle_civ_rx7jojo: sedan {};
	class RRPVehicle_civ_rx7jojo_drift: sedan {};

	class d3s_eldorado_68_3: sedan {};
	class d3s_amgGT_19_63S: sedan {};
	class d3s_w212s_13_EX: sedan {};
	class d3s_javelin_72: sedan {};
	class d3s_javelin_72_Talib: sedan {};

	class d3s_uaz_3907: sedan {};
	class d3s_levante_s_17 : sedan {};
	class d3s_e89_12 : sedan {};
	class d3s_e89_12_M : sedan {};
	class d3s_qx56_13_SE : sedan {};
	class d3s_qx56_ht_13 : sedan {};
	class d3s_q50_ER_14 : sedan {};
	class d3s_q50_14 : sedan {};
	class d3s_QX60_16_S : sedan {};
	class d3s_w212_13 : sedan {};
	class d3s_C63S_14 : sedan {};
	class d3s_C450_15 : sedan {};
	class d3s_C180_14 : sedan {};
	class d3s_s600_17 : sedan {};
	class d3s_svr_17_HSE : sedan {};
	class d3s_svr_17_TDV : sedan {};
	class d3s_malibu_18_LT : sedan {};
	class d3s_malibu_18 : sedan {};
	class d3s_ghost_18_EWB_II : sedan {};
	class d3s_f87_17_ACH : sedan {};
	class d3s_f87_17_m : sedan {};
	class d3s_f80_14_GTS : sedan {};
	class d3s_f80_14_cs : sedan {};
	class d3s_evoque_sd4_16 : sedan {};
	class d3s_evoque_16 : sedan {};
	class d3s_cla_45amg_15 : sedan {};
	class d3s_cla_45amg_14 : sedan {};
	class d3s_cla_15 : sedan {};
	class d3s_cla_14 : sedan {};
	class d3s_cayenne_s_16 : sedan {};
	class d3s_cayenne_16 : sedan {};
	class d3s_santafe_19 : sedan {};
	class d3s_santafe_19_prem : sedan {};
	class d3s_beetle_04 : sedan {};
	class d3s_amgGT_19_53 : sedan {};
	class d3s_amgGT_19_43 : sedan {};
	class d3s_amgGTS_15 : sedan {};
	class d3s_amgGT_15 : sedan {};
	class d3s_camry_18_XSE : sedan {};
	class d3s_camry_18 : sedan {};
	class d3s_cullinan_19_FE : sedan {};
	class d3s_continentalGT_18_Black: sedan {};
	class d3s_g500_18 : sedan {};
	class d3s_g63amg_18 : sedan {};
	class d3s_g63amg_18_CE : sedan {};
	class d3s_g500_15 : sedan {};
	class d3s_gls63_17 : sedan {};
	class IMPERIUM_Hyundai_A : sedan {};
	class IMPERIUM_GTR_15_A : sedan {};
	class IMPERIUM_GTR_15_W : sedan {};
	class d3s_dukes2_gtaV : sedan {};

	class RRPVehicle_vtech_A6: sedan {};
	class RRPVehicle_bolide_A6: sedan {};
	class RRPVehicle_one1_A6: sedan {};
	class RRPVehicle_speedtail_A6: sedan {};
	class RRPVehicle_wraithMANS_A6: sedan {};
	class RRPVehicle_f93HAMM_A6: sedan {};
	class RRPVehicle_amgGTRRoadster_A6: sedan {};
	class RRPVehicle_visionGT_A6: sedan {};
	class RRPVehicle_GTMANS_A6: sedan {};

	class d3s_LaFerrari_14_P: sedan {};
	class ivory_wrx: sedan {};
	class Mrshounka_ducati_Rework_blanche_f: sedan {};
	class IVORY_R8SPYDER: sedan {};
	class ivory_lp560: sedan {};
	class Mrshounka_hummerh2_Rework_noir_f: sedan {};
	class Alessio718: sedan {};
	class vvv_formula1_ferrari: sedan {};
	class MrRRPVehicle_civ_buggy_Rework_noir_f: sedan {};
	class O_Heli_Transport_04_covered_black_F: sedan {};
	class sab_boat_3: sedan {};
	class C_Offroad_02_unarmed_red_F: sedan {};
	class agora_tcl: sedan {};
	class M_CVPI_UC_Black: sedan {};
	class M_Charger12_UC_Black: sedan {};
	class Quiet_Cadillac_noir_f: sedan {};
	class M_Tahoe_UC_Black: sedan {};
	class ivory_wrx_mar: sedan {};
	class ivory_isf_bobcat: sedan {};
	class ivory_wrx_maw: sedan {};
	class ivory_wrx_fatum: sedan {};
	class Subaru_USSR: sedan {};
	class trafic3_vtp: sedan {};
	class Mrshounka_a3_308_Police_Rework_blanche_f: sedan {};
	class M_Tahoe: sedan {};
	class M_Tahoe_EMS: sedan {};
	class M_Silverado: sedan {};
	class M_Charger12: sedan {};
	class M_FPIS: sedan {};
	class M_CVPI: sedan {};
	class M_CVPI_EMS: sedan {};
	class M_Ambulance: sedan {};
	class B_AFV_Wheeled_01_cannon_F: sedan {};
	class B_AFV_Wheeled_01_up_cannon_F: sedan {};
	class O_T_LSV_02_AT_F: sedan {};
	class B_T_LSV_01_unarmed_F: sedan {};
	class Megane_Estate_vli: sedan {};
	class chmerc_amb: sedan {};
	class chdefender_vlhr: sedan {};
	class 1200RT_gn_ch: sedan {};
	class AlessioRS4COP: sedan {};
	class C_Van_02_medevac_F: sedan {};
	class C_Sal_RRPVehicle_civ_gtr_2017_alt_F: sedan {};
	class Urbanized_LP700_P: sedan {};
	class tw_raptor_ems: sedan {};
	class rs01ch: sedan {};
	class JR_CROWN_VICTORIA_POLICE1: sedan {};
	class JR_CHARGER_POLICE1: sedan {};
	class RRPVehicle_teslaS_kifo: sedan {};
	class RRPVehicle_teslaS_MS13: sedan {};
	class RRPVehicle_amgGT_MS13: sedan {};
	class RRPVehicle_f90_lyk_ms13: sedan {};
	class chgolf7_pp: sedan {};
	class SubaruWRXgn: sedan {};
	class chdefender_gn: sedan {};
	class mondeoswch_bac75: sedan {};
	class focussw2p2_GN: sedan {};
	class chduster14_gn: sedan {};
	class FJR1300_gn_ch: sedan {};
	class JR_DURANGO_UNMARKED_black: sedan {};
	class AlessioM4COP: sedan {};
	class JR_CHARGER_UNMARKED_black: sedan {};
	class chtwingoI_civ: sedan {};
	class 4l_civ: sedan {};
	class chgolf7_civ: sedan {};
	class chtwingoII_civ: sedan {};
	class Scenic3_civ: sedan {};
	class chmegane2_civ: sedan {};
	class Megane_Estate_civ: sedan {};
	class Renault_ClioIV_civ: sedan {};
	class 308_2015_civ: sedan {};
	class Peugeot_308_civ: sedan {};
	class 307ch_civ: sedan {};
	class ch206_civ: sedan {};
	class c4hch_civ: sedan {};
	class kangooII1_civ: sedan {};
	class partner2_civ: sedan {};
	class chcitan_civ: sedan {};
	class chdefender_civ: sedan {};
	class galaxych_civ: sedan {};
	class chduster14_civ: sedan {};
	class Berlingo2_civ: sedan {};
	class mondeovch_civ: sedan {};
	class mondeoswch_civ: sedan {};
	class fgtz3_civ: sedan {};
	class chfcrsciv: sedan {};
	class ivory_lfa: sedan {};
	class ivory_f1: sedan {};
	class ivory_gt500_fatum: sedan {};
	class bmx_ch: sedan {};
	class course2_ch: sedan {};
	class course3_ch: sedan {};
	class course1_ch: sedan {};
	class cruiser_ch: sedan {};
	class fixter_ch: sedan {};
	class vtt_ch: sedan {};
	class 690duke_ch: sedan {};
	class S1000RR_2013_ch: sedan {};
	class 1200RT_ch: sedan {};
	class 1150RT_ch: sedan {};
	class AlessioStingrayG: sedan {};
	class AlessioGTB_Gold: sedan {};
	class AlessioSuperfastG: sedan {};
	class AlessioMustangGold: sedan {};
	class AlessioAgeraG: sedan {};
	class AlessioAventadorG: sedan {};
	class AlessioC63NG: sedan {};
	class AlessioC63G: sedan {};
	class AlessioMGAG: sedan {};
	class AlessioIXMRG: sedan {};
	class AlessioGTRG: sedan {};
	class Alessio918G: sedan {};
	class AlessioBMG: sedan {};
	class C_Van_02_vehicle_F: sedan {};
	class C_Van_02_transport_F: sedan {};
	class AlessioR8_Gold: sedan {};
	class chvwt5_civ: sedan {};
	class Trafic3civ: sedan {};
	class Trafic1_civ: sedan {};
	class Trafic2_civ: sedan {};
	class master3p2_civ_civ: sedan {};
	class chexpert3_civ: sedan {};
	class Peugeot_Expert_civ: sedan {};
	class Peugeot_Boxer_civ: sedan {};
	class IvecoCh_cciv: sedan {};
	class IvecoCh_civ: sedan {};
	class Ducato_civ: sedan {};
	class vet_GAZ_2975_Tiger_special_version: sedan {};
	class I_UGV_01_F: sedan {};
	class B_UGV_01_F: sedan {};
	class B_UAV_02_F: sedan {};
	class dbo_CIV_ol_bike: sedan {};
	class dbo_CIV_new_bike: sedan {};
	class dbo_CIV_new_bike_R: sedan {};
	class dbo_CIV_new_bike_B: sedan {};
	class C_Kart_01_Blu_F: sedan {};
	class C_Kart_01_Fuel_F: sedan {};
	class C_Kart_01_Red_F: sedan {};
	class C_Kart_01_Vrana_F: sedan {};
	class EXT_W_Offroad_01_F: sedan {};
	class C_Offroad_01_repair_F: sedan {};
	class B_G_Offroad_01_F: sedan {};
	class B_mas_cars_Hilux_Unarmed: sedan {};
	class B_Quadbike_01_F: sedan {};
	class gac_jsdf_klx: sedan {};
	class max_bike: sedan {};
	class max_bike_b: sedan {};
	class max_bike_db: sedan {};
	class max_bike_dg: sedan {};
	class max_bike_w: sedan {};
	class nomads_bike: sedan {};
	class RRPVehicle_civ_lada_1: sedan {};
	class RRPVehicle_civ_lada_2: sedan {};
	class RRPVehicle_civ_lada_3: sedan {};
	class RRPVehicle_civ_lada_4: sedan {};
	class RRPVehicle_civ_lada_7: sedan {};
	class RRPVehicle_civ_lada_5: sedan {};
	class RRPVehicle_civ_lada_6: sedan {};
	class RRPVehicle_civ_2114: sedan {};
	class RRPVehicle_civ_fordbronco_1: sedan {};
	class RRPVehicle_civ_gaz24_1: sedan {};
	class RRPVehicle_civ_gaz24_2: sedan {};
	class RRPVehicle_civ_gaz24_3: sedan {};
	class RRPVehicle_civ_golf4rds_1: sedan {};
	class RRPVehicle_civ_golf4rds_2: sedan {};
	class RRPVehicle_f90lyk_kifo: sedan {};
	class RRPVehicle_f90_Sector7: sedan {};
	class RRPVehicle_civ_golf4rds_3: sedan {};
	class RRPVehicle_civ_golf4rds_4: sedan {};
	class RRPVehicle_civ_golf4rds_5: sedan {};
	class RRPVehicle_civ_golf4rds_6: sedan {};
	class RDS_S1203_Civ_01: sedan {};
	class RDS_S1203_Civ_04: sedan {};
	class RDS_S1203_Civ_05: sedan {};
	class RDS_S1203_Civ_06: sedan {};
	class RDS_S1203_Civ_07: sedan {};
	class RDS_S1203_Civ_08: sedan {};
	class C_Hatchback_01_sport_Taxi: sedan {};
	class RRPVehicle_xesv_BlackSnow: sedan {};
	class RRPVehicle_f82LB_BlackSnow: sedan {};
	class RRPVehicle_f82LB_2_BlackSnow: sedan {};
	class I_G_Van_01_transport_F: sedan {};
	class C_Boat_Civil_01_F: sedan {};
	class B_SDV_01_F: sedan {};
	class C_Boat_Civil_01_police_F: sedan {};
	class C_Boat_Civil_01_rescue_F: sedan {};
	class Burnes_MK10_1: sedan {};
	class extremo_lcm: sedan {};
	class GeK_Ferry: sedan {};
	class C_Fishing_Boat_Apex: sedan {};
	class Shalllop: sedan {};
	class C_Fishing_Boat: sedan {};
	class BHS_ifrit: sedan {};
	class B_mas_HMMWV_UNA: sedan {};
	class B_mas_HMMWV_sdr: sedan {};
	class B_mas_HMMWV_SWAT: sedan {};
	class B_mas_HMMWV_ISF: sedan {};
	class B_mas_HMMWV_noa: sedan {};
	class B_mas_HMMWV_TOW: sedan {};
	class B_mas_HMMWV_M2: sedan {};
	class B_mas_HMMWV_ISF_M2: sedan {};
	class B_mas_HMMWV_CCP_M2: sedan {};
	class B_mas_HMMWV_W_M2: sedan {};
	class B_mas_HMMWV_LA_M2: sedan {};
	class B_mas_HMMWV_sdr_M2: sedan {};
	class B_mas_HMMWV_ira_M2: sedan {};
	class B_mas_HMMWV_kra_M2: sedan {};
	class B_mas_HMMWV_VRS_M2: sedan {};
	class B_mas_HMMWV_MUJH_M2: sedan {};
	class B_mas_HMMWV_SWAT_M2: sedan {};
	class B_mas_HMMWV_noa_M2: sedan {};
	class B_mas_HMMWV_RFA_M2: sedan {};
	class B_mas_HMMWV_ICS_M2: sedan {};
	class B_mas_HMMWV_DEA_M2: sedan {};
	class B_mas_HMMWV_FSG_M2: sedan {};
	class B_mas_HMMWV_ARG_M2: sedan {};
	class B_mas_HMMWV_SWAT_TOW: sedan {};
	class B_mas_HMMWV_DEA_TOW: sedan {};
	class UAZ_Rebels: sedan {};
	class UAZ_Unarmed: sedan {};
	class UAZ_green: sedan {};
	class UAZ_Hunter_s: sedan {};
	class UAZ_Hunter_g: sedan {};
	class B_mas_cars_LR_Unarmed: sedan {};
	class C_Plane_Civil_01_F: sedan {};
	class C_Rubberboat: sedan {};
	class ext_sab_boat: sedan {};
	class I_Boat_Transport_01_F: sedan {};
	class d3s_fpace_17_EMS: sedan {};
	class d3s_fpace_17_COP: sedan {};
	class O_Boat_Armed_01_hmg_F: sedan {};
	class B_Boat_Armed_01_minigun_F: sedan {};
	class I_Boat_Armed_01_minigun_F: sedan {};
	class B_G_Boat_Transport_01_F: sedan {};
	class B_Boat_Transport_01_F: sedan {};
	class Mrshounka_a3_smart_Rework_noir_f: sedan {};
	class Mrshounka_r5_Rework_noir_f: sedan {};
	class MrShounka_Clio_RS_Rework_noir_f: sedan {};
	class Mrshounka_twingo_Rework_noir_f: sedan {};
	class MrShounka_Peugeot_207_rework_noir_f: sedan {};
	class Mrshounka_a3_rs_Rework_p_noir_f: sedan {};
	class Mrshounka_c4_Rework_noir_f: sedan {};
	class Mrshounka_a3_ds3_rework_noir_f: sedan {};
	class GeK_UAZ_3303: sedan {};
	class GeK_Zil_bleu: sedan {};
	class Mrshounka_golfvi_Rework_noir_f: sedan {};
	class Mrshounka_a3_308_Gti_Rework_noir_f: sedan {};
	class Mrshounka_Alfa_Romeo_Brera_Rework_noir_f: sedan {};
	class Mrshounka_subaru08_Rework_noir_f: sedan {};
	class MrShounka_Peugeot508_Rework_noir_f: sedan {};
	class Mrshounka_c63_2015_Rework_noir_f: sedan {};
	class Mrshounka_rs4_Rework_noir_f: sedan {};
	class Mrshounka_a3_dodge15_Rework_noir_f: sedan {};
	class Mrshounka_rs6_avant_Rework_noir_f: sedan {};
	class MrShounka_audi_RS5_Rework_p_noir_f: sedan {};
	class Mrshounka_bmwm6_Rework_noir_f: sedan {};
	class Mrshounka_mercedes_clk_Rework_noir_f: sedan {};
	class Mrshounka_mustang_Rework_noir_f: sedan {};
	class Mrshounka_mercedes_190_Rework_noir_f: sedan {};
	class Mrshounka_bmw_1series_Rework_noir_f: sedan {};
	class MrRRPVehicle_civ_transam_Rework_noir_f: sedan {};
	class Mrshounka_lincoln_Rework_noir_f: sedan {};
	class AlessioBM4M: sedan {};
	class d3s_fpace_17_s: sedan {};
	class Lemon_BMW_750i_noire: sedan {};
	class Lemon_Mercedes_ML_63_bordeaux: sedan {};
	class Mrshounka_Volkswagen_Touareg_Rework_noir_f: sedan {};
	class Mrshounka_cayenne_Rework_noir_f: sedan {};
	class Mrshounka_jeep_blinde_Rework_noir_f: sedan {};
	class MrShounka_audiq7_Rework_noir_f: sedan {};
	class Mrshounka_chevrolet_avalanche_noir_f: sedan {};
	class Mrshounka_hummer_Rework_noir_f: sedan {};
	class Mrshounka_Bowler_Rework_noir_f: sedan {};
	class MrShounka_Huracan_Rework_p_noir_f: sedan {};
	class Mrshounka_veveno_Rework_p_noir_f: sedan {};
	class Mrshounka_lykan_Rework_p_noir_f: sedan {};
	class Mrshounka_agera_Rework_p_noir_f: sedan {};
	class Mrshounka_pagani_Rework_p_noir_f: sedan {};
	class MrRRPVehicle_civ_porsche911_92_Rework_noir_f: sedan {};
	class Mrshouka_fordgt_Rework_noir_f: sedan {};
	class Mrshounka_mp4_Rework_p_noir_f: sedan {};
	class Mrshounka_ferrari_f430_scuderia_Rework_noir_f: sedan {};
	class Mrshounka_RRPVehicle_civ_monster_Rework_noir_f: sedan {};
	class Mrshounka_citroen_nemo_Rework_blanche_f: sedan {};
	class quiet_audi_r8_plus_spawn_couleur_blanche_ingame_f: sedan {};
	class quiet_sub2015_noir_f: sedan {};
	class atm_C130_J: sedan {};
	class RDS_S1203_Civ_02: sedan {};
	class mercedes_atego_pompier_ingame: sedan {};
	class dezkit_b206_ems: sedan {};
	class dezkit_b206_news: sedan {};
	class dezkit_b206_rescue: sedan {};
	class ivory_wrx_pd_m3: sedan {};
	class ivory_wrx_tsfi_marked: sedan {};
	class ivory_isf_unmarked: sedan {};
	class ivory_m3_unmarked: sedan {};
	class ivory_wrx_unmarked: sedan {};
	class ivory_wrx_pd_m2: sedan {};
	class ivory_wrx_pd_m1: sedan {};
	class ivory_m3_pd_M: sedan {};
	class ivory_isf_pd_m: sedan {};
	class B_G_Offroad_01_armed_F: sedan {};
	class B_mas_cars_Hilux_M2: sedan {};
	class I_mas_cars_UAZ_M2: sedan {};
	class B_mas_cars_LR_M2: sedan {};
	class PMC_Offroad_Transport: sedan {};
	class PMC_Offroad_Armed: sedan {};
	class SIG_SuperBee: sedan {};
	class SIG_SuperBeeY: sedan {};
	class SIG_SuperBeeB: sedan {};
	class SIG_SuperBeeL: sedan {};
	class SIG_SuperBeeM: sedan {};
	class SIG_SuperBeeG: sedan {};
	class SIG_Roadrunner: sedan {};
	class SIG_Hubcaps: sedan {};
	class SIG_Magnums: sedan {};
	class SIG_Hcode: sedan {};
	class jeffery_a3_audiq7_v2_gendarmerie: sedan {};
	class Mrjeffery_bmw_gend: sedan {};
	class Jeffery_a3_508gend: sedan {};
	class smart_Jonzie_Mini_Cooper: sedan {};
	class smart_Jonzie_Mini_Cooper_R_spec: sedan {};
	class smart_Jonzie_STI: sedan {};
	class smart_Jonzie_30CSL: sedan {};
	class smart_Jonzie_Datsun_Z432: sedan {};
	class smart_Jonzie_XB: sedan {};
	class smart_ivory_rs4: sedan {};
	class smart_ivory_c: sedan {};
	class ivory_wrx_command_ems: sedan {};
	class smart_ivory_veyron: sedan {};
	class smart_ivory_e36: sedan {};
	class smart_ivory_m3: sedan {};
	class smart_ivory_isf: sedan {};
	class smart_ivory_elise: sedan {};
	class smart_ivory_lfa: sedan {};
	class smart_ivory_mp4: sedan {};
	class smart_ivory_190e: sedan {};
	class smart_ivory_evox: sedan {};
	class smart_ivory_r34: sedan {};
	class smart_ivory_gt500: sedan {};
	class smart_ivory_wrx: sedan {};
	class smart_ivory_supra: sedan {};
	class smart_ivory_rs4_taxi: sedan {};
	class MrShounka_audia8_limo_Rework_p_noir_f: sedan {};
	class TM_Porsche_911_Black: sedan {};
	class Quiet_c65amg_noir_f: sedan {};
	class DKP_Gelik_SA_e999kx77: sedan {};
	class DKP_Gelik_SA_pnshr: sedan {};
	class smart_ivory_190e_taxi: sedan {};
	class O_mas_BTR60: sedan {};
	class RRPVehicle_Furai_76561198167288913: sedan {};
	class RRPVehicle_w212_kifo: sedan {};
	class RRPVehicle_w212_kifo_2: sedan {};
	class RRPVehicle_svr_kifo: sedan {};
	class B_APC_Wheeled_01_cannon_F: sedan {};
	class Mrshounka_Volkswagen_T_Gend_Rework_f: sedan {};
	class Mrshounka_megane_rs_2015_Gend_Rework_f: sedan {};
	class MrShounka_Clio_RS_Gend_Rework_f: sedan {};
	class Mrshounka_bmw_1s_Gend_Rework_f: sedan {};
	class mrshounka_vsav_smur_rework_Rework_f: sedan {};
	class smart_ivory_isf_police: sedan {};
	class smart_ivory_m3_police: sedan {};
	class smart_ivory_evox_police: sedan {};
	class smart_ivory_wrx_police: sedan {};
	class Xiphoid87_LX570_16_Rimas: sedan {};
	class Xiphoid87_NissanNismo_Rimas: sedan {};
	class Xiphoid87_RangeRover_HSE_Rimas: sedan {};
	class d3s_vklasse_17: sedan {};
	class d3s_vklasse_17_EMS: sedan {};
	class Sopranos_Camaro_ZL1: sedan {};
	class d3s_vklasse_17_COP: sedan {};
	class RRPVehicle_camaro_Kasatky: sedan {};
	class d3s_s650_18: sedan {};
	class d3s_vklasse_17_TAXI: sedan {};
	class d3s_is_YG: sedan {};
	class d3s_wrx_sti_YG: sedan {};
	class d3s_giulietta_quad_Kasatki: sedan {};
	class d3s_g65amg_Kasatki: sedan {};
	class d3s_focus_17_CHROME: sedan {};
	class d3s_focus_17_Sopranos: sedan {};
	class RRPVehicle_200_Cwrka: sedan {};
	class RRPVehicle_escalade_Cwrka: sedan {};
	class d3s_escalade_CHROME: sedan {};
	class CN_urus_18: sedan {};
	class d3s_crown_mafia: sedan {};
	class YG_silvia_s15_02: sedan {};
	class YG_f82_14_LB: sedan {};
	class Enclav_ctsv_16: sedan {};
	class Legion_ctsv: sedan {};
	class ACAD_savana_05: sedan {};
	class Legion_GMS: sedan {};
	class d3s_g63amg_PREM1: sedan {};
	class kasatky_yaga2: sedan {};
	class kasatky_yaga1: sedan {};
	class d3s_is_16_PREM: sedan {};
	class d3s_g63amg_PREM: sedan {};
	class d3s_bentayga_18: sedan {};
	class d3s_bentayga_d_18: sedan {};
	class d3s_bentayga_V12_18: sedan {};
	class d3s_vv222_18: sedan {};
	class d3s_vv222_18_2: sedan {};
	class d3s_macan_16: sedan {};
	class d3s_macan_s_16: sedan {};
	class d3s_macan_turbo_s_16: sedan {};
	class d3s_macan_turbo_16: sedan {};
	class d3s_200_VX_16: sedan {};
	class d3s_200_16: sedan {};
	class d3s_200_16_EX: sedan {};
	class d3s_continentalGT_18: sedan {};
	class d3s_vesta_15: sedan {};
	class d3s_vesta_15_turbo: sedan {};
	class d3s_e400_BW: sedan {};
	class d3s_gl63amg_BW: sedan {};
	class RRPVehicle_savana_Pirates: sedan {};
	class RRPVehicle_scoda_wolves: sedan {};
	class g_class_cigane: sedan {};
	class mustang_cigane: sedan {};
	class d3s_wrx_17_BW: sedan {};
	class RRPVehicle_santafe_MS13: sedan {};
	class d3s_g65amg_DW: sedan {};
	class RRPVehicle_sumo_76561198357268475: sedan {};
	class d3s_f90_DW: sedan {};
	class C_Scooter_Transport_01_F: sedan {};
	class I_C_Boat_Transport_02_F: sedan {};
	class C_Fishing_Trawler: sedan {};
	class RRPVehicle_svr_cigane: sedan {};
	class RRPVehicle_Q7_76561198805873784: sedan {};
	class CN_Boat_1: sedan {};
	class Boat_PH: sedan {};
	class RRPVehicle_Boat_Transport_Phoenix: sedan {};
	class IMPERIUM_M3_f80_14: sedan {};
	class IMPERIUM_amgGT_19_63S: sedan {};
	class IMPERIUM_asterion_15_DMC: sedan {};
	class ri_parom_u: sedan {};
	class ri_parom3_u_BE: sedan {};
	class ri_parom3_BE: sedan {};
	class RRPVehicle_civic_BlackSnow: sedan {};
	class RRPVehicle_durango_Deadlock: sedan {};
	class RRPVehicle_G12_76561198437378792: sedan {};
	class RRPVehicle_urus_MS13: sedan {};
	class RRPVehicle_svr_MS13: sedan {};
	class RRPVehicle_santafe_Sector7: sedan {};
	class RRPVehicle_svr_76561199003868334: sedan {};
	class RRPVehicle_fpace_Deadlock: sedan {};
	class d3s_menacer_gtaV: sedan {};
	class d3s_RS6MANS_20: sedan {};

	class RRPVehicle_Bears_G65: sedan{};
	class RRPVehicle_Bears_f90_1: sedan{};
	class RRPVehicle_Bears_f90_2: sedan{};
	class RRPVehicle_Bears_roversport: sedan{};
	class RRPVehicle_Bears_w124: sedan{};
	///
	class RRPVehicle_Event1_e34tun : sedan {};
	class RRPVehicle_Event1_agera : sedan {};
	class RRPVehicle_Event1_f90 : sedan {};
	class RRPVehicle_Event1_zr1spoiler : sedan {};
	class RRPVehicle_Event1_monster : sedan {};
	class RRPVehicle_Event1_ferrarif430 : sedan {};
	class RRPVehicle_Event1_mus : sedan {};
	class RRPVehicle_Event1_rx7 : sedan {};
	class RRPVehicle_Event1_c63amg_4 : sedan {};
	class RRPVehicle_Event1_trike : sedan {};
	class RRPVehicle_Event1_Windsorsedan : sedan {};
	class RRPVehicle_Event1_escalade : sedan {};
	class RRPVehicle_Event1_zombieagtaV : sedan {};
	class RRPVehicle_Event1_sanctusgtaV : sedan {};
	class RRPVehicle_Event1_KawasakiZ800 : sedan {};
	//
	class d3s_ghibli_14: sedan {};
	class d3s_ghibli_14_s: sedan {};
	class d3s_ghibli_14_q4: sedan {};
	class d3s_pajero_07_PE: sedan {};
	class d3s_pajero_07_38: sedan {};
	class d3s_pajero_07: sedan {};
	class d3s_e38_98: sedan {};
	class DV_e38: sedan {};
	class DV_vklasse_17: sedan {};
	class d3s_300S_12: sedan {};
	class d3s_300C_12: sedan {};
	class d3s_civic_17: sedan {};
	class d3s_civic_17_S: sedan {};
	class d3s_f13_13: sedan {};
	class d3s_f13_13_Comp: sedan {};
	class d3s_f13_13_CE: sedan {};
	class d3s_f13_13_EX: sedan {};
	class d3s_f82_14_base: sedan {};
	class d3s_uaz_469P: sedan {};
	class d3s_focus_17: sedan {};
	class d3s_ctsv_16: sedan {};
	class d3s_rapide_10_AMR: sedan {};
	class d3s_rapide_10_S: sedan {};
	class d3s_rapide_10: sedan {};
	class d3s_f85_15_EX: sedan {};
	class d3s_f85_15_m: sedan {};
	class d3s_f85_15: sedan {};
	class d3s_wrx_sti_17: sedan {};
	class d3s_wrx_17_FnF8: sedan {};
	class d3s_wrx_17: sedan {};
	class d3s_fiesta_16_EX: sedan {};
	class d3s_fiesta_16_H: sedan {};
	class d3s_fiesta_16_230: sedan {};
	class d3s_fiesta_16: sedan {};
	class d3s_clubman_11_W: sedan {};
	class d3s_clubman_11_50: sedan {};
	class d3s_clubman_11: sedan {};
	class d3s_g65amg_Mansory_2: sedan {};
	class d3s_g65amg_Mansory: sedan {};
	class d3s_durango_18_SRT: sedan {};
	class d3s_durango_18_se: sedan {};
	class d3s_durango_18: sedan {};
	class d3s_taurus_eco_10: sedan {};
	class d3s_is_16_SE: sedan {};
	class d3s_is_f_16: sedan {};
	class d3s_is_16: sedan {};
	class d3s_giulietta_16_SE: sedan {};
	class d3s_giulietta_quad_16: sedan {};
	class d3s_giulietta_16: sedan {};
	class d3s_cherokee_18_TRCK: sedan {};
	class d3s_f86_15_OFF: sedan {};
	class d3s_f86_15_m: sedan {};
	class d3s_f86_15: sedan {};
	class d3s_escalade_16: sedan {};
	class d3s_giulia_quad_16: sedan {};
	class RRPVehicle_giulia_MS13: sedan {};
	class d3s_urus_18: sedan {};
	class d3s_gle43amg_15: sedan {};
	class d3s_gle63amg_15: sedan {};
	class d3s_gle63amgS_15: sedan {};
	class d3s_savana_05: sedan {};
	class d3s_savana_out: sedan {};
	class d3s_silvia_s15_02: sedan {};
	class d3s_f90_18_med: sedan {};
	class d3s_f90_18_m: sedan {};
	class d3s_camaro_16: sedan {};
	class d3s_camaro_ss_16: sedan {};
	class jaguar_bs: sedan {};
	class rapid_BS: sedan {};
	class RRPVehicle_Q7_Alpha: sedan {};
	class RRPVehicle_RS7_Alpha: sedan {};
	class RRPVehicle_g63amg_Alpha: sedan {};
	class RRPVehicle_civ_segway: sedan {};
	//
	class d3s_uaz_3162: sedan {};
	class d3s_uaz_3165M: sedan {};
	class d3s_crown_98: sedan {};
	class d3s_kodiaq_17: sedan {};
	class d3s_explorer_13: sedan {};
	class d3s_charger_15: sedan {};
	class d3s_fpace_17_r: sedan {};
	class d3s_fpace_17_fe: sedan {};
	class d3s_tahoe_08: sedan {};
	class d3s_tahoe_ltz_08: sedan {};
	class d3s_e350_16: sedan {};
	class d3s_e400_16: sedan {};
	class d3s_f90_18: sedan {};
	class d3s_f90_18_FE: sedan {};
	class d3s_raptor_17: sedan {};
	class d3s_fpace_17_s_Legion: sedan {};
	class RRPVehicle_raptor_MS13: sedan {};
	class d3s_raptor_17_Legion: sedan {};
	class d3s_gl63amg_12: sedan {};
	class d3s_g350d_15: sedan {};
	class d3s_g63amg_463_16: sedan {};
	class d3s_g65amg_Mansory_Esc: sedan {};
	class RRPVehicle_g65amg_Pirates: sedan {};
	class d3s_f82_14_LB: sedan {};
	class RRPVehicle_xesv_Pirates: sedan {};
	class d3s_e350_DW: sedan {};
	class PULLMAN_FOR_URALEC: sedan {};
	class RRPVehicle_vv222_Pirates: sedan {};
	class d3s_vv222_DV: sedan {};
	class d3s_camaro_Const_1: sedan {};
	class d3s_g65amg_Mansory_Const: sedan {};
	class d3s_crown_98_phoenix: sedan {};
	class RRPVehicle_e400_Phoenix: sedan {};
	class d3s_escalade_16_phoenix: sedan {};
	class DV_levante: sedan {};
	class IMPERIUM_XE_SV: sedan {};
	class RRPVehicle_uaz_Cwrka: sedan {};
	class RRPVehicle_crown_Cwrka: sedan {};
	class RRPVehicle_escalade_Deadlock: sedan {};
	class RRPVehicle_e400_Pirates: sedan {};
	class RRPVehicle_xesv_cigane: sedan {};

	//NewYear cars
	class d3s_300SRT_NewYear: sedan {};
	class focus_FAR: sedan {};
	class d3s_bentayga_V12_18_NY: sedan {};
	class d3s_camaro_zl1_1le_18_NY: sedan {};
	class d3s_civic_17_EX_NewYear: sedan {};
	class d3s_clubman_11_50_NewYear: sedan {};
	class d3s_f13_13_CE_NY: sedan {};
	class d3s_f85_15_EX_NY: sedan {};
	class d3s_f90_18_sport_NY: sedan {};
	class d3s_f90_18_m_NY: sedan {};
	class d3s_f90_18_FE_NY: sedan {};
	class d3s_fiesta_16_EX_NY: sedan {};
	class d3s_focus_17_RS_NY: sedan {};
	class d3s_focus_17_PP_NY: sedan {};
	class d3s_focus_17_LB_NY: sedan {};
	class d3s_fpace_17_fe_NY: sedan {};
	class d3s_g65amg_17_FINAL_NY: sedan {};
	class d3s_ghibli_14_sq4_NY: sedan {};
	class d3s_giulietta_16_SE_NY: sedan {};
	class d3s_levante_s_17_mat_NY: sedan {};
	class d3s_pajero_07_NY: sedan {};
	class d3s_QX60_16_SE_NY: sedan {};
	class d3s_QX60_16_SE_NY2: sedan {};
	class d3s_raptor_SCR_17_NY: sedan {};
	class d3s_urus_18_NY: sedan {};
	class d3s_urus_18_NY2: sedan {};
	class Boat_ESC: sedan {};
	class IMPERIUM_SRT_18: sedan {};
	class IMPERIUM_fpace_17_s: sedan {};
	class RRPVehicle_sector7_2114: sedan {};
	class RRPVehicle_sector7_roversport: sedan {};
	class RRPVehicle_sector7_touareg: sedan {};
	class s7_vehicles_uaz: sedan {};
	class s7_vehicles_lc200: sedan {};
	class s7_vehicles_maserati: sedan {};
	class s7_vehicles_qx56: sedan {};
	class s7_vehicles_m4: sedan {};
	class d3s_f82_14_Pirates: sedan {};
	class RRPVehicle_f82_Pirates: sedan {};
	class d3s_f10_12_IMPEP: sedan {};
	class SK_6x6_14: sedan {};
	class SK_vv222_18: sedan {};
	class SK_amgGT_19_63S: sedan {};
	class SK_GTR_15_S: sedan {};
	class SK_GTR_15_W: sedan {};
	class SK_asterion_15_DMC: sedan {};
	class SK_Hyundai_S: sedan {};
	class SK_XE_SV: sedan {};
	class SK_M3_f80_14: sedan {};
	class SK_fpace_17_s: sedan {};
	class SK_SRT_18: sedan {};
	class d3s_f10_12_SK: sedan {};
	class RRP_g500_18_a2: sedan {};
	class RRP_veneno_a2: sedan {};
	class RRP_eldorado68_a2: sedan {};
	class RRP_eldorado76_a2: sedan {};
	class RRP_vv222_a2: sedan {};
	class RRP_f1gt_a2: sedan {};
	class RRP_mclaren_a2: sedan {};
	class RRP_6x6_a2: sedan {};
	class RRP_alfieri_a2: sedan {};
	class RRPVehicle_Mansory_umbrella_1: sedan {};
	class RRPVehicle_Mansory_umbrella_2: sedan {};
	class RRPVehicle_e220_umbrella_1: sedan {};
	class RRPVehicle_200_MW: sedan {};
	class RRPVehicle_pajero_Phoenix: sedan {};
	class RRPVehicle_chiron_76561198006239186: sedan {};
	class RRPVehicle_f1gt_76561198860385638: sedan {};
	class d3s_r8v10_19_D_aucV: sedan {};
	class d3s_terzo_18_M_aucV: sedan {};
	class d3s_roosevelt_gtaV_aucV: sedan {};
	class d3s_LP700_11_L_aucV: sedan {};
	class d3s_Streamside_AR8_aucV: sedan {};
	class d3s_911carrera_20_W_aucV: sedan {};
	class d3s_F40_87_V_aucV: sedan {};
	class d3s_HuayraRoadster_19_R_aucV: sedan {};
	class d3s_HuayraRoadster_17_R_aucV: sedan {};
	class d3s_gemera_21_A: sedan {};
	class d3s_megane_06 : sedan {};
	class d3s_911carrera_20 : sedan {};
	class RRPVehicle_civ_r5 : sedan {};
	class RRPVehicle_civ_smart : sedan {};
	class Mrshounka_c4_p_civ : sedan {};
	class Mrshounka_a3_ds3_civ : sedan {};
	class RRPVehicle_civ_peugeot308 : sedan {};
	class RRPVehicle_civ_citroenDS4 : sedan {};
	class RRPVehicle_civ_golfVI : sedan {};
	class RRPVehicle_civ_peugeot508 : sedan {};
	class RRPVehicle_civ_alfaromeobrera : sedan {};
	class RRPVehicle_civ_e34 : sedan {};
	class RRPVehicle_civ_w124 : sedan {};
	class RRPVehicle_civ_clk : sedan {};
	class RRPVehicle_civ_rs4 : sedan {};
	class RRPVehicle_civ_rs5 : sedan {};
	class RRPVehicle_civ_rx7 : sedan {};
	class RRPVehicle_civ_bmw1M : sedan {};
	class RRPVehicle_civ_porsche911 : sedan {};
	class RRPVehicle_civ_bmw6 : sedan {};
	class RRPVehicle_civ_cayenne : sedan {};
	class RRPVehicle_civ_audiq7 : sedan {};
	class RRPVehicle_civ_jeep : sedan {};
	class RRPVehicle_civ_touareg : sedan {};
	class RRPVehicle_civ_G65 : sedan {};
	class RRPVehicle_civ_roversport : sedan {};
	class RRPVehicle_civ_hummer2 : sedan {};
	class RRPVehicle_civ_hummer : sedan {};
	class RRPVehicle_civ_escalade : sedan {};
	class RRPVehicle_civ_fordgt : sedan {};
	class RRPVehicle_civ_mus : sedan {};
	class RRPVehicle_civ_monster : sedan {};
	class RRPVehicle_civ_zr1 : sedan {};
	class RRPVehicle_civ_ss : sedan {};
	class RRPVehicle_civ_buggy : sedan {};
	class RRPVehicle_civ_bowler : sedan {};
	class RRPVehicle_civ_f90 : sedan {};
	class RRPVehicle_civ_jeepblinde : sedan {};
	class RRPVehicle_civ_agera : sedan {};
	class RRPVehicle_civ_huracan : sedan {};
	class RRPVehicle_civ_veneno : sedan {};
	class RRPVehicle_civ_lykan : sedan {};
	class RRPVehicle_civ_gtrcustom : sedan {};
	class RRPVehicle_civ_gtr : sedan {};
	class RRPVehicle_civ_dubsta4x4vip : sedan {};
	class RRPVehicle_civ_paragon : sedan {};
	class RRPVehicle_civ_c63amg_1 : sedan {};
	class RRPVehicle_civ_porsche91182 : sedan {};
	class RRPVehicle_GTR_76561198157300994 : sedan {};
	class RRPVehicle_Cigane_Chevrolet : sedan {};
	class RRPVehicle_Cigane_Escalade : sedan {};
	class RRPVehicle_Cigane_SVR : sedan {};
	class RRPVehicle_Inagawakai_gtr : sedan {};
	class RRPVehicle_Inagawakai_cruiser200 : sedan {};
	class RRPVehicle_BlackWolves_fordbronco_1: sedan{};
	class RRPVehicle_blackWolves_jeep: sedan{};
	class RRPVehicle_blackWolves_370Z: sedan{};
	class RRPVehicle_BlackWolves_dodgesrt: sedan{};
	class RRPVehicle_LaCosaNostra_lc100: sedan{};
	class RRPVehicle_LaCosaNostra_camry55: sedan{};
	class RRPVehicle_Sector_gtr : sedan {};
	class RRPVehicle_Sector_cruiser200 : sedan {};
	class RRPVehicle_justice_rapid : sedan {};
	/////2020//////////////////////////////////
	class RRPVehicle_lm002_NY2020: 		newyear {};
	class RRPVehicle_teslaS_NY2020: 	newyear {};
	class RRPVehicle_continentalGT_NY2020: newyear {};
	class RRPVehicle_ghibli_NY2020: 	newyear {};
	class RRPVehicle_amgGT_NY2020: 		newyear {};
	class RRPVehicle_wrx_NY2020: 		newyear {};
	class RRPVehicle_raptor1_NY2020: 	newyear {};
	class RRPVehicle_raptor2_NY2020: 	newyear {};
	class RRPVehicle_gle63amgS_NY2020: 	newyear {};
	class RRPVehicle_g63amg_NY2020: 	newyear {};
	class RRPVehicle_cherokee_NY2020: 	newyear {};
	class RRPVehicle_camaro_NY2020: 	newyear {};
	class RRPVehicle_taurus1_NY2020: 	newyear {};
	class RRPVehicle_taurus2_NY2020: 	newyear {};
	class RRPVehicle_is_NY2020: 		newyear {};
	class RRPVehicle_giulietta_NY2020: 	newyear {};
	class RRPVehicle_giulia_NY2020: 	newyear {};
	class RRPVehicle_fpace_NY2020: 		newyear {};
	class RRPVehicle_escalade_NY2020: 	newyear {};
	class RRPVehicle_clubman_NY2020: 	newyear {};
	class RRPVehicle_vesta1_NY2020: 	newyear {};
	class RRPVehicle_vesta2_NY2020: 	newyear {};
	class RRPVehicle_3165M_NY2020: 		newyear {};
	class RRPVehicle_savana_NY2020: 	newyear {};
	class RRPVehicle_santafe_NY2020: 	newyear {};
	class RRPVehicle_pajero_NY2020: 	newyear {};
	class RRPVehicle_oka_NY2020: 		newyear {};
	class RRPVehicle_e38_NY2020: 		newyear {};
	class RRPVehicle_crown1_NY2020: 	newyear {};
	class RRPVehicle_crown2_NY2020: 	newyear {};
	class RRPVehicle_crown3_NY2020: 	newyear {};
	class RRPVehicle_focus_NY2020: 		newyear {};


	////
	class RRPVehicle_civic_NY21:		newyear {};
	class RRPVehicle_crown_NY21:		newyear {};
	class RRPVehicle_e38_NY21:			newyear {};
	class RRPVehicle_focus_NY21:		newyear {};
	class RRPVehicle_giulietta_NY21:	newyear {};
	class RRPVehicle_Quadbike_NY21:		newyear {};
	class RRPVehicle_uaz_1_NY21:		newyear {};
	class RRPVehicle_uaz_2_NY21:		newyear {};
	class RRPVehicle_vesta_NY21:		newyear {};
	class RRPVehicle_200_NY21:			newyear {};
	class RRPVehicle_beetle_u_NY21:		newyear {};
	class RRPVehicle_camaro_NY21:		newyear {};
	class RRPVehicle_camry_NY21:		newyear {};
	class RRPVehicle_cla_NY21:			newyear {};
	class RRPVehicle_fpace_NY21:		newyear {};
	class RRPVehicle_malibu_NY21:		newyear {};
	class RRPVehicle_santafe_u_NY21:	newyear {};
	class RRPVehicle_w212_1_NY21:		newyear {};
	class RRPVehicle_w212_2_NY21:		newyear {};
	class RRPVehicle_cayenne_NY21:		newyear {};
	class RRPVehicle_ctsv_NY21:			newyear {};
	class RRPVehicle_e400_NY21:			newyear {};
	class RRPVehicle_f80_R_NY21:		newyear {};
	class RRPVehicle_f86_NY21:			newyear {};
	class RRPVehicle_f90_NY21:			newyear {};
	class RRPVehicle_gls63_NY21:		newyear {};
	class RRPVehicle_juke_NY21:			newyear {};
	class RRPVehicle_qx56_NY21:			newyear {};
	class RRPVehicle_raptor_NY21:	 	newyear {};
	class RRPVehicle_santafe_NY21:		newyear {};
	class RRPVehicle_svr_R_NY21:		newyear {};
	class RRPVehicle_tahoe_1_NY21:		newyear {};
	class RRPVehicle_tahoe_2_NY21:		newyear {};
	class RRPVehicle_tahoe_3_NY21:		newyear {};
	class RRPVehicle_amgGT_NY21:		newyear {};
	class RRPVehicle_ctsv_rar_NY21:		newyear {};
	class RRPVehicle_durango_NY21:		newyear {};
	class RRPVehicle_Q7_NY21:			newyear {};
	class RRPVehicle_amgGTR_NY21:		newyear {};
	class RRPVehicle_e60_NY21:			newyear {};
	class RRPVehicle_f80_NY21:	 		newyear {};
	class RRPVehicle_g63amg_NY21:		newyear {};
	class RRPVehicle_hornet_1_NY21:		newyear {};
	class RRPVehicle_hornet_2_NY21:		newyear {};
	class RRPVehicle_Kuruma_NY21:		newyear {};
	class RRPVehicle_silvia_NY21:		newyear {};
	class RRPVehicle_svr_NY21:			newyear {};
	class RRPVehicle_tiger_NY21:		newyear {};
	class RRPVehicle_titan_NY21:		newyear {};
	class RRPVehicle_zaz968m_NY21:		newyear {};

	class RRPVehicle_civ_e34_NY2022:			newyear {};
	class RRPVehicle_civ_peugeot508_NY2022:		newyear {};
	class RRPVehicle_civ_citroends3_NY2022:		newyear {};
	class RRPVehicle_civ_r5_NY2022:				newyear {};
	class RRPVehicle_civ_audiq7_NY2022:			newyear {};
	class RRPVehicle_civ_roversport_NY2022:		newyear {};
	class RRPVehicle_civ_cayenne_NY2022:		newyear {};
	class RRPVehicle_civ_touareg_NY2022:		newyear {};
	class RRPVehicle_civ_bmw6_1_NY2022:			newyear {};
	class RRPVehicle_civ_bmw6_2_NY2022:			newyear {};
	class RRPVehicle_civ_clk_NY2022:			newyear {};
	class RRPVehicle_civ_golfVI_NY2022:			newyear {};
	class RRPVehicle_civ_bmw1M_NY2022:			newyear {};
	class RRPVehicle_civ_G65_NY2022:			newyear {};
	class RRPVehicle_civ_gtr_NY2022:			newyear {};
	class RRPVehicle_civ_yamaha_NY2022:			newyear {};

	class d3s_r8v10_19 : sedan {};
	class d3s_Q7_15 : sedan {};
	class d3s_RS6_20 : sedan {};
	class d3s_RS7_13 : sedan {};
	class d3s_RS7_13_D : sedan {};

	class RRPVehicle_hornet_RimasINC: sedan {};
	class RRPVehicle_200_RimasINC: sedan {};
	class RRPVehicle_f80_RimasINC: sedan {};
	class RRPVehicle_crown_RimasINC: sedan {};
	class d3s_roosevelt_RimasINC: sedan {};

	class RRPVehicle_miners_touareg : sedan {};

	class RRPVehicle_civ_camry: sedan {};
	class RRPVehicle_lk_camry: sedan {};
	class RRPVehicle_lk_cruiser200: sedan {};
	class RRPVehicle_civ_cruiser200: sedan {};

	class RRPVehicle_civ_lc_100: sedan {};
	class RRPVehicle_civ_lc_100_vx: sedan {};
	class RRPVehicle_civ_lc_100_unm: sedan {};
	class RRPVehicle_civ_camry55: sedan {};
	class toyota_cruiser_100_off_road: sedan {};

	class d3s_amgGTR_15: sedan {};
	class RRPVehicle_w212s_Sector7: sedan {};
	class RRPVehicle_santafe_Sopranos: sedan {};
	class RRPVehicle_f87_Sopranos: sedan {};
	class RRPVehicle_RS6_76561198022595697: sedan {};
	class d3s_ADV_Brabus: sedan {};
	class d3s_uaz_469P_EXP: sedan {};
	class RRPVehicle_durango_BlackSnow: sedan {};
	class RRPVehicle_6x6_76561199028844328: sedan {};
	class RRPVehicle_LP700_76561198965376624: sedan {};
	class RRPVehicle_divooff_A7_76561198802169420: sedan {};
	class RRPVehicle_hornet_A4: sedan {};
	class RRPBoat_parom_127_A4: sedan {};
	class RRPVehicle_Ultriansurgent_A4: sedan {};
	class RRPVehicle_chiron_1_A4: sedan {};
	class RRPVehicle_chiron_2_A4: sedan {};
	class RRPVehicle_ADVBrabus_1_A4: sedan {};
	class RRPVehicle_ADVBrabus_2_A4: sedan {};
	class RRPVehicle_BT62_1_A4: sedan {};
	class RRPVehicle_BT62_2_A4: sedan {};
	class RRPVehicle_RWBEvo_1_A4: sedan {};
	class RRPVehicle_RWBEvo_2_A4: sedan {};
	class RRPVehicle_dubsta_4x4_A4: sedan {};
	class RRPVehicle_dubsta2_A4: sedan {};
	class RRPVehicle_eldorado_A4: sedan {};
	class RRPVehicle_lm002_MS13: sedan {};
	class RRPVehicle_lm002_Phoenix: sedan {};
	class RRPVehicle_lm002_Phoenix_2: sedan {};
	class RRPVehicle_h1_76561198437378792: sedan {};
	class RRPVehicle_GT_76561197987658357: sedan {};
	class RRPVehicle_mclaren_76561198327404632: sedan {};
	class RRPVehicle_LP700_76561198805873784: sedan {};
	class RRPVehicle_TOW_achiev: sedan {};
	class RRPVehicle_vv222_achiev: sedan {};
	class RRPVehicle_cullinan_76561198437378792: sedan {};
	class RRPVehicle_fpace_wolves: sedan {};
	class RRPVehicle_svr_wolves: sedan {};
	class RRPVehicle_Heli_wolves: sedan {};
	class RRPVehicle_Heli_1_wolves: sedan {};
	class RRPVehicle_3165M_Deadlock: sedan {};
	class RRPVehicle_dubsta2_76561198984360169: sedan {};
	class RRPVehicle_dubsta2_76561199072206957: sedan {};
	class RRPVehicle_dubsta2_76561199113587031: sedan {};
	class RRPVehicle_911gt3rs_76561198130879772: sedan {};
	class RRPVehicle_C63AMG_76561198802169420: sedan {};
	class RRPVehicle_fpace_cigane: sedan {};
	class d3s_titan_17: sedan {};
	class d3s_juke_15: sedan {};
	class RRPVehicle_mark2_76561198283449875: sedan {};
	class RRPVehicle_TM2UCG_76561198366046837: sedan {};
	class d3s_bacalar_21_B_aucV: sedan {};
	class RRPVehicle_tahoe_bears: sedan {};
	class RRPVehicle_RS6_bears: sedan {};
	class d3s_boss_15: sedan {};
	class RRPVehicle_boss_76561198396427659: sedan {};
	class RRPVehicle_w212s_Phoenix: sedan {};
	class d3s_taycan_19_S: sedan {};
	class d3s_taycan_19_BS: sedan {};
	class d3s_teslaR_20: sedan {};
	class d3s_370ZNismo_16: sedan {};
	class d3s_h2_02: sedan {};
	class d3s_812Superfast_18: sedan {};
	class RRPVehicle_zr380_A7: sedan {};
	class RRPVehicle_parom3_A7: sedan {};
	class RRPVehicle_rrocket_A7: sedan {};
	class RRPVehicle_kitt_A7: sedan {};
	class RRPVehicle_mini_A7: sedan {};
	class RRPVehicle_furai_A7: sedan {};
	class RRPVehicle_gtmans_A7: sedan {};
	class RRPVehicle_paragon_sport_A7: sedan {};
	class RRPVehicle_escalade50_A7: sedan {};
	class RRPVehicle_divooff_A7: sedan {};
	class RRPVehicle_divo_A7: sedan {};
	class RRPVehicle_e34tun_A7: sedan {};
	class RRPVehicle_C63AMG_A7: sedan {};
	class RRPVehicle_f90off_A7: sedan {};
	class d3s_scaldarsi: sedan {};
	class RRPVehicle_bat12_A7: sedan {};
	
	class RRPVehicle_drop01_c63amgtun_3: sedan{};

	class RRPVehicle_drop01_cruiser200: sedan{};
	class RRPVehicle_drop01_gtrcustom: sedan{};
		 
	class RRPVehicle_drop01_gt63: sedan{};
	class RRPVehicle_drop01_zr1spoiler: sedan{};
	class RRPVehicle_drop01_w124: sedan{};

	class RRPVehicle_drop01_mini: sedan{};
	class RRPVehicle_drop01_clk: sedan{};
	class RRPVehicle_drop01_bmw1M: sedan{};
	class RRPVehicle_drop01_pontiackitt: sedan{};

	class RRPVehicle_drop01_rs4: sedan{};
	class RRPVehicle_drop01_peugeot508: sedan{};
	class RRPVehicle_drop01_audiq7: sedan{};
	class RRPVehicle_drop01_alfaromeobrera: sedan{};
	class RRPVehicle_drop01_smart: sedan{};

	class RRPVehicle_osk_honda_nsx_chameleon_ny2023: sedan{};
	class RRPVehicle_civ_mustang18_ny2023: sedan{};
	class RRPVehicle_civ_Windsorcoupe_ny2023: sedan{};
	class RRPVehicle_civ_G65_ny2023: sedan{};
	class RRPVehicle_civ_escalade_ny2023: sedan{};
	class RRPVehicle_civ_transam_ny2023: sedan{};
	class RRPVehicle_civ_quattro83_ny2023: sedan{};
	class RRPVehicle_civ_e34_ny2023: sedan{};
	class RRPVehicle_civ_bmw1M_ny2023: sedan{};
	class RRPVehicle_civ_lincoln_ny2023: sedan{};
	class RRPVehicle_civ_r5_ny2023: sedan{};
	class RRPVehicle_civ_2114_ny2023: sedan{};
	class RRPVehicle_civ_buggy_ny2023: sedan{};
	class RRPVehicle_civ_twingo_ny2023: sedan{};
	class RRPVehicle_civ_citroenC4_ny2023: sedan{};
	class RRPVehicle_civ_911_girl: sedan{};
	class RRPVehicle_civ_911_carrera: sedan{};

	class mustang18: sedan {};

	class auction8_RRPVehicle_f93HAMM_A8 : sedan {};
	class auction8_RRPVehicle_bacalar_A8 : sedan {};
	class auction8_RRPVehicle_f90offroad_A8 : sedan {};
	class auction8_RRPVehicle_divooff_A8 : sedan {};
	class auction8_RRPVehicle_hornet52_A8 : sedan {};
	class auction8_RRPVehicle_hornet53_A8 : sedan {};
	class auction8_RRPVehicle_impala67_A8 : sedan {};
	class auction8_RRPVehicle_nsx17_A8 : sedan {};
	class auction8_RRPVehicle_escalade50_A8 : sedan {};
	class auction8_RRPVehicle_LSVAT_A8 : sedan {};
	class auction8_RRPVehicle_Karen_A8 : sedan {};
	class auction8_RRPVehicle_PEEP50_A8 : sedan {};
	class auction8_RRPVehicle_BTR9023_A8 : sedan {};
	class auction8_RRPVehicle_zil130_A8 : truk_min {};
	class auction8_RRPVehicle_AGSMRAP_A8 : sedan {};
	class camry55_unm : sedan {};
	class toyota_cruiser_200_unm : sedan {};
	class RRPVehicle_civ_ctsv_16 : sedan {};
	class RRPVehicle_civ_giulietta_16 : sedan {};
	class RRPVehicle_civ_qx60_16 : sedan {};
	class RRPVehicle_civ_vklasse_17 : sedan {};
	class RRPVehicle_civ_wrx_17 : sedan {};
	class RRPVehicle_civ_explorer_13 : sedan {};
	//new cars
	class RRPVehicle_cigane_w124: sedan {}
	class RRPVehicle_cigane_G65: sedan {}
	class RRPVehicle_cigane_mus: sedan {}
	class RRPVehicle_cigane_roversport: sedan {}

	class RRPVehicle_BlackSnow_jeep: sedan {};
	class RRPVehicle_BlackSnow_gtr: sedan {};
	class RRPVehicle_BlackSnow_jeepblinde: sedan {};

	class RRPVehicle_DamnedKnights_roversport: sedan {};
	class RRPVehicle_DamnedKnights_jeep: sedan {};
	class RRPVehicle_DamnedKnights_2114: sedan {};
	class RRPVehicle_DamnedKnights_escalade: sedan {};
	class RRPVehicle_DamnedKnights_cruiser200: sedan {};

	class RRPVehicle_kifo_gtr: sedan {};
	class RRPVehicle_kifo_roversport: sedan {};
	class RRPVehicle_kifo_zr1_1: sedan {};
	class RRPVehicle_kifo_zr1_2: sedan {};
	class RRPVehicle_kifo_f90lyk_1: sedan {};
	class RRPVehicle_kifo_f90lyk_2: sedan {};

	class RRPVehicle_sector7_f90: sedan {};

	class RRPVehicle_rimasinc_touareg: sedan {};
	class RRPVehicle_rimasinc_w124: sedan {};

	class RRPVehicle_phoenix_f90lyk: sedan {};
	class RRPVehicle_phoenix_lm002: sedan {};
	class RRPVehicle_phoenix_escalade: sedan {};
	class RRPVehicle_phoenix_w124: sedan {};
	class RRPVehicle_phoenix_mus: sedan {};

	class RRPVehicle_narcos_f90lyk: sedan {};
	class RRPVehicle_narcos_e34: sedan {};
	class RRPHelicopter_narcos_hummingbird: helli_min {};
	class RRPVehicle_Miners_Heli_01: helli_min {};
	class RRPVehicle_shark_mus: sedan {};
	class RRPVehicle_shark_f90lyk: sedan {};
	class RRPVehicle_shark_jeep: sedan {};

	class RRPVehicle_Deadlock_roversport : sedan {};
	class RRPVehicle_Deadlock_jeep : sedan {};
	class RRPVehicle_Deadlock_2114 : sedan {};
	class RRPVehicle_Deadlock_kuruma : sedan {};

	class RRPHelicopter_Psychokids_hummingbird: helli_min {};
	class RRPVehicle_Psychokids_e34: sedan {};
	class RRPVehicle_Psychokids_gtr: sedan {};
	class RRPVehicle_Psychokids_man: truk_big {};
	class RRPVehicle_Psychokids_kuruma: battle {};
	class RRPVehicle_Psychokids_BTR90: battle {};
	class RRPVehicle_Psychokids_tiger: battle {};

	class RRPVehicle_DamnedKnights_50call: battle {};
	class RRPVehicle_DamnedKnights_ifrit: battle {};
	class RRPVehicle_DamnedKnights_insurgent: battle {};
	class RRPVehicle_DamnedKnights_kuruma: battle {};
	class RRPVehicle_DamnedKnights_tiger: battle {};

	class RRPVehicle_imperium_e34: sedan {};
	class RRPVehicle_imperium_jeep: sedan {};
	//хели
	class Ver_Jetpack: helli_min {};
	class RRPHelicopter_kifo_hummingbird: helli_min {};
	class RRPHelicopter_DamnedKnights_hummingbird: helli_min {};
	class RRPHelicopter_shark_hummingbird: helli_min {};
	class RRPHelicopter_huron_A6: helli_min {};
	class RRPHelicopter_AS565_A6: helli_min {};
	class RRPVehicle_Predator_A6: helli_min {};
	class RRPHelicopter_A18_A6: helli_min {};
	class RRPHelicopter_Dragonfly_A6: helli_min {};
	class RRPVehicle_hummingbird_umbrella_1: helli_min {};
	class RRPHelicopter_Dragonfly_aucV: helli_min {};
	class RRPVehicle_hummingbird_MW: helli_min {};
	class RRP_Korova_a2: helli_min {};
	class RRP_Dodj_a2: helli_min {};
	class Sopranos_humming: helli_min {};
	class RRPHelicopter_phoenix_hummingbird: helli_min {};
	class Phoenix_humming: helli_min {};
	class phoenix_humming_winter: helli_min {};
	class EC635_Unarmed: helli_min {};
	class CN_humming: helli_min {};
	class I_C_Heli_Light_01_civil_F: helli_min {};
	class RRPHelicopter_Cwrka_1 : helli_min {};
	class RimasINC_humming : helli_min {};
	class RRPHelicopter_Deadlock_1 : helli_min {};
	class BS_humming: helli_min {};
	class IMPERIUM_TN_Heli: helli_min {};
	class IMPERIUM_Grif_helli: helli_min {};
	class IMPERIUM_Cerber_Helli: helli_min {};
	class SK_N_Samurai_Helli: helli_min {};
	class SK_BlueWolf_Helli: helli_min {};
	class SK_Dragon_Helli: helli_min {};
	class YG_humming: helli_min {};
	class DW_humming: helli_min {};
	class RRP_SOA_AIR: helli_min {};
	class Cigane_humming: helli_min {};
	class BW_humming: helli_min {};
	class RRPVehicle_hummingbird_MS13: helli_min {};
	class RRPVehicle_hummingbird_2_MS13: helli_min {};
	class CHR_humming: helli_min {};
	class ENC_humming: helli_min {};
	class Legion_humming: helli_min {};
	class Legion_hummingbird_new: helli_min {};
	class OUT_humming: helli_min {};
	class ESC_humming: helli_min {};
	class KAS_humming: helli_min {};
	class BW_humming_2: helli_min {};
	class CON_humming: helli_min {};
	class sab_ultralight: helli_min {};
	class O_Heli_Transport_04_bench_F: helli_min {};
	class B_Heli_Transport_01_F: helli_min {};
	class B_mas_UH1Y_UNA_F: helli_min {};
	class B_mas_UH60M_SF: helli_min {};
	class B_mas_UH60M_kra: helli_min {};
	class B_mas_UH60M_VRS: helli_min {};
	class I_Heli_light_03_unarmed_F: helli_min {};
	class I_Heli_light_03_VIKA: helli_min {};
	class C_Heli_Light_01_civil_Taxi: helli_min {};
	class O_Heli_Light_02_unarmed_F: helli_min {};
	class B_Heli_Transport_03_unarmed_F: helli_min {};
	class I_Heli_Transport_02_F: helli_min {};
	class O_Heli_Transport_04_covered_F: helli_min {};
	class O_Heli_Transport_04_box_F: helli_min {};
	class RRPVehicle_HURON_default: helli_min {};
	class RRPVehicle_HURON_lk_default: helli_min {};
	class O_Heli_Transport_04_fuel_F: helli_min {};
	class RRPVehicle_PlaneFighter03_noammo: helli_min {};
	class Sab_af_An2: helli_min {};
	class Sab_tk_An2: helli_min {};
	class sab_ca_An2: helli_min {};
	class Sab_ana_An2: helli_min {};
	class Sab_yel_An2: helli_min {};
	class Sab_fd_An2: helli_min {};
	class Sab_cz_An2: helli_min {};
	class O_Heli_Transport_04_medevac_F : helli_min {};
	class s7_vehicles_hummingbird: helli_min {};
	class s7_vechicles_hummingbird_2: helli_min {};
	class RRPHelicopter_Vladika_A4: helli_min {};
	class RRPHelicopter_Dragonfly_A4: helli_min {};
	class RRPHelicopter_AS565_A4: helli_min {};
	class RRPVehicle_huron_old_lk: helli_min {};
	class RRPVehicle_huron_lk: helli_min {};

	class AS_565_aucV: helli_min {};
	class RRP_Korova_aucV: helli_min {};
	class RRP_Base_Dojd_aucV: helli_min {};
	class B_Plane_Fighter_01_Stealth_F_aucV: helli_min {};
	//грузовики
	class d3s_3303: truk_min {};
	class d3s_uaz_2206: truk_min {};
	class New_Holland_TC590_civ: truk_min {};
	class New_Holland_TC590_civ_BE: truk_min {};
	class O_Truck_02_covered_F: truk_min {};
	class O_Truck_02_fuel_F: truk_min {};
	class B_Truck_01_box_F: truk_min {};
	class B_Truck_01_box_CIV_F: truk_min {};
	class B_Truck_01_fuel_F: truk_min {};
	class chciternvol_bp: truk_min {};
	class B_Truck_01_mover_F: truk_min {};
	class I_mas_cars_Ural_fuel: truk_min {};
	class I_mas_cars_Ural: truk_min {};
	class I_mas_cars_Ural_open: truk_min {};
	class O_Truck_03_fuel_F: truk_min {};
	class O_Truck_03_device_F: truk_min {};
	class Jonzie_Tanker_Truck: truk_min {};
	class Jonzie_Box_Truck: truk_min {};
	class RDS_Ikarus_Civ_01: truk_min {};
	class O_Truck_02_medical_F: truk_min {};
	class smart_Jonzie_Tow_Truck: truk_min {};
	class smart_Jonzie_Flat_Bed: truk_min {};
	class smart_Jonzie_Log_Truck: truk_min {};
	class C_Van_01_box_F_EXT_DHL: truk_min {};
	class C_Van_01_box_F: truk_min {};
	class C_Truck_02_covered_F: truk_min {};
	class C_Truck_02_fuel_F: truk_min {};
	class d3s_next: truk_min {};
	class d3s_next_bocha: truk_min {};
	class d3s_zil_130_03: truk_min {};
	class d3s_zil_130_01: truk_min {};
	class d3s_zil_130_04: truk_min {};
	class d3s_zil_130_06: truk_min {};
	class d3s_ural_tent: truk_min {};

	class RRPVehicle_lk_kamaz49255: truk_big {};
	class RRPVehicle_lk_kamaz49255_racing: truk_big {};
	class RRPVehicle_knur_lk: truk_big {};
	class RRPVehicle_knur_old_lk : truk_big {};

	class d3s_SRlonghorn_4520_cov: truk_big {};
	class d3s_SRmh_9500_cov : truk_big {};
	class d3s_peterbilt_579_dryvan: truk_big {};
	class d3s_maz_6317: truk_big {};
	class d3s_maz_6317_cistern: truk_big {};
	class d3s_kraz_6315: truk_big {};
	class d3s_kraz_6316: truk_big {};
	class B_Truck_01_covered_F: truk_big {};
	class B_Truck_01_fuel_CIV_F: truk_big {};
	class RRPVehicle_fuel_truck: truk_big {};
	class MAN_Truck_03_fuel_F_WD: truk_big {};
	class C_Van_01_fuel_F: truk_min {};
	class d3s_next_tent: truk_big {};
	class d3s_next_kung: truk_big {};
	class d3s_maz_6317_tent: truk_big {};
	class MAN_Truck_03_fuel_F_E: truk_big {};
	class d3s_actros_14_O: truk_big {};
	class d3s_actros_14_ESC: truk_big {};
	class d3s_actros_14_DW: truk_big {};
	class d3s_actros_14_K: truk_big {};
	class d3s_actros_14_giga: truk_big {};
	class d3s_actros_14_DV: truk_big {};
	class d3s_zil_131_2: truk_big {};
	class RRP_actros_a2: truk_big {};
	class d3s_zil_131_4: truk_big {};
	class d3s_maz_7429: truk_big {};
	class d3s_gaz66_TENT: truk_big {};
	class d3s_SRlonghorn_4520: truk_big {};
	class d3s_guardian_gtaV: truk_big {};
	class d3s_mule: truk_big {};
	class d3s_T440: truk_big {};
	class d3s_T680_Dryvan: truk_big {};

	class RRPVehicle_civ_daf_box: truk_big {};
	class RRPVehicle_civ_daf_box_3k: truk_big {};
	class RRPVehicle_civ_daf_box_4k: truk_big {};

	class RRP_SOA_MAN: truk_big {};
	class RRP_SOA_SR: truk_big {};


	class RRPVehicle_civ_yamaha: bike {};
	class RRPVehicle_civ_harley: bike {};
	class RRPVehicle_civ_ducati: bike {};
	class d3s_Ducati_RRPVehicle_civ_monster_1200_S: bike {};
	class outcast_kawasaki900: bike {};
	class d3s_zombiea_gtaV: bike {};
	class d3s_sanctus_gtaV: bike {};
	
	
	class d3s_Aprilia_Tuono_V4_1100_RR: bike {};
	class d3s_BMW_S_1000_RR: bike {};
	class d3s_Ducati_Monster_1200_S: bike {};
	class d3s_Ducati_XDiavel_S: bike {};
	class d3s_Kawasaki_Ninja_H2R: bike {};
	class d3s_Kawasaki_Z800: bike {};
	class d3s_Kawasaki_ZX7RR: bike {};
	class d3s_KTM_1290_Super_Duke: bike {};
	class d3s_Suzuki_GSX_R_1000: bike {};
	class d3s_Suzuki_Hayabusa: bike {};
	///

	class RRP_SOA_LMG: battle {};

	//Comins DC Pack
	class RRPVehicle_civ_evo9_dc: sedan {};
	class RRPVehicle_civ_kitt_dc: sedan {};
	class RRPVehicle_civ_locrall_dc: sedan {};
	class RRPVehicle_bmw_m4_dc: sedan {};
	class RRPVehicle_civ_dodgesrt_dc: sedan {};
	class RRPVehicle_civ_sstuning_dc: sedan {};

	class RRPVehicle_civ_panamera_speedhunters: sedan {};
	class RRPVehicle_civ_svr_lk: sedan {};

	//Drift Pack
	class RRPVehicle_civ_evo9_drift_pack: sedan {};
	class RRPVehicle_civ_ae86_drift_pack: sedan {};
	class RRPVehicle_civ_nsx_drift_pack: sedan {};
	class RRPVehicle_civ_240sx_drift_pack: sedan {};
	class RRPVehicle_civ_jdm_drift_pack: sedan {};
	class RRPVehicle_civ_370z_drift_pack: sedan {};

	class RRPVehicle_civ_cullinan_gold: sedan {};
	class RRPVehicle_civ_x7: sedan {};
	class RRPVehicle_civ_svr: sedan {};
	class RRPVehicle_civ_chiron: sedan {};
	class RRPVehicle_civ_tesla: sedan {};
	class RRPVehicle_civ_rs7_ob: sedan {};
	class RRPVehicle_civic18_lk: sedan {};

	class RRPVehicle_civ_mustang18_cp: sedan {};
	class RRPVehicle_rs4_13_cp: sedan {};
	class RRPVehicle_am_vantage_cp: sedan {};
	class RRPVehicle_civ_porsche91182_cp: sedan {};
	class RRPVehicle_civ_javelin_cp: sedan {};
	

	// Escobaro 
	class R_Vehicle_Nissan_370Z_Escobaro: sedan {};
	class R_Vehicle_Jeep_Cherokee_Escobaro: sedan {};

	class ver_bat: sedan {};
};
