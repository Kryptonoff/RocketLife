#define true 1
#define false 0

/*
	TODO

	НУЖНО ВЫБРАТЬ КРАСИВЫЕ МЕСТА ГДЕ БУДУТ ЭТИ САМЫЕ КРУГИ
*/

class LifeCfgArcheology {

	conditions = ""; //условия необходимые для БОНУСА при добыче ресурсов (подумать что)
	zonesCount = 5; //сколько зон спаунится за раз при нажатии на initItem
	initItem = "extItem_metalDetector"; //предмет, который запускает всю херню
	workItem = "Extremo_Tool_Shovel"; //предмет, которым надо ДОБЫВАТЬ (лопата в нашем случае)
	spawnItem[] = {"plp_cts_WeathCrateBigBrown"}; //предмет, который появляется на месте раскопки "EXT_ArcObject_Vase"

	class ArcheologyItems {
		class plp_cts_WeathCrateBigBrown {
			items[] = {
				{ {"Skyline_Mosin9130_01_F"}, 17 },
				{ {"Skyline_Mosin9130_02_F"}, 17 },
				{ {"Skyline_Mosin9130_03_F"}, 17 },
				{ {"Skyline_Mosin9130_04_F"}, 17 },
				{ {"Skyline_B95_01_F"}, 17 },
				{ {"Skyline_B95_02_F"}, 17 },
				{ {"Skyline_B95_03_F"}, 17 },
				{ {"RRPItem_JeamBean_F"}, 15 },
				{ {"RRPItem_Jamb_F"}, 15 },
				{ {"RRPItem_Speedball_F"}, 15 },
				{ {"RRP_RZ_Suit_03"}, 10 },
				{ {"RRP_RZ_Gas_Mask_1"}, 10 },
				{ {"HandGrenade"}, 5 },
				{ {"RRPWeapon_empGun"}, 5 },
				{ {"ftmItem_det_medved"}, 2 }
			};
			virtualItems[] = {
				{ { {"RRP_Treasure_2",3} }, 35 },
				{ { {"RRP_Treasure_1",11} }, 25 },
				{ { {"RRP_Potato",3} }, 20 },
				{ { {"RRP_Bread",1} }, 20 },
				{ { {"RRP_Coal",17} }, 20 },
				{ { {"RRP_Iron",12} }, 20 },
				{ { {"RRP_Treasure_6",7} }, 18 },
				{ { {"RRP_Nephritis",8} }, 15 },
				{ { {"RRP_Titan",14} }, 10 },
				{ { {"RRP_Topaz",12} }, 10 },
				{ { {"RRP_Sapphire",15} }, 6 },
				{ { {"RRP_Sapphire",15} }, 6 },
				{ { {"RRP_Treasure_10",17} }, 5 },
				{ { {"RRP_Scandium",5} }, 5 },
				{ { {"RRP_Treasure_10",25} }, 3 },

				{ { {"money",5000} }, 25 },
				{ { {"money",7500} }, 20 },
				{ { {"money",10000} }, 15 },
				{ { {"money",15000} }, 10 },
				{ { {"money",25000} }, 5 },
				{ { {"money",30000} }, 2 }
			};
			recipes[] = {};
		};
	};

	class ArcheologyZones {
		class RRpMap {
			class arch_z1 {
				position[] = {6161.44,13633.7,0}; //центр окружности
				radius = 100; //радиус окружности
				count = 3; //кол-во раскопок в одном маркере
			};
			class arch_z_2: arch_z1 {
				position[] = {4324.44,18971.8,0};
			};
			class arch_z_3: arch_z1 {
				position[] = {7690.3,20293,0};
			};
			class arch_z_4: arch_z1 {
				position[] = {11869.4,17704.9,0};
			};
			class arch_z_5: arch_z1 {
				position[] = {11089.4,21483.2,0};
			};
			class arch_z_6: arch_z1 {
				position[] = {10126.1,8651.04,0};
			};
			class arch_z_7: arch_z1 {
				position[] = {18660.6,8984,0};
			};
			class arch_z_8: arch_z1 {
				position[] = {18335.3,11798,0};
			};
			class arch_z_9: arch_z1 {
				position[] = {6510,21518,0};
			};
			class arch_z_10: arch_z1 {
				position[] = {6490,17400,0};
			};
			class arch_z_11: arch_z1 {
				position[] = {8037,15178,0};
			};
			class arch_z_12: arch_z1 {
				position[] = {11097,15329,0};
			};
			class arch_z_13: arch_z1 {
				position[] = {13220.9,21529,0};
			};
			class arch_z_14: arch_z1 {
				position[] = {6386,20331,0};
			};
			class arch_z_15: arch_z1 {
				position[] = {6262,11164.5,0};
			};
			class arch_z_16: arch_z1 {
				position[] = {4196,10633,0};
			};
			class arch_z_17: arch_z1 {
				position[] = {8687,10757,0};
			};
			class arch_z_18: arch_z1 {
				position[] = {10418.1,7863.78,0};
			};
			class arch_z_19: arch_z1 {
				position[] = {12400,8177,0};
			};
			class arch_z_20: arch_z1 {
				position[] = {11174,9727.1,0};
			};
			class arch_z_21: arch_z1 {
				position[] = {13560,15579,0};
			};
			class arch_z_22: arch_z1 {
				position[] = {13885,20386,0};
			};
			class arch_z_23: arch_z1 {
				position[] = {15518.8,19974,0};
			};
			class arch_z_24: arch_z1 {
				position[] = {16641.6,18550.9,0};
			};
			class arch_z_25: arch_z1 {
				position[] = {19759.3,16128,0};
			};
			class arch_z_26: arch_z1 {
				position[] = {17288,17634,0};
			};
			class arch_z_27: arch_z1 {
				position[] = {18631.5,17647.5,0};
			};
			class arch_z_28: arch_z1 {
				position[] = {20049.4,14398.9,0};
			};
			class arch_z_29: arch_z1 {
				position[] = {21066,13820,0};
			};
			class arch_z_30: arch_z1 {
				position[] = {20554.2,13125.1,0};
			};
			class arch_z_31: arch_z1 {
				position[] = {16562,10804,0};
			};
			class arch_z_32: arch_z1 {
				position[] = {17267.6,9652.25,0};
			};
			class arch_z_33: arch_z1 {
				position[] = {20881,8323,0};
			};
			class arch_z_34: arch_z1 {
				position[] = {19678.4,9829.61,0};
			};
			class arch_z_35: arch_z1 {
				position[] = {20800.4,10976.6,0};
			};
			class arch_z_36: arch_z1 {
				position[] = {18068,13931,0};
			};
			class arch_z_37: arch_z1 {
				position[] = {23485.8,16604.7,0};
			};
			class arch_z_38: arch_z1 {
				position[] = {22808.4,17603.1,0};
			};
			class arch_z_39: arch_z1 {
				position[] = {22886.3,21984.9,0};
			};
			class arch_z_40: arch_z1 {
				position[] = {23842.4,22758.8,0};
			};
			class arch_z_41: arch_z1 {
				position[] = {25135,23061,0};
			};
			class arch_z_42: arch_z1 {
				position[] = {26240,22508,0};
			};
			class arch_z_43: arch_z1 {
				position[] = {24611,19689,0};
			};
			class arch_z_44: arch_z1 {
				position[] = {27765,21918,0};
			};
			class arch_z_45: arch_z1 {
				position[] = {26576,24165,0};
			};
		};
	};
};