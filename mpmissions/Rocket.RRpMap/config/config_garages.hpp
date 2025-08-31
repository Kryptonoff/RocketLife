class LifeCfgGarages {
	costPlate = 990;
	
	// Транспорт который нельзя вытащить с гаража по определенным причинам
	lockedVehicles[]=
	{ 
	"RRPVehicle_Tanketka_aucV",
      "B_Plane_Fighter_01_Stealth_F_aucV",
     // "RRPHelicopter_A18_A6",
      "RRPVehicle_Tanketka_A6",
      //"RRPVehicle_Predator_A6",
      "RRPVehicle_Tanketka_A6",
      "RRP_Tanker_a2",
      "RRP_Tanker_w_a2",
      "RRPVehicle_Tanker_w_A4",
      "RRPVehicle_Marid2_A3",
      "RRPVehicle_Marid1_A3",
      "RRP_Marid1_a2",
      "RRPVehicle_BOBA01_A3",
     //"RRPVehicle_Karen_A3",
      "RRPVehicle_Marshal_A3",
      "RRPVehicle_Tanketka_A4",
      "RRPVehicle_Tanketka_A7",
      "RRPVehicle_Tanketka_A3"
	  /*
	"RRPVehicle_kuruma_kifo",
	"RRPVehicle_Tanker_A6",
	"RRPVehicle_Tanketka_A6",
	"RRPVehicle_tiger_76561199189042038",
	"RRPVehicle_tiger_76561199113587031",
	"RRPVehicle_tiger_76561199072206957",
	"RRPVehicle_tiger_76561198859526459",
	"RRPVehicle_tiger_76561199003868334",
	"RRPVehicle_tiger_76561197989379888",
	"RRPVehicle_Tanketka_aucV",
	"B_Plane_Fighter_01_Stealth_F_aucV",
	"RRPHelicopter_A18_A6",
	"RRPVehicle_Predator_A6",
	"RRP_Tanker_a2",
	"RRP_Tanker_w_a2",
	"RRPVehicle_Tanker_w_A4",
	"RRPVehicle_Marid2_A3",
	"RRPVehicle_Marid1_A3",
	"RRP_Marid1_a2",
	"RRPVehicle_BOBA01_A3",
	"RRPVehicle_Karen_A3",
	"RRPVehicle_Marshal_A3",
	"RRPVehicle_Tanketka_A4",
	"RRPVehicle_Tanketka_A3",
	"RRPVehicle_BTR90_MS13",
	"RRPVehicle_BTR90_Deadlock",
	"RRPVehicle_BTR90_Cigane",
	"RRPVehicle_BTR90_Sector7",
	"RRPVehicle_BTR90_Kifo",
	"RRPVehicle_BTR90_Phoenix",
	"RRPVehicle_BTR90_IMPERIUM",
	"RRPVehicle_BTR90_CostraNostra",
	"RRPVehicle_BTR90_Soprano",
	"RRPVehicle_BTR90_Wolves",
	"RRPVehicle_BTR90_Pirates",
	"RRPVehicle_BTR90_BlackSnow",
	"RRPVehicle_BTR90",
	"CN_MAN",
	"Deadlock_MAN",
	"Kasatky_MAN",
	"SOPRANO_MAN",
	"PH_MAN",
	"PH_MAN_2",
	"IMPER_MAN",
	"SK_MAN",
	"Pirats_MAN",
	"RRPVehicle_man_Pirates",
	"RRPVehicle_man_kifo",
	"BS_MAN",
	"RRPVehicle_MAN_MS13",
	"ESC_MAN",
	"CIGANE_MAN",
	"RRPVehicle_man_Bloods",
	"RRPVehicle_man_new_Bloods",
	"RRPVehicle_man_Sector7",
	"RRPVehicle_MAN_Wolves",
	"RRPVehicle_man_constant",
	"RimasINC_MAN",
	"Kuruma_PD",
	"RRPVehicle_MRAP01_Escobaro",
	"B_MRAP_01_F",
	"s7_vehicles_hunter",
	"DV_Hunter",
	"RRPVehicle_hunter_Pirates",
	"P_Hunter",
	"d3s_kuruma_esc",
	"Kuruma_RimasINC",
	"RRPVehicle_kuruma_Pirates",
	"RRPVehicle_kuruma_wolves",
	"RRPVehicle_kuruma_BlackSnow",
	"RRPVehicle_kuruma_MS13",
	"RRPVehicle_kuruma_Cwrka",
	"d3s_kuruma_sopranos2",
	"IMPERIUM_Kuruma_A",
	"SK_Kuruma_S",
	"Kuruma_cigane",
	"d3s_kuruma_DW",
	"s7_vehicles_kuruma",
	"d3s_kuruma_Sopranos",
	"d3s_kuruma_CHROME",
	"RRPVehicle_kuruma_bears",
	"d3s_kuruma_Kas",
	"d3s_kuruma_kasatky",
	"KurumaCN",
	"Kuruma_new_CN",
	"insurgent_SWAT",
	"RRPVehicle_tiger_PD",
	"d3s_insurgent_Sam ",
	"RRPVehicle_insurgent_Sopranos",
	"RRPVehicle_Insurgent_Umbrella",
	"RRPVehicle_Insurgent_Deadlock",
	"RRPVehicle_insurgent_Cwrka",
	"RRPVehicle_insurgent_BS",
	"insurgent_Cigane",
	"Insurgent_SOP",
	"insurgent_Kasatky_1",
	"insurgent_Kasatky_2",
	"insurgent_imperium",
	"Insurgent_SK",
	"insurgent_DV",
	"s7_vehicles_insurgent",
	"insurgent_Pirates",
	"RRPVehicle_insurgent_Pirates",
	"insurgent_legion",
	"insurgent_phoenix",
	"insurgent_CN",
	"insurgent_valkirey",
	"d3s_insurgent_gtaV_SWAT",
	"ifrit_DW",
	"ifrit_DV",
	"s7_vehicles_ifrit",
	"ifrit_kasatky_1",
	"RRPVehicle_ifrit_Deadlock ",
	"ifrit_chrome",
	"ifrit_cosanostra",
	"ifrit_escobaro",
	"RRPVehicle_ifrit_Pirates",
	"ifrit_constant_1",
	"outcast_chrome",
	"ifrit_enclav",
	"ifrit_Legion",
	"ifrit_YG",
	"ifrit_BS",
	"ifrit_cigane",
	"ifrit_VAL",
	"Outcast_Hunter",
	"DW_Hunter",
	"RRPVehicle_ifrit_MW",
	"Sopranos_Ifrit",
	"ifrit_kasatky",
	"ifrit_phoenix",
	"Legion_ifrit_new"*/
    };
	
	class RRpMap {

		class RRP_MGRP_Air_1 {
			displayName = "Авиагараж Minersа #1";
		};
		class RRP_MGRP_Veh_1 {
			displayName = "Гараж Minersа #1";
			position[] = {{3586.15,13622.4,0.16479},{{0.996539,-0.0814617,-0.0165685},{0.0166386,0.000182095,0.999862}}};
		};

		class RRP_MGRP_Air_2 {
			displayName = "Авиагараж Minersа #2";
			position[] = {{13323.7,14526,-0.0100112},{{-0.637919,0.76996,0.014896},{0.00832533,-0.0124466,0.999888}}};
		};
		class RRP_MGRP_Veh_2 {
			displayName = "Гараж Minersа #2";
			position[] = {{13304,14551.1,-0.0082252},{{0.777208,0.62923,0.00418881},{-0.00046247,-0.00608568,0.999981}}};
		};

		class OUTCAST_air_s {
			displayName = "Авиагараж SOA";
			position[] = {{5998.72,16260.2,0.0510979},{{-0.998717,0.0305654,0.0403745},{0.0396293,-0.0246063,0.998911}}};
		};
		class none {
			displayName = "Не закреплен";
		};
		class rimas_veh_s {
			displayName = "Автогараж Rimas Inc.";
		};
		class rimas_air_sh {
			displayName = "Авиагараж Rimas Inc.";
			position[] = {{8035.04,14664.6,0.00579834},{{0.673295,0.739372,0.00153905},{-0.00103551,-0.0011386,0.999999}}};
		};
		class g_air_kav_1 {
			displayName = "Авиагараж Кавала";
		};
		class car_g_1 {
			displayName = "Автогараж Пиргос";
		};
		class car_g_6 {
			displayName = "Автогараж Столица";
		};
		class gar_dp11_1 {
			displayName = "Автогараж DP 11";
		};
		class car_g_reb_2 {
			displayName = "Автогараж Кавала";
		};
		class car_g_reb_4 {
			displayName = "Автогараж база бандитов";
		};
		class car_g_reb_1 {
			displayName = "База Революционеров 1";
		};
		class car_g_3 {
			displayName = "Автогараж Атира";
		};
		class cop_ship_1 {
			displayName = "Лодочный гараж DP10";
		};
		class cop_ship_2 {
			displayName = "Лодочный гараж Кавала";
		};
		class civ_ship_1 {
			displayName = "Лодочный гараж Кавала";
		};
		class civ_ship_2 {
			displayName = "Лодочный гараж Неохори";
		};
		class civ_ship_3 {
			displayName = "Бухта Калитея";
		};
		class civ_ship_4 {
			displayName = "Лодочный гараж Пиргос";
		};
		class cop_ship_1_1 {
			displayName = "Лодочный гараж Пиргоса";
		};
		class reb_ship_1 {
			displayName = "Лодочный гараж Столица Пиргоса";
		};
		class air_g_1 {
			displayName = "Авигараж центральный Аэропорт";
		};
		class reb_v_2 {
			displayName = "База Революционеров 2";
		};
		class civ_air_2 {
			displayName = "Авиагараж София";
		};
		class car_g_2 {
			displayName = "Автогараж София";
		};
		class car_g_reb_3 {
			displayName = "База Революционеров";
		};
		class air_g_3 {
			displayName = "Авиагараж Альфа";
		};
		class car_g_1_1 {
			displayName = "Автогараж Пиргоса";
		};
		class air_g_1_1 {
			displayName = "Авиагараж Пиргоса";
		};
		class air_g_2 {
			displayName = "Авиаспортивный клуб";
		};
		class car_g_reb_city {
			displayName = "Столица Революционеров";
		};
		class air_g_reb_city {
			displayName = "Столица Революционеров";
		};
		class medic_spawn_1 {
			displayName = "Гараж МЧС Кавала";
		};
		class med_kavala {
			displayName = "Гараж МЧС Кавала";
		};
		class medic_spawn_2 {
			displayName = "Гараж МЧС Атира";
		};
		class medic_spawn_3 {
			displayName = "Гараж МЧС Пиргос";
		};
		class medic_spawn_4 {
			displayName = "Гараж МЧС София";
		};
		class med_car_1 {
			displayName = "Гараж МЧС Кавала";
		};
		class med_car_2 {
			displayName = "Гараж МЧС Пиргос";
		};
		class med_car_3 {
			displayName = "Гараж МЧС Атира";
		};
		class med_car_4 {
			displayName = "Гараж МЧС София";
			position[] = {{14494.5,16703.1,12.7827},{{0.743179,0.669088,-0.00228802},{0.00170031,0.00153101,0.999997}}};
		};
		class med_car {
			displayName = "Гараж МЧС";
			position[] = {{3776.33,13000.3,0.0179291},{{0.0169871,-0.999829,-0.00726482},{-0.0203425,-0.00760996,0.999764}}};
		};
		class med_air {
			displayName = "Авиагараж МЧС";
			position[] = {{3764.63,13001.7,12.8393},{{-0.999636,0.0269245,0.00155191},{0.00155155,-3.43155e-005,0.999999}}};
		};
		class gov_garage {
			displayName = "Губернатор";
		};
		class g_press_hel_s {
			displayName = "База 7 новостей";
			position[] = {{15248.7,19090.6,21.0561},{{-0.681986,0.731363,0.00153957},{0.00105411,-0.00112212,0.999999}}};
		};
		class g_press_veh_s {
			displayName = "База 7 новостей";
			position[] = {{15206.2,19100,-0.000656128},{{0.898633,0.438701,0.000466235},{0.00139468,-0.0039196,0.999991}}};
		};
		class g_car_nmd {
			displayName = "База NOMADS";
		};
		class car_taxi_1 {
			displayName = "Таксопарк";
		};
		class air_taxi_1 {
			displayName = "Таксопарк";
		};
		class civ_ship_sofia {
			displayName = "Лодочный гараж София";
		};
		class reb_ship_base2 {
			displayName = "Лодочный гараж База бандитов 2";
		};
		class g_boat_nsb {
			displayName = "Лодочный гараж NSB";
		};
		class g_boat_aff {
			displayName = "Лодочный гараж AFF";
		};
		class g_car_led {
			displayName = "Гараж Прокуратуры";
		};
		class car_g_penalty {
			displayName = "Штрафстоянка";
		};
		//премки
		class helly_more {
			displayName = "Авиагараж Пиратская Бухта";
			position[] = {{17921,1650.05,188.049},{{-0.999472,-0.0324569,0.00154036},{0.00153945,5.30352e-005,0.999999}}};
		};
		//
		class anvil_air_1 {
			displayName = "Авиагараж ANVIL";
			position[] = {{7749.66,6509.11,4.9451},{{-0.582737,0.812659,0.00153933},{0.000895997,-0.00125168,0.999999}}};
		};
		class anvil_air_2 {
			displayName = "Авиагараж ANVIL";
			position[] = {{7733.78,6496.83,4.94304},{{-0.612724,0.790296,0.00153967},{0.000944535,-0.00121592,0.999999}}};
		};
		class anvil_veh_1 {
			displayName = "Гараж ANVIL";
		};

		//
		class BS_air_spawn {
			displayName = "Авиагараж Black Snow";
		};
		class BS_car_spawn {
			displayName = "Автогараж Black Snow";
			position[] = {{17123.1,22183.6,0.0235293},{{-2.04387e-006,-0.999974,-0.00717619},{-0.00139411,-0.00717618,0.999973}}};
		};
		//
		class inagawakai_air_spawn_1 {
			displayName = "Авиагараж Inagawa Kai";
			position[] = {{13827,20210.6,2.19916},{{-0.586389,0.809525,0.0285684},{0.0167619,-0.0231343,0.999592}}};
		};
		class inagawakai_air_spawn {
			displayName = "Авиагараж Inagawa Kai";
		};
		class inagawakai_car_spawn {
			displayName = "Автогараж Inagawa Kai";
		};
		//
		class cigane_air_spawn {
			displayName = "Авиагараж Cigane";
			position[] = {{23714.1,24209.2,0.00909805},{{-0.994908,-0.0960494,-0.0305254},{-0.0276191,-0.0314439,0.999124}}};
		};
		class cigane_car_spawn {
			displayName = "Автогараж Cigane";
			position[] = {{23707.3,24243.4,0.0127335},{{0.202655,-0.977402,-0.0601299},{0.0105974,-0.0592114,0.998189}}};
		};
		//
		class blackwolves_air_spawn {
			displayName = "Авиагараж black wolves";
			position[] = {{6025.84,16258.1,13.1449},{{-0.000135498,0.999999,0.00154076},{1.16892e-006,-0.00154076,0.999999}}};
		};
		class blackwolves_car_spawn {
			displayName = "Автогараж black wolves";
		};
		//
		class lacosanostra_air_spawn {
			displayName = "Авиагараж la cosa nostra";
			position[] = {{9145.74,19223.1,2.21744},{{0.000214797,0.999592,0.0285686},{-2.59933e-006,-0.0285686,0.999592}}};
		};
		class lacosanostra_car_spawn {
			displayName = "Автогараж la cosa nostra";
		};
		//
		class COP_veh_spawn {
			displayName = "Автогараж ПД";
			position[] = {{3669.66,12614.3,-0.00224876},{{-0.157293,-0.987552,-5.41612e-005},{-0.000324812,-3.10914e-006,1}}};
		};
		class COP_air_spawn {
			displayName = "Авиагараж ПД";
			position[] = {{3680.86,12615.4,11.8714},{{9.23718e-005,0.999998,0.00219357},{4.33403e-006,-0.00219357,0.999998}}};
		};
		//
		class judge_air_spawn {
			displayName = "Автогараж Мин.Юст";
		};
		//
		class med_car_spawn_p {
			position[] = {{16996.7,12806.7,0.00779343},{{0.662891,0.74864,0.0106411},{0.0101935,-0.0232353,0.999678}}};
		};
		class med_air_spawn_p {
			position[] = {{17007.6,12792.3,13.8248},{{-0.989073,0.14352,0.0337145},{0.0322254,-0.0126885,0.9994}}};
		};
		/////
		class civ_air_kavala_2 {
			displayName = "Авиагараж Кавала";
			position[] = {{3614.26,13199.7,3.83383},{{-0.23439,-0.971723,0.0285698},{0.00670256,0.0277724,0.999592}}};
		};
		///

		class R_Sector_Veh_Garage {
            displayName = "Гараж Sector 7";
            position[] = {{20370.5,18725,-0.00225067},{{-0.807605,-0.589723,-5.41204e-005},{-0.000210849,0.000196978,1}}};
        };
        class R_Sector_Air_Garage {
            displayName = "Авиагараж Sector 7";
            position[] = {{20348.1,18807.5,2.24805},{{0.608403,-0.793622,0.00300389},{-0.00179492,0.002409,0.999995}}};
        };

		class R_Escobaro_Veh_Garage_Spawn {
            displayName = "Гараж La Escobaro Family";
            position[] = {{27840.5,22764.8,0.0232615},{{0.694422,-0.719531,-0.00724783},{0.00400969,-0.00620295,0.999973}}};
        };
        class R_Escobaro_Air_Garage_Spawn {
            displayName = "Авиагараж La Escobaro Family";
            position[] = {{27816.4,22773.6,0.00619364},{{-0.731419,-0.681927,0.00154445},{0.00113093,0.00105183,0.999999}}};
        };

		class RRP_Sumiyoshi_Veh_Garage_Spawn {
            displayName = "Гараж Sumiyoshi Kai";
            position[] = {{23750.7,16699,0.00484753},{{-7.27447e-005,1,-5.52726e-005},{0.000275439,5.52926e-005,1}}};
        };
        class RRP_Sumiyoshi_Air_Garage_Spawn {
            displayName = "Авиагараж Sumiyoshi Kai";
            position[] = {{23763.5,16672.6,0.00620174},{{-2.34323e-005,0.999999,0.00154052},{-3.32155e-007,-0.00154052,0.999999}}};
        };

		class RRP_Judge_Veh_Garage_Spawn {
			displayName = "Гараж Мин. юстиции";
			position[] = {{3649.92,13368.5,-0.0211887},{{-0.774964,0.631827,-0.0149737},{-0.0190684,0.000306504,0.999818}}};
		};
	};

	class tanoa {
			class none {
				displayName = "Не закреплен";
			};
			class car_g_tanoa {
				displayName = "гараж г. Каткоула";
			};
			class civ_ship_Tanoa {
				displayName = "порт  г. Каткоула";
			};
			class car_g_tanoa_2 {
				displayName = "Lijnhaven";
			};
			class civ_ship_Tanoa_2 {
				displayName = "Гараж г. Lijnhaven";
			};
			class car_g_tanoa_3 {
				displayName = "Гараж г. Harcourd";
			};
			class civ_ship_Tanoa_3 {
				displayName = "Порт г. Harcourd";
			};
			class car_g_tanoa_4 {
				displayName = "Гараж Остров запад";
			};
			class civ_ship_Tanoa_4 {
				displayName = "Порт Остров запад";
			};
			class car_g_tanoa_5 {
				displayName = "Гараж Tuvanaka";
			};
			class civ_ship_Tanoa_5 {
				displayName = "Порт Tuvanaka";
			};
			class car_g_tanoa_6 {
				displayName = "Belford";
			};
			class civ_ship_Tanoa_6 {
				displayName = "Belford";
			};
			class car_g_tanoa_7 {
				displayName = "Гараж Oumere";
			};
			class civ_ship_Tanoa_7 {
				displayName = "Порт Oumere";
			};
			class car_g_tanoa_8 {
				displayName = "Гараж ( порт Голубая жемчужина)";
			};
			class civ_ship_Tanoa_8 {
				displayName = "Порт (порт Голубая жемчужина)";
			};
			class car_g_tanoa_9 {
				displayName = "Гараж La Rochelle";
			};
			class civ_ship_Tanoa_9 {
				displayName = "Порт La Rochelle";
			};
			class car_g_tanoa_01 {
				displayName = "Гараж Georgetown";
			};
			class civ_ship_Tanoa_01 {
				displayName = "Порт Georgetown";
			};
			class car_g_tanoa_02 {
				displayName = "Гараж Nicolet";
			};
			class civ_ship_Tanoa_02 {
				displayName = "Порт Nicolet";
				//position[] = {5667.27,10418.1,900}; //если хочешь задать спану машины с гаража кастомную позицию, просто вставь коорды как тут
			};
	};

	//Кастомные позиции спавна машин при покупке авто
	class shopVeh_marker {

		class COP_veh_sh {
			position[] = {{3669.66,12614.3,-0.00224876},{{-0.157293,-0.987552,-5.41612e-005},{-0.000324812,-3.10914e-006,1}}};
		};
		class COP_air_sh {
			position[] = {{3680.86,12615.4,11.8714},{{9.23718e-005,0.999998,0.00219357},{4.33403e-006,-0.00219357,0.999998}}};
		};
		class flightschool_airspawn_1 {
			position[] = {{14653.1,16776.7,-0.00387955},{{0.256881,-0.966079,0.0265216},{-0.00535513,0.0260192,0.999647}}};
		};
		class flightschool_airspawn_3 {
			position[] = {{14653.1,16776.7,-0.00387955},{{0.256881,-0.966079,0.0265216},{-0.00535513,0.0260192,0.999647}}};
		};
		class flightschool_airspawn_4 {
			position[] = {{14653.1,16776.7,-0.00387955},{{0.256881,-0.966079,0.0265216},{-0.00535513,0.0260192,0.999647}}};
		};
		//
		class civ_air_kavala_1 {
			displayName = "Авиагараж Кавала";
			position[] = {{3614.26,13199.7,3.83383},{{-0.23439,-0.971723,0.0285698},{0.00670256,0.0277724,0.999592}}};
		};
		class judge_air_sh {
		};
		/////
		class BS_air_sh {
		};
		class BS_car_sh {
			position[] = {{17123.1,22183.6,0.0235293},{{-2.04387e-006,-0.999974,-0.00717619},{-0.00139411,-0.00717618,0.999973}}};
		};
		//
		class inagawakai_air_sh_1 {
			position[] = {{13814.1,20228.7,2.20052},{{-0.586328,0.80957,0.0285661},{0.0167503,-0.0231397,0.999592}}};
		};
		class inagawakai_air_sh {
		};
		class inagawakai_car_sh {
		};
		//
		class cigane_car_sh {
			position[] = {{23704.2,24259.1,0.03125},{{0.201863,-0.977593,-0.0596991},{0.0171643,-0.0574135,0.998203}}};
		};
		class cigane_air_sh {
			position[] = {{23721.8,24225.5,0.00713348},{{0.173657,-0.98473,-0.0122626},{-0.0162288,-0.0153117,0.999751}}};
		};
		//
		class blackwolves_air_sh {
			position[] = {{6025.84,16258.1,13.1449},{{-0.000135498,0.999999,0.00154076},{1.16892e-006,-0.00154076,0.999999}}};
		};
		class blackwolves_car_sh {
		};
		//
		class lacosanostra_air_sh {
			position[] = {{9145.79,19199.2,2.21933},{{0.000282599,0.999592,0.0285712},{-8.67882e-006,-0.0285712,0.999592}}};
		};
		class lacosanostra_car_sh {
		};
		/////
		class med_car_sh {
			position[] = {{3776.33,13000.3,0.0179291},{{0.0169871,-0.999829,-0.00726482},{-0.0203425,-0.00760996,0.999764}}};
		};
		class med_air_sh {
			position[] = {{3741.47,12990.4,13.8034},{{-0.999154,-0.0173455,0.0372808},{0.0373384,-0.00300629,0.999298}}};
		};
		class med_car_sh_p {
			position[] = {{16996.7,12806.7,0.00779343},{{0.662891,0.74864,0.0106411},{0.0101935,-0.0232353,0.999678}}};
		};
		class med_air_sh_p {
			position[] = {{17007.6,12792.3,13.8248},{{-0.989073,0.14352,0.0337145},{0.0322254,-0.0126885,0.9994}}};
		};
		///
		class g_press_hel_spawn {
			position[] = {{15248.7,19090.6,21.0561},{{-0.681986,0.731363,0.00153957},{0.00105411,-0.00112212,0.999999}}};
		};
		class g_press_veh_spawn {
			position[] = {{15206.2,19100,-0.000656128},{{0.898633,0.438701,0.000466235},{0.00139468,-0.0039196,0.999991}}};
		};

		class R_Sector_Veh_Shop {
            position[] = {{20355.3,18714,0.00670624},{{-0.807605,-0.589723,-5.13716e-005},{-0.000203611,0.000191727,1}}};
        };
        class R_Sector_Air_Shop {
            position[] = {{20362,18788.2,2.24859},{{-0.55985,0.828589,0.00290319},{0.00165988,-0.00238224,0.999996}}};
        };

		class R_Escobaro_Veh_Shop_Spawn {
            position[] = {{27828.3,22777.3,0.0254984},{{0.694422,-0.719532,-0.00724511},{0.00400903,-0.0061998,0.999973}}};
        };
        class R_Escobaro_Air_Shop_Spawn {
            position[] = {{27800.6,22758.5,0.0061965},{{0.715606,0.698502,0.00153915},{-0.0011004,-0.00107615,0.999999}}};
        };

		class RRP_Sumiyoshi_Veh_Shop_Spawn {
            position[] = {{23761,16691.2,-0.00073123},{{-0.999996,-0.00265788,-5.42115e-005},{-5.50326e-005,0.000308861,1}}};
        };
        class RRP_Sumiyoshi_Air_Shop_Spawn {
            position[] = {{23783.5,16672.6,0.0062027},{{-2.50042e-005,0.999999,0.00154017},{-4.19103e-007,-0.00154017,0.999999}}};
        };

		class RRP_Judge_Veh_Shop_Spawn {
			position[] = {{3640.65,13376,-0.0211954},{{-0.765023,0.643807,-0.0158736},{-0.0210253,-0.00033351,0.999779}}};
		};
	};
};