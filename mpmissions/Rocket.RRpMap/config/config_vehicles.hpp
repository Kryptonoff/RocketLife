#define true 1
#define false 0
/*
	class {
		vItemSpace = вместительность багажника для виртуальных предметов (0 = нету)
		conditions = условия в формате "true" (пока что не используется)
		price = базовая цена
		textures[] = {
			{"класс из LifeCfgVehTextures", {"флаг маназина техники"}, "conditions для использования этого цвета" }
		};
		materials[] = {классы из LifeCfgVehMaterials};
		NEW SETTING
		sellEnabled - регулирует кто может продавать
		chopEnabled - регулирует кто может перебивать

		ignoreSlots = true; - игнорирует слоты в гараже
		Если параметра нету вообще, значит открыто для всех
		Если написать = "false" - значит запрет для всех
		Если написать = "license_alpha" будет доступно действие только для alpha
	};
*/

class vehiclesMoreSetting {
	class breakingLock {
		class breakLVL_1 {
			chance = 70;
			time = 10;
			limit = 50000;
		};

		class breakLVL_2 {
			chance = 55;
			time = 15;
			limit = 100000;
		};

		class breakLVL_3 {
			chance = 45;
			time = 24;
			limit = 150000;
		};

		class breakLVL_4 {
			chance = 35;
			time = 30;
			limit = 200000;
		};

		class breakLVL_5 {
			chance = 25;
			time = 40;
			limit = 250000;
		};

		class breakLVL_6 {
			chance = 15;
			time = 50;
			limit = 350000;
		};
	};
};

class LifeCfgVehicles {

	class car_base {
		vItemSpace = 50;
		price = 140000;
		textures[] = {};
		materials[] = {};

		sellEnabled = "true";
		chopEnabled = "true";
		conditions = "";
	};


	class RRPVehicle_civ_lc_100 : car_base {
		conditions = "(call life_donator) > 3";
	};

	class RRPVehicle_civ_lc_100_vx: RRPVehicle_civ_lc_100 {
		price = 160000;
	};
	class RRPVehicle_civ_lc_100_unm {
		chopEnabled = "false";
		breakingChance = 4;
	};

	class RRPVehicle_civ_cruiser200: car_base {
		price = 180000;
	};
	class RRPVehicle_civ_camry55: car_base {
		price = 120000;
	};
	class toyota_cruiser_100_off_road : car_base {};


	class RRPVehicle_bmw_m8 : car_base {
		price = 240000;
		conditions = "(call life_donator) > 3";
	};
	class RRPVehicle_bmw_m8_cop : car_base {
		price = 240000;
	};
	class RRPVehicle_bmw_m8_unm : car_base {
		price = 240000;
	};
	class RRPVehicle_bmw_m4: car_base {
		price = 195000;
		conditions = "(call life_donator) > 3";
	};
	//not for sale
	class RRPVehicle_osk_honda_nsx_AIMGAIN : car_base {
		price = 480000;
	};
	class RRPVehicle_osk_honda_nsx_purpure : car_base {
		conditions = "(call life_donator) > 3";
		price = 430000;
	};
	//not for sale 
	class RRPVehicle_osk_honda_nsx_chameleon : car_base {
		price = 450000;
	};
	class RRPVehicle_nissan_370Z : car_base {
		price = 160000;
	};
	class R_Vehicle_Nissan_370Z_Escobaro: RRPVehicle_nissan_370Z {};
	class RRPVehicle_blackWolves_370Z: RRPVehicle_nissan_370Z {};
	class RRPVehicle_civ_quattro83 : car_base {
		price = 170000;
	}; 
	class RRPVehicle_osk_Mercedes_w140_01: car_base {
		price = 250000;
	};


	class RRPVehicle_maz_black {
		vItemSpace = 3000;
		conditions = "";
		price = 60000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};

		ignoreSlots = true;
		sellEnabled = "true";
		chopEnabled = "false";
	};
	class RRPVehicle_civ_dubsta6x6vip: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 400000;

		breakingChance = 4;
	};
	class RRPVehicle_civ_paragonsport: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 1900000;
		conditions = "(call life_donator) > 3";
		breakingChance = 4;
		animationList[] = {
			{"SOD_1_1",0,"SPT_1_1",0,"extra_cage",1,"extra_roof_b",1,"extra_sunstrip",1,"extra_bonnet_c",1,"extra_exhaust_d",1,"extra_split_a",1,"extra_intercool_c",1,"extra_wing_d",1,"extra_camo_b",1}
		};
	};
	class osk_Windsor_sedan: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 320000;

		breakingChance = 4;
	};
	class Ver_Jetpack: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 60000;

		breakingChance = 4;
	};
	class RRPVehicle_civ_ram: RRPVehicle_maz_black {
		vItemSpace = 100;
		price = 135000;

		breakingChance = 4;
	};
	class osk_ultrainsurgent_tracked_civ: RRPVehicle_maz_black {
		vItemSpace = 100;
		price = 250000;

		breakingChance = 4;
		armored = true;
	};
	class RRPVehicle_civ_f90offroad: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 260000;

		breakingChance = 4;
	};
	class RRPVehicle_civ_gt63offroad: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 240000;

		breakingChance = 4;
	};
	class RRPVehicle_lk_AURUSsenat: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 300000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_e34tundrift: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 130000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_nsx: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 210000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_MRAP: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 650000;
		breakingChance = 6;
	};
	class I_MRAP_03_hmg_F: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 1450000;
		breakingChance = 4;
	};
	class O_MRAP_02_hmg_F: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 1450000;
		breakingChance = 4;
	};
	class B_MRAP_01_hmg_F: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 1450000;
		breakingChance = 4;
	};
	class ver_bat: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 450000;
		breakingChance = 6;
	};
	
	class RRPVehicle_lk_bentayga: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 190000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_abrer: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 310000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_wraithMANS: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 270000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_mclaren: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 340000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_C63AMG: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 180000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_HuayraRoadster: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 370000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_scaldarsi: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 280000;

		breakingChance = 6;
	};
	class RRPVehicle_lk_roosevelt: RRPVehicle_maz_black {
		vItemSpace = 50;
		price = 190000;

		breakingChance = 6;
	};
	class RRPVehicle_civ_svr_lk: RRPVehicle_maz_black
	{
		vItemSpace = 50;
		breakingChance = 6;
	};
	class RRPVehicle_civ_rs7_ob: RRPVehicle_maz_black
	{
		vItemSpace = 50;
		breakingChance = 6;
	};
	class RRPVehicle_civic18_lk: RRPVehicle_maz_black
	{
		vItemSpace = 50;
		breakingChance = 6;
	};

	class RRPVehicle_civ_cullinan_gold: RRPVehicle_maz_black {
		vItemSpace = 50;
		breakingChance = 6;
	}
	class RRPVehicle_civ_x7: RRPVehicle_maz_black {
		vItemSpace = 50;
		breakingChance = 6;
	}
	class RRPVehicle_civ_svr: RRPVehicle_maz_black {
		vItemSpace = 50;
		breakingChance = 6;
	}
	class RRPVehicle_civ_chiron: RRPVehicle_maz_black {
		vItemSpace = 50;
		breakingChance = 6;
	}
	class RRPVehicle_civ_tesla: RRPVehicle_maz_black {
		vItemSpace = 50;
		breakingChance = 6;
	}


	class RRPHelicopter_sheriff_hummingbird {
		vItemSpace = 50;
		conditions = "";
		fuelType = "dizel";
		price = 70000;
		textures[] = {};
		materials[] = {};
	};
	class RRPHelicopter_sheriff_eurocopter: RRPHelicopter_sheriff_hummingbird {};
	class RRPHelicopter_detective_hummingbird: RRPHelicopter_sheriff_hummingbird {};
	class RRPHelicopter_opr_hummingbird: RRPHelicopter_sheriff_hummingbird {};
	class RRPHelicopter_opr_eurocopter: RRPHelicopter_sheriff_hummingbird {};
	class RRPHelicopter_fbi_hummingbird: RRPHelicopter_sheriff_hummingbird {};
	class RRPHelicopter_fbi_eurocopter: RRPHelicopter_sheriff_hummingbird {};
	class Maverick2_heli_cop: RRPHelicopter_sheriff_hummingbird {};

	class RRPVehicle_B_Heli_Light_01_F: RRPHelicopter_sheriff_hummingbird
	{
		vItemSpace = 50;
		price = 450000;
	};

    class RRP_RZ_Buran_1 {
        vItemSpace = 300;
		conditions = "";
		price = 5000;
		textures[] = {
			{"Anvil_buran_1", {""}, "" },
			{"Anvil_buran_2", {""}, "" },
			{"Anvil_buran_3", {""}, "" }
		};
		materials[] = {};
		sellEnabled = "true";
		chopEnabled = "false";
		breakingChance = -1;
	};
	class RRP_RZ_Buran_2: RRP_RZ_Buran_1 {};
	class RRP_RZ_Buran_3: RRP_RZ_Buran_1 {};
	class RRP_BTR90: RRP_RZ_Buran_1 {
		conditions = "false";
		textures[] = {
			{"Anvil_BTR_1", {""}, "" }
		};
	};
	class RRP_BTR9023: RRP_RZ_Buran_1 {
		textures[] = {};
		conditions = "false";
		sellEnabled = "false";
		chopEnabled = "false";
		ignoreSlots = true;
	};

	class Box_Wps_F {
		vItemSpace = 100;
	};

	class B_UAV_01_F {
		vItemSpace = 100;
	};
	class B_UGV_02_Science_F {
		vItemSpace = 100;
	};
	class B_UGV_02_Demining_F {
		vItemSpace = 100;
	};
	class base {
		vItemSpace = 50;
		conditions = "";
		price = 6000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};

		sellEnabled = "true";
		chopEnabled = "true";

		animationList[] = {
			//{"showcamonethull", 1, },
			//{"showcamonetturret", 1, },
			//{"showcamonetcannon", 1, },
			//{"showslathull", 1}
		};

		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};

	class rds_base {
		vItemSpace = 50;
		conditions = "";
		price = 999999;
		textures[] = {};
		materials[] = {};
		sellEnabled = "true";
		chopEnabled = "true";
	};

	class RRPVehicle_civ_golf4rds_4: rds_base {
		price = 20000;
		textures[] = {
			{"RRP_RDS_Golf_1", {""}, "" },
			{"RRP_RDS_Golf_2", {""}, "" },
			{"RRP_RDS_Golf_3", {""}, "" },
			{"RRP_RDS_Golf_4", {""}, "" },
			{"RRP_RDS_Golf_5", {""}, "" },
			{"RRP_RDS_Golf_6", {""}, "" }
		};
	};

	class RRPVehicle_civ_gaz24_3: rds_base {
		price = 20000;
		textures[] = {
			{"RRP_RDS_Gaz24_1", {""}, "" },
			{"RRP_RDS_Gaz24_2", {""}, "" },
			{"RRP_RDS_Gaz24_3", {""}, "" }
		};
	};

	class RRPVehicle_civ_lada_2: rds_base {
		price = 9000;
		textures[] = {
			{"RRP_RDS_Lada_1", {""}, "" },
			{"RRP_RDS_Lada_2", {""}, "" },
			{"RRP_RDS_Lada_3", {""}, "" },
			{"RRP_RDS_Lada_4", {""}, "" },
			{"RRP_RDS_Lada_5", {""}, "" }
		};
	};


	class osk_base {
		vItemSpace = 50;
		conditions = "";
		price = 999999;
		textures[] = {
			{"RRP_Color_1", {""}, "" },
			{"RRP_Color_2", {""}, "" },
			{"RRP_Color_3", {""}, "" },
			{"RRP_Color_4", {""}, "" },
			{"RRP_Color_5", {""}, "" },
			{"RRP_Color_6", {""}, "" },
			{"RRP_Color_7", {""}, "" },
			{"RRP_Color_8", {""}, "" },
			{"RRP_Color_9", {""}, "" },
			{"RRP_Color_10", {""}, "" },
			{"RRP_Color_11", {""}, "" },
			{"RRP_Color_12", {""}, "" },
			{"RRP_Color_13", {""}, "" },
			{"RRP_Color_14", {""}, "" },
			{"RRP_Color_15", {""}, "" },
			{"RRP_Color_16", {""}, "" },
			{"RRP_Color_17", {""}, "" },
			{"RRP_Color_18", {""}, "" },
			{"RRP_Color_19", {""}, "" },
			{"RRP_Color_20", {""}, "" },
			{"RRP_Color_21", {""}, "" },
			{"RRP_Color_22", {""}, "" }
		};
		materials[] = {};
		sellEnabled = "true";
		chopEnabled = "true";
	};
	class RRPVehicle_civ_dubsta4x4vip : osk_base {
		price = 930000;
	};
	class RRPVehicle_civ_paragon : osk_base {
		price = 380000;
	};
	class RRPVehicle_civ_c63amg_1 : osk_base {
		price = 310000;
	};
	class RRPVehicle_civ_c63amg_1_guber : osk_base {
		price = 310000;
		textures[] = {};
	};
	class RRPVehicle_civ_fordbronco_1: osk_base {
		price = 36000;
	};

	class ver_base {
		vItemSpace = 50;
		conditions = "";
		price = 999999;
		textures[] = {
			{"RRP_Color_1", {""}, "" },
			{"RRP_Color_2", {""}, "" },
			{"RRP_Color_3", {""}, "" },
			{"RRP_Color_4", {""}, "" },
			{"RRP_Color_5", {""}, "" },
			{"RRP_Color_6", {""}, "" },
			{"RRP_Color_7", {""}, "" },
			{"RRP_Color_8", {""}, "" },
			{"RRP_Color_9", {""}, "" },
			{"RRP_Color_10", {""}, "" },
			{"RRP_Color_11", {""}, "" },
			{"RRP_Color_12", {""}, "" },
			{"RRP_Color_13", {""}, "" },
			{"RRP_Color_14", {""}, "" },
			{"RRP_Color_15", {""}, "" },
			{"RRP_Color_16", {""}, "" },
			{"RRP_Color_17", {""}, "" },
			{"RRP_Color_18", {""}, "" },
			{"RRP_Color_19", {""}, "" },
			{"RRP_Color_20", {""}, "" },
			{"RRP_Color_21", {""}, "" },
			{"RRP_Color_22", {""}, "" }
		};
		materials[] = {};
		sellEnabled = "true";
		chopEnabled = "true";
	};
	class RRPVehicle_civ_e34: ver_base {
		price = 132000;
	};
	class RRPVehicle_civ_w124: ver_base {
		price = 110000;
	};
    class RRPVehicle_civ_mus18: ver_base {
        price = 740000;
	};
	class RRPVehicle_civ_rx7: ver_base {
		price = 92000;
	};
	class RRPVehicle_civ_jeep: ver_base {
		price = 190000;
	};
	class R_Vehicle_Jeep_Cherokee_Escobaro: RRPVehicle_civ_jeep {
		textures[] = {};
	};
	class RRPVehicle_blackWolves_jeep: RRPVehicle_civ_jeep {
		textures[] = {};
	};
	class RRPVehicle_civ_G65: ver_base {
		price = 340000;
	};
	class RRPVehicle_civ_roversport: ver_base {
		price = 320000;
	};
	class RRPVehicle_civ_escalade: ver_base {
		conditions = "(call life_donator) > 3";
		price = 960000;
	};
	class RRPVehicle_civ_lm002: ver_base {
		price = 580000;
	};
	class RRPVehicle_civ_escalade_guber: ver_base {
		price = 960000;
		textures[] = {};
	};
	class RRPVehicle_civ_mus: ver_base {
		price = 276000;
	};
	class RRPVehicle_civ_zr1: ver_base {
		price = 800000;
	};
	class RRPVehicle_civ_f90: ver_base {
		price = 230000;
	};
	class RRPVehicle_civ_f90_guber: ver_base {
		price = 230000;
		textures[] = {};
	};
	class RRPVehicle_civ_f90lyk: ver_base {
		price = 230000;
	};
	class RRPVehicle_civ_gtr: ver_base {
		price = 390000;
	};
	class RRPVehicle_civ_gtrcustom: ver_base {
		price = 390000;
	};
	class RRPVehicle_civ_e34tun: ver_base {
		price = 240000;
	};
	class RRPVehicle_civ_insurgent: ver_base {
		price = 240000;
	};
	class RRPVehicle_civ_2114: ver_base {
		price = 60000;
	};
	class RRPVehicle_cop_2114: RRPVehicle_civ_2114 {
		textures[] = {
			{"RRP_Lada_2114", {""}, "" }
		};
	};

	class shounka_base {
		vItemSpace = 50;
		conditions = "";
		price = 999999;
		textures[] = {
			{"RRP_Color_1", {""}, "" },
			{"RRP_Color_2", {""}, "" },
			{"RRP_Color_3", {""}, "" },
			{"RRP_Color_4", {""}, "" },
			{"RRP_Color_5", {""}, "" },
			{"RRP_Color_6", {""}, "" },
			{"RRP_Color_7", {""}, "" },
			{"RRP_Color_8", {""}, "" },
			{"RRP_Color_9", {""}, "" },
			{"RRP_Color_10", {""}, "" },
			{"RRP_Color_11", {""}, "" },
			{"RRP_Color_12", {""}, "" },
			{"RRP_Color_13", {""}, "" },
			{"RRP_Color_14", {""}, "" },
			{"RRP_Color_15", {""}, "" },
			{"RRP_Color_16", {""}, "" },
			{"RRP_Color_17", {""}, "" },
			{"RRP_Color_18", {""}, "" },
			{"RRP_Color_19", {""}, "" },
			{"RRP_Color_20", {""}, "" },
			{"RRP_Color_21", {""}, "" },
			{"RRP_Color_22", {""}, "" }
		};
		materials[] = {};
		sellEnabled = "true";
		chopEnabled = "true";
	};
	class RRPVehicle_civ_ducati : shounka_base {
		price = 138000;
	};
	class RRPVehicle_civ_yamaha : shounka_base {
		price = 120000;
	};
	class RRPVehicle_civ_harley : shounka_base {
		price = 150000;
	};
	class RRPVehicle_civ_r5 : shounka_base {
		price = 75000;
	};
	class RRPVehicle_civ_smart : shounka_base {
		price = 24000;
	};
	class RRPVehicle_civ_citroends3 : shounka_base {
		price = 42000;
	};
	class RRPVehicle_civ_citroenC4 : shounka_base {
		price = 67000;
	};
	class RRPVehicle_civ_peugeot308 : shounka_base {
		price = 62000;
	};
	class RRPVehicle_civ_citroenDS4 : shounka_base {
		price = 49000;
	};
	class RRPVehicle_civ_golfVI : shounka_base {
		price = 28000;
	};
	class RRPVehicle_civ_peugeot508 : shounka_base {
		price = 79000;
	};
	class RRPVehicle_civ_alfaromeobrera : shounka_base {
		price = 65000;
	};
	class RRPVehicle_civ_clk : shounka_base {
		price = 180000;
	};
	class RRPVehicle_civ_rs4 : shounka_base {
		price = 235000;
	};
	class RRPVehicle_civ_rs5 : shounka_base {
		price = 260000;
	};
	class RRPVehicle_civ_bmw1M : shounka_base {
		price = 380000;
	};
	class RRPVehicle_civ_porsche911 : shounka_base {
		price = 880000;
	};
	class RRPVehicle_civ_bmw6 : shounka_base {
		price = 370000;
	};
	class RRPVehicle_civ_cayenne : shounka_base {
		price = 260000;
	};
	class RRPVehicle_civ_audiq7 : shounka_base {
		price = 172000;
	};
	class RRPVehicle_civ_touareg : shounka_base {
		price = 290000;
	};
	class RRPVehicle_civ_hummer2 : shounka_base {
		price = 300000;
	};
	class RRPVehicle_civ_hummer2_guber : shounka_base {
		price = 300000;
		textures[] = {};
	};
	class RRPVehicle_civ_hummer : shounka_base {
		price = 280000;
	};
	class RRPVehicle_civ_raptor2 : shounka_base {
		price = 255000;
	};
	class RRPVehicle_civ_fordgt : shounka_base {
		price = 700000;
	};
	class RRPVehicle_civ_monster : shounka_base {
		price = 500000;
	};
	class RRPVehicle_civ_buggy : shounka_base {
		price = 40000;
	};
	class RRPVehicle_civ_bowler : shounka_base {
		price = 80000;
	};
	class RRPVehicle_civ_jeepblinde : shounka_base {
		price = 100000;
	};
	class RRPVehicle_civ_huracan : shounka_base {
		price = 360000;
	};
	class RRPVehicle_civ_veneno : shounka_base {
		price = 550000;
	};
	class RRPVehicle_civ_lykan : shounka_base {
		price = 1480000;
	};
	class RRPVehicle_civ_porsche91182 : shounka_base {
		price = 920000;
	};

/*
	class d3s_scaldarsi {
		vItemSpace = 50;
		conditions = "";
		price = 30000;
		textures[] = {};
		materials[] = {};
		sellEnabled = "true";
		chopEnabled = "true";
		breakingChance = -1;
	};
	class cop_marsh: base {
		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};
	class RRP_Marid_PD_Armered: cop_marsh {
		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};
	class RRP_Marid_PD_Armered_1: cop_marsh {
		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};
	class cop_gh: cop_marsh {
		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};
	class cop_helli: cop_marsh {
		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};
	class I_C_Offroad_02_AT_F_cop: base {
		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};
	class BTR90: base {
		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};
	class RRPVehicle_Qilin_PD: base {
		allowedDamageOnlySZ = false;
		allowedDamageSZ = false;
	};
*/

	class RRPVehicle_civ_rx7tun {
		vItemSpace = 50;
		conditions = "";
		price = 600000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};

		sellEnabled = "true";
		chopEnabled = "true";
	};
	class RRPVehicle_civ_rx7tun_drift : RRPVehicle_civ_rx7tun {};
	class RRPVehicle_civ_rx7jojo : RRPVehicle_civ_rx7tun {};
	class RRPVehicle_civ_rx7jojo_drift : RRPVehicle_civ_rx7tun {};


/*
	//battle vehicle
	class RRPVehicle_Marshal_POLICE {
		vItemSpace = 50;
		conditions = "";
		price = 30000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
		animationList[] = {
			{"showcamonethull", 1, },
			{"showcamonetturret", 1, },
			{"showcamonetcannon", 1, },
			{"showslathull", 1}
		};
		sellEnabled = "true";
		chopEnabled = "true";
		breakingChance = -1;
		allowedDamageSZ = true;
		allowedDamageOnlySZ = true;
	};
*/

	class O_Truck_03_device_F {
		vItemSpace = 1000;
		fuelType = "dizel";
		conditions = "";
		price = 140000;
		textures[] = {};
		materials[] = {};
	 };

	class C_Offroad_01_F {
		vItemSpace = 120;
		fuelType = "dizel";
		conditions = "";
		price = (600 * 40);
		textures[] = {{"ffrd_7n", {"press"}, "license_press" }};
		materials[] = {"default","glossy","metallic","matte","chrome"};
	};


	class C_Van_01_transport_F {
		vItemSpace = 200;
		conditions = "";
		price = (500 * 40);
		fuelType = "dizel";
		textures[] = {
			{"vtt_w", {"","cia"}, "" },
			{"vtt_r", {"","cia"}, "" }
		};
		materials[] = {};
	};

		class d3s_uaz_2206 {
		price = (1000 * 40);
		vItemSpace = 200;
		conditions = "";
		textures[] = {
			{"3741_Black", {""}, "" },
			{"3741_Black_2", {""}, "" },
			{"3741_Blue", {""}, "" },
			{"3741_camo2", {""}, "" },
			{"3741_camo3", {""}, "" },
			{"3741_camo4", {""}, "" },
			{"3741_camo5", {""}, "" },
			{"3741_camo6", {""}, "" },
			{"3741_camo7", {""}, "" },
			{"3741_camo8", {""}, "" },
			{"3741_Khaki", {""}, "" },
			{"3741_Khaki_2", {""}, "" },
			{"3741_Red", {""}, "" },
			{"3741_Silver_2", {""}, "" },
			{"3741_Khaki_2", {""}, "" }
		};
		materials[] = {};
	};

	class C_Van_01_box_F {
		vItemSpace = 200;
		conditions = "";
		fuelType = "dizel";
		price = (1000 * 41);
		textures[] = {
			{"vtt_w", {""}, "" },
			{"vtt_r", {""}, "" }
		};
		materials[] = {};
	};
	class C_Van_02_vehicle_F {
		vItemSpace = 260;
		conditions = "";
		price = (1000 * 43);
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class C_Van_02_transport_F : C_Van_02_vehicle_F {};

	class d3s_3303 {
	vItemSpace = 300;
	conditions = "";
	price = (1200 * 50);
	fuelType = "ai95";
	textures[] = {
		{"buhanka_box_red", {""}, "" },
		{"buhanka_box_green", {""}, "" }
	};
	materials[] = {};
	};

	class d3s_gaz66_TENT {
		vItemSpace = 340;
		conditions = "";
		price = (1000 * 68);
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class d3s_zil_130_01 {
		vItemSpace = 450;
		conditions = "";
		price = (2000 * 45);
		fuelType = "dizel";
		textures[] = {
			{"zil130_1", {""}, "" },
			{"zil130_2", {""}, "" },
			{"zil130_3", {""}, "" },
			{"zil130_4", {""}, "" },
			{"zil130_5", {""}, "" }
		};
	};
	class d3s_zil_131_2 {
		vItemSpace = 400;
		conditions = "";
		price = (2000 * 40);
		fuelType = "dizel";
		textures[] = {
			{"Zil_131_1", {""}, "" },
			{"Zil_131_2", {""}, "" },
			{"Zil_131_3", {""}, "" },
			{"Zil_131_4", {""}, "" }
		};
		materials[] = {};
	};

	class d3s_zil_131_5: d3s_zil_131_2 {
		vItemSpace = 1;
		price = 10000;
		textures[] = {
			//{"d3s_zil_131_5", {""}, "" },
			{"EMS_Zil_131", {""}, "" }
		};
		isStructures = true;
	};

	class d3s_next_tent {
		vItemSpace = 600;
		fuelType = "dizel";
		conditions = "";
		price = (2000 * 60);
		textures[] = {
			{"next1", {""}, "" },
			{"next2", {""}, "" },
			{"next3", {""}, "" },
			{"next4", {""}, "" },
			{"next5", {""}, "" },
			{"Ben_NEX_1", {""}, "" },
			{"Ben_NEX_2", {""}, "(call life_donator) > 1" },
			{"Ben_NEX_3", {""}, "(call life_donator) > 1" }
		};
		materials[] = {};
	};
	class d3s_maz_6317_tent {
		vItemSpace = 750;
		conditions = "";
		price = (2500 * 60);
		fuelType = "dizel";
		textures[] = {
			{"maz_1", {""}, "" },
			{"maz_2", {""}, "" },
			{"maz_3", {""}, "" },
			{"maz_4", {""}, "" },
			{"maz_5", {""}, "" },
			{"maz_6", {""}, "" },
			{"maz_7", {""}, "" },
			{"maz_8", {""}, "" },
			{"maz_1v", {""}, "(call life_donator) > 2" },
			{"maz_2v", {""}, "(call life_donator) > 2" },
			{"maz_3v", {""}, "(call life_donator) > 2" },
			{"maz_4v", {""}, "(call life_donator) > 2" },
			{"maz_5v", {""}, "(call life_donator) > 2" },
			{"maz_6v", {""}, "(call life_donator) > 2" },
			{"maz_7v", {""}, "(call life_donator) > 2" },
			{"Ben_MAZ", {""}, "" }
		};
		materials[] = {};
	};
	class d3s_kraz_6315 {
		vItemSpace = 900;
		conditions = "";
		fuelType = "dizel";
		price = (3000 * 60);
		textures[] = {
			{"kraz_1", {""}, "" },
			{"kraz_2", {""}, "" },
			{"kraz_3", {""}, "" },
			{"kraz_4", {""}, "" },
			{"kraz_5", {""}, "" },
			{"kraz_6", {""}, "" },
			{"kraz_7", {""}, "" },
			{"kraz_8", {""}, "" }
		};
		materials[] = {};
	};
	class d3s_actros_14_giga {
		vItemSpace = 900;
		conditions = "";
		fuelType = "dizel";
		price = (3000 * 60);
		textures[] = {
			{"Actros_1", {""}, "" },
			{"Actros_2", {""}, "" },
			{"Actros_3", {""}, "" },
			{"Actros_4", {""}, "" },
			{"Actros_5", {""}, "" },
			{"Actros_6", {""}, "" },
			{"Actros_7", {""}, "" },
			{"Mike_Mers_1", {"med"}, "" }
		};
		materials[] = {};
	};

	class d3s_peterbilt_579_dryvan {
		vItemSpace = 1000;
		conditions = "";
		fuelType = "dizel";
		price = (5000 * 40);
		textures[] = {};
		materials[] = {};
	};

	class d3s_kraz_6316 {
		vItemSpace = 1050;
		conditions = "";
		price = (3000 * 65);
		fuelType = "dizel";
		textures[] = {
			{"kraz_1", {""}, "" },
			{"kraz_2", {""}, "" },
			{"kraz_3", {""}, "" },
			{"kraz_4", {""}, "" },
			{"kraz_5", {""}, "" },
			{"kraz_6", {""}, "" },
			{"kraz_7", {""}, "" },
			{"kraz_8", {""}, "" },
			{"Ben_KRAZ", {""}, "" }
		};
		materials[] = {};
	};
	class d3s_maz_7429 {
		vItemSpace = 1200;
		conditions = "";
		price = (5000 * 48);
		fuelType = "ai95";
		textures[] = {
			{"MAZ_7kk_11", {""}, "" },
			{"MAZ_7kk_1", {""}, "" },
			{"MAZ_7kk_2", {""}, "" },
			{"MAZ_7kk_3", {""}, "" },
			{"MAZ_7kk_4", {""}, "" },
			{"MAZ_7kk_5", {""}, "" },
			{"MAZ_7kk_7", {""}, "(call life_donator) > 2" },
			{"MAZ_7kk_8", {""}, "(call life_donator) > 2" },
			{"MAZ_7kk_10", {""}, "(call life_donator) > 2" }
		};
		materials[] = {};
	};
	class d3s_SRmh_9500_cov {
		vItemSpace = 1300;
		conditions = "";
		fuelType = "dizel";
		price = (5000 * 52);
		textures[] = {
			{"d3s_SRmh_9500_cov_1", {""}, "" },
			{"d3s_SRmh_9500_cov_2", {""}, "" },
			{"d3s_SRmh_9500_cov_3", {""}, "" },
			{"d3s_SRmh_9500_cov_4", {""}, "" },
			{"d3s_SRmh_9500_cov_5", {""}, "" },
			{"d3s_SRmh_9500_cov_6", {""}, "" }
		};
		materials[] = {};
	};

	class d3s_SRlonghorn_4520_cov {
		vItemSpace = 1400;
		conditions = "";
		fuelType = "dizel";
		price = (7000 * 40);
		textures[] = {
			/*{"d3s_SRlonghorn_4520_cov_1", {""}, "" },
			{"d3s_SRlonghorn_4520_cov_2", {""}, "" },
			{"d3s_SRlonghorn_4520_cov_3", {""}, "" },
			{"d3s_SRlonghorn_4520_cov_4", {""}, "" },
			{"d3s_SRlonghorn_4520_cov_5", {""}, "" },
			{"d3s_SRlonghorn_4520_cov_6", {""}, "" },
			{"d3s_SRlonghorn_4520_cov_7", {""}, "" },
			{"d3s_SRlonghorn_4520_cov_8", {""}, "" },
			{"d3s_SRlonghorn_4520_cov_9", {""}, "" }*/
		};
		materials[] = {};
	};
	class RRP_SOA_SR {
		vItemSpace = 1400;
		conditions = "";
		fuelType = "dizel";
		price = (1400 * 60);
		textures[] = {};
		materials[] = {};
	};
	class C_Van_01_box_F_EXT_DHL {
		vItemSpace = 0;
		conditions = "";
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};


	class defaultVeh
	{
		vItemSpace = 50;
		conditions = "";
		fuelType = "ai95";
		price = 100;
		textures[] = {};
		materials[] = {"default","glossy","metallic","matte","chrome"};
		breakingChance = 2;
	};

	class DefaultFBI
	{
		vItemSpace = 50;
		conditions = "";
		fuelType = "ai95";
		price = 200000;
		textures[] = {};
		materials[] = {"default","glossy","metallic","matte","chrome"};
		breakingChance = 2;
	};
	class d3s_amgGT_19_63S: DefaultFBI {};
	class d3s_levante_s_17_mat: DefaultFBI {};



	/*
			textures[] = {
			{"_1", {""}, "" },
			{"_2", {""}, "" },
			{"_3", {""}, "" },
			{"_4", {""}, "" },
			{"_5", {""}, "" },
			{"_6", {""}, "" },
			{"_7", {""}, "" },
			{"_8", {""}, "" },
			{"_9", {""}, "" },
			{"_10", {""}, "" },
			{"_11", {""}, "" },
			{"_12", {""}, "" },
			{"_13", {""}, "" },
			{"_14", {""}, "" },
			{"_15", {""}, "" },
			{"_16", {""}, "" },
			{"_17", {""}, "" },
			{"_18", {""}, "" },
			{"_19", {""}, "" },
			{"_20", {""}, "" }
		};
	*/

	class O_Heli_Transport_04_covered_F
	{
		vItemSpace = 380;
		conditions = "";
		fuelType = "dizel";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_fuel_F: O_Heli_Transport_04_covered_F{};
	class O_Heli_Transport_04_repair_F: O_Heli_Transport_04_covered_F{};
	class O_Heli_Transport_04_box_F: O_Heli_Transport_04_covered_F{};

	class d3s_santafe_19: defaultVeh {
		price = 9900;
		conditions = "";
	};
	class RRPVehicle_santafe_Sector7: defaultVeh {
		price = 9900;
		conditions = "";
	};
	/*
	Phoenix Cars
	*/
	class RRPVehicle_uaz_Cwrka: defaultVeh {
		price = 3500;
	};
	class dezkit_b206_ems
	{
		vItemSpace = 30;
		conditions = "";
		fuelType = "dizel";
		price = 6000;
		textures[] = {};
		materials[] = {};
	};
	class dezkit_b206_7n
	{
		vItemSpace = 30;
		conditions = "";
		fuelType = "dizel";
		price = 6000;
		textures[] = {};
		materials[] = {};
	};

	class O_Heli_Light_02_unarmed_F {
		vItemSpace = 60;
		conditions = "";
		fuelType = "dizel";
		price = 650000;
		textures[] = {
			{"orc_cia", {"cia"}, "" },
			{"orc_wb", {""}, "" },
			{"orc_cm", {"",""}, "(call life_donator) > 0" },
			{"orc_reb", {""}, "" },
			{"orc_cop", {"cop"}, "" }
			//{"orc_med_1", {"med"}, "" }
		};
		materials[] = {};
	};
	class Bell_H13_heli 
	{
		vItemSpace = 30;
		conditions = "";
		fuelType = "dizel";
		price = 250000;
		textures[] = {};
		materials[] = {};
	};
	class heli_mav
	{
		vItemSpace = 90;
		conditions = "";
		fuelType = "dizel";
		price = 550000;
		textures[] = {};
		materials[] = {};
	};
	class dezkit_b206_rescue
	{
		vItemSpace = 30;
		conditions = "";
		fuelType = "dizel";
		price = 6000;
		textures[] = {};
		materials[] = {};
	};
	class dezkit_b206_police
	{
		vItemSpace = 30;
		conditions = "";
		fuelType = "dizel";
		price = 6000;
		textures[] = {
			{"7news_vert", {""}, "" }
		};
		materials[] = {};
	};
	class C_Kart_01_Blu_F {
		vItemSpace = 0;
		conditions = "";
		fuelType = "ai95";
		price = 20000;
		textures[] = {};
		materials[] = {};
	};
	class C_Kart_01_Fuel_F: C_Kart_01_Blu_F {};
	class C_Kart_01_Red_F: C_Kart_01_Blu_F {};
	class C_Kart_01_Vrana_F: C_Kart_01_Blu_F {};

	class B_Quadbike_01_F {
		vItemSpace = 25;
		conditions = "";
		fuelType = "ai95";
		price = 8000;
		textures[] = {
			{"qdbk_cop", {"cop"}, "" },
			{"qdbk_reb", {""}, "" },
			{"qdbk_b", {""}, "" },
			{"qdbk_bl", {""}, "" },
			{"qdbk_r", {""}, "" },
			{"qdbk_w", {""}, "" },
			{"qdbk_g", {""}, "" },
			{"qdbk_cm", {""}, "" }
		};
		materials[] = {};
	};

	class RRPVehicle_civ_segway {
		vItemSpace = 35;
		conditions = "";
		fuelType = "ai95";
		price = 6000;
		textures[] = {};
		materials[] = {};
	};

	class RRPVehicle_civ_segway_cop: RRPVehicle_civ_segway {
		isStructures = true;
	};

	class B_SDV_01_F {
		vItemSpace = 85;
		conditions = "(call life_donator) > 2";
		fuelType = "ai95";
		price = 20000;
		textures[] = {};
		materials[] = {};
	};
	class I_SDV_01_F: B_SDV_01_F{};

	class C_Boat_Civil_01_police_F {
		vItemSpace = 85;
		conditions = "";
		price = 160;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class C_Boat_Civil_01_rescue_F {
		vItemSpace = 85;
		conditions = "";
		fuelType = "ai95";
		price = 100;
		textures[] = {};
		materials[] = {};
	};
	class I_MRAP_03_F {
		vItemSpace = 58;
		conditions = "";
		price = 1000;
		fuelType = "dizel";
		textures[] = {
			{"strd_cop", {"cop"}, "" },
			{"strd_aff", {"aff"}, "" },
			{"strd_reb", {"rebgang"}, "" },
			{"strd_wd", {"sdr"}, "" },
			{"strd_rst", {"rst"}, "" },
			{"strd_swt", {"swat"}, "" },
			{"strd_med", {"med"}, "" },
			{"strd_dea", {"dea"}, "" },
			{"strd_nsb", {"nsb"}, "" }
		};
		materials[] = {};
		armored = true;
	};
	class d3s_AS_365 {
		vItemSpace = 20;
		conditions = "";
		fuelType = "dizel";
		price = 20000;
		textures[] = {
			{"SWAT_Eurocopter", {"cop"}, "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]" },
			{"FBI_Eurocopter", {"cop"}, "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]" }
		};
		materials[] = {};
		isStructures = true;
	};
	class B_Heli_Light_01_F {
		vItemSpace = 20;
		conditions = "";
		fuelType = "dizel";
		price = 450000;
		textures[] = {
			{"humm_cop", {"cop"}, "('cop' call RRPClient_groups_getSideLevel) < 23 || ('cop' call RRPClient_groups_getSideLevel) > 26" },
			{"SWAT_MH9", {"cop"}, "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]" },
			{"FBI_MH9", {"cop"}, "('cop' call RRPClient_groups_getSideLevel) in [27, 28, 29, 30, 32]" },
			{"humm_cia", {"cia"}, "" },
			{"humm_bl", {""}, "" },
			{"humm_r", {""}, "" },
			{"humm_vme", {"","","cia"}, "(call life_donator) > 0" },
			{"humm_bln", {""}, "" },
			{"humm_llp", {""}, "" },
			{"humm_fr", {""}, "" },
			{"humm_bj", {""}, "" },
			{"humm_rl", {""}, "" },
			{"humm_sn", {""}, "" },
			{"humm_vrn", {""}, "" },
			{"humm_wv", {""}, "" },
			{"humm_reb", {""}, "" },
			{"humm_med", {"med"}, "" },
			{"humm_rg", {"rebgang"}, "" },
			{"humm_sdr", {"sdr"}, "" },
			{"humm_swt", {"swat"}, "" },
			{"humm_rfa", {"rfa"}, "" },
			{"humm_nsb", {"nsb"}, "" },
			{"humm_ics", {"ics"}, "" },
			{"humm_led", {"led"}, "" },
			{"humm_dea", {"dea"}, "" },
			{"humm_fsg", {"fsg"}, "" },
			{"humm_arg", {"arg"}, "" }
		};
		materials[] = {};
	};
	class I_Heli_light_03_unarmed_F {
		vItemSpace = 90;
		conditions = "";
		fuelType = "dizel";
		price = 25000;
		textures[] = {
			{"hllc_cia", {"cia"}, "" },
			{"hllc_med", {"med"}, "" },
			{"hllc_g", {""}, "" },
			{"hllc_7n", {"press"}, "" },
			{"hllc_rg", {"rebgang"}, "" },
			{"hllc_cop", {"cop"}, "" },
			{"hllc_sdr", {"sdr"}, "" },
			{"hllc_gra", {"mc"}, "" },
			{"hllc_13", {"g13"}, "" },
			{"hllc_arg", {"arg"}, "" },
			{"hllc_swt", {"swat"}, "" },
			{"hllc_nsb", {"nsb"}, "" },
			{"hllc_muj", {"muj"}, "" },
			{"hllc_ics", {"ics"}, "" },
			{"hllc_ccp", {"ccp"}, "" },
			{"hllc_dea", {"dea"}, "" }
		};
		materials[] = {};
	};
	class C_Heli_Light_01_civil_F {
		vItemSpace = 20;
		conditions = "";
		price = 350000;
		fuelType = "dizel";
		textures[] = {
			{"humm_bln", {""}, "" },
			{"humm_reb", {""}, "" },
			{"humm_llp", {""}, "" },
			{"humm_fr", {""}, "" },
			{"humm_gra", {""}, "" },
			{"humm_bj", {""}, "" },
			{"humm_lg", {""}, "" },
			{"humm_shd", {""}, "" },
			{"humm_shr", {""}, "" },
			{"humm_rl", {"",""}, "(call life_donator) > 0" },
			{"humm_sn", {"",""}, "(call life_donator) > 0" },
			{"humm_vrn", {""}, "" },
			{"humm_wsp", {"",""}, "(call life_donator) > 0" },
			{"humm_wv", {""}, "" },
			{"humm_tx", {"taxi"}, "" }
		};
		materials[] = {};
	};
	
	///////////////////////////////////////////////
	class I_C_Heli_Light_01_civil_F {
		vItemSpace = 20;
		conditions = "";
		price = 380000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class CN_humming {
		vItemSpace = 20;
		conditions = "";
		price = 50000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class Phoenix_humming : CN_humming {};
	class phoenix_humming_winter : CN_humming {};
	class RRPHelicopter_Cwrka_1 : CN_humming {};
	class RimasINC_humming : CN_humming {};
	class RRPHelicopter_kifo_hummingbird : CN_humming {};
	class RRPHelicopter_Light01_7NEWS : CN_humming {
		price = 5000;
	};
	class RRPHelicopter_Deadlock_1 : CN_humming {
		textures[] = {
			{"RRPHelicopter_Deadlock_1", {""}, "" }
		};
	};
	class RRPVehicle_Heli_wolves : CN_humming {};
	class RRPVehicle_Heli_1_wolves : CN_humming {};
	class RRPVehicle_Heli_taxi : CN_humming {
		price = 25000;
	};
	class RRPHelicopter_Hellcat_7News : RRPHelicopter_Light01_7NEWS {
		price = 15000;
	};
	class RRP_SOA_AIR: CN_humming {};
	class DW_humming: CN_humming {};
	class Cigane_humming: CN_humming {};
	class BS_humming: CN_humming  {};
	class YG_humming: CN_humming {};
	class CON_humming: CN_humming {};
	class ENC_humming: CN_humming {};
	class KAS_humming: CN_humming {};
	class OUT_humming: CN_humming {};
	class CHR_humming: CN_humming {};
	class Legion_humming: CN_humming {};
	class Legion_hummingbird_new: CN_humming {};
	class BW_humming_2: CN_humming {};
	class ESC_humming: CN_humming {
		textures[] = {
			{"escobaro_heli_1", {""}, "" }
		};
	};
	class IMPERIUM_TN_Heli: CN_humming {};
	class SK_Dragon_Helli: CN_humming {};
	class SK_N_Samurai_Helli: CN_humming {};
	class SK_BlueWolf_Helli: CN_humming {};
	class IMPERIUM_Cerber_Helli: CN_humming {};
	class s7_vehicles_hummingbird: CN_humming {};
	class s7_vechicles_hummingbird_2: CN_humming {};
	class RRPHelicopter_Light01_justice: CN_humming {};
	class IMPERIUM_Grif_helli: CN_humming {};
	class RRPVehicle_hummingbird_umbrella_1: CN_humming {
		textures[] = {
			{"RRPVehicle_hummingbird_umbrella_1", {""}, "" }
		};
	};
	class RRPVehicle_hummingbird_MS13: CN_humming {};
	class RRPVehicle_hummingbird_2_MS13: CN_humming {};
	class Sopranos_humming: CN_humming
	{
		textures[] = {
			{"Sopranos_humming_1", {""}, "" }
		};
	};
	class RRPVehicle_hummingbird_MW: CN_humming {};
	class BW_humming: CN_humming {
		textures[] = {
			{"BW_humming", {""}, "" }
		};
	};
	class B_Heli_Transport_03_unarmed_F {
		vItemSpace = 210;
		conditions = "";
		price = 20000;
		fuelType = "dizel";
		textures[] = {
			{"hrn_fed", {"cop","cia","swat"}, "" },
			{"hrn_med", {"med"}, "" }
		};
		materials[] = {};
	};
	class RRPVehicle_PlaneFighter03_noammo {
		vItemSpace = 150;
		conditions = "";
		price = 1000000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class C_Plane_Civil_01_F {
		vItemSpace = 150;
		conditions = "";
		fuelType = "dizel";
		price = 255000;
		textures[] = {
			{"cpc_wbl", {"",""}, "" },
			{"cpc_bly", {"",""}, "" },
			{"cpc_gw", {"",""},  "" },
			{"cpc_r", {"",""},   "" }
		};
		materials[] = {};
	};
	class C_Truck_02_covered_F {
		vItemSpace = 500;
		conditions = "";
		fuelType = "dizel";
		price = 30000;
		textures[] = {};
		materials[] = {};
	};
	class d3s_next_bocha {
		vItemSpace = 500;
		conditions = "";
		fuelType = "dizel";
		price = 10000;
		textures[] = {
			{"next1", {""}, "" },
			{"next2", {""}, "(call life_donator) > 0" },
			{"next3", {""}, "(call life_donator) > 0" },
			{"next4", {""}, "(call life_donator) > 0" },
			{"next5", {""}, "(call life_donator) > 0" },
			{"Ben_NEX_1", {""}, "" },
			{"Ben_NEX_2", {""}, "(call life_donator) > 1" },
			{"Ben_NEX_3", {""}, "(call life_donator) > 1" }
		};
		materials[] = {};
	};
	class d3s_next {
		vItemSpace = 150;
		conditions = "";
		fuelType = "dizel";
		price = 10000;
		textures[] = {
			{"next1", {""}, "" },
			{"next2", {""}, "(call life_donator) > 0" },
			{"next3", {""}, "(call life_donator) > 0" },
			{"next4", {""}, "(call life_donator) > 0" },
			{"next5", {""}, "(call life_donator) > 0" },
			{"Ben_NEX_1", {""}, "" },
			{"Ben_NEX_2", {""}, "(call life_donator) > 1" },
			{"Ben_NEX_3", {""}, "(call life_donator) > 1" }
		};
		materials[] = {};
	};
	class d3s_next_kung {
		vItemSpace = 500;
		conditions = "";
		fuelType = "dizel";
		price = 10000;
		textures[] = {
			{"next1", {""}, "" },
			{"next2", {""}, "(call life_donator) > 0" },
			{"next3", {""}, "(call life_donator) > 0" },
			{"next4", {""}, "(call life_donator) > 0" },
			{"next5", {""}, "(call life_donator) > 0" },
			{"Ben_NEX_1", {""}, "" },
			{"Ben_NEX_2", {""}, "(call life_donator) > 1" },
			{"Ben_NEX_3", {""}, "(call life_donator) > 1" }
		};
		materials[] = {};
	};
	class d3s_maz_6317_cistern {
		vItemSpace = 600;
		conditions = "";
		fuelType = "dizel";
		price = 15000;
		textures[] = {
			{"maz_1", {""}, "" },
			{"maz_2", {""}, "(call life_donator) > 0" },
			{"maz_3", {""}, "(call life_donator) > 0" },
			{"maz_4", {""}, "(call life_donator) > 0" },
			{"maz_5", {""}, "(call life_donator) > 0" },
			{"maz_6", {""}, "(call life_donator) > 0" },
			{"maz_7", {""}, "(call life_donator) > 0" },
			{"maz_8", {""}, "(call life_donator) > 0" },
			{"maz_1v", {""}, "(call life_donator) > 2" },
			{"maz_2v", {""}, "(call life_donator) > 2" },
			{"maz_3v", {""}, "(call life_donator) > 2" },
			{"maz_4v", {""}, "(call life_donator) > 2" },
			{"maz_5v", {""}, "(call life_donator) > 2" },
			{"maz_6v", {""}, "(call life_donator) > 2" },
			{"maz_7v", {""}, "(call life_donator) > 2" },
			{"Ben_MAZ", {""}, "" }
		};
		materials[] = {};
	};
	class d3s_maz_6317 {
		vItemSpace = 200;
		conditions = "";
		fuelType = "dizel";
		price = 15000;
		textures[] = {
			{"maz_1", {""}, "" },
			{"maz_2", {""}, "(call life_donator) > 0" },
			{"maz_3", {""}, "(call life_donator) > 0" },
			{"maz_4", {""}, "(call life_donator) > 0" },
			{"maz_5", {""}, "(call life_donator) > 0" },
			{"maz_6", {""}, "(call life_donator) > 0" },
			{"maz_7", {""}, "(call life_donator) > 0" },
			{"maz_8", {""}, "(call life_donator) > 0" },
			{"maz_1v", {""}, "(call life_donator) > 2" },
			{"maz_2v", {""}, "(call life_donator) > 2" },
			{"maz_3v", {""}, "(call life_donator) > 2" },
			{"maz_4v", {""}, "(call life_donator) > 2" },
			{"maz_5v", {""}, "(call life_donator) > 2" },
			{"maz_6v", {""}, "(call life_donator) > 2" },
			{"maz_7v", {""}, "(call life_donator) > 2" },
			{"Ben_MAZ", {""}, "" }
		};
		materials[] = {};
	};
	class B_Truck_01_fuel_CIV_F {
		vItemSpace = 700;
		conditions = "";
		price = 26000;
		fuelType = "dizel";
		textures[] = {
			{"tfc_def", {""}, "" },
			{"tfc_bl", {""}, "(call life_donator) > 0" },
			{"tfc_gs", {""}, "(call life_donator) > 0" },
			{"tfc_mh", {""}, "(call life_donator) > 0" },
			{"tfc_or", {""}, "(call life_donator) > 0" },
			{"tfc_pr", {""}, "(call life_donator) > 0" },
			{"tfc_r", {""}, "(call life_donator) > 0" },
			{"tfc_y", {""}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class RRPVehicle_fuel_truck {
		vItemSpace = 700;
		conditions = "";
		price = 26000;
		fuelType = "dizel";
		textures[] = {
			{"tfc_def", {""}, "" },
			{"tfc_bl", {""}, "(call life_donator) > 0" },
			{"tfc_gs", {""}, "(call life_donator) > 0" },
			{"tfc_mh", {""}, "(call life_donator) > 0" },
			{"tfc_or", {""}, "(call life_donator) > 0" },
			{"tfc_pr", {""}, "(call life_donator) > 0" },
			{"tfc_r", {""}, "(call life_donator) > 0" },
			{"tfc_y", {""}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_Truck_01_covered_F {
		vItemSpace = 700;
		conditions = "";
		price = 26000;
		fuelType = "dizel";
		textures[] = {
			{"tfc_def", {""}, "" },
			{"tfc_bl", {""}, "(call life_donator) > 0" },
			{"tfc_gs", {""}, "(call life_donator) > 0" },
			{"tfc_mh", {""}, "(call life_donator) > 0" },
			{"tfc_or", {""}, "(call life_donator) > 0" },
			{"tfc_pr", {""}, "(call life_donator) > 0" },
			{"tfc_r", {""}, "(call life_donator) > 0" },
			{"tfc_y", {""}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class sab_ultralight {
		vItemSpace = 0;
		conditions = "";
		price = 50000;
		fuelType = "dizel";
		textures[] = {
			{"Sub_ul_1", {"",""}, "" },
			{"Sub_ul_2", {"",""}, "" },
			{"Sub_ul_3", {"",""}, "" },
			{"Sub_ul_4", {"",""}, "" },
			{"Sub_ul_5", {"",""}, "" },
			{"Sub_ul_6", {"",""}, "" }
		};
		materials[] = {};
	};
	class Sab_an2_sea
	{
		vItemSpace = 0;
		conditions = "";
		price = 90000;
		fuelType = "dizel";
		textures[] = {
			{"sab_an2_air", {"",""}, "" },
			{"sab_an2_aero", {"",""}, "" },
			{"sab_an2_isl", {"",""}, "(call life_donator) > 0" },
			{"sab_an2_anast", {"",""}, "" },
			{"sab_an2_fire", {"",""}, "" },
			{"sab_an2_Vintage", {"",""}, "" },
			{"sab_an2_cz", {"",""}, "" }
		};
		materials[] = {};
	};
	class plane_dodo
	{
		vItemSpace = 0;
		conditions = "";
		price = 155000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class plane_duster
	{
		vItemSpace = 0;
		conditions = "";
		price = 205000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class plane_velum
	{
		vItemSpace = 0;
		conditions = "";
		price = 255000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};

	class TM2_UCG_Black {
		vItemSpace = 40;
		conditions = "";
		price = 100000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_uaz_3162 {
		vItemSpace = 50;
		conditions = "";
		price = 2600;
		fuelType = "ai95";
		textures[] = {
			{"d3s_uaz_1", {""}, "" },
			{"d3s_uaz_2", {""}, "" },
			{"d3s_uaz_3", {""}, "" },
			{"d3s_uaz_4", {""}, "" },
			{"d3s_uaz_5", {""}, "" },
			{"d3s_uaz_6", {""}, "" },
			{"d3s_uaz_7", {""}, "" },
			{"d3s_uaz_8", {""}, "" },
			{"d3s_uaz_9", {""}, "" },
			{"d3s_uaz_11", {""}, "" },
			{"d3s_uaz_12", {""}, "" },
			{"d3s_uaz_13", {""}, "" },
			{"Ben_PAT_1", {""}, "" },
			{"Ben_PAT_2", {""}, "(call life_donator) > 1" },
			{"Ben_PAT_3", {""}, "(call life_donator) > 1" }
		};
		materials[] = {"default","glossy","metallic","matte","chrome"};
	};
	class s7_vehicles_uaz {
		vItemSpace = 50;
		conditions = "";
		price = 2600;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class RRPVehicle_tahoe_bears {
		vItemSpace = 50;
		conditions = "";
		fuelType = "ai95";
		price = 42000;
		textures[] = {};
	};
	class d3s_uaz_3165M {
		vItemSpace = 110;
		conditions = "";
		price = 3500;
		fuelType = "ai95";
		textures[] = {
			{"uaz_1", {""}, "" },
			{"uaz_2", {""}, "" },
			{"uaz_3", {""}, "" },
			{"uaz_4", {""}, "" },
			{"uaz_5", {""}, "" },
			{"uaz_6", {""}, "" },
			{"uaz_7", {""}, "" }
			};
		materials[] = {"default","glossy","metallic","matte","chrome"};
	};
	class d3s_zil_131_4 {
		vItemSpace = 400;
		conditions = "";
		price = 24000;
		fuelType = "dizel";
		textures[] = {
			{"Zil_131_1", {""}, "" },
			{"Zil_131_2", {""}, "" },
			{"Zil_131_3", {""}, "" },
			{"Zil_131_4", {""}, "" }
		};
		materials[] = {};
	};
	class d3s_actros_14_TAXI {
		vItemSpace = 900;
		conditions = "";
		fuelType = "dizel";
		price = 70000;
		textures[] = {};
		materials[] = {};
	};
	class d3s_uaz_3162_COP {
		vItemSpace = 50;
		conditions = "";
		fuelType = "ai95";
		price = 100;
		textures[] = {};
		materials[] = {};
		isStructures = true;
	};
	class d3s_uaz_3165M_COP {
		vItemSpace = 50;
		conditions = "";
		price = 100;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		isStructures = true;
	};
	//////////////////////
	/////////////////
	class d3s_uaz_469P {
		vItemSpace = 50;
		conditions = "";
		price = 1500;
		fuelType = "ai95";
		textures[] = {
			{"UAZ1_1", {""}, "" },
			{"UAZ1_2", {""}, "(call life_donator) > 1" },
			{"UAZ1_3", {""}, "(call life_donator) > 1" },
			{"UAZ1_4", {""}, "" },
			{"UAZ1_5", {""}, "" },
			{"UAZ1_6", {""}, "" },
			{"UAZ1_7", {""}, "(call life_donator) > 1" },
			{"UAZ1_8", {""}, "" },
			{"UAZ1_9", {""}, "" },
			{"UAZ1_10", {""}, "" },
			{"UAZ1_11", {""}, "(call life_donator) > 1" },
			{"UAZ1_12", {""}, "(call life_donator) > 1" },
			{"UAZ1_13", {""}, "(call life_donator) > 1" },
			{"UAZ1_14", {""}, "(call life_donator) > 1" },
			{"UAZ1_15", {""}, "(call life_donator) > 1" },
			{"UAZ1_16", {""}, "(call life_donator) > 1" },
			{"UAZ1_17", {""}, "(call life_donator) > 1" }
		};
		materials[] = {"default","glossy","metallic","matte","chrome"};
	};
	/////////////
	class New_Holland_TC590_civ {
		vItemSpace = 500;
		conditions = "";
		price = 200000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};

	class RRP_Dob {
		vItemSpace = 500;
		conditions = "";
		price = 45000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class New_Holland_TC590_civ_BE {
		vItemSpace = 750;
		conditions = "";
		price = 240000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};

	class d3s_Kawasaki_Ninja_H2R {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 380000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_Aprilia_Tuono_V4_1100_RR {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 320000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_Kawasaki_Z800 {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 390000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class outcast_kawasaki900 {
		vItemSpace = 100;
		conditions = "";
		price = 90000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_zombiea_gtaV {
		vItemSpace = 100;
		conditions = "";
		price = 200000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_sanctus_gtaV {
		vItemSpace = 100;
		conditions = "";
		price = 240000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_BMW_S_1000_RR {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 400000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_Ducati_Monster_1200_S {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 410000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_Ducati_XDiavel_S {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 410000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_Ducati_RRPVehicle_civ_monster_1200_S {
		vItemSpace = 100;
		conditions = "(call life_donator) > 3";
		price = 18000;
		fuelType = "ai95";
		textures[] = {
			{"duc_monst1", {""}, "" }
		};
		materials[] = {};
	};
	class d3s_KTM_1290_Super_Duke {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 346000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_Suzuki_GSX_R_1000 {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 338000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_Kawasaki_ZX7RR {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		price = 355000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class d3s_Suzuki_Hayabusa {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3";
		fuelType = "ai95";
		price = 250000;
		textures[] = {};
		materials[] = {};
	};
	class d3s_f10_12_IMPEP {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3 or license_imperium";
		fuelType = "ai95";
		price = 90000;
		textures[] = {};
		materials[] = {};
	};
	class d3s_f10_12_SK {
		vItemSpace = 1;
		conditions = "(call life_donator) > 3 or license_imperium";
		fuelType = "ai95";
		price = 90000;
		textures[] = {};
		materials[] = {};
	};
	///////////////////
	class I_C_Offroad_02_LMG_F {
		vItemSpace = 50;
		conditions = "false";
		price = 60000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		battle = true;
	};

	class RRP_SOA_LMG {
		vItemSpace = 50;
		conditions = "false";
		price = 60000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		battle = true;
	};
	class RRPVehicle_50call_Bears {
		vItemSpace = 65;
		conditions = "false";
		price = 75000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		battle = true;
	};
	class RRPVehicle_50call_Deadlock {
		vItemSpace = 65;
		conditions = "false";
		price = 75000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		battle = true;
	};
	class Offroad_01_KASATKY {
		vItemSpace = 65;
		conditions = "false";
		price = 75000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		battle = true;
	};
	class BS_Offroad {
		vItemSpace = 65;
		conditions = "false";
		price = 75000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		battle = true;
	};
	class d3s_zil_130_06 { //тент
		vItemSpace = 450;
		conditions = "";
		price = 27000;
		fuelType = "dizel";
		textures[] = {
			{"zil130_1", {""}, "" },
			{"zil130_2", {""}, "" },
			{"zil130_3", {""}, "" },
			{"zil130_4", {""}, "" },
			{"zil130_5", {""}, "" }
		};
	};
	class d3s_zil_130_04 { //бочка
		vItemSpace = 450;
		conditions = "";
		price = 27000;
		fuelType = "dizel";
		textures[] = {
			{"zil130_1", {""}, "" },
			{"zil130_2", {""}, "" },
			{"zil130_3", {""}, "" },
			{"zil130_4", {""}, "" },
			{"zil130_5", {""}, "" }
		};
	};
	class d3s_zil_130_03 { //юорт металл
		vItemSpace = 450;
		conditions = "";
		price = 27000;
		fuelType = "dizel";
		textures[] = {
			{"zil130_1", {""}, "" },
			{"zil130_2", {""}, "" },
			{"zil130_3", {""}, "" },
			{"zil130_4", {""}, "" },
			{"zil130_5", {""}, "" }
		};
	};
	class d3s_ural_tent { //юорт металл
		vItemSpace = 400;
		conditions = "";
		price = 6000;
		fuelType = "dizel";
	};
	class d3s_mule
	{
		vItemSpace = 1400;
		conditions = "";
		price = 300000;
		fuelType = "dizel";
	};
	class d3s_T440
	{
		vItemSpace = 1550;
		conditions = "";
		price = 350000;
		fuelType = "dizel";
	};
	class d3s_T680_Dryvan
	{
		vItemSpace = 1600;
		conditions = "";
		price = 370000;
		fuelType = "dizel";
	}; 
	/*
	Орендные МАНЫ по цене 425000
	Покупные маны по цене 5000000
	*/



	class MAN_Truck_03_covered_F_WD {
		vItemSpace = 2000;
		conditions = "";
		price = 90000;
		fuelType = "dizel";
		textures[] = {};
		armored = false;
	};
	class MAN_Truck_03_covered_F_E: MAN_Truck_03_covered_F_WD {};


	class RRPVehicle_civ_tempest{
		vItemSpace = 2000;
		conditions = "false";
		price = 90000;
		fuelType = "dizel";
		textures[] = {};
		armored = false;
		sellEnabled = "true";
		chopEnabled = "true";
		enableRopeAttach = true;
	};
	class Deadlock_MAN: RRPVehicle_civ_tempest
	{
		textures[] =
		{
			{"Deadlock_MAN", {""}, "" }
		};
	};
	class CN_MAN: RRPVehicle_civ_tempest {};
	class RRP_SOA_MAN: RRPVehicle_civ_tempest {};
	class Kasatky_MAN: RRPVehicle_civ_tempest {};
	class SOPRANO_MAN: RRPVehicle_civ_tempest {};
	class PH_MAN: RRPVehicle_civ_tempest {};
	class PH_MAN_2: RRPVehicle_civ_tempest {};
	class IMPER_MAN: RRPVehicle_civ_tempest {};
	class SK_MAN: RRPVehicle_civ_tempest  {};
	class Pirats_MAN: RRPVehicle_civ_tempest {};
	class RRPVehicle_man_Pirates: RRPVehicle_civ_tempest {};
	class RRPVehicle_kifo_tempest: RRPVehicle_civ_tempest {};
	class BS_MAN: RRPVehicle_civ_tempest {};
	class RRPVehicle_MAN_MS13: RRPVehicle_civ_tempest {};
	class ESC_MAN: RRPVehicle_civ_tempest {};
	class CIGANE_MAN: RRPVehicle_civ_tempest {};
	class RRPVehicle_man_Bloods: RRPVehicle_civ_tempest {};
	class RRPVehicle_man_new_Bloods: RRPVehicle_civ_tempest {};
	class RRPVehicle_man_Sector7: RRPVehicle_civ_tempest {};
	class RRPVehicle_narcos_tempest: RRPVehicle_civ_tempest {};
	class RRPVehicle_Miners_MAN: RRPVehicle_civ_tempest {};
	class RRPVehicle_MAN_Wolves: RRPVehicle_civ_tempest {};
	class RRPVehicle_man_constant: RRPVehicle_civ_tempest {};
	class RimasINC_MAN: RRPVehicle_civ_tempest {};

	class C_Scooter_Transport_01_F {
		vItemSpace = 1;
		conditions = "(call life_donator) > 2";
		price = 10000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class B_Boat_Transport_01_F { //надувная бомж
		vItemSpace = 45;
		conditions = "";
		price = 25000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class C_Boat_Civil_01_F {
		vItemSpace = 85;
		conditions = "";
		price = 43000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class I_C_Boat_Transport_02_F {
		vItemSpace = 85;
		conditions = "(call life_donator) > 2";
		price = 50000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};

	//бтры
	class RRPVehicle_BTR90 {
		vItemSpace = 10;
		conditions = "false";
		price = 400000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
		AllowedGarages[] = {""};

		battle = true;

		sellEnabled = "true";
		chopEnabled = "true";
	};
	class RRPVehicle_BTR90_BlackSnow: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","BS_car_spawn"};
	};
	class RRPVehicle_BTR90_Pirates: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","ESC_k_car_s_a","ESC_k_car_s_p"};
	};
	class RRPVehicle_BTR90_Wolves: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","wolves_car_spawn"};
	};
	class RRPVehicle_BTR90_Soprano: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","CHROME_car_spawn"};
	};
	class RRPVehicle_BTR90_CostraNostra: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","far_veh_spawn"};
	};
	class RRPVehicle_BTR90_IMPERIUM: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","imperium_veh_spawn"};
	};
	class RRPVehicle_BTR90_Phoenix: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","phoenix_car_spawn"};
	};
	class RRPVehicle_BTR90_Kifo: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","kifo_car_spawn"};
	};
	class RRPVehicle_BTR90_Sector7: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","DW_veh_s"};
	};
	class RRPVehicle_BTR90_Cigane: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","cigane_veh_s_1"};
	};
	class RRPVehicle_BTR90_Deadlock: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","deadlock_car_spawn","deadlock_car_spawn_1"};
	};
	class RRPVehicle_BTR90_MS13: RRPVehicle_BTR90 {
		AllowedGarages[] = {"stratis_garage","blackw_veh_s"};
	};

	//паромы
	class ri_parom_u {
		vItemSpace = 0;
		conditions = "";
		price = 230000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};
	class ri_parom3_u_BE : ri_parom_u {
		conditions = "(call life_donator) > 2";
		price = 440000;
	};
	class ri_parom3_BE : ri_parom_u {
		conditions = "(call life_donator) > 2";
		price = 500000;
	};
	/////////////

	///////////////*******///////////////
	class d3s_e38_98_discordBooster {
		vItemSpace = 50;
		conditions = "";
		price = 200;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};

		ignoreSlots = true;
		sellEnabled = "true";
		chopEnabled = "true";
		breakingChance = -1;
	};
	class d3s_e60_09_discordBooster: d3s_e38_98_discordBooster {};
	class d3s_g63amg_18_discordBooster: d3s_e38_98_discordBooster {};
	class d3s_svr_17_discordBooster: d3s_e38_98_discordBooster {};

	class RRPVehicle_discordBooster_clk: d3s_e38_98_discordBooster {};
	class RRPVehicle_discordBooster_audiq7: d3s_e38_98_discordBooster {};
	class RRPVehicle_discordBooster_touareg: d3s_e38_98_discordBooster {};
	class RRPVehicle_discordBooster_Z800: d3s_e38_98_discordBooster {};

	///////////////
	//////////////////

	class RRPHelicopter_AS365_7NEWS {
		vItemSpace = 10;
		conditions = "false";
		price = 7000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class RRPHelicopter_AS365_EMS {
		vItemSpace = 10;
		conditions = "false";
		price = 7000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class RRPVehicle_Armed_Boat_PD {
		vItemSpace = 1;
		conditions = "false";
		price = 7000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
		battle = true;
	};

	//
	class RRPVehicle_HELLCAT_EMS {
		vItemSpace = 0;
		conditions = "false";
		price = 6000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};

		breakingChance = -1;
		sellEnabled = "true";
		chopEnabled = "true";
	};
	class RRPVehicle_humming_EMS {
		vItemSpace = 0;
		conditions = "false";
		price = 6000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class RRPVehicle_ORCA_EMS {
		vItemSpace = 0;
		conditions = "false";
		price = 6000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class RRPVehicle_HURON_EMS {
		vItemSpace = 0;
		conditions = "false";
		price = 6000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
		enableRopeAttach = true;
	};
	class RRPVehicle_VTOL_EMS {
		vItemSpace = 0;
		conditions = "false";
		price = 6000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};
	};
	class RRPVehicle_HURON_default {
		vItemSpace = 1400;
		conditions = "false";
		price = 320000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};

		breakingChance = 6;
		sellEnabled = "true";
		chopEnabled = "fasle";
		enableRopeAttach = true;
	};

	///////////////////////////
	class RRPVehicle_TOW_achiev {
		vItemSpace = 50;
		conditions = "false";
		price = 30000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};

		ignoreSlots = true;
		chopEnabled = "true";
	};
	//хуйня что плавает
	class d3s_uaz_3907 {
		vItemSpace = 250;
		conditions = "";
		price = 56000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
	};

	class RRPVehicle_fbi_agera
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_sheriff_agera : RRPVehicle_fbi_agera {};

	class RRPVehicle_fbi_audiq7
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_sheriff_audiq7 : RRPVehicle_fbi_audiq7 {};
	class RRPVehicle_opr_audiq7 : RRPVehicle_fbi_audiq7 {};
	class RRPVehicle_detective_audiq7 : RRPVehicle_fbi_audiq7 {};

	class RRPVehicle_opr_bmw1M
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};

	class RRPVehicle_sheriff_bmw1M : RRPVehicle_opr_bmw1M {};
	class RRPVehicle_fbi_bmw1M : RRPVehicle_opr_bmw1M {};
	class RRPVehicle_detective_bmw1M : RRPVehicle_opr_bmw1M {};


	class RRPVehicle_civ_camry55unm : RRPVehicle_opr_bmw1M {};
	class RRPVehicle_civ_cruiser200unm : RRPVehicle_opr_bmw1M {};

	class RRPVehicle_detective_2114
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_opr_2114 : RRPVehicle_detective_2114 {};
	class RRPVehicle_fbi_2114 : RRPVehicle_detective_2114 {};
	class RRPVehicle_sheriff_2114 : RRPVehicle_detective_2114 {};

	class RRPVehicle_detective_e34
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_opr_e34 : RRPVehicle_detective_e34 {};
	class RRPVehicle_fbi_e34 : RRPVehicle_detective_e34 {};
	class RRPVehicle_sheriff_e34 : RRPVehicle_detective_e34 {};

	class RRPVehicle_detective_escalade
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_sheriff_escalade : RRPVehicle_detective_escalade {};

	class RRPVehicle_detective_f90
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};

	class RRPVehicle_sheriff_f90 : RRPVehicle_detective_f90 {};
	class RRPVehicle_fbi_f90 : RRPVehicle_detective_f90 {};
	class RRPVehicle_opr_f90 : RRPVehicle_detective_f90 {};

	class RRPVehicle_sheriff_rx7tun
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};

	class RRPVehicle_detective_rx7tun : RRPVehicle_sheriff_rx7tun {};
	class RRPVehicle_fbi_rx7tun : RRPVehicle_sheriff_rx7tun {};
	class RRPVehicle_opr_rx7tun : RRPVehicle_sheriff_rx7tun {};

	class RRPVehicle_detective_G65
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_opr_G65 : RRPVehicle_detective_G65 {};
	class RRPVehicle_fbi_G65 : RRPVehicle_detective_G65 {};
	class RRPVehicle_sheriff_G65 : RRPVehicle_detective_G65 {};

	class RRPVehicle_opr_gtr
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_k9_gtr : RRPVehicle_opr_gtr {};
	class RRPVehicle_fbi_gtr : RRPVehicle_opr_gtr {};

	class RRPVehicle_opr_peugeot508
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_detective_peugeot508 : RRPVehicle_opr_peugeot508 {};
	class RRPVehicle_fbi_peugeot508 : RRPVehicle_opr_peugeot508 {};
	class RRPVehicle_sheriff_peugeot508 : RRPVehicle_opr_peugeot508 {};


	class RRPVehicle_detective_paragon
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_opr_paragon: RRPVehicle_detective_paragon {};
	class RRPVehicle_sheriff_paragon: RRPVehicle_detective_paragon {};
	class RRPVehicle_fbi_paragon: RRPVehicle_detective_paragon {};



	class RRPVehicle_fbi_lykan
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_sheriff_lykan: RRPVehicle_fbi_lykan {};



	class RRPVehicle_detective_roversport
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_sheriff_roversport: RRPVehicle_detective_roversport {};


	class RRPVehicle_sheriff_insurgent
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};
	class RRPVehicle_fbi_insurgent: RRPVehicle_sheriff_insurgent {};
	class RRPVehicle_opr_insurgent: RRPVehicle_sheriff_insurgent {};
	class RRPVehicle_sheriff_insurgent_armed: RRPVehicle_sheriff_insurgent {
		allowedDamageSZ = true;
		allowedDamageOnlySZ = true;
	};


	class RRPVehicle_fbi_mus
	{
		vItemSpace = 10;
		conditions = "false";
		chopEnabled = "true";
		price = 5000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};
		armored = true;
		isCop = true;
	};

	class RRPVehicle_opr_mus : RRPVehicle_fbi_mus {
		textures[] = {};};
	//cigane cars
	class RRPVehicle_cigane_w124: RRPVehicle_civ_w124{
		textures[] = {};};
	class RRPVehicle_cigane_G65: RRPVehicle_civ_G65{
		textures[] = {};};
	class RRPVehicle_cigane_mus: RRPVehicle_civ_mus{
		textures[] = {};};
	class RRPVehicle_cigane_roversport: RRPVehicle_civ_roversport{
		textures[] = {};};
	//bs cars
	class RRPVehicle_bs_jeep: RRPVehicle_civ_jeep{
		textures[] = {};};
	class RRPVehicle_bs_mus: RRPVehicle_civ_mus{
		textures[] = {};};
	class RRPVehicle_bs_touareg: RRPVehicle_civ_touareg{
		textures[] = {};};
	class RRPVehicle_bs_f90lyk_1: RRPVehicle_civ_f90lyk{
		textures[] = {};};
	class RRPVehicle_bs_f90lyk_2: RRPVehicle_civ_f90lyk{
		textures[] = {};};
	class RRPVehicle_bs_gtr_1: RRPVehicle_civ_gtr{
		textures[] = {};};
	class RRPVehicle_bs_gtr_2: RRPVehicle_civ_gtr{
		textures[] = {};};
	class RRPVehicle_bs_e34tun: RRPVehicle_civ_e34tun{
		textures[] = {};};
	class RRPVehicle_bs_insurgent: RRPVehicle_civ_insurgent{
		textures[] = {};};
	//taxi cars
	class RRPVehicle_taxi_cayenne: RRPVehicle_civ_cayenne{
		price = 25000;
		textures[] = {};
	};
	class RRPVehicle_taxi_bmw6: RRPVehicle_civ_bmw6{
		price = 25000;
		textures[] = {};
	};
	class RRPVehicle_taxi_e34: RRPVehicle_civ_e34{
		price = 25000;
		textures[] = {};
	};
	class RRPVehicle_taxi_rs5: RRPVehicle_civ_rs5{
		price = 25000;
		textures[] = {};
	};
	class RRPVehicle_taxi_w124: RRPVehicle_civ_w124{
		price = 25000;
		textures[] = {};
	};
	class RRPVehicle_taxi_huracan: RRPVehicle_civ_huracan{
		price = 25000;
		textures[] = {};
	};
	class RRPHelicopter_taxi_AS365: RRPVehicle_civ_monster{
		price = 25000;
		textures[] = {};
	};
	//kifo cars
	class RRPVehicle_kifo_gtr: RRPVehicle_civ_gtr{
		textures[] = {};};
	class RRPVehicle_kifo_roversport: RRPVehicle_civ_roversport{
		textures[] = {};};
	class RRPVehicle_kifo_zr1_1: RRPVehicle_civ_zr1{
		textures[] = {};};
	class RRPVehicle_kifo_zr1_2: RRPVehicle_civ_zr1{
		textures[] = {};};
	class RRPVehicle_kifo_f90lyk_1: RRPVehicle_civ_f90lyk{
		textures[] = {};};
	class RRPVehicle_kifo_f90lyk_2: RRPVehicle_civ_f90lyk{
		textures[] = {};};

	//ems cars
	class RRPVehicle_ems_escalade: RRPVehicle_civ_escalade{
		price = 15000;
		textures[] = {};};
	class RRPVehicle_ems_bowler: RRPVehicle_civ_bowler{
		price = 5000;
		textures[] = {};};
	class RRPVehicle_ems_vanz: RRPVehicle_civ_peugeot308{
		price = 10000;
		textures[] = {
			{"RRPVehicle_ems_vanz", {"med"}, "" }
		};
	};
	class RRPVehicle_ems_peugeot308: RRPVehicle_civ_peugeot308{
		price = 5000;
		textures[] = {};};
	class RRPVehicle_ems_peugeot508: RRPVehicle_civ_peugeot508{
		price = 5000;
		textures[] = {};};
	class RRPVehicle_ems_f90: RRPVehicle_civ_f90{
		price = 10000;
		textures[] = {};};
	class RRPVehicle_ems_audiq7: RRPVehicle_civ_audiq7{
		price = 7000;
		textures[] = {};};
	class RRPVehicle_ems_G65: RRPVehicle_civ_G65{
		price = 9000;
		textures[] = {};};
	class RRPVehicle_ems_divooff: RRPVehicle_civ_G65{
		price = 5000;
		textures[] = {};};
	class RRPVehicle_med_dubsta4x4: RRPVehicle_civ_G65{
		price = 15000;
		textures[] = {};};
	class RRPVehicle_ems_roversport: RRPVehicle_civ_roversport{
		price = 8000;
		textures[] = {};};
	class RRPVehicle_ems_w124: RRPVehicle_civ_w124{
		price = 9000;
		textures[] = {};};
	class RRPVehicle_med_porsche911: RRPVehicle_civ_porsche911{
		price = 12000;
		textures[] = {};};
	class RRPVehicle_ems_hummer2: RRPVehicle_civ_hummer2{
		price = 11500;
		textures[] = {};};
	class RRPVehicle_ems_hummer: RRPVehicle_civ_hummer{
		price = 10500;
		textures[] = {};};
	class RRPVehicle_ems_fordbronco_1: RRPVehicle_civ_hummer{
		price = 5000;
		textures[] = {};};
	class RRPVehicle_ems_zr1: RRPVehicle_civ_zr1{
		price = 14000;
		textures[] = {};};
	class RRPVehicle_ems_2114: RRPVehicle_civ_2114{
		price = 6000;
		textures[] = {};};
	//7news cars
	class RRPVehicle_7news_audiq7: RRPVehicle_civ_audiq7{
		textures[] = {};};
	class RRPVehicle_7news_f90: RRPVehicle_civ_f90{
		textures[] = {};};
	class RRPVehicle_7news_hummer: RRPVehicle_civ_hummer{
		textures[] = {};};
	class RRPVehicle_7news_monster: RRPVehicle_civ_monster{
		textures[] = {};};
	class RRPVehicle_7news_vant{
		price = 25000;
		textures[] = {};
	};
	class RRPVehicle_7news_vanz{
		price = 25000;
		textures[] = {};
	};
	class RRPVehicle_7news_strider: RRPVehicle_civ_monster{
		textures[] = {};};
	class RRPVehicle_7news_insurgent: RRPVehicle_civ_monster{
		textures[] = {};};
	class RRPVehicle_7news_Ikarus: RRPVehicle_civ_monster{
		textures[] = {};};
	class RRPHelicopter_7news_AS365: RRPVehicle_civ_monster{
		textures[] = {};};
	class RRPHelicopter_7news_hellcat: RRPVehicle_civ_monster{
		textures[] = {};};
	class RRPHelicopter_7news_mh9: RRPVehicle_civ_monster{
		textures[] = {};};
	class RRPHelicopter_7news_VTOL: RRPVehicle_civ_monster{
		textures[] = {};};
	class RRPHelicopter_7news_Huron: RRPVehicle_civ_monster{
		textures[] = {};};
	// minust
	class RRPVehicle_justice_rapid: RRPVehicle_civ_monster {
		price = 25000;
		textures[] = {};
	};
	
	//sector7 cars
	class RRPVehicle_sector7_f90: RRPVehicle_civ_f90{
		textures[] = {};
	};
	class RRPVehicle_sector7_2114: RRPVehicle_civ_2114{
		textures[] = {};
	};
	class RRPVehicle_sector7_roversport: RRPVehicle_civ_roversport{
		textures[] = {};
	};
	class RRPVehicle_sector7_touareg: RRPVehicle_civ_touareg{
		textures[] = {};
	};
	//rimasinc cars
	class RRPVehicle_rimasinc_touareg: RRPVehicle_civ_touareg
	{
		textures[] = {};
	};
	class RRPVehicle_rimasinc_w124: RRPVehicle_civ_w124
	{
		textures[] = {};
	};
	//phoenix cars
	class RRPVehicle_phoenix_f90lyk: RRPVehicle_civ_f90lyk
	{
		textures[] = {};
	};
	class RRPVehicle_phoenix_lm002: RRPVehicle_civ_lm002
	{
		textures[] = {};
	};
	class RRPVehicle_phoenix_escalade: RRPVehicle_civ_escalade
	{
		textures[] = {};
	};
	class RRPHelicopter_phoenix_hummingbird : CN_humming
	{
		textures[] = {};
	};
	class RRPVehicle_phoenix_w124: RRPVehicle_civ_w124
	{
		textures[] = {};
	};
	class RRPVehicle_phoenix_mus: RRPVehicle_civ_mus
	{
		textures[] = {};
	};
	//narcos cars
	class RRPHelicopter_narcos_hummingbird: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	class RRPVehicle_narcos_f90lyk: RRPVehicle_civ_f90lyk
	{
		textures[] = {};
	};
	class RRPVehicle_narcos_e34: RRPVehicle_civ_e34
	{
		textures[] = {};
	};
	//
	class RRPVehicle_Psychokids_gtr: RRPVehicle_civ_gtr
	{
		textures[] = {};
		breakingChance = 6;
	};
	class RRPVehicle_Psychokids_e34: RRPVehicle_civ_e34
	{
		textures[] = {};
	};
	class RRPVehicle_Psychokids_tiger: RRPVehicle_civ_e34
	{
		price = 90000;
		textures[] = {};
	};
	class RRPHelicopter_Psychokids_hummingbird: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	class RRPVehicle_Psychokids_BTR90: RRPVehicle_BTR90
	{
		AllowedGarages[] = {"stratis_garage","psychokids_veh_sh"};
		textures[] = {};
	};
	class RRPVehicle_Psychokids_man: RRPVehicle_civ_tempest
	{
		textures[] = {};
	};
	//
	class RRPVehicle_imperium_jeep: RRPVehicle_civ_jeep
	{
		textures[] = {};
	};
	class RRPVehicle_imperium_e34: RRPVehicle_civ_e34
	{
		textures[] = {};
	};
	class RRPVehicle_shark_jeep: RRPVehicle_civ_jeep
	{
		textures[] = {};
	};
	class RRPVehicle_shark_mus: RRPVehicle_civ_mus
	{
		textures[] = {};
	};
	class RRPVehicle_shark_f90lyk: RRPVehicle_civ_f90lyk
	{
		textures[] = {};
	};
	class RRPVehicle_shark_tempest: RRPVehicle_narcos_tempest
	{
		textures[] = {};
	};
	class RRPHelicopter_shark_hummingbird: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	//
	class RRPHelicopter_flightschool_hummingbird: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	class 	RRPAirplane_flightschool_Plane01: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	class 	RRPAirplane_flightschool_Plane02: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	class RRPHelicopter_flightschool_kasatca: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	class RRPVehicle_flightschool_jeep: RRPVehicle_civ_rs5
	{
		textures[] = {};
	};
	////
	class RRPHelicopter_anvil_hummingbird: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	class RRPBoat_anvil_Karas: B_Heli_Light_01_F
	{
		price = 25000;
		textures[] = {};
	};
	class d3s_AURUSsenat_L {
		vItemSpace = 0;
		price = 12000;
		fuelType = "dizel";
		textures[] = {};
		materials[] = {};

		conditions = "false";
		sellEnabled = "true";
		chopEnabled = "fasle";
		enableRopeAttach = true;
	};

	class RRPVehicle_Miners_Heli_01: B_Heli_Light_01_F
	{
		textures[] = {};
	};
	/////////
	class RRPVehicle_miners_touareg: RRPVehicle_civ_touareg{
		textures[] = {};};
	/////
	class RRPVehicle_Deadlock_roversport: RRPVehicle_civ_roversport
	{
		textures[] = {};
	};
	class RRPVehicle_Deadlock_jeep: RRPVehicle_civ_jeep
	{
		textures[] = {};
	};
	class RRPVehicle_Deadlock_2114: RRPVehicle_civ_2114
	{
		textures[] = {};
	};

	////

	class RRPVehicle_DamnedKnights_roversport: RRPVehicle_civ_roversport {
		textures[] = {};};
	class RRPVehicle_DamnedKnights_jeep: RRPVehicle_civ_jeep {
		textures[] = {};};
	class RRPVehicle_DamnedKnights_2114: RRPVehicle_civ_2114 {
		textures[] = {};};
	class RRPVehicle_DamnedKnights_tempest: RRPVehicle_civ_tempest {
		textures[] = {};};
	class RRPVehicle_DamnedKnights_insurgent: RRPVehicle_civ_insurgent {
		textures[] = {};};
	class RRPVehicle_DamnedKnights_escalade: RRPVehicle_civ_escalade {
		textures[] = {};};
	class RRPHelicopter_DamnedKnights_hummingbird: B_Heli_Light_01_F {
		textures[] = {};};
	class RRPVehicle_DamnedKnights_tiger: RRPVehicle_Psychokids_tiger {
		textures[] = {};};
	class RRPVehicle_DamnedKnights_cruiser200: RRPVehicle_civ_cruiser200 {
		textures[] = {
			{"RRPVehicle_DamnedKnights_cruiser200_1", {""}, "" },
			{"RRPVehicle_DamnedKnights_cruiser200_2", {""}, "" },
			{"RRPVehicle_DamnedKnights_cruiser200_3", {""}, "" }
		};
	};

	class RRPVehicle_Bears_G65: RRPVehicle_civ_G65{
		textures[] = {};};
	class RRPVehicle_Bears_f90_1: RRPVehicle_civ_f90{
		textures[] = {};};
	class RRPVehicle_Bears_f90_2: RRPVehicle_civ_f90{
		textures[] = {};};
	class RRPVehicle_Bears_roversport: RRPVehicle_civ_roversport{
		textures[] = {};};
	class RRPVehicle_Bears_w124: RRPVehicle_civ_w124{
		textures[] = {};};

	////
	class mustang18: RRPVehicle_civ_mus {
		sellEnabled = "true";
		chopEnabled = "fasle";
		enableRopeAttach = true;
		textures[] = {
			{"RRPVehicle_JAMES_1", {""}, "" }
		};
	};

	class RRPVehicle_civ_f93HAMM19: RRPVehicle_civ_mus
	{
		vItemSpace = 50;
		price = 240000;
	};
	class RRPVehicle_civ_bolide: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_civ_bolide_2: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_civ_hornet54: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_civ_GTMANS17: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_civ_mustang18: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_civ_Furai: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_civ_terzo18: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_lk_xsar1: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_civ_divooff: RRPVehicle_civ_f93HAMM19 {};
	class RRPVehicle_civ_divo: RRPVehicle_civ_f93HAMM19 {};


	class RRPVehicle_Cigane_Chevrolet: RRPVehicle_civ_mus
	{
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
	};
	class RRPVehicle_Cigane_Escalade: RRPVehicle_civ_escalade
	{
		conditions = "";
		vItemSpace = 50;
		price = 240000;
		textures[] = {};
	};
	class RRPVehicle_Cigane_SVR: RRPVehicle_civ_roversport
	{
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
	};
	class RRPVehicle_BlackSnow_jeep: RRPVehicle_civ_jeep
	{
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
	};
	class RRPVehicle_Inagawakai_gtr: RRPVehicle_civ_gtr
	{
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
		breakingChance = 6;
	};
	class RRPVehicle_Inagawakai_cruiser200: RRPVehicle_civ_cruiser200
	{
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
	};
	class RRPVehicle_Sector_gtr: RRPVehicle_civ_gtr
	{
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
		breakingChance = 6;
	};
	class RRPVehicle_Sector_cruiser200: RRPVehicle_civ_cruiser200
	{
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
	};
	class RRPVehicle_BlackWolves_fordbronco_1: RRPVehicle_civ_fordbronco_1
	{
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
	};
	class RRPVehicle_BlackWolves_dodgesrt: RRPVehicle_civ_escalade
	{
		price = 325000;
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
	};
	class RRPVehicle_LaCosaNostra_lc100 {
		vItemSpace = 50;
		price = 140000;
		textures[] = {};
		materials[] = {};

		sellEnabled = "true";
		chopEnabled = "true";
		conditions = "";
	};
	class RRPVehicle_LaCosaNostra_camry55 {
		vItemSpace = 50;
		price = 120000;
		textures[] = {};
		materials[] = {};

		sellEnabled = "true";
		chopEnabled = "true";
		conditions = "";
	};
	class RRPVehicle_BlackSnow_gtr: RRPVehicle_civ_gtr
	{
		price = 390000;
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
		breakingChance = 6;
	};
	class RRPVehicle_Blacksnow_jeepblinde: RRPVehicle_civ_jeepblinde
	{
		price = 100000;
		conditions = "";
		vItemSpace = 50;
		textures[] = {};
	};
	//
	class RRPVehicle_knur_old_lk {
		vItemSpace = 3000;
		conditions = "";
		price = 118800;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};

		breakingChance = 6;
	};
	class RRPVehicle_knur_lk {
		vItemSpace = 2000;
		conditions = "";
		price = 118800;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};

		breakingChance = 6;
	};
	class RRPVehicle_lk_kamaz49255 {
		vItemSpace = 2000;
		conditions = "";
		price = 118800;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};

		breakingChance = 6;
	};
	class RRPVehicle_civ_daf_box: RRPVehicle_lk_kamaz49255 {
		vItemSpace = 1000;
	};
	class RRPVehicle_civ_daf_box_3k: RRPVehicle_civ_daf_box {
		vItemSpace = 3000;
		breakingChance = 7;
	};
	class RRPVehicle_civ_daf_box_4k: RRPVehicle_civ_daf_box {
		vItemSpace = 4000;
		breakingChance = 7;
	};

	class RRPVehicle_lk_kamaz49255_racing: RRPVehicle_lk_kamaz49255 {};
	class RRPVehicle_huron_lk {
		vItemSpace = 1500;
		conditions = "";
		price = 118800;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};

		breakingChance = 6;
	};
	class RRPVehicle_huron_old_lk {
		vItemSpace = 1500;
		conditions = "";
		price = 118800;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};

		breakingChance = 6;
	};
	
	class RRPVehicle_drop01_c63amgtun_3
	{
		vItemSpace = 50;
		conditions = "";
		price = 240000;
		fuelType = "ai95";
		textures[] = {};
		materials[] = {};

		ignoreSlots = true;
		sellEnabled = "true";
		chopEnabled = "true";
		breakingChance = 6;
	};

	class RRPVehicle_drop01_cruiser200: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_gtrcustom: RRPVehicle_drop01_c63amgtun_3{};
		 
	class RRPVehicle_drop01_gt63: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_zr1spoiler: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_w124: RRPVehicle_drop01_c63amgtun_3{};

	class RRPVehicle_drop01_mini: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_clk: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_bmw1M: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_pontiackitt: RRPVehicle_drop01_c63amgtun_3{};

	class RRPVehicle_drop01_rs4: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_peugeot508: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_audiq7: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_alfaromeobrera: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_drop01_smart: RRPVehicle_drop01_c63amgtun_3{};

	class RRPVehicle_osk_honda_nsx_chameleon_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_mustang18_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_Windsorcoupe_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_G65_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_escalade_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_transam_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_quattro83_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_e34_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_bmw1M_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_lincoln_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_r5_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_2114_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_buggy_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_twingo_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_citroenC4_ny2023: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_911_girl: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_911_carrera: RRPVehicle_drop01_c63amgtun_3{};
	class RRPVehicle_civ_panamera_speedhunters: RRPVehicle_drop01_c63amgtun_3{
		price = 420000;
	};
	class RRPVehicle_civ_ctsv_16: RRPVehicle_drop01_c63amgtun_3
	{
		price = 490000;
	};
	class RRPVehicle_civ_giulietta_16: RRPVehicle_drop01_c63amgtun_3
	{
		price = 350000;
	};
	class RRPVehicle_civ_qx60_16: RRPVehicle_drop01_c63amgtun_3
	{
		price = 580000;
	};
	class RRPVehicle_civ_vklasse_17: RRPVehicle_drop01_c63amgtun_3
	{
		price = 550000;
	};
	class RRPVehicle_civ_wrx_17: RRPVehicle_drop01_c63amgtun_3
	{
		price = 630000;
	};
	class RRPVehicle_civ_explorer_13: RRPVehicle_drop01_c63amgtun_3
	{
		price = 460000;
	};

	//Comics DC Pack
	class RRPVehicle_civ_evo9_dc: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['dc_pack'] call inSS";
		price = 300000;
	};
	class RRPVehicle_civ_kitt_dc: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['dc_pack'] call inSS";
		price = 550000;
	};
	class RRPVehicle_civ_locrall_dc: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['dc_pack'] call inSS";
		price = 480000;
	};
	class RRPVehicle_bmw_m4_dc: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['dc_pack'] call inSS";
		price = 600000;
	};
	class RRPVehicle_civ_dodgesrt_dc: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['dc_pack'] call inSS";
		price = 380000;
	};
	class RRPVehicle_civ_sstuning_dc: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['dc_pack'] call inSS";
		price = 400000;
	}; 

	// Drift Pack
	class RRPVehicle_civ_ae86_drift_pack: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['drift_pack'] call inSS";
		price = 350000;
	};
	class RRPVehicle_civ_nsx_drift_pack: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['drift_pack'] call inSS";
		price = 670000;
	};
	class RRPVehicle_civ_evo9_drift_pack: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['drift_pack'] call inSS";
		price = 300000;
	};
	class RRPVehicle_civ_240sx_drift_pack: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['drift_pack'] call inSS";
		price = 460000;
	};
	class RRPVehicle_civ_jdm_drift_pack: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['drift_pack'] call inSS";
		price = 550000;
	};
	class RRPVehicle_civ_370z_drift_pack: RRPVehicle_drop01_c63amgtun_3 {
		chopEnabled = "false";
		conditions = "['drift_pack'] call inSS";
		price = 650000;
	};
		class RRPVehicle_civ_mustang18_cp: RRPVehicle_drop01_c63amgtun_3
	{
		chopEnabled = "false";
		conditions = "['cp_pack'] call inSS";
		price = 550000;
	};
	class RRPVehicle_rs4_13_cp: RRPVehicle_drop01_c63amgtun_3
	{
		chopEnabled = "false";
		conditions = "['cp_pack'] call inSS";
		price = 500000;
	};
	class RRPVehicle_am_vantage_cp: RRPVehicle_drop01_c63amgtun_3
	{
		chopEnabled = "false";
		conditions = "['cp_pack'] call inSS";
		price = 450000;
	};
	class RRPVehicle_civ_porsche91182_cp: RRPVehicle_drop01_c63amgtun_3
	{
		chopEnabled = "false";
		conditions = "['cp_pack'] call inSS";
		price = 300000;
	};
	class RRPVehicle_civ_javelin_cp: RRPVehicle_drop01_c63amgtun_3
	{
		chopEnabled = "false";
		conditions = "['cp_pack'] call inSS";
		price = 400000;
	};
};
