#define true 1
#define false 0
class LifeCfgSettings
{
	beginnerTime = 600; // Время в минутах через которое статус новичка будет снят
	whisperMarkers[] = {
		/*
			1 - Marker
			2 - Radius
		*/
		{"ZZ_PD_Kavala",75}
	};
	life_refinery_oilProduce = 100;
	array_magazine_hotKey[] = {
		"extItem_grinder",
		"extItem_MetalWire",
		"extItem_canteen_empty",
		"extItem_bottle_empty",
		"extItem_canteen_salt",
		"extItem_bottle_salt",
		"extItem_campFire",
		"extItem_Fuelcan_empty",
		"extItem_Fuelcan",
		"extItem_ItemDetoxin",
		"extItem_vitaminbottle",
		"extItem_bandage",
		"extItem_antibiotic",
		"extItem_painkillers",
		"extItem_ItemMorphine",
		"MineDetector",
		"methp",
		"bottledwhiskey",
		"bottledshine",
		"bottledbeer",
		"marijuana",
		"cocainep"
	};
	
	startUniforms[] = {
		"U_C_Blouson_Bleu",
		"A3L_CivShirtAdidasMake",
		"A3L_CivShirtAdidas_r",
		"A3L_CivShirtAdidas",
		"A3L_CivShirtAnotherCat",
		"A3L_CivShirtHollister",
		"A3L_CivShirtKeepCalm",
		"A3L_Lacoste_C",
		"A3L_Lacoste_G",
		"A3L_Lacoste_S",
		"A3L_Lacoste_T",
		"A3L_CivShirtNikeCamo",
		"A3L_CivShirtNikeDoIt",
		"A3L_CivShirtNikeDoIt2",
		"A3L_CivShirtNikeFeet",
		"BluePlaid_uni",
		"GreenPlaid_uni",
		"OrangePlaid_uni",
		"PinkPlaid_uni",
		"RedPlaid_uni",
		"YellowPlaid_uni",
		"BlGnGy_uni",
		"BlGyBr_uni",
		"checkered_uni",
		"GbGyBr_uni",
		"GnBlBr_uni",
		"GnGyBr_uni",
		"poloranger_uni",
		"GyBlBr_uni",
		"OrBlBr_uni",
		"OrGnGy_uni",
		"OrGyBr_uni",
		"PkGnGy_uni",
		"PkGyBr_uni",
		"RdBlBr_uni",
		"RdGnGy_uni",
		"RdGyBr_uni",
		"WhBlBr_uni",
		"YlBlBr_uni",
		"YlGnGy_uni"
	};
	gasMask[] = {"RRP_RZ_Gas_Mask_1","RRP_RZ_Gas_Mask_2","RRP_RZ_Gas_Mask_3","RRP_RZ_Gas_Mask_4","G_RegulatorMask_F","Skyline_GasMask","Skyline_Glasses_Masque_GP5_01_F","KA_MCU"};
	interactionObjects[] = {"Land_CargoBox_V1_F","A3L_Corn","A3L_Cotton","A3L_Wheat","acd_b_NeriumO2d_F","acd_W_sharpStone_02","A3L_Beans","apple_tree","A3L_Cannabis","Land_SCF_01_pipe_end_F","acd_b_NeriumO2s_white_F","A3L_Sunflower","Land_WeldingTrolley_01_F","ver_prison_toilet","Land_IndPipe1_valve_F","Land_Device_assembled_F","Land_Atm_02_F","vvv_tronco","DDR_Mushrooms","RRP_Gift","Land_TransferSwitch_01_F","plp_cts_MultiboxColFuel","plp_cts_MultiboxColFuelSide","plp_cts_MultiboxColOlive","plp_cts_MultiboxColOliveSide","plp_cts_MultiboxColOrange","plp_cts_MultiboxColOrangeSide","plp_cts_MultiboxColTan","plp_cts_MultiboxColTanSide"};
	illegalMaskList[] = {"G_Balaclava_blk","G_Balaclava_oli","Skyline_Glasses_Cagoule_01_F","Skyline_Glasses_Cagoule_02_F","GM_boneface_plain","GM_boneface_alpine","GM_boneface_blue","GM_boneface_cyan","GM_boneface_desert","GM_boneface_diazDeLosMuertos","GM_boneface_green","GM_boneface_magenta","GM_boneface_multicam","GM_boneface_oliveDrab","GM_boneface_red","GM_boneface_snow","GM_boneface_tan","GM_boneface_thirst","GM_boneface_woodland","GM_boneface_yellow","Skyline_GasMask","Skyline_Glasses_Masque_GP5_01_F","Skyline_Anonymous","Skyline_Corvo","Skyline_Dallas","Skyline_Hoxton","Skyline_Wolf"};
	allowAlphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ._-!\\/()%йцукенгшщзхъфывапролджэячсмитьбюёЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ";
	allowNumber = "0123456789";
	LifeCfgBanReasons[] =
	{
		"RDM",
		"VRDM",
		"HACK"
	};


	//Появление ворон над игроками в ВП
	timeCreateroosters = 180;
	roostersRadius = 15;
	amount_roosters = 1;

	//Зона для новичков
	zone_for_beginners = "other_freshspawn_zone";
	empEffectTime  = 40;


	spawnPosToJail[] = {
		{2997.66,17809.5,0.11311}
	};

	spawnPosToKPZ[] = {
		{3707.71,12615.4,4.41007},
		{3706.99,12612.2,4.41006},
		{3705.57,12608.3,4.41006},
		{3702.1,12609,4.41006}
	};

	//Список техники с которой можно стрелять в зоне для новичков
	allowVehicleInSafeZone[] = {
		"RRPVehicle_Qilin_PD",
		"cop_gh",
		"cop_helli",
		"I_C_Offroad_02_AT_F_cop",
		"RRP_Marid_PD_Armered_1",
		"RRP_Marid_PD_Armered",
		"RRPVehicle_Marshal_POLICE",
		"cop_marsh",

		"RRP_Marid_PD",
		"RRP_Marid_PD_1",
		"RRP_Marid_PD_Unarmed",
		"RRP_Marid_PD_Unarmed_1"
	};

	parkourBlackList[] = {
		{"RRP_MGRP_Spawn_1",150},
		{"RRP_MGRP_Spawn_2",150},
		{"blacksnow_spawn_m",100},
		{"GRP_Cigane_Marker",150},
		{"GRP_Escobaro_Marker",150},
		{"GRP_Inagawa_Marker",150},
		{"RRP_Marker_Sumiyoshi", 150},
		{"RRP_KPP_01", 200},
		{"grp_BlackWolves", 150},
		{"nat_golds",260}

	};
	class CfgGaragesPublic
	{
		carsGarages[] =
		{
			"car_g_1",
			"gar_dp11_1",
			"car_g_reb_3",
			"car_g_3",
			"car_g_2",
			"car_g_1_1"
		};
		boatGarages[] = {
			"civ_ship_1","civ_ship_2"
		};
		airGarages[] = {
			"g_air_kav_1","air_g_1"
		};
		stratisGarage = "stratis_garage";
	};
	enableSnow = 0; //Включить / выключить снег

	life_exitTimer = 20; //сколько секунд до выхода с сервера (20 дефолт)
	life_pvpTimer = 3; //таймер пвп-режима в минутах (10 дефолт)
	#ifdef DEBUG
		life_respawn_timer = 1; //таймер возрождения в минутах (10 дефолт)
	#else
		life_respawn_timer = 5; //таймер возрождения в минутах (10 дефолт)
	#endif
	life_revive_cops = true; //могут ли ресать копы
	life_revive_fee = 250; //Сколько платит за рес игрок. Воскресивший получает x2

	life_houseLimit = 2; //максимум домов для одного игрока
	life_houseLimitDonat = 4; //максимум домов для одного игрока с випкой
	life_houseCreditPrice = 750; //сумма выдаваемого кредита за дом
	life_houseSpawnCondition = "life_firstTime OR life_newLife"; //условие для отображения домов в списке спауна

	life_virtualMax = 1050; //вместивость виртуального хранилища
	life_inventoryMax = 1050; //вместивость контейнера для реальных предметов

	life_gangPrice = 20000; //цена создание группировки
	life_gangUpgradeBase = 800; //базовая стоимость апгрейда базы
	life_gangUpgradeMultipler = 2.5;
	life_gangSlotLimit = 15; //макс кол-во членов обычной банды
	life_gangSlotLimitPrem = 25; //макс кол-во членов премиум банды
	life_gangCopCanLeaveCondition = "('cop' call RRPClient_groups_getSideLevel) in [19,22]"; //условие для копов, чтобы можно было выходить из базовой группы

	life_enableFatigue = true; //усталость у игроков?

	life_paycheck = 400; //пособие по безработице unclient.fsm
	life_paycheckGov = 10000;  //пособие для гос служащих unclient.fsm
	life_paycheckCondition = "('cop' call RRPClient_groups_getSideLevel) > 0 OR {('med' call RRPClient_groups_getSideLevel) > 0}"; //кто получает пособие для гос служащих unclient.fsm
	life_paycheck_period = 15; //выплачивать пособие каждые Х минут	unclient.fsm

	life_impound_max = 25000; //максимальная сумма за конфискацию
	life_impound_car = 500; //вознаграждение за конфискацию машины
	life_impound_boat = 600; //вознаграждение за конфискацию лодки
	life_impound_air = 700; //вознаграждение за конфискацию авиа

	life_cop_min = 4; //минимум копов на сервере
	life_cop_min_illegal = 3; //минимум копов на сервере для нелегала
	life_med_min = 3; //минимум медиков на сервере


	/*Техника которая будет взрыватся (вносить только боевую) в любом случае. Чего нет в списке будет принимать максимальный урон но взрыватся не бует!!!*/
	vehicleHandleDamageIgnorList[] =
	{
		"RRPVehicle_BTR90_BlackSnow",
		"RRPVehicle_BTR90_Pirates",
		"RRPVehicle_BTR90_Soprano",
		"RRPVehicle_BTR90_CostraNostra",
		"RRPVehicle_BTR90_IMPERIUM",
		"RRPVehicle_BTR90_Phoenix",
		"RRPVehicle_BTR90_Kifo",
		"RRPVehicle_BTR90_Sector7",
		"RRPVehicle_BTR90_Cigane",
		"RRPVehicle_BTR90_Deadlock",
		"RRPVehicle_BTR90_MS13",
		"RRPVehicle_BTR90_Deadlock",
		"RRPVehicle_BTR90_A3",
		"RRPVehicle_Karen_A3",
		"RRPVehicle_LSVAT_A4",
		"RRPVehicle_OffroadPT_A4",
		"RRPVehicle_Ultrainsurgent_A4",
		"RRPHelicopter_Vladika_A4",
		"RRPHelicopter_Dragonfly_A4",
		"RRPHelicopter_Dodj_A4",
		"RRPVehicle_Tanker_w_A4",
		"RRPVehicle_Tanketka_A4",
		"RRPBoat_parom_127_A4",
		"RRPVehicle_Marid2_A3",
		"RRPVehicle_Marid1_A3",
		"RRPVehicle_BOBA01_A3",
		"RRPVehicle_Dragonfly_A3",
		"RRPBoat_Karas_A3",
		"RRPHelicopter_AS565_A3",
		"RRPVehicle_Tanketka_A3",
		"RRPVehicle_Marshal_A3",
		"RRPVehicle_Armed_Boat_PD",
		"RRP_Marid1_a2",
		"RRP_Tanker_w_a2",
		"RRP_Marid2_a2",
		"RRP_Dodj_a2",
		"AS_565_A1",
		"paromSPMG_A1",
		"paromDHK_A1",
		"parom3_A1",
		"LRm2_A1",
		"UAZm2_A1",
		"Qilin_A1",
		"An2_A1",
		"cop_marsh",
		"BTR90",
		"RRPVehicle_Qilin_PD",
		"RRP_Marid_PD_Armered",
		"RRP_Marid_PD_Armered_1",
		"cop_gh",
		"cop_helli",
		"B_UGV_02_Demining_F",
		//
		"RRPVehicle_HURON_76561198366046837",
		"RRPVehicle_HURON_76561197989379888",
		"RRPVehicle_HURON_76561198157551141",
		"RRPVehicle_HURON_76561198109707602",
		"RRPVehicle_HURON_76561199072206957",
		"RRPVehicle_HURON_76561198984360169",
		"RRPVehicle_HURON_76561198199874517",
		"RRPVehicle_HURON_76561198022500941",
		"RRPVehicle_HURON_76561198351236835",
		"CN_humming",
		"Phoenix_humming",
		"phoenix_humming_winter",
		"RRPHelicopter_Cwrka_1",
		"RRPVehicle_Heli_kifo",
		"RRPHelicopter_Deadlock_1",
		"RRPVehicle_Heli_wolves",
		"RRPVehicle_Heli_1_wolves",
		"RRPVehicle_Heli_taxi",
		"DW_humming",
		"Cigane_humming",
		"BS_humming",
		"YG_humming",
		"CON_humming",
		"ENC_humming",
		"KAS_humming",
		"OUT_humming",
		"CHR_humming",
		"Legion_humming",
		"Legion_hummingbird_new",
		"BW_humming_2",
		"ESC_humming",
		"IMPERIUM_TN_Heli",
		"SK_Dragon_Helli",
		"SK_N_Samurai_Helli",
		"SK_BlueWolf_Helli",
		"IMPERIUM_Cerber_Helli",
		"s7_vehicles_hummingbird",
		"s7_vechicles_hummingbird_2",
		"IMPERIUM_Grif_helli",
		"RRPVehicle_hummingbird_umbrella_1",
		"RRPVehicle_hummingbird_MS13",
		"RRPVehicle_hummingbird_2_MS13",
		"Sopranos_humming",
		"RRPVehicle_hummingbird_MW",
		"BW_humming",
		"B_Heli_Transport_03_unarmed_F",
		"I_Plane_Fighter_03_AA_F",
		"C_Plane_Civil_01_F",
		"C_Heli_Light_01_civil_F",
		//
		"RRPVehicle_Armed_Boat_aucV",
		"RRP_Base_Dojd_aucV",
		"RRPHelicopter_Dragonfly_aucV",
		"RRP_Korova_aucV",
		"RRPVehicle_LSVAT_aucV",
		"B_Plane_Fighter_01_Stealth_F_aucV",
		"RRPVehicle_OffroadPT_aucV",
		"AS_565_aucV",
		"RRPVehicle_Tanketka_aucV",
		"RRPVehicle_Qilin_aucV",
		//
		"IMPERIUM_Kuruma_A",
		"RRPVehicle_shark_kuruma",
		"RRPVehicle_kuruma_kifo",
		"Kuruma_RimasINC",
		"RRPVehicle_kuruma_bears",
		"RRPVehicle_kuruma_wolves",
		"d3s_kuruma_sopranos2",
		"d3s_kuruma_Kas",
		"d3s_kuruma_kasatky",
		"s7_vehicles_kuruma",
		"Kuruma_cigane",
		"RRPVehicle_kuruma_BlackSnow",
		"KurumaCN",
		"d3s_kuruma_esc",
		"RRPVehicle_kuruma_Cwrka",
		"RRPVehicle_tiger_76561197989379888",
		"RRPVehicle_tiger_76561199003868334",
		"RRPVehicle_tiger_76561198859526459",
		"RRPVehicle_tiger_76561199189042038",
		"RRPVehicle_tiger_76561199072206957",
		"Kasatky_MAN",
		"Pirats_MAN",
		"RRPVehicle_kifo_tempest",
		"RRPVehicle_shark_tempest",
		"RRPVehicle_man_Bloods",
		"RRPVehicle_man_new_Bloods",
		"RRPVehicle_man_Pirates",
		"RRPVehicle_MAN_MS13",
		"RRPVehicle_MAN_Wolves",
		"Deadlock_MAN",
		"RRPVehicle_man_constant",
		"CIGANE_MAN",
		"IMPER_MAN",
		"SOPRANO_MAN",
		"PH_MAN",
		"PH_MAN_2",
		"ESC_MAN",
		"BS_MAN",
		"CN_MAN",
		"SK_MAN",
		//
		"RRPHelicopter_Dragonfly_A6",
		"RRPVehicle_Tanketka_A6",
		"RRPVehicle_Tanker_A6",
		"RRPHelicopter_AS565_A6",
		"RRPVehicle_Predator_A6",
		"RRPHelicopter_A18_A6"
	};

	/*машины с которых можно вызвать базу данных полицейских*/
	CarCopDataBase[] =
    {
		"d3s_f80_14_SE",
		"d3s_fseries_17_P3E",
		"d3s_AS_365",
		"d3s_s600_14",
		"d3s_g65amg_16",
		"d3s_e60_09_ACS5",
		"TM2_UCG_Black",
		"d3s_vklasse_17_UNM",
		"d3s_f10_12_FEMID",
		"d3s_lm002_90_open",
		"d3s_C63_14",
		"d3s_boss_19_UNM",
		"Kuruma_PD",
		"LaFerrari_PD",
		"d3s_svr_17_007",
		"d3s_FPIU_13",
		"d3s_f90_18_PD",
		"d3s_crown_98_PD",
		"d3s_charger_15_CPP",
		"d3s_uaz_3165M_COP",
		"d3s_uaz_3162_COP",
		"d3s_vklasse_17_TAXI",
		"d3s_vklasse_17_COP",
		"d3s_fpace_17_COP",
		"d3s_e400_16_COP",
		"d3s_tahoe_PPV",
		"d3s_raptor_PRP_17",
		"d3s_g63amg_16_Police",
		"d3s_tahoe_UNM",
		"d3s_santafe_19_COP",
		"d3s_g63amg_16_FSB",
		"d3s_f86_15_COP",
		"d3s_f86_15_COP_Y",
		"d3s_f10_12_COP",
		"d3s_raptor_UNM_17",
		"d3s_insurgent_gtaV_SWAT",
		"insurgent_SWAT",
		"d3s_e400_16_FSB",
		"B_Heli_Light_01_F",
		"O_Heli_Light_02_unarmed_F",
		"B_Heli_Transport_03_unarmed_F",
		"I_Heli_light_03_unarmed_F",
		"d3s_gl63amg_12_FSB",
		"d3s_malibu_18_UNM",
		"d3s_camry_18_UNM",
		"d3s_taurus_UNM_10",
		"d3s_gls63amg_17_FSB",
		"d3s_g500_18_FSB",
		"d3s_camry_18_COP",
		"d3s_malibu_18_COP",
		"RRPVehicle_civ_f90cop",
		"RRPVehicle_f90_spec",
		"d3s_taurus_FPI_10",
		"d3s_svr_17_EMS",
		"RRPVehicle_G12_OrlovPD",
		"TM2_UCG_Police",
		"d3s_svr_17_007",
		"d3s_w212s_13_EX",
		"RRPVehicle_civ_segway_cop",
		"d3s_durango_18_DDPI",
		"d3s_lm002_90_door_up",
		"d3s_amgGTR_15",
		"d3s_durango_18_UNM",
		"d3s_f86_15_UNM",
		"d3s_veneno_13",
		"RRPVehicle_6x6_76561199028844328",
		"RRPVehicle_LP700_76561198965376624"
    };

	/* CorrectiveWork */
	radiusCW = 400;
	startMarkerCW = "C_R";
	MarkerCW_1 = "corrective_work_main_1";
	MarkerCW_2 = "corrective_work_main_2";
	MarkerCW_3 = "corrective_work_main_3";

	dividerDonateCloth = 10;
	dividerDonateCar = 15;
	dividerDonateWeapon = 10;

	life_trunkClass = "Metal_Locker_F"; //объект, используемый для хранилища группировки
	life_trunkVirtualWeight = 1000; //базовая вместимость для виртуальных предметов
	life_trunkInventoryWeight = 1000; //базовая вместимость для виртуальных предметов

	life_removeLicByJail = true; //анулировать лицензии после посадки в тюрьму?
	life_removeLicByJailList[] = {"mafia","slavery"}; //классы лицензий

	life_removeLicByVeh = true; //анулировать лицензии при нарушении правил вождения?
	life_removeLicByVehList[] = {"civdriver","rebdriver","civtruck","rebtruck"};

	life_vaultBoxClass = "Land_CargoBox_V1_F";
	life_vaultBoxVirtualWeight = 5000;

	rewardForSearch = 50; //За 1 нелегальный айтем
	zonesForSearhing[] = {{"grp_PD",100},{"grp_jail_marker",100}}; //Список маркеров с радиусом в зоне которых полиция может вести обыск техники на наличие vItems
	life_benchesForCivHumm = ""; //условие чтобы не убирались скамейки на хэминге при спауне ----------??????

	life_dhl_office = "dhl_office"; //маркер офиса DHL, где спаун тачек делаем
	life_dhl_car = "C_Van_01_box_F_EXT_DHL"; //класс фургона, который даем на задание
	life_dhl_box = "plp_cts_CanisterWhite"; //класс коробки, которую надо возить
	life_dhl_price = 1; //сколько платим за метр

	//world settings
	class RRpMap {
		life_sz[] = {
			{
				"other_ZZ_capitalRebels",
			 	80,
			 	"default" //приоритет default - обычная, full - запрет для всех
			},

			{ "other_ZZ_capitalRebels", 80, "default" },
			{ "other_ZZ_rebHospital", 55, "default" },
			{ "other_ZZ_northRebBase", 40, "default" },

			{ "other_ZZ_zona_trager", 50, "default" },

			{ "other_ZZ_DP11", 50, "default" },
			{ "other_ZZ_Avia", 50, "default" },
			{ "RRP_Anomaly_ZZ_1", 80, "default" },
			{ "RRP_Anomaly_ZZ_2", 55, "default" },
			{ "other_ZZ_KPP", 100, "default" },
			{ "other_ZZ_Sud", 100, "default" },
			{ "ZZ_PD_Kavala", 75, "default" },
			{ "ZZ_7NEWS_Kavala", 55, "default" },
			{ "ZZ_EMS_Pirgos", 100, "default" },
			{ "nz_soa", 12, "default" },
			{ "other_ZZ_Pirgos", 470, "default" },
			{ "mi_6_zz", 55, "default" },
			{ "other_ZZ_centralHospital", 106, "full" },
			{ "other_ZZ_Prison", 115, "default"},
			{ "other_ZZ_Pirgos_1", 95, "default"},
			{ "ZZ_EMS_Kavala", 43, "default"}
		};
		life_dp_points[] = {"dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"};
		life_posWhite[] = {{"cargo_spawn",500},{"grp_jail_marker",100},{"paintball_zone1",280},{"cotton_1",50},{"jail_release_civ",50},{"reb_city_spawn_1",50},{"sky_dive",50}};
		life_gangResources = "[mari_processor,coke_processor,heroin_processor,meth_processor,uran_processor,uran_processor_clean]";
		life_platformZlevel = 193;

	};
	class Tanoa {
		life_sz[] = {{ "players_spawn_zone", 100 }};
		life_dp_points[] = {};
		life_posWhite[] = {};
		life_gangResources = "[]";
		life_platformZlevel = 69;
	};

	class giftsNY {
		class NYgift_vip1_1 {promo = "promo";};
	};

	class setFlagOnVeh {
		class Pirates {
			condition = "license_escobaro";
			texture = "\flag_pack\flad_Pirates.paa";
		};
		class Soprano {
			condition = "license_alpha";
			texture = "\flag_pack\flad_Soprano.paa";
		};
		class CWRKA {
			condition = "license_cwrka";
			texture = "\flag_pack\flad_CWRK.paa";
		};
		class Sector7 {
			condition = "license_sector";
			texture = "\flag_pack\flad_Sector7.paa";
		};
		class BS {
			condition = "license_blacksnow";
			texture = "\flag_pack\flad_BS.paa";
		};
		class Phoenix {
			condition = "license_phoenix";
			texture = "\flag_pack\flad_Phoenix.paa";
		};
	};
};
class CfgFlyDelivery
{
	allowedPlanes[] = {"C_Plane_Civil_01_F", "Sab_an2_sea", "sab_ultralight", "plane_dodo", "plane_velum"};
	CruisingSpeed = 11; // время в сек. преодоления 1км с крейсерской скоростью
	TakeoffTime = 30; 	// время на взлет в сек
	SeatTime = 60; 	// время на посадку в сек
	life_FlyDPpoints[] = {
		{3004.25,17799,369.62},
		{3683.41,12565.1,745.083},
		{3753.39,13757.6,722.584},
		{3956.81,19141.3,425.704},
		{4273.4,20686.2,359.469},
		{4572.21,21355.8,378.467},
		{4861.45,9552.01,458.749},
		{5068.37,11211.7,276.384},
		{6399.9,12369.8,388.209},
		{6558.61,21591.9,457.804},
		{7118.71,16425.1,271.923},
		{8448.77,25051.2,267.737},
		{8590.22,18278,665.444},
		{9052.44,11972.4,202.3},
		{9143.82,21481.6,18.4624},
		{9228.72,15847.7,252.074},
		{11672.3,11914.5,33.7463},
		{12413.6,15685,182.185},
		{12555.5,14387.5,501.407},
		{12866.1,16680.2,242.597},
		{13982.3,18729.3,219.272},
		{14516.5,17651.8,393.157},
		{14611.2,20799.8,149.981},
		{14755.3,16296.4,23.1695},
		{15170.9,11171.4,720.124},
		{15329.8,19732.5,164.993},
		{15393.3,14633.2,224.174},
		{15395.1,16004.9,164.663},
		{16466.4,12780.2,384.01},
		{17884.6,1685.13,92.3928},
		{18839,16639.2,333.549},
		{19386.9,13242.4,199.108},
		{20036.8,6189.86,173.398},
		{20251.4,11675.3,538.622},
		{20984.9,16987,525.772},
		{21114.7,7303.67,37.8277},
		{21262.7,14599.8,162.235},
		{21446.4,20390.1,143.149},
		{23839.3,18257.6,47.8622},
		{25745.5,21379.6,181.209},
		{26989.7,23217.5,213.877},
		{28300.3,25759.5,482.99}
	};
};
class CfgLifeColors
{
	class WaypointColors
	{
		displayName="Метки";
		variable="PRNS_WaypointColor";
		defaultColors[]={0.5,0.5,0.5,0.85000002};
	};
	class MarkerTeam
	{
		displayName="Маркер членов тусовки";
		variable="PRNS_ColorNotPlayerDraw";
		defaultColors[]=
		{
			"8/255",
			"107/255",
			"115/255",
			0.85000002
		};
	};
	class PRNS_ColorGroupPlayers
	{
		displayName="Маркер членов организации";
		variable="PRNS_ColorGroupPlayers";
		defaultColors[]=
		{
			"8/255",
			"107/255",
			"115/255",
			0.85000002
		};
	};
	class MyMarker
	{
		displayName="Ваш маркер";
		variable="PRNS_ColorPlayerDraw";
		defaultColors[]=
		{
			"52/255",
			"199/255",
			"13/255",
			0.85000002
		};
	};
	class GpsVehicle
	{
		displayName="Маркер техники с GPS";
		variable="PRNS_ColorVehGPS";
		defaultColors[]={0.85000002,0.85000002,0,0.85000002};
	};
	class TagsAndNames
	{
		displayName="Имена и теги";
		variable="PRNS_TagsColors";
		defaultColors[]={1,0,0.27000001,1};
	};
	class PartyPing
	{
		displayName="Пинг тусовки";
		variable="PRNS_PingColors";
		defaultColors[]={1,0,0.27000001,1};
	};
	class PartyESP
	{
		displayName = "Маркер на членах тусовки";
		variable="PRNS_PartyESP";
		defaultColors[]={1,0,0.27000001,1};
	};
};
class CfgSimulation
{
	enableDynamicSimulation = 1;
	groupSimulationDistance = 500;
	vehicleSimulationDistance = 250;
	emptyVehicleSimulationDistance = 250;
	propSimulationDistance = 50;
	isMovingSimulationCoef = 2;
};
#include "Config_secret_shop.hpp"
#include "Config_RemoteExec.hpp"
#include "Config_Spyglass.hpp"
#include "Config_Licenses.hpp"
#include "Config_Clothing.hpp"
#include "Config_Passports.hpp"
#include "Config_Housing.hpp"
#include "Config_Crafting.hpp"
#include "Config_Tags.hpp"
#include "Config_Skins.hpp"
#include "Config_Trunks.hpp"
#include "Config_Spawn.hpp"
#include "Config_Vehicles.hpp"
#include "Config_VehColors.hpp"
#include "Config_VehShops.hpp"
#include "Config_Adac.hpp"
#include "Config_Garages.hpp"
#include "Config_Items.hpp"
#include "Config_Weapons.hpp"
#include "Config_crime.hpp"
#include "Config_Titles.hpp"
#include "Config_Markers.hpp"
#include "Config_BattleVehicle.hpp"
#include "config_archeology.hpp"
#include "Config_WarZones.hpp"
#include "config_jobSys.hpp"
#include "config_pleaceables.hpp"
#include "config_animals.hpp"
#include "config_ltd.hpp"
#include "config_lootbox.hpp"
#include "config_network.hpp"
#include "config_lottery.hpp"
#include "config_metaldetector.hpp"
#include "config_cctv.hpp"
#include "config_gather.hpp"
#include "config_farm.hpp"
#include "config_vitems.hpp"
#include "config_clams.hpp"
#include "config_settingsTrash.hpp"
#include "config_animations.hpp"
#include "config_fuels.hpp"
#include "config_processing.h"
#include "config_chopShop.hpp"
#include "config_waypoints.hpp"
#include "config_skills.hpp"
#include "config_interaction.hpp"
#include "config_ptw.hpp"
#include "config_messages.hpp"
#include "config_gate.hpp"
#include "config_achievments.hpp"
#include "config_playerTags.hpp"
#include "config_radio.hpp"
#include "config_pGates.hpp"
#include "config_spectrum_device.hpp"
#include "config_telegram.hpp"
#include "config_party.hpp"
#include "config_overwrites.hpp"
#include "config_groups.hpp"
#include "config_sides.hpp"
#include "config_hints.hpp"
#include "config_rr.hpp"
#include "Config_Anomaly.hpp"
#include "config_events.hpp"
#include "Config_Documents.hpp"
#include "config_itemUse.hpp"
#include "ConfigDialogs.hpp"
#include "ConfigNpc.hpp"
#include "deleteCar.hpp"
#include "config_surgery.hpp"
#include "config_dailyReward.hpp"
#include "shops_setting.hpp"
#include "items_limited.hpp"
#include "config_wiki.hpp"
#include "config_party_meat.hpp"
#include "config_case.hpp"
#include "Config_Jobs.hpp"
#include "config_goals.hpp"
#include "config_atmrob.hpp"
#include "refinery.hpp"
#include "config_trx.hpp"
#include "config_raid.hpp"
#include "config_farming.hpp"
#include "config_fishing.hpp"
#include "config_fed.hpp"