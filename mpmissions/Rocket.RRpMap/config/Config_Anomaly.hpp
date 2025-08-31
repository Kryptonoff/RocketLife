//Config_Anomaly.hpp
#define true 1
#define false 0
class LifeCfgAnomaly {
	debug = false;
	gasDamage = false; // Вкл/Вык Домаг от газа при входе в аномальную зону.
	particleDistance = 300; // Минимальная дистанция вывода визуальных эффектов аномалий в режим ожидания.
	triggerDistance = 300; // Расстояние на котором активируются триггера аномалий. Важный параметр который влияет на производительность так как триггер проверает условия присутствия в каждом кадре.
	boltAmmo = "FTM_Ammo_Bolt"; // Болты, для безопасной деактивации аномалий.
	gasMasks[] = {"RRP_RZ_Gas_Mask_1","RRP_RZ_Gas_Mask_2","RRP_RZ_Gas_Mask_3","RRP_RZ_Gas_Mask_4"}; //Список противогазов, для защиты от некоторых видов аномалий.
	uniform[] = {"RRPUniform_Anvil_01","RRPUniform_Anvil_02","RRPUniform_Anvil_03","RRP_RZ_Suit_01","RRP_RZ_Suit_02","RRP_RZ_Suit_03"}; //Список для защиты от радиации видов аномалий.
	unique[] = {"RRPUniform_Anvil_01","RRPUniform_Anvil_02","RRPUniform_Anvil_03","RRP_RZ_Suit_01","RRP_RZ_Suit_02","RRP_RZ_Suit_03"};
	detectorArtefactItems[] = {"ftmItem_det_medved","ftmItem_det_svarog","ftmItem_det_otklick"}; //Детектор, для поиска артефактов и аномалий.
	detectorAnomalyItems[] = {}; //Детектор, для поиска аномалий. (не используется пока что)
	detectorRadimetrItems[] = {"ftmItem_det_DBG06M","ftmItem_det_RKS20","ftmItem_det_MKS1009"}; //Радиметр, для измерения фоновоой радиации и для поиска аномалий.
	anomalyTapes[] = {
		"Springboard",
        "Springboard_invis",
		"Tramplin",
        "Tramplin_invis",
		"Meat_invis",
        "Skrimer_invis",
		"Gravi",
		//"Gravi_invis",
		"Radiation",
		"Electra",
        //"Electra_invis",
		"Electra_Big",
		"Electra_Shar",
		"Teleport",
		//"Teleport_invis",
		//"Teleport_v2",
		"Burner",
        //"Burner_invis",
		"Jarka",
		"Jarka_v2",
		//"Jarka_invis",
		//"Meat",
		"Buzz"
	};

	//Список техники на которой можно находиться в зоне.
	vehicles[] = {
	//	classname, condition
	  {"RRP_BTR90","true"},
	  {"RRP_BTR9023","true"},
	  {"RRPBoat_anvil_Karas","true"},
	  {"RRPHelicopter_anvil_hummingbird","true"},
	  {"RRP_RZ_Buran_1","true"},
	  {"RRP_RZ_Buran_2","true"},
	  {"RRP_RZ_Buran_3","true"}
	};

	class Detector {
		class ftmItem_det_otklick {
			detectTypes[] = {"Fatum_Artefact","fatum_anomaly_sound","AZ_CUTTER_SMALL"};
			detectRadius = 50;
			detectAngle = 30;
		};
		class ftmItem_det_medved {
			detectTypes[] = {"Fatum_Artefact","fatum_anomaly_sound","AZ_CUTTER_SMALL"};
			detectRadius = 100;
			detectAngle = 360;
		};
		class ftmItem_det_svarog {
			detectRadius = 70;
			detectAngle = 180;
			detectTypes[] = {"Fatum_Artefact","fatum_anomaly_sound","AZ_CUTTER_SMALL"};
		};
	};

	class Settings {
		//Пока тока часть настроек используется потом рализую все что бы было удобно настроивать.
		class default {
			spawnRandom = 150;
			damage = 0; // Урон аномалии
			damageTypeObject[] = {"Man","LandVehicle","Air"}; //Типы объектов, по которым аномалия может нанести урон
			damageRange = 4; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			damageDelay = 0; // Задержка перед нанесением урона
			damageOverTime = 0; // Постепенный урон аномалии
			damageOverTimeTick = 0; // Интервал с которым должен наноститься постепенный урон
			damageOverTimeTickCount = 1; // Количество интервалов, для постепенного урона
			reloadTime = 10; // Промежуток времени, после нанесения урона, во время которого аномалия не может быть активирована
			triggerRectangle = false;
			triggerArea[] = {4, 4, 4}; // 1 и 2 радиус 3 высота
			triggerStatements[] = {
				"this && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateDefault"
			};
			//{local (vehicle _x) && {isPlayer (vehicle _x)} && {alive (vehicle _x)}} count thislist > 0
		};

		class Burner: default {
			//spawnRandom = 25;
			spawnRandom = 200;
			damageRange = 5; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			damageOverTime = 0.35; // Постепенный урон аномалии
			damageOverTimeTick = 0.3; // Интервал с которым должен наноститься постепенный урон
			damageOverTimeTickCount = 3; // Количество интервалов, для постепенного урона
		};
		class Burner_invis: Burner {
			spawnRandom = 150;
		};
		class Jarka: Burner {
			spawnRandom = 300;//
		};
		class Jarka_v2: Burner {};
		class Jarka_invis: Burner {
			spawnRandom = 150;
		};
		class Buzz: default {
			damage = 0.50; // Урон аномалиии
			damageOverTime = 0.15; // Постепенный урон аномалии
			damageOverTimeTick = 0.3; // Интервал с которым должен наноститься постепенный урон
			damageOverTimeTickCount = 2; // Количество интервалов, для постепенного урона
			damageRange = 10; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			reloadTime = 0.05; // Промежуток времени, после нанесения урона, во время которого аномалия не может быть активирована
			triggerArea[] = {5, 5, 5}; // 1 и 2 радиус 3 высота
			triggerStatements[] = {
				"this && {!life_anomalyCooldown} && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateBuzz"
			};
		};
		class Electra: default {
			//spawnRandom = 25;
			spawnRandom = 200;
			damage = 1; // Урон аномалии
			damageDelay = 0.01; // Задержка перед нанесением урона
			damageRange = 5; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			triggerArea[] = {5, 5, 5}; // 1 и 2 радиус 3 высота
		};
		class Electra_Big: Electra {
			spawnRandom = 25;
			damageRange = 8; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			triggerArea[] = {7.5, 7.5, 7.5}; // 1 и 2 радиус 3 высота
		};
		class Electra_Shar: Electra {
			spawnRandom = 25;
			damageRange = 5; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			triggerArea[] = {5, 5, 5}; // 1 и 2 радиус 3 высота
		};
		class Electra_invis: Electra {
			spawnRandom = 150;
		};
		class Meat: default {
			spawnRandom = 25;
			damage = 1; // Урон аномалии
			damageDelay = 2; // Задержка перед нанесением урона
			damageRange = 4.5;
			triggerArea[] = {4, 4, 4}; // 1 и 2 радиус 3 высота
			triggerStatements[] = {
				"this && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateMeat"
			};
		};
		class Meat_invis: Meat {
			//spawnRandom = 150;
			spawnRandom = 300;
		};
		class Gravi: default {
			//spawnRandom = 25;
			spawnRandom = 200;
			damage = 1; // Урон аномалии
			damageDelay = 3.5; // Задержка перед нанесением урона
			damageRange = 6; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			triggerArea[] = {6, 6, 6}; // 1 и 2 радиус 3 высота
			triggerStatements[] = {
				"this && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateGravi"
			};
		};
		class Gravi_invis: Gravi {
			//spawnRandom = 150;
		};
		class Springboard: default {
			spawnRandom = 25;
			damage = 1; // Урон аномалии
			damageRange = 5; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			damageDelay = 0.3; // Задержка перед нанесением урона
			triggerArea[] = {5, 5, 5}; // 1 и 2 радиус 3 высота
			triggerStatements[] = {
				"this && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateSpringboard"
			};
		};
		class Springboard_sound: Springboard {};
		class Springboard_invis: Springboard {
			spawnRandom = 150;
		};
		class Tramplin: default {
			spawnRandom = 25;
			damage = 0.4; // Урон аномалии
			damageRange = 4.5; // Радиус  аномалии, в котороом наносится урон при активации аномалии
			damageDelay = 0.1; // Задержка перед нанесением урона
			triggerArea[] = {4, 4, 4}; // 1 и 2 радиус 3 высота
			triggerStatements[] = {
				"this && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateSpringboard"
			};
		};
		class Tramplin_invis: Tramplin {
			spawnRandom = 150;
		};
		class Teleport: default {
			spawnRandom = 10;
			damageDelay = 0.15; // Задержка перед нанесением урона
			damageRange = 3; // Радиус  аномалии, в котороом наносится урон при активации аномали
			triggerArea[] = {3, 3, 3};
			reloadTime = 99999; // Промежуток времени, после нанесения урона, во время которого аномалия не может быть активирована
			triggerStatements[] = {
				"this && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateTeleport"
			};
		};
		class Teleport_invis: Teleport {
			spawnRandom = 150;
		};
		class Teleport_v2: default {
			spawnRandom = 25;
			damageDelay = 0.15; // Задержка перед нанесением урона
			damageRange = 3; // Радиус  аномалии, в котороом наносится урон при активации аномали
			triggerArea[] = {3, 3, 3};
			triggerStatements[] = {
				"this && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateTeleport"
			};
		};
		class Teleport_v2_invis: Teleport_v2 {
			spawnRandom = 150;
		};
		class Skrimer: default {
			spawnRandom = 25;
			damage = 0.05; // Урон аномалии
			damageRange = 3; // Радиус  аномалии, в котороом наносится урон при активации аномали
			triggerArea[] = {3, 3, 3};
			triggerStatements[] = {
				"this && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateSkrimer"
			};
		};
		class Skrimer_invis: Skrimer {
			spawnRandom = 150;
			damage = 0.5; // Урон аномалии
			damageDelay = 0.05; // Задержка перед нанесением урона
		};
		class Radiation {
			spawnRandom = 150;
			triggerRectangle = false;
			triggerArea[] = {200,200,100}; // 1 и 2 радиус 3 высота
			triggerStatements[] = {
				"{local (vehicle _x) && {isPlayer (vehicle _x)} && {alive (vehicle _x)}} count thislist > 0 && {!life_radiationCooldown} && {!(thisTrigger getVariable ['anomaly_cooldown',false])}",
				"[thisTrigger,thisList] call client_anomaly_activateRadiation"
			};
		};
	};

	class Zones {
		class RRpMap {
			//NEW format
			positions[] = {
			// "_marker","_radius","_distance","_count","_positionMarker","_markerSize","_markerDir"
				{"anomaly_zone_1", 4500, 45, 2200, {3248.926,4275.581}, {4704.204,5083.592},108.664}
			};
		};
	};


	maxItems = 12; //Рандом, до скольки айтемов может быть найдено
	NightCoef = 2;  //В ночное время вещей спавнится больше, maxItems * NightCoef
	/*
		Шансы
		Arcane 3
		Legendary 7
		Mythical 10
		rare, 15
		uncommon, 25
		common 35

	*/
	//ВАЖНО!! Не прописывать патрики, они автоматом подтягиваются к оружию
	class HouseLootItems {
		class MilitaryLoot {
			items[] = {
				{"RRP_RZ_ASP_KIR","item","Arcane"},
				{"RRP_RZ_Artefact_09","item","Arcane"},
				{"RRP_RZ_Artefact_08","item","Arcane"},
				{"RRP_RZ_Artefact_07","item","Legendary"},
				{"RRP_RZ_Artefact_04","item","Legendary"},
				{"RRP_RZ_Artefact_03","item","Legendary"},
				{"RRP_RZ_Artefact_01","item","Legendary"},
				{"RRP_RZ_Artefact_06","item","rare"},
				{"RRP_RZ_Artefact_05","item","rare"},
				{"RRP_RZ_Artefact_02","item","rare"},
				{"RRP_RZ_Suit_03","item","rare"},
				{"RRP_RZ_Gas_Mask_2","item","rare"},
				{"RRP_RZ_Gas_Mask_3","item","rare"},
				{"RRP_RZ_Gas_Mask_4","item","rare"},
				{"arifle_MXC_F","item","Mythical"},
				{"arifle_Katiba_F","item","Mythical"},
				{"optic_MRCO","item","Mythical"},
				{"optic_ACO_grn","item","rare"},
				{"RRP_RZ_MSBS65_01","item","rare"},
				{"RRP_RZ_MSBS65_02","item","rare"},
				{"RRP_RZ_DMR_06_01","item","rare"},
				{"RRP_RZ_DMR_06_02","item","rare"},
				{"RRP_RZ_DMR_06_03","item","rare"},
				{"M4A1_PUSTIR","item","Mythical"},
				{"M4A1_VOLTEC","item","Mythical"},
				{"M4A1_MELLISK","item","Mythical"},
				{"M4A1_EMO","item","Mythical"},
				{"M4A1_MEL","item","Mythical"},
				{"M4A1_LESNIK","item","Mythical"},
				{"M4A1_BLOOD","item","Mythical"},
				{"M4A1_GHOST","item","Mythical"},
				{"AKM_ADIDAS_NPZ","item","Mythical"},
				{"AKM_VDOVEC_NPZ","item","Mythical"},
				{"AKM_KLACKS_NPZ","item","Mythical"},
				{"AKM_BODYA_NPZ","item","Mythical"},
				{"AKM_FACTOR_NPZ","item","Mythical"},
				{"AKM_VOLNA_NPZ","item","Mythical"},
				{"AKM_VISHNYA_NPZ","item","Mythical"},
				{"ftmItem_det_medved","item","Arcane"},
				//{"ftmItem_det_svarog","item","Arcane"},
				{"ftmItem_det_otklick","item","Mythical"},
				{"ftmItem_det_DBG06M","item","Mythical"},
				{"ftmItem_det_RKS20","item","Mythical"},
				{"ftmItem_det_MKS1009","item","Mythical"},
				{"DDOPP_X26","item","uncommon"},
				{"HandGrenade","item","rare"},
				{"FTM_Ammo_Bolt","item","common"},
				{"RRPbackpack_Anvil_ShieldBag_01","item","Mythical"},
				{"RRPbackpack_Anvil_ShieldBag_01","item","Mythical"},
				{"RRPbackpack_Anvil_ShieldBag_01","item","Mythical"},
				//{"I_shield_backpack_RRPw","item","Mythical"},
				//{"B_shield_backpack_RRPw","item","Mythical"},
				//{"O_shield_backpack_RRPw","item","Mythical"},
				//{"O_shield_backpack_GHEX_RRPw","item","Mythical"},
				{"arifle_Velko_RRPw","item","Mythical"},
				{"arifle_SLR_V_RRPw","item","Mythical"},
				{"arifle_SLR_V_GL_RRPw","item","Mythical"},
				{"arifle_SLR_GL_RRPw","item","Mythical"},
				{"1Rnd_40mm_HE_RRPw","item","Mythical"},
				{"1Rnd_50mm_Smoke_RRPw","item","Mythical"},
				{"1Rnd_40mm_HE_RRPw","item","Mythical"},
				{"arifle_Galat_RRPw","item","Mythical"}
			};
		};
		class CivilianLoot {
			items[] = {
				{"RRP_RZ_Artefact_06","item","Legendary"},
				{"RRP_RZ_Artefact_05","item","Legendary"},
				{"RRP_RZ_Artefact_02","item","Legendary"},
				{"Desert_Eagle","item","rare"},
				{"SMG_02_F","item","rare"},
				{"arifle_SDAR_F","item","rare"},
				{"hgun_PDW2000_F","item","rare"},
				{"hgun_esd_01_F","item","rare"},
				{"Skyline_Mosin9130_01_F","item","rare"},
				{"Skyline_Mosin9130_02_F","item","rare"},
				{"Skyline_Mosin9130_03_F","item","rare"},
				{"Skyline_Mosin9130_04_F","item","rare"},
				{"Skyline_Mosin9130_Bayonette_01_F","item","rare"},
				{"Skyline_Mosin9130_Bayonette_02_F","item","rare"},
				{"Skyline_Mosin9130_Bayonette_03_F","item","rare"},
				{"Skyline_Mosin9130_Bayonette_04_F","item","rare"},
				{"hgun_Pistol_heavy_01_F","item","rare"},
				{"hgun_ACPC2_F","item","rare"},
				{"KA_Glock_17_Single","item","rare"},
				{"KA_Glock_17","item","rare"},
				{"KA_Glock_18_Single","item","rare"},
				{"Skyline_MR96_01_F","item","rare"},
				{"hgun_P07_F","item","rare"},
				{"hgun_P07_khk_F","item","rare"},
				{"Skyline_pm73rak_01_F","item","rare"},
				{"hgun_Rook40_F","item","rare"},
				{"Skyline_B95_01_F","item","rare"},
				{"MeleeHatchet","item","uncommon"},
				{"MeleeKatana","item","uncommon"},
				{"MeleeHammer","item","uncommon"},
				{"MeleeHammer2","item","uncommon"},
				{"MeleeShovel","item","uncommon"},
				{"MeleeCrowbar","item","uncommon"},
				{"MeleeClub","item","uncommon"},
				{"KA_axe","item","uncommon"},
				{"KA_machete","item","uncommon"},
				{"KA_dagger","item","uncommon"},
				{"KA_knife","item","uncommon"},
				{"extItem_lockpick","item","common"},
				{"extItem_ducttape","item","common"},
				{"extItem_headBag","item","common"},
				{"extItem_bandage","item","common"},
				{"extItem_ItemRepairKit","item","common"},
				{"RRPItem_Canteen_Clean_F","item","common"},
				{"RRPItem_Canteen_Clean_C","item","common"},
				{"RRPItem_Canteen_Dirty_F","item","common"},
				{"RRPItem_Canteen_Dirty_C","item","common"},
				{"RRPItem_Canteen_Empty_L","item","common"},
				{"RRPItem_Container_Rabbit_Potato","item","common"},
				{"RRPItem_Container_Rooster_Potato","item","common"},
				{"RRPItem_Container_Rooster_Rice","item","common"},
				{"RRPItem_Container_Goat_Potato","item","common"},
				{"RRPItem_Container_Goat_Rice","item","common"},
				{"RRPItem_Container_Fin_Rice","item","common"},
				{"RRPItem_Container_Chicken_Rice","item","common"},
				{"RRPItem_Container_Sheep_Rice","item","common"},
				{"RRPItem_Container_Tuna_Potato","item","common"},
				{"RRPItem_Container_Tuna_Rice","item","common"},
				{"RRPItem_Container_CatShark_Rice","item","common"},
				{"RRPItem_Container_Salema_Potato","item","common"},
				{"RRPItem_Container_Salema_Rice","item","common"},
				{"FTM_Ammo_Bolt","item","common"}
			};
		};
		class MedicalLoot {
			items[] = {
				{"RRPItem_Jamb_F","item","rare"},
				{"RRPItem_Speedball_F","item","rare"},
				{"ftmItem_det_otklick","item","Mythical"},
				{"ftmItem_det_DBG06M","item","Mythical"},
				{"ftmItem_det_RKS20","item","Mythical"},
				{"ftmItem_det_MKS1009","item","Mythical"},
				//{"Medikit","item","rare"},
				{"RRP_RZ_Suit_01","item","rare"},
				{"RRP_RZ_Suit_02","item","rare"},
				{"RRP_RZ_Gas_Mask_1","item","rare"},
				{"extItem_ItemAdrenaline","item","common"},
				{"extItem_ItemSurgeryKit","item","common"},
				{"extItem_painkillers","item","common"},
				{"extItem_ItemMorphine","item","common"},
				{"RRPItem_jivchik_1","item","common"},
				{"RRPItem_flash","item","common"},
				{"RRPItem_cola","item","common"},
				{"RRPItem_pepsi","item","common"},
				{"RRPItem_perventiPills_1_1","item","common"},
				{"RRPItem_perventinSyringe","item","common"},
				{"FTM_Ammo_Bolt","item","common"}
			};
		};
		class Artefacts {
			items[] = {
				{"RRP_RZ_Artefact_04","item","Mythical"},
				{"RRP_RZ_Artefact_03","item","Mythical"},
				{"RRP_RZ_Artefact_02","item","rare"},
				{"RRP_RZ_Artefact_01","item","rare"}
			};
		};
		class EmptyDetector : Artefacts {}; //Триггер
        class Land_u_Shop_01_V1_F: CivilianLoot {}; // Дом с магазином (заброшенный)
		class Land_d_Shop_01_V1_F: CivilianLoot {}; // Магазин (разрушенный)
		class Land_u_Shop_02_V1_F: CivilianLoot {}; // Магазин (заброшенный)
		class Land_d_Shop_02_V1_F: CivilianLoot {}; // Магазин (разрушенный)
		class Land_i_Stone_Shed_V3_F: CivilianLoot {}; // Халупа мелкая
		class Land_i_Stone_Shed_V2_F: CivilianLoot {}; // Халупа мелкая
		class Land_i_Stone_Shed_V1_F: CivilianLoot {}; // Халупа мелкая
		class Land_d_Stone_Shed_V1_F: CivilianLoot {}; // Халупа мелкая (разрушенный)
		class Land_u_House_Small_01_V1_F: CivilianLoot {}; // Дом (заброшенный)
		class Land_d_House_Small_01_V1_F: CivilianLoot {}; // Дом (разрушенный)
		class Land_u_House_Small_02_V1_F: CivilianLoot {}; // Дом (маленький, заброшенный)
		class Land_d_House_Small_02_V1_F: CivilianLoot {}; // Дом (маленький, разрушенный)
		class Land_u_House_Big_01_V1_F: CivilianLoot {}; // Очень большой заброшенный дом 2этажа
		class Land_d_House_Big_01_V1_F: CivilianLoot {}; // Очень большой разрушенный дом 2этажа
		class Land_u_House_Big_02_V1_F: CivilianLoot {};  //Большой заброшенный дом 2этажа
		class Land_d_House_Big_02_V1_F: CivilianLoot {}; //Большой разрушенный дом 2этажа
		class Land_i_Stone_HouseBig_V1_F: CivilianLoot {}; // Каменный дом поебанный 2 этажа
		class Land_i_Stone_HouseBig_V2_F: CivilianLoot {}; // Каменный дом поебанный 2 этажа
		class Land_i_Stone_HouseBig_V3_F: CivilianLoot {}; // Каменный дом поебанный 2 этажа
        class Land_d_Stone_HouseBig_V1_F: CivilianLoot {}; // Каменный дом поебанный 2 этажа (разрушенный)
		class Land_i_Addon_03_V1_F: CivilianLoot {}; // Красивая беседка
		class Land_u_Addon_01_V1_F: CivilianLoot {}; // Беседка открытая
		class Land_u_Addon_02_V1_F: CivilianLoot {}; // Халупа заброшенная с выбитой дверью
		class Land_d_Addon_02_V1_F: CivilianLoot {}; // Халупа заброшенная с выбитой дверью (разрушенный)
		class Land_d_Stone_HouseSmall_V1_F: CivilianLoot {}; // Каменный дом (разрушенный)
		class Land_Metal_Shed_F: CivilianLoot {}; //Открытая мет. будка
		class Land_Slum_House01_F: CivilianLoot {}; //Маленький дер. дом
		class Land_Slum_House02_F: CivilianLoot {}; //Маленький дер. дом
		class Land_Slum_House03_F: CivilianLoot {}; //Маленький дер. дом
		class Land_Unfinished_Building_01_F: CivilianLoot {}; // Стройка
		class Land_Unfinished_Building_02_F: CivilianLoot {}; // Большая стройка
		class Land_LightHouse_F: CivilianLoot {}; // Маяк высокий
		class Land_Chapel_V1_F: CivilianLoot {}; // Часовня-церковь
		class Land_Chapel_Small_V1_F: CivilianLoot {}; // Часовня мелкая
		class Land_Cargo_House_V1_F: MilitaryLoot {}; // Зеленый контейнер
		class Land_Cargo_House_V2_F: MilitaryLoot {}; // Ржавый зеленый контейнер
		class Land_Cargo_Tower_V1_F: MilitaryLoot {}; // Вышка мелкая
		class Land_Cargo_Tower_V2_F: MilitaryLoot {}; // Вышка смерти ржавая
		//class Land_Сargo_House_Slum_F: default {}; // Домик из контейнера
		class Land_Research_house_V1_F: MedicalLoot {}; // Домик ученых
		class Land_Medevac_HQ_V1_F: MedicalLoot {}; // Домик ученых
		class Land_Cargo_HQ_V1_F: MilitaryLoot {}; // Штаб зеленый военный
		class Land_Cargo_HQ_V2_F: MilitaryLoot {}; // Штаб ржавый военный
		class Land_Cargo_Patrol_V1_F: MilitaryLoot {}; // Вышка мелкая
		class Land_Cargo_Patrol_V2_F: MilitaryLoot {}; // Вышка мелкая ржавая

		class Land_GuardHouse_02_F: MilitaryLoot {}; // Казарма военная
		class Land_Barracks_03_F: MilitaryLoot {}; // Казарма военная
		class Land_Barracks_04_F: MilitaryLoot {}; // Казарма военная
		class Land_Barracks_05_F: MilitaryLoot {}; // Казарма военная
		class Land_Barracks_06_F: MilitaryLoot {}; // Казарма военная
		class Land_Radar_01_HQ_F: MilitaryLoot {}; // Казарма военная
		class Land_MedicalTent_01_NATO_generic_inner_F: MilitaryLoot {}; // Казарма военная

		class Land_MilOffices_V1_F: CivilianLoot {};
		class Land_GarageRow_01_small_F: CivilianLoot {};
		class Land_GarageOffice_01_F: CivilianLoot {};
		class Land_GarageRow_01_large_F: CivilianLoot {};
		class Land_Radar_01_antenna_base_F: CivilianLoot {};
		class Land_Workshop_04_F: CivilianLoot {};
		class Land_FuelStation_Build_F: CivilianLoot {};

		class Land_MedicalTent_01_white_generic_inner_F: MedicalLoot {};
	};
	//наверное coming soon (но это не точно)
	//class Artefacts {};
};
