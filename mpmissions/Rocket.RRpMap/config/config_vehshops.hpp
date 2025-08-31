/*
	[
		395180 - Apex
		304380 - Heli
		601670 - Jets
		288520 - Kart
		332350 - Marksman
		571710 - orange/laws of war
		744950 - tacops
		798390 - Tanks
		getNumber(configfile >> ""CfgMods"" >> ""Enoch"" >> ""appId"")  - contact

	]

	//Пример проверки
	[395180] in (getDLCs 1) //Чекаем что этот предмет требует Apex и т.д.
*/

class LifeCfgVehShops
{
	/* Sumiyoshi Kai */
	class RRP_VehShop_Sumiyoshi {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_sumiyoshi";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия Sumiyoshi Kai";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_civ_huracan", "" , "", "false" },
			{ "RRPVehicle_civ_jeep", "" , "", "false" }
		};
	};
	class RRP_AirShop_Sumiyoshi
	{
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота";
		multiplier = 1;
		groupID = 13;
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" }
		};
	};
	
	/* Escobaro */
	class R_VehShop_Escobaro {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_escobaro";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия La Escobaro Family";
		multiplier = 1;
		vehicles[] = {
			{"R_Vehicle_Nissan_370Z_Escobaro", "" , "", "false"},
			{"R_Vehicle_Jeep_Cherokee_Escobaro", "" , "", "false"}
		};
	};
	class R_AirShop_Escobaro
	{
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота";
		multiplier = 1;
		groupID = 12;
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" }
		};
	};

	/* FlightShcool */
	class RRP_flightschool_vAir
	{
		type = "Air";
		side = "civ";
		onlyrent = "true";
		conditions = "license_flightschool_grp_2 || license_flightschool_grp_3 || (getPlayerUID player) in ['76561198322725899']";
		conditionsMessage = "Необходимо разрешение на покупку транспорта";
		multiplier = 1;
		vehicles[] =
		{
			{ "RRPHelicopter_flightschool_hummingbird", "" , "", "false" },
			{ "RRPHelicopter_flightschool_kasatca", "" , "", "false" }
		};
	};
	class RRP_flightschool_sAir
	{
		type = "Air";
		side = "civ";
		onlyrent = "true";
		conditions = "license_flightschool_grp_2 || license_flightschool_grp_3 || (getPlayerUID player) in ['76561198322725899']";
		conditionsMessage = "Необходимо разрешение на покупку транспорта";
		multiplier = 1;
		vehicles[] =
		{
			{ "sab_ultralight", "" , "", "false" },
			{ "RRPAirplane_flightschool_Plane01", "" , "", "false" },
			{ "RRPAirplane_flightschool_Plane02", "" , "", "false" }
		};
	};
	class RRP_flightschool_Veh
	{
		type = "Land";
		side = "civ";
		onlyrent = "true";
		conditions = "license_flightschool_grp_2 || license_flightschool_grp_3";
		conditionsMessage = "Необходимо разрешение на покупку транспорта";
		multiplier = 1;
		vehicles[] =
		{
			{ "RRPVehicle_flightschool_jeep", "" , "", "false" }
		};
	};
	/* Полиция */
	class RRP_Cop_Air
	{
		type = "Air";
		side = "cop";
		onlyrent = "true";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
		conditionsMessage = "";
		multiplier = 1;
		groupID = 1;
		vehicles[] = {
			{ "RRPHelicopter_sheriff_hummingbird", "('cop' call RRPClient_groups_getSideLevel) in [2,3,4,5,6,7,8,9,10,11,12,13,15,18,16,19,21,22,23]" , "С звания Рядовой", "false" },
			{ "RRPHelicopter_sheriff_eurocopter", "('cop' call RRPClient_groups_getSideLevel) in [7,8,9,10,11,12,13,15,18,16,19,21,22,23]" , "С звания Лейтенант I", "false" },
			{ "RRPHelicopter_detective_hummingbird", "('cop' call RRPClient_groups_getSideLevel) in [14,17,21,22,23]" , "С звания Детектив", "false" },
			{ "RRPHelicopter_fbi_hummingbird", "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]" , "Доступно FBI", "false" },
			{ "RRPHelicopter_fbi_eurocopter", "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]" , "Доступно FBI", "false" },
			{ "Maverick2_heli_cop", "('cop' call RRPClient_groups_getSideLevel) in [7,8,9,10,11,12,13,15,18,16,19,21,22,23]" , "С звания Лейтенант I", "false" }
		};
	};
    /* Правительство */
    class RRP_Gov_Car {
		type = "Land";
		side = "civ";
		onlyrent = "true";
		conditions = "license_driver && life_gov || license_driver && license_admittance_goverment";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_civ_hummer2_guber", "" , "", "false" },
			{ "RRPVehicle_civ_escalade_guber", "" , "", "false" },
			{ "RRPVehicle_civ_c63amg_1_guber", "life_gov" , "", "false" },
			{ "RRPVehicle_civ_f90_guber", "life_gov" , "", "false" }
		};
	};
    /* Байки */
    class RRP_CivBike_1 {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_driver";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_civ_yamaha", "" , "", "false" },
			{ "RRPVehicle_civ_harley", "" , "", "false" },
			{ "RRPVehicle_civ_ducati", "" , "", "false" },
			{ "d3s_Ducati_XDiavel_S", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "d3s_Kawasaki_Ninja_H2R", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "d3s_Kawasaki_ZX7RR", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "d3s_KTM_1290_Super_Duke", "(call life_donator) > 3" , "VIP 4", "false" }
		};
	};
    /* Дешевые машины */
    class RRP_CivCar_1 {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_driver";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "B_Quadbike_01_F", "" , "", "false" },
			{ "RRPVehicle_civ_golf4rds_4", "" , "", "false" },
			{ "RRPVehicle_civ_gaz24_3", "" , "", "false" },
			{ "RRPVehicle_civ_lada_2", "" , "", "false" },
			{ "RRPVehicle_civ_2114", "" , "", "false" },
			{ "RRPVehicle_civ_fordbronco_1", "" , "", "false" }
		};
	};
	/* Средний класс */
	class RRP_CivCar_2: RRP_CivCar_1 {
		vehicles[] = {
			{ "RRPVehicle_civ_r5", "" , "", "false" },
			{ "RRPVehicle_civ_smart", "" , "", "false" },
			{ "Mrshounka_c4_p_civ", "" , "", "false" },
			{ "Mrshounka_a3_ds3_civ", "" , "", "false" },
			{ "RRPVehicle_civ_peugeot308", "" , "", "false" },
			{ "RRPVehicle_civ_citroenDS4", "" , "", "false" },
			{ "RRPVehicle_civ_golfVI", "" , "", "false" },
			{ "RRPVehicle_civ_peugeot508", "" , "", "false" },
			{ "RRPVehicle_civ_alfaromeobrera", "" , "", "false" },
			{ "RRPVehicle_civ_e34", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_w124", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_clk", "" , "", "false" },
			{ "RRPVehicle_civ_rs4", "" , "", "false" },
			{ "RRPVehicle_civ_rs5", "" , "", "false" },
			{ "RRPVehicle_civ_rx7", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_bmw1M", "" , "", "false" },
			{ "RRPVehicle_civ_porsche911", "" , "", "false" },
			{ "RRPVehicle_civ_bmw6", "" , "", "false" },
			{ "RRPVehicle_civ_cayenne", "" , "", "false" },
			{ "RRPVehicle_civ_audiq7", "" , "", "false" },
			{ "RRPVehicle_civ_jeep", "" , "", "false" },
			{ "RRPVehicle_civ_touareg", "" , "", "false" },
			{ "RRPVehicle_civ_G65", "" , "", "false" },
			{ "RRPVehicle_civ_roversport", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_hummer2", "" , "", "false" },
			{ "RRPVehicle_civ_hummer", "" , "", "false" },
			{ "RRPVehicle_civ_escalade", "" , "", "false" },
			{ "RRPVehicle_civ_ctsv_16", "" , "", "false" },
			{ "RRPVehicle_civ_giulietta_16", "" , "", "false" },
			{ "RRPVehicle_civ_qx60_16", "" , "", "false" },
			{ "RRPVehicle_civ_vklasse_17", "" , "", "false" },
			{ "RRPVehicle_civ_wrx_17", "" , "", "false" },
			{ "RRPVehicle_civ_explorer_13", "" , "", "false" }
		};
	};
	/* Дорогие машины */
	class RRP_CivCar_3: RRP_CivCar_1 {
		vehicles[] = {
			{ "RRPVehicle_civ_raptor2", "" , "", "false" },
			{ "RRPVehicle_civ_fordgt", "" , "", "false" },
			{ "RRPVehicle_civ_mus", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_monster", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_zr1", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_ss", "" , "", "false" },
			{ "RRPVehicle_civ_buggy", "" , "", "false" },
			{ "RRPVehicle_civ_bowler", "" , "", "false" },
			{ "RRPVehicle_civ_f90", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_jeepblinde", "" , "", "false" },
			{ "RRPVehicle_civ_agera", "" , "", "false" },
			{ "RRPVehicle_civ_huracan", "" , "", "false" },
			{ "RRPVehicle_civ_veneno", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_lykan", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_gtr", "" , "", "false" },
			{ "RRPVehicle_civ_dubsta4x4vip", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_paragon", "" , "", "false" },
			{ "RRPVehicle_civ_c63amg_1", "" , "", "false" },
			{ "RRPVehicle_civ_porsche91182", "" , "", "false" },
			{ "RRPVehicle_civ_lc_100", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_camry55", "(call life_donator) > 3" , "", "false" },
			{ "RRPVehicle_civ_cruiser200", "(call life_donator) > 3" , "", "false" },

			{ "RRPVehicle_bmw_m8", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_bmw_m4", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_osk_honda_nsx_purpure", "(call life_donator) > 3" , "VIP 4", "false" },
			{ "RRPVehicle_civ_quattro83", "" , "", "false" },
			{ "RRPVehicle_nissan_370Z", "" , "", "false" },
			{ "RRPVehicle_osk_Mercedes_w140_01", "" , "", "false" }

		};
	};
	class RRP_CopCivCar_1: RRP_CivCar_1 {
		side = "cop";
	};
	class RRP_CopCivCar_2: RRP_CivCar_2 {
		side = "cop";
	};
	class RRP_CopCivCar_3: RRP_CivCar_3 {
		side = "cop";
	};

	class kart_shop
	{
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_driver";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		pushVIPitems = "false";
		vehicles[] =
		{
			{ "C_Kart_01_Blu_F", "!([288520] in (getDLCs 1))" , "требуется DLC Karts", "false" },
			{ "C_Kart_01_Fuel_F", "!([288520] in (getDLCs 1))" , "требуется DLC Karts", "false" },
			{ "C_Kart_01_Red_F","!([288520] in (getDLCs 1))" , "требуется DLC Karts", "false" },
			{ "C_Kart_01_Vrana_F", "!([288520] in (getDLCs 1))" , "требуется DLC Karts", "false" }
		};
	};
	class Rbike_shop
	{
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_driver";
		conditionsMessage = "Этот транспорт не для Вас";
		multiplier = 1;
		pushVIPitems = "false";
		vehicles[] =
		{
			{ "d3s_Aprilia_Tuono_V4_1100_RR", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_BMW_S_1000_RR", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_Ducati_Monster_1200_S", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_Ducati_XDiavel_S", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_Kawasaki_Ninja_H2R", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_Kawasaki_ZX7RR", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_Suzuki_GSX_R_1000", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_KTM_1290_Super_Duke", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_Suzuki_Hayabusa", "(call life_donator) > 3" , "с VIP 4 ур.", "false" },
			{ "d3s_Kawasaki_Z800", "(call life_donator) > 3" , "с VIP 4 ур.", "false" }
		};
	};
	class med_shop
    {
		type = "Land";
        side = "med";
        onlyrent = "true";
        conditions = "";
        conditionsMessage = "";
        multiplier = 1;
        vehicles[] =
        {
			{ "d3s_zil_131_5", "", "", "false" },
			{ "RRPVehicle_ems_2114", "", "", "false" },
			{ "RRPVehicle_ems_vanz", "", "", "false" },
			{ "RRPVehicle_ems_peugeot308", "", "", "false" },
			{ "RRPVehicle_ems_peugeot508", "", "", "false" },
			{ "RRPVehicle_ems_bowler", "", "", "false" },
			{ "RRPVehicle_ems_w124", "", "", "false" },
			{ "RRPVehicle_ems_roversport", "", "", "false" },
			{ "RRPVehicle_ems_G65", "", "", "false" },
			{ "RRPVehicle_ems_audiq7", "", "", "false" },
			{ "RRPVehicle_ems_f90", "", "", "false" },
			{ "RRPVehicle_ems_escalade", "", "", "false" },
			{ "RRPVehicle_ems_zr1", "", "", "false" },
			{ "RRPVehicle_ems_fordbronco_1", "", "", "false" },
			{ "RRPVehicle_ems_hummer", "", "", "false" },
			{ "RRPVehicle_ems_hummer2", "", "", "false" },
			//{ "d3s_ghost_18_76561197987658357", "(getPlayerUID player) isEqualTo '76561197987658357'", "", "false" },
			//{ "RRPVehicle_EWB_76561197987658357", "(getPlayerUID player) isEqualTo '76561197987658357'", "", "false" },
			//{ "RRPVehicle_chiron_76561197987658357", "(getPlayerUID player) isEqualTo '76561197987658357'", "", "false" },
			//{ "RRPVehicle_RS6_76561198022595697", "(getPlayerUID player) in ['76561198022595697']" , "", "false" },
			{ "RRPVehicle_urus_76561198048514367", "(getPlayerUID player) isEqualTo '76561198048514367'", "", "false" },
			{ "RRPVehicle_urus_76561198078143143", "(getPlayerUID player) in ['76561198078143143']" , "", "false" },
			{ "RRPVehicle_maz_76561198802169420", "(getPlayerUID player) in ['76561198802169420']" , "", "false" },
			{ "RRPVehicle_javelin_76561198802169420", "(getPlayerUID player) in ['76561198802169420']" , "", "false" },
			{ "RRPVehicle_dubsta2_76561198802169420", "(getPlayerUID player) in ['76561198802169420']" , "", "false" },
			{ "RRPVehicle_C63AMG_76561198802169420", "(getPlayerUID player) in ['76561198802169420']" , "", "false" },
			{ "RRPVehicle_bentayga_76561198802169420", "(getPlayerUID player) in ['76561198802169420']" , "", "false" },
			{ "RRPVehicle_911gt3rs_76561198130879772", "(getPlayerUID player) in ['76561198802169420']" , "", "false" },
			{ "RRPVehicle_divooff_76561198802169420", "(getPlayerUID player) in ['76561198802169420']" , "", "false" },
			{ "d3s_f93HAMM_19", "(getPlayerUID player) in ['76561198802169420']" , "", "false" },
			{ "RRPVehicle_GTR_76561198157300994", "(getPlayerUID player) in ['76561198157300994']" , "", "false" },
			//{ "RRPVehicle_370ZNismo_76561198157300994", "(getPlayerUID player) in ['76561198157300994']" , "", "false" },
			{ "ver_bat", "(getPlayerUID player) in ['76561198802169420']" , "", "false" }
        };
    };


	class med_boat {
		type = "Ship";
		side = "med";
		onlyrent = "true";
		conditions = "";
		conditionsMessage = "";
		multiplier = 6;
		pushVIPitems = "false";
		vehicles[] =
		{
			{ "C_Boat_Civil_01_rescue_F", "" , "", "false" }
		};
	};

	class med_air_hs {
		type = "Air";
        side = "med";
        onlyrent = "true";
        conditions = "";
        conditionsMessage = "";
        multiplier = 0.09;
		pushVIPitems = "false";
		groupID = 2;
        vehicles[] = {
            { "RRPVehicle_humming_EMS", "" , "", "false" },
			{ "Bell_H13_heli", "" , "", "false" },
            { "RRPHelicopter_AS365_EMS", "" , "", "false" },
            { "RRPVehicle_HURON_76561198948262502_med", "getPlayerUID player in ['76561198948262502']" , "", "false" },
            { "RRPVehicle_HELLCAT_EMS", "('med' call RRPClient_groups_getSideLevel) >= 3" , "", "false" },
            { "RRPVehicle_ORCA_EMS", "('med' call RRPClient_groups_getSideLevel) >= 5" , "", "false" },
            { "RRPVehicle_HURON_EMS", "('med' call RRPClient_groups_getSideLevel) >= 5" , "", "false" },
            { "RRPVehicle_VTOL_EMS", "(call life_donator) > 3 or ('med' call RRPClient_groups_getSideLevel) >= 7" , "", "false" }
        };
    };
	class reb_ship
	{
		type = "Ship";
		side = "civ";
		onlyrent = "false";
		conditions = "license_boat";
		conditionsMessage = "Лицензия моряка";
		multiplier = 1;
		//pushVIPitems = "false";
		vehicles[] =
		{
			{ "I_Boat_Transport_01_F", "" , "", "false" },
			{ "C_Boat_Civil_01_F", "" , "", "false" },
			{ "I_SDV_01_F", "(call life_donator) > 0" , "с VIP 1 ур.", "false" },
			{ "ri_parom_u", "" , "", "false" },
			{ "ri_parom3_BE", "(call life_donator) > 2" , "с VIP 3 ур.", "false" },
			{ "ri_parom3_u_BE", "(call life_donator) > 2" , "с VIP 3 ур.", "false" }
		};
	};

	class air_blacksnow {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота";
		multiplier = 1;
		groupID = 5;
		//pushVIPitems = "false";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" },
			{ "sab_ultralight", "(call life_donator) > 3" , "с VIP 4 ур.", "false" }


		};
	};

	class car_blacksnow {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_blacksnow";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия Black Snow";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_BlackSnow_jeep", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
			{ "RRPVehicle_BlackSnow_gtr", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
			{ "RRPVehicle_BlackSnow_jeepblinde", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" }
		};
	};
	class car_Sector {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_sector";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия Sector";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_Sector_gtr", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
			{ "RRPVehicle_Sector_cruiser200", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" }
		};
	};
	class air_Sector {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота Sector";
		multiplier = 1;
		groupID = 11;
		//pushVIPitems = "false";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" },
			{ "sab_ultralight", "(call life_donator) > 3" , "с VIP 4 ур.", "false" }
		};
	};

	class air_cigane {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота Cigane";
		multiplier = 1;
		groupID = 6;
		//pushVIPitems = "false";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" }
		};
	};
	class car_cigane {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_cigane";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия Cigane";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_Cigane_Chevrolet", "('civ' call RRPClient_groups_getSideLevel) > 4" , "Доступно с 5го ранга", "false" },
			{ "RRPVehicle_Cigane_Escalade", "('civ' call RRPClient_groups_getSideLevel) > 4" , "Доступно с 5го ранга", "false" },
			{ "RRPVehicle_Cigane_SVR", "('civ' call RRPClient_groups_getSideLevel) > 4" , "Доступно с 5го ранга", "false" },
		};
	};
	
	class air_InagawaKai {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота Cigane";
		multiplier = 1;
		groupID = 7;
		//pushVIPitems = "false";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" },
			{ "sab_ultralight", "(call life_donator) > 3" , "с VIP 4 ур.", "false" }
		};
	};

	class car_InagawaKai {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_inagawakai";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия inagawakai";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_Inagawakai_gtr", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
			{ "RRPVehicle_Inagawakai_cruiser200", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
		};
	};
	class air_blackwolves {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота blackwolves";
		multiplier = 1;
		groupID = 8;
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" },
			{ "sab_ultralight", "(call life_donator) > 3" , "с VIP 4 ур.", "false" }
		};
	};
	class car_blackwolves {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_blackwolves";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия black wolves";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_BlackWolves_fordbronco_1", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
			{ "RRPVehicle_BlackWolves_dodgesrt", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
			{ "RRPVehicle_blackWolves_jeep", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
			{ "RRPVehicle_blackWolves_370Z", "('civ' call RRPClient_groups_getSideLevel) > 4" , "", "false" },
		};
	};
	class air_lacosanostra {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота la cosa nostra";
		multiplier = 1;
		groupID = 9;
		//pushVIPitems = "false";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" },
			{ "sab_ultralight", "(call life_donator) > 3" , "с VIP 4 ур.", "false" }
		};
	};
	class car_lacosanostra {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_lacosanostra";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия la cosa nostra";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_LaCosaNostra_camry55", "('civ' call RRPClient_groups_getSideLevel) > 5" , "", "false" },
			{ "RRPVehicle_LaCosaNostra_lc100", "('civ' call RRPClient_groups_getSideLevel) > 5" , "", "false" },
		};
	};


	class judge {
		type = "Land";
		side = "civ";
		onlyrent = "true";
		conditions = "license_judge";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия Мин.Юст";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_justice_rapid", "" , "", "false" }
		};
	};
	class judge_air {
		type = "Air";
		side = "civ";
		onlyrent = "true";
		conditions = "license_judge";
		pushVIPitems = "false";
		conditionsMessage = "Необходима лицензия Мин.Юст";
		multiplier = 1;
		groupID = 10;
		vehicles[] = {
			{ "RRPHelicopter_Light01_justice", "('civ' call RRPClient_groups_getSideLevel) > 0" , "", "false" }
		};
	};



	class reb_car {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_driver";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_lk_MRAP", "" , "", "false" },
		};
	};

	class civ_truck {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_truck";
		conditionsMessage = "Необходима лицензия «Дальнобойщика»";
		//pushVIPitems = "false";
		multiplier = 1;
		vehicles[] = {
			{ "C_Offroad_01_F", "" , "", "false" },
		    { "C_Van_01_transport_F", "" , "", "false" },
			{ "C_Van_01_box_F", "" , "", "false" },
			{ "C_Van_02_vehicle_F", "!([571710] in (getDLCs 1))" , "треб. DLC Laws Of War", "false" },
			{ "C_Van_02_transport_F", "!([571710] in (getDLCs 1))" , "треб. DLC Laws Of War", "false" },
			{ "d3s_3303", "", "", "false"},
			{ "d3s_uaz_2206", "", "", "false" },
			{ "d3s_gaz66_TENT", "" , "", "false" },
			{ "d3s_zil_130_01", "" , "", "false" },
			{ "d3s_zil_131_2", "" , "", "false" },
			{ "d3s_next_tent", "" , "", "false" },
			{ "d3s_maz_6317_tent", "" , "", "false" },
			{ "d3s_kraz_6315", "" , "", "false" },
			{ "d3s_actros_14_giga", "" , "", "false" },
			{ "d3s_peterbilt_579_dryvan", "" , "", "false" },
			{ "d3s_kraz_6316", "" , "", "false" },
			{ "d3s_maz_7429", "" , "", "false" },
			{ "d3s_SRmh_9500_cov", "" , "", "false" },
			{ "d3s_SRlonghorn_4520_cov", "" , "", "false" },
			{ "d3s_guardian_gtaV", "" , "", "false" },
			{ "d3s_mule", "" , "", "false" },
			{ "d3s_T440", "" , "", "false" },
			{ "d3s_T680_Dryvan", "" , "", "false" }
		};
	};

	class reb_truck: civ_truck {
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_truck";
	};

	class civ_air {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота";
		multiplier = 1;
		//pushVIPitems = "false";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" },
			{ "Bell_H13_heli", "", "", "false"},
			{ "heli_mav", "call life_donator > 3", "Треб. VIP от 4 уровня", "false" }


		};
	};
	class civ_air7news {
		type = "Air";
		side = "civ";
		onlyrent = "true";
		conditions = "license_press and license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота и сотрудника 7news";
		multiplier = 0.01;
		pushVIPitems = "false";
		vehicles[] = {
			{ "RRPHelicopter_7news_AS365", "" , "", "false" },
			{ "RRPHelicopter_Light01_7NEWS", "" , "", "false" },
			{ "RRPHelicopter_7news_mh9", "" , "", "false" },
			{ "RRPHelicopter_7news_VTOL", "" , "", "false" },
			{ "RRPHelicopter_7news_Huron", "" , "", "false" },
			{ "RRPHelicopter_7news_hellcat", "" , "", "false" }
		};
	};
	class reb_air {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота";
		multiplier = 1;
		//pushVIPitems = "false";
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" , "", "false" },
			{ "O_Heli_Light_02_unarmed_F", "" , "", "false" }
		};
	};

	class gov_car {
		type = "Land";
		side = "civ";
		onlyrent = "true";
		conditions = "life_gov or license_minkult";
		conditionsMessage = "Необходима лицензия Губернатора";
		pushVIPitems = "false";
		multiplier = 1;
		vehicles[] = {
			{ "d3s_next_tent", "" , "", "false" },
			{ "d3s_s560_18", "" , "", "false" },
			{ "d3s_s650_18", "" , "", "false" },
			{ "d3s_AURUSsenat_L", "" , "", "false" }
		};
	};

	class civ_ship {
		type = "Ship";
		side = "";
		onlyrent = "false";
		conditions = "license_boat";
		conditionsMessage = "Лицензия моряка";
		//pushVIPitems = "false";
		multiplier = 1;
		vehicles[] = {
			{ "C_Scooter_Transport_01_F", "(!([395180] in (getDLCs 1)) and {call life_donator > 2})" , "треб. VIP 3 и DLC Apex", "false" },
			{ "B_Boat_Transport_01_F", "" , "", "false" },
			{ "C_Boat_Civil_01_F", "" , "", "false" },
			{ "I_C_Boat_Transport_02_F", "(!([395180] in (getDLCs 1)) and {call life_donator > 2})" , "треб. VIP 3 и DLC Apex", "false" },
			{ "B_SDV_01_F", "(call life_donator) > 2" , "с VIP 3 ур.", "false" },
			{ "ri_parom_u", "" , "", "false" },
			{ "ri_parom3_BE", "(call life_donator) > 2" , "с VIP 3 ур.", "false" },
			{ "ri_parom3_u_BE", "(call life_donator) > 2" , "с VIP 3 ур.", "false" }
		};
	};

	class cop_car {
		type = "Land";
		side = "cop";
		onlyrent = "true";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
		conditionsMessage = "Только для сотрудников полиции";
		pushVIPitems = "false";
		multiplier = 1;
		vehicles[] = {
			{ "RRPVehicle_sheriff_peugeot508", "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,10,11,12,13,16,19,21,22,23]" , "С звания Кадет", "false" },
			{ "RRPVehicle_sheriff_roversport", "('cop' call RRPClient_groups_getSideLevel) in [5,6,7,8,9,10,11,12,13,15,16,18,19,20,21,22,23]", "C 5 ранга", "false"},
			{ "RRPVehicle_sheriff_audiq7", "('cop' call RRPClient_groups_getSideLevel) in [2,3,4,5,6,7,8,9,10,11,12,13,16,19,21,22,23]" , "С звания Рядовой", "false" },
			{ "RRPVehicle_sheriff_bmw1M", "('cop' call RRPClient_groups_getSideLevel) in [3,4,5,6,7,8,9,10,11,12,13,16,19,21,22,23]" , "С звания Сержант", "false" },
			{ "RRPVehicle_sheriff_escalade", "('cop' call RRPClient_groups_getSideLevel) in [6,7,8,9,10,11,12,13,16,19,21,22,23]" , "С звания Офицер", "false" },
			{ "RRPVehicle_sheriff_f90", "('cop' call RRPClient_groups_getSideLevel) in [7,8,9,10,11,12,13,16,19,21,22,23]" , "С звания Лейтенант I", "false" },
			{ "RRPVehicle_sheriff_rx7tun", "('cop' call RRPClient_groups_getSideLevel) in [8,9,10,11,12,13,16,19,21,22,23]" , "С звания Лейтенант II", "false" },
			{ "RRPVehicle_sheriff_G65", "('cop' call RRPClient_groups_getSideLevel) in [9,10,11,12,13,16,19,21,22,23]" , "С звания Капитан", "false" },
			{ "RRPVehicle_sheriff_agera", "('cop' call RRPClient_groups_getSideLevel) in [16,19,21,22,23]" , "С звания Начальник ПА", "false" },
			{ "RRPVehicle_detective_roversport", "('cop' call RRPClient_groups_getSideLevel) in [14,17,21,22,23]", "C 14 ранга", "false"},
			{ "RRPVehicle_detective_audiq7", "('cop' call RRPClient_groups_getSideLevel) in [14,17,21,22,23]" , "С звания Детектив", "false" },
			{ "RRPVehicle_detective_bmw1M", "('cop' call RRPClient_groups_getSideLevel) in [14,17,21,22,23]" , "С звания Детектив", "false" },
			{ "RRPVehicle_detective_escalade", "('cop' call RRPClient_groups_getSideLevel) in [14,17,21,22,23]" , "С звания Детектив", "false" },
			{ "RRPVehicle_detective_peugeot508", "('cop' call RRPClient_groups_getSideLevel) in [14,17,21,22,23]" , "С звания Детектив", "false" },
			{ "RRPVehicle_detective_f90", "('cop' call RRPClient_groups_getSideLevel) in [17,21,22,23]" , "С звания Начальник ДО", "false" },
			{ "RRPVehicle_detective_rx7tun", "('cop' call RRPClient_groups_getSideLevel) in [17,21,22,23]" , "С звания Начальник ДО", "false" },
			{ "RRPVehicle_detective_G65", "('cop' call RRPClient_groups_getSideLevel) in [17,21,22,23]" , "С звания Начальник ДО", "false" },
			{ "RRPVehicle_detective_paragon", "('cop' call RRPClient_groups_getSideLevel) in [17,21,22,23]" , "С звания Начальник ДО", "false" },
			{ "RRPVehicle_k9_gtr", "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]" , "С звания Оперативник К9", "false" },
			{ "RRPVehicle_fbi_gtr", "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_fbi_audiq7", "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_fbi_bmw1M", "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_fbi_rx7tun", "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_fbi_peugeot508", "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_fbi_G65", "('cop' call RRPClient_groups_getSideLevel) in [21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_fbi_paragon", "('cop' call RRPClient_groups_getSideLevel) in [21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_fbi_mus", "('cop' call RRPClient_groups_getSideLevel) in [21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_fbi_agera", "('cop' call RRPClient_groups_getSideLevel) in [21,22,23]" , "Доступно FBI", "false" },
			{ "RRPVehicle_civ_camry55unm", "('cop' call RRPClient_groups_getSideLevel) in [15,18,19,20,21,22,23]" , "С звания Оперативник К9", "false" },
			{ "RRPVehicle_civ_cruiser200unm", "('cop' call RRPClient_groups_getSideLevel) in [15,18,19,20,21,22,23]" , "С звания Оперативник К9", "false" },
		};
	};

	class cop_ship {
		type = "Ship";
		side = "cop";
		onlyrent = "true";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
		conditionsMessage = "";
		multiplier = 1;
		pushVIPitems = "false";
		vehicles[] = {
			{ "B_Boat_Transport_01_F", "('cop' call RRPClient_groups_getSideLevel) > 1" , "с 2 звания", "false" },
			{ "C_Boat_Civil_01_police_F", "('cop' call RRPClient_groups_getSideLevel) > 1" , "с 2 звания", "false" },
			{ "RRPVehicle_Armed_Boat_PD", "('cop' call RRPClient_groups_getSideLevel) > 2" , "", "false" },
			{ "B_SDV_01_F", "('cop' call RRPClient_groups_getSideLevel) > 2" , "с 3 звания", "false" }
		};
	};
	class civ_planes {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		conditions = "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Необходима лицензия пилота";
		pushVIPitems = "false";
		multiplier = 1;
		vehicles[] = {
			{ "Sab_an2_sea", "" , "", "false" },
			{ "sab_ultralight", "" , "", "false" },
			{ "C_Plane_Civil_01_F", "['Pilot_Prof'] call RRPClient_skills_getLevel > 1" , "Уровень Пилота 2 и выше", "false" },
			{ "plane_dodo", "['Pilot_Prof'] call RRPClient_skills_getLevel > 3", "Уровень Пилота 4 и выше", "false"},
			{ "plane_duster", "['Pilot_Prof'] call RRPClient_skills_getLevel > 4", "Уровень Пилота 4 и выше", "false"},
			{ "plane_velum", "['Pilot_Prof'] call RRPClient_skills_getLevel > 6", "Уровень Пилота 7 и выше", "false"},
			{ "RRPVehicle_PlaneFighter03_noammo", "call life_donator > 3" , "Треб. VIP от 4 уровня", "false" }
		};
	};
	class reb_planes: civ_planes {
		type = "Air";
		side = "civ";
		onlyrent = "false";
		pushVIPitems = "false";
	};

	class press_car {
		type = "Land";
		side = "civ";
		onlyrent = "true";
		conditions = "license_press AND license_driver";
		conditionsMessage = "Нужна лицензия прессы и водителя";
		multiplier = 0.00001;
		pushVIPitems = "false";
		vehicles[] =
		{
			{ "RRPVehicle_7news_audiq7", "" , "", "false" },
			{ "RRPVehicle_7news_f90", "" , "", "false" },
			{ "RRPVehicle_7news_hummer", "" , "", "false" },
			{ "RRPVehicle_7news_monster", "" , "", "false" },
			{ "RRPVehicle_7news_vant", "" , "", "false" },
			{ "RRPVehicle_7news_vanz", "" , "", "false" },
			{ "RRPVehicle_7news_strider", "" , "", "false" },
			{ "RRPVehicle_7news_insurgent", "" , "", "false" },
			{ "RRPVehicle_7news_Ikarus", "" , "", "false" }
		};
	};
	class taxi_car
	{
		type = "Land";
		side = "civ";
		onlyrent = "true";
		conditions = "license_taxi AND license_driver";
		conditionsMessage = "Нужна лицензия таксиста и водителя";
		multiplier = 1;
		pushVIPitems = "false";
		vehicles[] =
		{
			{ "RRPVehicle_taxi_cayenne", "" , "", "false" },
			{ "RRPVehicle_taxi_bmw6", "" , "", "false" },
			{ "RRPVehicle_taxi_e34", "" , "", "false" },
			{ "RRPVehicle_taxi_rs5", "" , "", "false" },
			{ "RRPVehicle_taxi_w124", "" , "", "false" },
			{ "RRPVehicle_taxi_huracan", "" , "", "false" }
		};
	};
	class taxi_air
	{
		type = "Air";
		side = "civ";
		onlyrent = "true";
		conditions = "license_taxi AND license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair";
		conditionsMessage = "Нужна лицензия таксиста и водителя";
		multiplier = 1;
		pushVIPitems = "false";
		vehicles[] =
		{
			{ "RRPVehicle_Heli_taxi", "" , "", "false" },
			{ "RRPHelicopter_taxi_AS365", "" , "", "false" }
		};
	};
	class civ_traktors
	{
		type = "Land";
		side = "civ";
		onlyrent = "false";
		conditions = "license_driver AND license_truck";
		conditionsMessage = "Необходима лицензия водителя и дальнобойщика";
		multiplier = 1;
		pushVIPitems = "false";
		vehicles[] =
		{
			{ "New_Holland_TC590_civ", "" , "", "false"},
			//{ "RRP_Dob", "" , "", "false" },
			{ "New_Holland_TC590_civ_BE", "(call life_donator) > 2" , "с VIP 3 ур.", "false" },
			{ "d3s_uaz_3907", "(call life_donator) > 1" , "с VIP 2 ур.", "false" },
		};
	};
};
