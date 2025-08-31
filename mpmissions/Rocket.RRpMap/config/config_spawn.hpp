/*

	displayName = Отображаемое название
	spawnMarker = имя маркера на карте
	icon = полный путь к иконке
	conditions = требования, необходимые для спауна на этой точке (не забыть (life_firstTime OR life_newLife))

*/
//_this addAction["Переместиться к зоне добычи",{[player,'gather_zone_jail'] call RRPClient_system_move}];
class teleportCfg {
		class gather_zone_jail {
			title = "Переместиться к зоне добычи";
			position[] = {2982.6,17806.5,0.00143814};
			time = 5;
		};
		
		class jail_block {
			title = "Переместиться в тюремный блок";
			position[] = {3006.4,17804.9,0.00143814};
			time = 5;
		};
		
		class playground {
			title = "Переместиться на спортивную площадку";
			position[] = {3004.74,17777.8,0.00143814};
			time = 5;
		};

		class entrance_imp {
			title = "Спуститься на базу";
			position[] = {15261.7,19136,0.00143814};
			time = 5;
		};

		class exit_imp {
			title = "Подняться на улицу";
			position[] = {15267.9,19142.8,49.9601};
			time = 5;
		};
};

class LifeCfgSpawnPoints {
	class RRpMap {
		class civ {
			
			class GovBase {
				displayName = "Усадьба Губернатора";
				spawnMarker = "gov_grp";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && (life_gov || license_admittance_goverment)";
			};
			class Pirgos {
				displayName = "Кавала (Столица)";
				spawnMarker = "Stolica_1";
				icon = "\rimas_pack\icons\city.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Atira {
				displayName = "Атира";
				spawnMarker = "Atira";
				icon = "\rimas_pack\icons\city.paa";
				conditions = "(life_firstTime OR life_newLife) AND !(player getVariable ['isBeginner',false])";
			};
			class Sofia {
				displayName = "София";
				spawnMarker = "Sofia";
				icon = "\rimas_pack\icons\city.paa";
				conditions = "(life_firstTime OR life_newLife) AND !(player getVariable ['isBeginner',false]) and ['WideTraveller'] call perk";
			};
			class DP11 {
				displayName = "Айос-Дионис";
				spawnMarker = "DP11";
				icon = "\rimas_pack\icons\city.paa";
				conditions = "(life_firstTime OR life_newLife) AND !(player getVariable ['isBeginner',false]) and ['WideTraveller'] call perk";
			};
			class Neochori {
				displayName = "Неохори";
				spawnMarker = "C_R";
				icon = "\rimas_pack\icons\city.paa";
				conditions = "(life_firstTime OR life_newLife) AND !(player getVariable ['isBeginner',false]) and ['WideTraveller'] call perk";
			};
			class Press {
				displayName = "База 7 News";
				spawnMarker = "press_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_press";
			};
			class Taxi {
				displayName = "Таксопарк (Кавала)";
				spawnMarker = "taxi_kavala_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_taxi";
			};
			class Taxi_spawn {
				displayName = "Таксопарк (ЦБ)";
				spawnMarker = "taxi_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_taxi";
			};
			class MC_spawn_3 {
				displayName = "Здание Суда";
				spawnMarker = "RRP_Judge_Spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_judge";
			};
			class blacksnow_spawn_m {
				displayName = "База Black Snow";
				spawnMarker = "blacksnow_spawn_m";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_blacksnow";
			};
			class inagawakai_spawn {
				displayName = "Поместье Inagawa Kai";
				spawnMarker = "inagawakai_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_inagawakai";
			};
			class cigane_spawn {
				displayName = "База Cigane";
				spawnMarker = "cigane_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_cigane";
			};
			class lacosanostra_spawn {
				displayName = "Поместье la cosa nostra";
				spawnMarker = "lacosanostra_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_lacosanostra";
			};
			class blackwolves_spawn {
				displayName = "Поместье Black Wolves";
				spawnMarker = "blackwolves_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_blackwolves";
			};
			class PremGRP_2_spawn {
				displayName = "Поместье PremGRP_2";
				spawnMarker = "PremGRP_2_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_PremGRP_2";
			};
			class PremGRP_3_spawn {
				displayName = "Поместье PremGRP_3";
				spawnMarker = "PremGRP_3_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_PremGRP_3";
			};
			class PremGRP_4_spawn {
				displayName = "Поместье PremGRP_4";
				spawnMarker = "PremGRP_4_spawn";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_PremGRP_4";
			};
			class flightshool_spawn {
				displayName = "Аэропорт(школа)";
				spawnMarker = "flightschool_airspawn_4";
				icon = "\rimas_pack\icons\base.paa";
				conditions = "license_flightschool_grp_1 OR license_flightschool_grp_3";
			};
			class Capital {
				displayName = "Столица бандитов";
				spawnMarker = "base_reb_1";
				icon = "\rimas_pack\icons\rebel.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb";
			};
			
			class Capital_Base {
				displayName = "Лагерь бандитов";
				spawnMarker = "base_reb_2";
				icon = "\rimas_pack\icons\rebel.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb";
			};


			class R_Sector_Spawn {
                displayName = "Поместье Sector";
                spawnMarker = "R_Sector_Spawn";
                icon = "\rimas_pack\icons\base.paa";
                conditions = "(life_firstTime OR life_newLife) && license_sector";
            };

			class R_Escobaro_Spawn {
                displayName = "Поместье La Escobaro Family";
                spawnMarker = "R_Escobaro_Spawn";
                icon = "\rimas_pack\icons\base.paa";
                conditions = "(life_firstTime OR life_newLife) && license_escobaro";
            };

			class RRP_Sumiyoshi_Spawn {
                displayName = "База Sumiyoshi Kai";
                spawnMarker = "RRP_Sumiyoshi_Spawn";
                icon = "\rimas_pack\icons\base.paa";
                conditions = "(life_firstTime OR life_newLife) && license_sumiyoshi";
            };
		};
		class reb {};
		class cop {
			class KPP_centr {
				displayName = "Центральный участок ПД";
				spawnMarker = "Cop_spawn";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
			};
			class grp_KPP {
				displayName = "КПП Кавала";
				spawnMarker = "grp_KPP";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
			};
			class Prison {
				displayName = "Тюрьма";
				spawnMarker = "spawn_jail";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
			};
		};
		class med {
			class Base_1 {
				displayName = "Больница в Кавале";
				spawnMarker = "base_hospital_1";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
			class Kavala {
				displayName = "Столица";
				spawnMarker = "Stolica_1";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};/*
			class Mike_228 {
				displayName = "Столица";
				spawnMarker = "Mike_228";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "(getPlayerUID player) isEqualTo '76561198075443139'";
			};
			class Atira {
				displayName = "Аэропорт";
				spawnMarker = "medic_spawn_2";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};*/
			class base_hospital_2 {
				displayName = "Пиргос";
				spawnMarker = "base_hospital_2";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
		};
	};
};