/*
Author(s):
Arrra (original)
*/

class LifeSettingCrafting {
	class CraftingTree {
		class Equipment {
		name = "Экипировка";
			class Hats {name = "Головные уборы";};
			class Masks {name = "Маски";};
			class Camo {name = "Камуфляжи";};
			class Clothes {name = "Верхняя одежда";};
			class Armors {name = "Бронежилеты";};
			class Backpacks {name = "Рюкзаки";};
			class Weapons {name = "Оружие";};
			class Sight {name = "Прицелы";};
			class HimProtection {name = "Химзащита";};
		};
		class Medecine {
		name = "Медицина";
			class Buffs {name = "Баффы";};
			class Medicaments {name = "Медикаменты";};
		};
		class Food {
		name = "Еда";
			class Water {name = "Вода";};
			class PlantProd {name = "Растительные продукты";};
			class Meat {name = "Мясо";};
			class Skinning {name = "Освежевание рыбы";};
			class Seafood {name = "Морепродукты";};
			class Complex {name = "Комплексные";};
		};
		class Other {
		name = "Прочее";
			class Electronics {name = "Электроника";};
			class SurvivalItems {name = "Выживание";};
			class IllegalItems {name = "Нелегал";};
			class Improvements {name = "Улучшения";};
			class Gathers {name = "Добыча";};
		};
	};

	vip1 = 15;
	vip2 = 20;
	vip3 = 35;
	vip4 = 50;
	vip5 = 60;
};

class LifeCfgRecipes {

	/*
		Default_01 : Маска (Одевается на слот шлема) из железа.
		Default_02 : Кепки/Шемаги/Шапки (Одеваются на слот шлема).
		Default_03 : Маска (Одевается на слот маски) из хлопка.
	*/
    class RRP_RZ_Suit_01 {
		finalItem = "RRP_RZ_Suit_01";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",30}};
		category = "HimProtection";
		conditions = "";
		conditionsMessage = "";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Химкостюм необходимый для защиты от радиации и некоторых видов аномалий";
	};
    class RRP_RZ_Suit_02:RRP_RZ_Suit_01 {
		finalItem = "RRP_RZ_Suit_02";
	};
	class RRP_RZ_Gas_Mask_1:RRP_RZ_Suit_01 {
        finalItem = "RRP_RZ_Gas_Mask_1";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Glass",2},{"virtual","RRP_Iron",4}};
		category = "HimProtection";
		conditions = "";
		conditionsMessage = "";
		timeAction = 15;
		requaredTools[] = {"extItem_hammer"};
		desctiption = "Противогаз необходимый для защиты от некоторых видов аномалий";
	};
	class RRP_RZ_Gas_Mask_2:RRP_RZ_Gas_Mask_1 {
		finalItem = "RRP_RZ_Gas_Mask_2";
	};
	class RRP_RZ_Gas_Mask_3:RRP_RZ_Gas_Mask_1 {
		finalItem = "RRP_RZ_Gas_Mask_3";
	};
	class RRP_RZ_Gas_Mask_4:RRP_RZ_Gas_Mask_1 {
		finalItem = "RRP_RZ_Gas_Mask_4";
	};
	/*
	class muzzle_snds_L {
		finalItem = "muzzle_snds_L";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",10}};
		category = "Weapons";
		conditions = "";
		conditionsMessage = "";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Глушитель 9мм";
	};
	class muzzle_snds_acp :muzzle_snds_L {};
	class arifle_mas_aks74u_c: muzzle_snds_L {
		finalItem = "arifle_mas_aks74u_c";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",5}};
		category = "Weapons";
		conditions = "";
		conditionsMessage = "";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Cлезоточивый газ";
	};
	*/
	class RRPsmokeShell
	{
		finalItem = "RRPsmokeShell";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",3}};
		category = "Weapons";
		conditions = "";
		conditionsMessage = "";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Дымовая шашка";
	};

	class RRPsmokeShellYellow : RRPsmokeShell {
		desctiption = "Дымовая шашка (Желтая)";
		finalItem = "RRPsmokeShellYellow";
	};
	class RRPsmokeShellGreen : RRPsmokeShell {
		desctiption = "Дымовая шашка (Зеленая)";
		finalItem = "RRPsmokeShellGreen";
	};
	class RRPsmokeShellRed : RRPsmokeShell {
		desctiption = "Дымовая шашка (Красная)";
		finalItem = "RRPsmokeShellRed";
	};
	class RRPsmokeShellOrange : RRPsmokeShell {
		desctiption = "Дымовая шашка (Оранжевая)";
		finalItem = "RRPsmokeShellOrange";
	};
	class RRPsmokeShellPurple : RRPsmokeShell {
		desctiption = "Дымовая шашка (Фиолетовая)";
		finalItem = "RRPsmokeShellPurple";
	};
	class RRPsmokeShellBlue : RRPsmokeShell {
		desctiption = "Дымовая шашка (Синяя)";
		finalItem = "RRPsmokeShellBlue";
	};

	// Улучшения
	 class RRP_Craft_DefaultImp
	 {
	 	amount = 1;
	 	typeItem = "Physical";
	 	category = "Improvements";
	 	conditions = "('med' call RRPClient_groups_getSideLevel) >= 1";
	 	conditionsMessage = "";
	 	timeAction = 2;

	 };
	 class RRPItem_adacBox: RRP_Craft_DefaultImp
	 {
	 	displayName = "Ящик";
	 	finalItem = "RRPItem_adacBox";
	 	recipe[] = {{"virtual","RRP_Iron",2}};
	 	requaredTools[] = {"extItem_hammer"};
	 	desctiption = "Контейнер для ресурсов на 100 слотов.";
	 };
	 class RRPItem_adacNitro: RRP_Craft_DefaultImp
	 {
	 	displayName = "Нитро";
	 	finalItem = "RRPItem_adacNitro";
	 	recipe[] = {{"virtual","RRP_ClearGasolin",2}};
	 	requaredTools[] = {"extItem_wrench"};
	 	desctiption = "Закись азота — кратковременно ускоряет ваш автомобиль.";
	 };
	 class RRPItem_GPSTracker: RRP_Craft_DefaultImp
	 {
	 	displayName = "GPS-трекер";
	 	finalItem = "RRPItem_GPSTracker";
	 	recipe[] = {{"virtual","RRP_Palladium_Ref",2}};
	 	requaredTools[] = {"extItem_saw"};
	 	desctiption = "GPS метка, которая позволяет отслеживать технику по карте.";
	 };
	 /* ПОТОМ ВЕРНУТЬ
	 class RRPItem_AntiStole: RRP_Craft_DefaultImp
	 {
	 	displayName = "Анти-перебивка";
	 	finalItem = "RRPItem_AntiStole";
	 	recipe[] = {{"virtual","RRP_Scandium",1}};
	 	requaredTools[] = {"extItem_hammer"};
	 	desctiption = "Это улучшение не позволит вору перебить вашу технику.";
	 };
	 */
	 // ВРЕМЕННО
	 class RRPItem_AntiStole: RRP_Craft_DefaultImp
	 {
	 	displayName = "Анти-перебивка";
	 	finalItem = "RRPItem_AntiStole";
	 	recipe[] = {{"virtual","RRP_Treasure_1",2}};
	 	requaredTools[] = {"extItem_hammer"};
	 	desctiption = "Это улучшение не позволит вору перебить вашу технику.";
	 };
	 //
	 class RRPItem_SeatBelt: RRP_Craft_DefaultImp
	 {
	 	displayName = "Ремни безопасности";
		finalItem = "RRPItem_SeatBelt";
	 	recipe[] = {{"virtual","RRP_Cotton",2}};
	 	requaredTools[] = {"extItem_rope"};
		desctiption = "Это улучшение спасет вашу жизнь в трудную минуту.";
	 };

	// Головные уборы
	class Default_01
	{
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",10}};
		category = "Hats";
		conditions = "";
		conditionsMessage = "";
		timeAction = 5;
		requaredTools[] = {"extItem_hammer", "extItem_knife", "extItem_rope"};
		desctiption = "";
	};
	class RRP_Craft_Hats_1:Default_01 {finalItem = "aot_mask_alien";};
	class RRP_Craft_Hats_2:Default_01 {finalItem = "aot_mask_angrysm";};
	class RRP_Craft_Hats_3:Default_01 {finalItem = "aot_mask_bfskarl";};
	class RRP_Craft_Hats_4:Default_01 {finalItem = "aot_mask_bfs";};
	class RRP_Craft_Hats_5:Default_01 {finalItem = "aot_mask_bionicle";};
	class RRP_Craft_Hats_6:Default_01 {finalItem = "aot_mask";};
	class RRP_Craft_Hats_7:Default_01 {finalItem = "aot_mask_clemc";};
	class RRP_Craft_Hats_8:Default_01 {finalItem = "aot_mask_t_desert";};
	class RRP_Craft_Hats_9:Default_01 {finalItem = "aot_mask_devilscartel";};
	class RRP_Craft_Hats_10:Default_01 {finalItem = "aot_mask_f_blue";};
	class RRP_Craft_Hats_11:Default_01 {finalItem = "aot_mask_f_green";};
	class RRP_Craft_Hats_12:Default_01 {finalItem = "aot_mask_f_red";};
	class RRP_Craft_Hats_13:Default_01 {finalItem = "aot_mask_grumpy";};
	class RRP_Craft_Hats_14:Default_01 {finalItem = "aot_mask_japanese";};
	class RRP_Craft_Hats_15:Default_01 {finalItem = "aot_mask_line";};
	class RRP_Craft_Hats_16:Default_01 {finalItem = "aot_mask_mouth";};
	class RRP_Craft_Hats_17:Default_01 {finalItem = "aot_mask_rio";};
	class RRP_Craft_Hats_18:Default_01 {finalItem = "aot_mask_salem";};
	class RRP_Craft_Hats_19:Default_01 {finalItem = "aot_mask_spawn";};
	class RRP_Craft_Hats_20:Default_01 {finalItem = "aot_mask_t_steel";};
	class RRP_Craft_Hats_21:Default_01 {finalItem = "aot_mask_t_wood";};

	class G_RegulatorMask_F {
		amount = 1;
		finalItem = "G_RegulatorMask_F";
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",30},{"virtual","RRP_Scandium",10}};
		category = "Masks";
		conditions = "";
		conditionsMessage = "";
		timeAction = 5;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Эта маска эффективно защищают от слезоточивого газа и других раздражителей слизистой ";
	};
	class Skyline_GasMask : G_RegulatorMask_F {finalItem = "Skyline_GasMask";};
	class Skyline_Glasses_Masque_GP5_01_F : G_RegulatorMask_F {finalItem = "Skyline_Glasses_Masque_GP5_01_F";};
	class KA_MCU : G_RegulatorMask_F {finalItem = "KA_MCU";};

	class Default_02
	{
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",15}};
		finalItem = "H_ShemagOpen_khk";
		category = "Hats";
		conditions = "";
		conditionsMessage = "";
		timeAction = 5;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "";
	};
	class RRP_Craft_Hats_32:Default_02 {finalItem = "H_ShemagOpen_tan";};
	class RRP_Craft_Hats_33:Default_02 {finalItem = "H_Shemag_olive";};
	class RRP_Craft_Hats_34:Default_02 {finalItem = "H_Hat_camo";};

	// Маски
	class Default_03
	{
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",10}};
		category = "Masks";
		conditions = "";
		conditionsMessage = "";
		timeAction = 5;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "";
	};
	/*
	class RRP_Craft_Mask_1:Default_03 {finalItem = "T_HoodACUBLK";};
	class RRP_Craft_Mask_2:Default_03 {finalItem = "T_HoodBDUBLK";};
	class RRP_Craft_Mask_3:Default_03 {finalItem = "T_HoodBlkBLK";};
	class RRP_Craft_Mask_4:Default_03 {finalItem = "T_HoodMDBLK";};
	class RRP_Craft_Mask_5:Default_03 {finalItem = "T_HoodODBLK";};
	class RRP_Craft_Mask_6:Default_03 {finalItem = "T_HoodTanBlk";};
	class RRP_Craft_Mask_7:Default_03 {finalItem = "T_HoodMWBLK";};
	class RRP_Craft_Mask_8:Default_03 {finalItem = "G_Blindfold_01_white_F";};
	class RRP_Craft_Mask_9:Default_03 {finalItem = "G_Blindfold_01_black_F";};
*/
	class RPP_Craft_Mask_0
	{
		amount = 1;
		finalItem = "rrp_wrench";
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",60}};
		category = "Masks";
		conditions = "";
		conditionsMessage = "";
		timeAction = 25;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "";
	};

	// Прочее
	/*
	class RRP_Craft_Tape
	{
		finalItem = "extItem_Itemducttype";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",5}};
		category = "IllegalItems";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5-й уровень игрока.";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Клейкая лента - с помощью ленты ты сможешь заклеить любые предметы, например чьи то руки.";
	};
	*/
	class RRP_Craft_Hammer
	{
		finalItem = "extItem_hammer";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",2}};
		category = "SurvivalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Этот инструмент является обязательным для крафта некоторых предметов.";
	};
	class RRP_Craft_Rope
	{
		finalItem = "extItem_rope";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",2}};
		category = "SurvivalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Этот инструмент является обязательным для крафта некоторых предметов.";
	};
	class RRP_Craft_Saw
	{
		finalItem = "extItem_saw";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Nickel",2}};
		category = "SurvivalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Этот инструмент является обязательным для крафта некоторых предметов.";
	};
	/*
	class RRP_Craft_Wrench
	{
		finalItem = "extItem_wrench";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Nickel",2}};
		category = "SurvivalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Этот инструмент является обязательным для крафта некоторых предметов.";
	};
	*/
	class RRP_Craft_Wrench
	{
		finalItem = "extItem_wrench";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Silver",2}};
		category = "SurvivalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Этот инструмент является обязательным для крафта некоторых предметов.";
	};

	// Прицелы
	class RRP_Craft_Holosight
	{
		finalItem = "optic_Holosight";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Glass",5}, {"virtual","RRP_Iron",7}};
		category = "Sight";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 14)";
		conditionsMessage = "Для крафта Вам нужен 15 уровень игрока.";
		timeAction = 25;
		requaredTools[] = {};
		desctiption = "Этот прицел может быть установлен на большое количество оружия.";
	};
	class RRP_Craft_ACO_SMG
	{
		finalItem = "optic_Aco_smg";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Glass",5}, {"virtual","RRP_Iron",7}};
		category = "Sight";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 14)";
		conditionsMessage = "Для крафта Вам нужен 15 уровень игрока.";
		timeAction = 25;
		requaredTools[] = {};
		desctiption = "Этот прицел может быть установлен на большое количество оружия.";
	};
	class RRP_Craft_ACO_SMG_GRN
	{
		finalItem = "optic_ACO_grn_smg";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Glass",5}, {"virtual","RRP_Iron",7}};
		category = "Sight";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 14)";
		conditionsMessage = "Для крафта Вам нужен 15 уровень игрока.";
		timeAction = 25;
		requaredTools[] = {};
		desctiption = "Этот прицел может быть установлен на большое количество оружия.";
	};
	class RRP_Craft_ACO
	{
		finalItem = "optic_Aco";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Glass",5}, {"virtual","RRP_Iron",7}};
		category = "Sight";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 14)";
		conditionsMessage = "Для крафта Вам нужен 15 уровень игрока.";
		timeAction = 25;
		requaredTools[] = {};
		desctiption = "Этот прицел может быть установлен на большое количество оружия.";
	};
	class RRP_Craft_ACO_GRN
	{
		finalItem = "optic_ACO_grn";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Glass",5}, {"virtual","RRP_Iron",7}};
		category = "Sight";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 14)";
		conditionsMessage = "Для крафта Вам нужен 15 уровень игрока.";
		timeAction = 25;
		requaredTools[] = {};
		desctiption = "Этот прицел может быть установлен на большое количество оружия.";
	};

	// Медицина
	/*
	class RRP_Craft_Bandage
	{
		finalItem = "extltem_bandage";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",2}};
		category = "Medicaments";
		conditions = "";
		conditionsMessage = "";
		timeAction = 10;
		requaredTools[] = {};
		desctiption = "Этот предмет остановит любое кровотечение.";
	};
	*/
	class RRP_Craft_Surgerykit
	{
		finalItem = "extItem_ItemSurgerykit";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",6}, {"Physical","extItem_ItemMorphine",1}, {"Physical","extItem_bandage",6}};
		category = "Medicaments";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5 уровень игрока.";
		timeAction = 60;
		requaredTools[] = {};
		desctiption = "Хирургический набор - на скорую руку сгодится, чтобы оказать себе первую мед. помощь";
	};

	// Оружие
	/*
	class RRP_Craft_Weapon_Taizer
	{
		finalItem = "DDOPP_X26";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",3}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5 уровень игрока.";
		timeAction = 120;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Нелегальный предмет для самообороны. Говорят, что он на ходу остановит даже коня.";
	};
	class RRP_Craft_Weapon_Taizer_Ammo
	{
		finalItem = "DDOPP_1Rnd_X26";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",1}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5 уровень игрока.";
		timeAction = 10;
		requaredTools[] = {};
		desctiption = "Картриджи к тайзеру.";
	};
	*/
	class RRP_Craft_Weapon_Taizer
	{
		finalItem = "DDOPP_X26";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Treasure_1",5},{"virtual","RRP_Iron",10}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5 уровень игрока.";
		timeAction = 120;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Нелегальный предмет для самообороны. Говорят, что он на ходу остановит даже коня.";
	};
	class RRP_Craft_Weapon_Taizer_Ammo
	{
		finalItem = "DDOPP_1Rnd_X26";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",5}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5 уровень игрока.";
		timeAction = 10;
		requaredTools[] = {};
		desctiption = "Картриджи к тайзеру.";
	};
	/*
	class RRP_Craft_Weapon_Mosin
	{
		finalItem = "Skyline_Mosin9130_01_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",9}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 70;
		requaredTools[] = {"extItem_hammer", "extItem_saw"};
		desctiption = "С этой винтовки стрелял твой прадед.";
	};
	class RRP_Craft_Weapon_Mosin_Ammo
	{
		finalItem = "5Rnd_762x54_Mosin";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",2}, {"virtual","RRP_Coal",2}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 5;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Патроны к Mosin";
	};
	*/
	/*
	class RRP_Craft_Weapon_Blaser
	{
		finalItem = "Skyline_B95_01_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",8}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 70;
		requaredTools[] = {"extItem_hammer", "extItem_saw"};
		desctiption = "Охотничий карабин Blaser B95.";
	};
	class RRP_Craft_Weapon_Blaser_Noir:RRP_Craft_Weapon_Blaser {finalItem = "Skyline_B95_03_F";};
	class RRP_Craft_Weapon_Blaser_Vert:RRP_Craft_Weapon_Blaser {finalItem = "Skyline_B95_02_F";};
	class RRP_Craft_Weapon_Blaser_Ammo
	{
		finalItem = "2Rnd_B95_Mag";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",1}, {"virtual","RRP_Coal",1}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 5;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Патроны к Blaser";
	};
	*/
	class RRP_Craft_Weapon_SDAR
	{
		finalItem = "arifle_SDAR_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Palladium_Ref",15}, {"virtual","RRP_Iron",5}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 75;
		requaredTools[] = {"extItem_hammer", "extItem_saw", "extItem_wrench"};
		desctiption = "Винтовка, которая специально разработанна для стрельбы как на суше, так и под водой.";
	};
	class RRP_Craft_Weapon_SDAR_Ammo
	{
		finalItem = "20Rnd_556x45_UW_mag";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Palladium_Ref",5}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Патроны к SDAR.";
	};
	/*
	class RRP_Craft_Weapon_UMP
	{
		finalItem = "Skyline_UMP45_01_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",8}, {"virtual","RRP_Yashma",8}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 19)";
		conditionsMessage = "Для крафта Вам нужен 20 уровень игрока.";
		timeAction = 150;
		requaredTools[] = {"extItem_hammer"};
		desctiption = "Хороший и сбалансированный ствол, чтобы взять его на дело.";
	};
	class RRP_Craft_Weapon_UMP_Ammo
	{
		finalItem = "25Rnd_45ACP_Mag";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",2}, {"virtual","RRP_Yashma",2}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 19)";
		conditionsMessage = "Для крафта Вам нужен 20 уровень игрока.";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Патроны к UMP45.";
	};
	*/
	/*
	class RRP_Craft_Weapon_AKU_Green
	{
		finalItem = "RRPWeapon_AK12U_SAND";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Titan",5}, {"virtual","RRP_Silver",5}, {"virtual","RRP_Scandium",2}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 180;
		requaredTools[] = {"extItem_hammer", "extItem_saw", "extItem_wrench"};
		desctiption = "Мощный и редкий ствол, способный остановить легко-бронированную технику.";
	};
	class RRP_Craft_Weapon_AKU_Green_Ammo
	{
		finalItem = "30rnd_762x39_AK12_Lush_Mag_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Malachit",5}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Патроны к AKU.";
	};
	class RRP_Craft_Weapon_AKU_Sand
	{
		finalItem = "RRPWeapon_AK12U_GREEN";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Titan",5}, {"virtual","RRP_Silver",5}, {"virtual","RRP_Scandium",2}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 180;
		requaredTools[] = {"extItem_hammer", "extItem_saw", "extItem_wrench"};
		desctiption = "Мощный и редкий ствол, способный остановить легко-бронированную технику.";
	};
	class RRP_Craft_Weapon_AKU_Sand_Ammo
	{
		finalItem = "30rnd_762x39_AK12_Arid_Mag_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Amber",3}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Патроны к AKU.";
	};
	class RRP_Craft_Weapon_AUG
	{
		finalItem = "Skyline_AugA1_01_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Topaz",5}, {"virtual","RRP_Scandium",2}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 150;
		requaredTools[] = {"extItem_hammer", "extItem_saw", "extItem_wrench"};
		desctiption = "Это оружие является контрабандой из Австрии. Имеет встроенный прицел и стабилизирующую рукоятку.";
	};
	class RRP_Craft_Weapon_AUG_Ammo
	{
		finalItem = "30Rnd_556x45_Stanag";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Iron",5}};
		category = "Weapons";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 15;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Патроны к AUG A1.";
	};
	*/
	// Мафиозник
	class RRP_Craft_Cloth_1
	{
		finalItem = "EF_suit_3";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",15}};
		category = "Clothes";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5 уровень игрока.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Мафиозник""";
	};
	class RRP_Craft_Cap_1
	{
		finalItem = "Skyline_HeadGear_Cowboy_05_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",10}};
		category = "Hats";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5 уровень игрока.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Мафиозник""";
	};
	class RRP_Craft_Backpack_80
	{
		finalItem = "B_AssaultPack_blk";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",6}, {"virtual","RRP_Iron",5}};
		category = "Backpacks";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 4)";
		conditionsMessage = "Для крафта Вам нужен 5 уровень игрока. Имеет 80 слотов под ресурсы.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Мафиозник""";
	};

	// Измученный нефтяник
	class RRP_Craft_Cloth_2
	{
		finalItem = "Skyline_Character_U_CivilD_01_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",10}, {"virtual","RRP_Gasolin",4}};
		category = "Clothes";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Измученный нефтяник""";
	};
	/*
	class RRP_Craft_Armor_2
	{
		finalItem = "TAC_EI_RRV1_RG";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",17}, {"virtual","RRP_Gasolin",2}, {"virtual","RRP_Iron",5}, {"virtual","RRP_Yashma",7}};
		category = "Armors";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Измученный нефтяник""";
	};
	*/
	class RRP_Craft_Cap_2
	{
		finalItem = "H_Construction_basic_yellow_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",5}, {"virtual","RRP_Gasolin",8}};
		category = "Hats";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Измученный нефтяник""";
	};
	class RRP_Craft_Backpack_100
	{
		finalItem = "B_Carryall_cbr";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",6}, {"virtual","RRP_Gasolin",6}, {"virtual","RRP_Iron",7}};
		category = "Backpacks";
		conditions = "(missionNamespace getVariable [""VRP_Level"",1] > 9)";
		conditionsMessage = "Для крафта Вам нужен 10 уровень игрока.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Измученный нефтяник"". Имеет 100 слотов под ресурсы.";
	};

	// Серьезный малый
	class RRP_Craft_Cloth_3
	{
		finalItem = "EF_MKJKT2";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",15}};
		category = "Clothes";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 19)";
		conditionsMessage = "Для крафта Вам нужен 20 уровень игрока.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Серьезный малый""";
	};
	/*
	class RRP_Craft_Armor_3
	{
		finalItem = "TAC_Punisher_Vest_BK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",17}, {"virtual","RRP_Iron",5}, {"virtual","RRP_Yashma",10}};
		category = "Armors";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 19)";
		conditionsMessage = "Для крафта Вам нужен 20 уровень игрока.";
		timeAction = 2;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Входит в комплект ""Серьезный малый""";
	};
	*/
	// Камуфляжи
	/*
	class RRP_Craft_Camo_GRN_1
	{
		finalItem = "TRYK_H_ghillie_top_green";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",10}, {"virtual","RRP_Scandium",5}, {"virtual","RRP_Palladium_Ref",5}};
		category = "Camo";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 300;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Стандартный маскхалат";
	};
	class RRP_Craft_Camo_GRN_2
	{
		finalItem = "TRYK_H_ghillie_top_headless_green";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",5}, {"virtual","RRP_Scandium",5}, {"virtual","RRP_Mithril",5}, {"virtual","RRP_Palladium_Ref",5}};
		category = "Camo";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 300;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Стандартный маскхалат (без головного убора)";
	};
	class RRP_Craft_Camo_YLW_1
	{
		finalItem = "TRYK_H_ghillie_top";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",10}, {"virtual","RRP_Scandium",10}, {"virtual","RRP_Mithril",5}, {"virtual","RRP_Palladium_Ref",5}};
		category = "Camo";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 300;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Стандартный маскхалат";
	};
	class RRP_Craft_Camo_YLW_2
	{
		finalItem = "TRYK_H_ghillie_top_headless";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cotton",5}, {"virtual","RRP_Scandium",5}, {"virtual","RRP_Mithril",5}, {"virtual","RRP_Palladium_Ref",5}};
		category = "Camo";
		conditions = "((missionNamespace getVariable [""VRP_Level"",1] > 29)";
		conditionsMessage = "Для крафта Вам нужен 30 уровень игрока.";
		timeAction = 300;
		requaredTools[] = {"extItem_knife", "extItem_rope"};
		desctiption = "Стандартный маскхалат (без головного убора)";
	};
	*/
	/*
	class extItem_lockpick
	{
		finalItem = "extItem_lockpick";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",2}};
		category = "IllegalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Обычная отмычка - с ее помощью можно взламывать замки в транспортных средствах";
	};
	*/
	class extItem_lockpick
	{
		finalItem = "extItem_lockpick";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Treasure_1",1},{"virtual","RRP_Iron",1}};
		category = "IllegalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Обычная отмычка - с ее помощью можно взламывать замки в транспортных средствах";
	};
	class extItem_grinder
	{
		finalItem = "extItem_grinder";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Treasure_1",1},{"virtual","RRP_Iron",1}};
		category = "IllegalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Болгарка - спиливает замки на зданиях, следите за перегревом!";
	};
	class extItem_drillAku
	{
		finalItem = "extItem_drillAku";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Treasure_1",1},{"virtual","RRP_Iron",1}};
		category = "IllegalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Дрель - с ее помощью можно просверлить замок в некоторых зданиях";
	};
	class RRPmag_atmCard
	{
		finalItem = "RRPmag_atmCard";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Treasure_1",1},{"virtual","RRP_Treasure_6",1}};
		category = "IllegalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 30;
		requaredTools[] = {};
		desctiption = "Карта для взлома - с ее помощью можно хакнуть банкомат и забрать деньги";
	};
	class RRPWeapon_empGun
	{
		finalItem = "RRPWeapon_empGun";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Treasure_1",10},{"virtual","RRP_Palladium_Ref",10}};
		category = "Electronics";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "EMP - пушка. Создает электромагнитный импульс, которым повреждает топливную систему вертолета.";
	};

	class RRPMagazines_empCharge
	{
		finalItem = "RRPMagazines_empCharge";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Treasure_1",1},{"virtual","RRP_Palladium_Ref",2}};
		category = "Electronics";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Заряд для EMP - пушки";
	};

	class hgun_esd_01_F
	{
		finalItem = "hgun_esd_01_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",5}};
		category = "Electronics";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Спектрально устройство которое отображает излучения различных устройств и техники и показывает его диапазон";
	};
	class muzzle_antenna_01_f
	{
		finalItem = "muzzle_antenna_01_f";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",2}};
		category = "Electronics";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Обнаруживает объекты в диапазоне 10-99Гц";
	};

	class muzzle_antenna_02_f
	{
		finalItem = "muzzle_antenna_02_f";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",3}};
		category = "Electronics";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Обнаруживает объекты в диапазоне 100-499Гц";
	};

	class muzzle_antenna_03_f
	{
		finalItem = "muzzle_antenna_03_f";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Scandium",4}};
		category = "Electronics";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Обнаруживает объекты в диапазоне 500-999Гц";
	};

	class RRPItem_Apple_Red
	{
		finalItem = "RRPItem_Apple_Red";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Apple",1}};
		category = "PlantProd";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Что бы создать этот предмет, вам необходимо яблоко, который можно собрать в яблоневом саду";
	};

/*
	Ниже написаны рецепты на рыбу
	Сюда влючены рецепты на освеживаине рыбы, а так же на ее приготовление
	Рецепты с тегом RAW - это что мы получаем после крафта словленой рыбины
	Рецепты с тегом Ck  - это то что мы получаем после крафта предмета с тегом RAW

	Цепочка: Ловим рыбку -> освеживаем -> жарим -> кушаем
*/

	class RRPItem_Roll_Tuna_F
	{
		finalItem = "RRPItem_Roll_Tuna_F";
		amount = 8;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Rice",4}, {"Physical","RRPItem_Tuna_RAW",8}};
		category = "Seafood";
		conditions = "";
		conditionsMessage = "";
		timeAction = 5;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для приготовления роллов вам необходимо использовать нож.";
		profession = "";
	};
	class RRPItem_Sushi_Tuna_F
	{
		finalItem = "RRPItem_Sushi_Tuna_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Rice",4}, {"Physical","RRPItem_Tuna_RAW",1}};
		category = "Seafood";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для приготовления суши вам необходимо использовать нож.";
		profession = "";
	};
	class RRPItem_Roll_Skumbria_F
	{
		finalItem = "RRPItem_Roll_Skumbria_F";
		amount = 8;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Rice",4}, {"Physical","RRPItem_Mackrel_RAW",8}};
		category = "Seafood";
		conditions = "";
		conditionsMessage = "";
		timeAction = 5;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для приготовления роллов вам необходимо использовать нож.";
		profession = "";
	};
	class RRPItem_Sushi_Skumbria_F
	{
		finalItem = "RRPItem_Sushi_Skumbria_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Rice",4}, {"Physical","RRPItem_Mackrel_RAW",1}};
		category = "Seafood";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для приготовления суши вам необходимо использовать нож.";
		profession = "";
	};
	class RRPItem_Tuna_RAW
	{
		finalItem = "RRPItem_Tuna_RAW";
		amount = 12;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Tuna_F",1}};
		category = "Skinning";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для разделывания рыбы вам необходимо использовать нож.";
		profession = "";
	};

	class RRPItem_Tuna_CK
	{
		finalItem = "RRPItem_Tuna_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Tuna_RAW",1}};
		category = "Seafood";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной рыбы вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_CatShark_RAW
	{
		finalItem = "RRPItem_CatShark_RAW";
		amount = 8;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_CatShark_F",1}};
		category = "Skinning";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для разделывания рыбы вам необходимо использовать нож.";
		profession = "";
	};

	class RRPItem_CatShark_CK
	{
		finalItem = "RRPItem_CatShark_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_CatShark_RAW",1}};
		category = "Seafood";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной рыбы вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_Salema_RAW
	{
		finalItem = "RRPItem_Salema_RAW";
		amount = 6;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Salema_F",1}};
		category = "Skinning";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для разделывания рыбы вам необходимо использовать нож.";
		profession = "";
	};

	class RRPItem_Salema_CK
	{
		finalItem = "RRPItem_Salema_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Salema_RAW",1}};
		category = "Seafood";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной рыбы вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_Mullet_RAW
	{
		finalItem = "RRPItem_Mullet_RAW";
		amount = 5;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Mullet_F",1}};
		category = "Skinning";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для разделывания рыбы вам необходимо использовать нож.";
		profession = "";
	};

	class RRPItem_Mullet_CK
	{
		finalItem = "RRPItem_Mullet_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Mullet_RAW",1}};
		category = "Seafood";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной рыбы вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_Ornate_RAW
	{
		finalItem = "RRPItem_Ornate_RAW";
		amount = 4;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Ornate_F",1}};
		category = "Skinning";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для разделывания рыбы вам необходимо использовать нож.";
		profession = "";
	};

	class RRPItem_Ornate_CK
	{
		finalItem = "RRPItem_Ornate_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Ornate_RAW",1}};
		category = "Seafood";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной рыбы вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_Mackrel_RAW
	{
		finalItem = "RRPItem_Mackrel_RAW";
		amount = 4;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Mackrel_F",1}};
		category = "Skinning";
		conditions = "";
		conditionsMessage = "";
		timeAction = 2;
		requaredTools[] = {"extItem_knife"};
		desctiption = "Для разделывания рыбы вам необходимо использовать нож.";
		profession = "";
	};

	class RRPItem_Mackrel_CK
	{
		finalItem = "RRPItem_Mackrel_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Mackrel_RAW",1}};
		category = "Seafood";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "";
		profession = "";
	};

/*
	Ниже написаны рецепты на мясо
	Сюда влючены рецепты на освеживаине рыбы, а так же на ее приготовление
	Рецепты с тегом RAW - это что мы получаем после крафта словленой рыбины
	Рецепты с тегом Ck  - это то что мы получаем после крафта предмета с тегом RAW

	Цепочка: Нахотим тушь -> Освеживаем тушь -> жарим -> кушаем
*/
	/*class RRPItem_Turtle_Ck
	{
		finalItem = "RRPItem_Turtle_Ck";
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Turtle_RAW",1}};
		category = "Meat";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной черепахи вам потребуется находится у костра.";
		profession = "";
	};
	*/
	class RRPItem_Rooster_CK
	{
		finalItem = "RRPItem_Rooster_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Rooster_RAW",1}};
		category = "Meat";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной петушатины вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_Goat_CK
	{
		finalItem = "RRPItem_Goat_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Goat_RAW",1}};
		category = "Meat";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 2;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной козлятины вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_Chicken_CK
	{
		finalItem = "RRPItem_Chicken_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Chicken_RAW",1}};
		category = "Meat";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 1;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной курицы вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_Sheep_CK
	{
		finalItem = "RRPItem_Sheep_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Sheep_RAW",1}};
		category = "Meat";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 1;
		requaredTools[] = {};
		desctiption = "Для приготовления жареной баранины вам потребуется находится у костра.";
		profession = "";
	};

	class RRPItem_Rabbit_CK
	{
		finalItem = "RRPItem_Rabbit_CK";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Rabbit_RAW",1}};
		category = "Meat";
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
		timeAction = 1;
		requaredTools[] = {};
		desctiption = "Для приготовления кролика вам потребуется находится у костра.";
		profession = "";
	};

	/* Вода */

	/* Чистая вода */
    class RRPItem_Canteen_01
	{
		finalItem = "RRPItem_Canteen_Clean_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Canteen_Empty_L",1}};
		category = "Water";
		conditions = "player distance nearestObject [player, 'Land_Water_source_F'] < 4";
		conditionsMessage = "Вы должны находиться рядом с водокачкой";
		timeAction = 5;
		requaredTools[] = {};
		desctiption = "Для пополнения флаги Вы должны находиться рядом с водокачкой";
		profession = "";
	};
	/* Пресная вода */
    class RRPItem_Canteen_02: RRPItem_Canteen_01
	{
		finalItem = "RRPItem_Canteen_Dirty_F";
		recipe[] = {{"Physical","RRPItem_Canteen_Empty_L",1}};
		conditions = "getPosASL player select 2 < 0";
		conditionsMessage = "Вы должны находиться рядом с источником воды";
		desctiption = "Для пополнения флаги Вы должны находиться рядом с источником воды";
	};
	/* Очистка воды */
    class RRPItem_Canteen_03: RRPItem_Canteen_01
	{
		finalItem = "RRPItem_Canteen_Clean_F";
		recipe[] = {{"Physical","RRPItem_Canteen_Dirty_F",1}};
		conditions = "[getPosATL player, 5] call RRPClient_system_isFireNear";
		conditionsMessage = "Вы должны находиться рядом с костром";
		desctiption = "Для очистки флаги Вы должны находиться рядом с костром";
	};

	/* Комплексные обеды */

    class RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Rabbit_Potato";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Rabbit_CK",1},{"virtual","RRP_Potato",5}};
		category = "Complex";
		conditions = "";
		conditionsMessage = "";
		timeAction = 1;
		requaredTools[] = {};
		desctiption = "";
		profession = "";
	};
	class RRPItem_Container_Rabbit_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Rabbit_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Rabbit_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Rooster_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Rooster_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Rooster_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Goat_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Goat_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Goat_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Goat_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Goat_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Goat_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Fin_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Fin_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Fin_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Fin_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Fin_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Fin_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Chicken_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Chicken_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Chicken_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Chicken_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Chicken_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Chicken_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Sheep_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Sheep_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Sheep_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Sheep_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Sheep_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Sheep_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Tuna_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Tuna_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Tuna_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Tuna_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Tuna_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Tuna_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_CatShark_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_CatShark_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_CatShark_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_CatShark_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_CatShark_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_CatShark_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Salema_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Salema_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Salema_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Salema_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Salema_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Salema_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Mullet_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Mullet_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Mullet_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Mullet_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Mullet_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Mullet_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Ornate_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Ornate_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Ornate_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Ornate_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Ornate_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Ornate_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};
	class RRPItem_Container_Mackrel_Potato: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Mackrel_Potato";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Mackrel_CK",1},{"virtual","RRP_Potato",5}};
		desctiption = "";
	};
	class RRPItem_Container_Mackrel_Rice: RRPItem_Container_Rabbit_Potato
	{
		finalItem = "RRPItem_Container_Mackrel_Rice";
		recipe[] = {{"Physical","RRPItem_Container",1},{"Physical","RRPItem_Mackrel_CK",1},{"virtual","RRP_Rice",5}};
		desctiption = "";
	};

	class RRPItem_Jamb_F
	{
		finalItem = "RRPItem_Jamb_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Cigarette", 1},{"virtual","RRP_Hemp", 10}};
		category = "Buffs";
		conditions = "";
		conditionsMessage = "";
		timeAction = 3;
		requaredTools[] = {};
		desctiption = "Будет очень полезен во многих ситуациях, но может вызвать зависимость.";
		profession = "";
	};
	class RRPItem_Speedball_F: RRPItem_Jamb_F
	{
		finalItem = "RRPItem_Speedball_F";
		recipe[] = {{"virtual","RRP_Heroin", 5},{"virtual","RRP_Cocaine", 5}};
	};

	class extItem_ItemDetoxin
	{
		finalItem = "extItem_ItemDetoxin";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Nephritis", 4}};
		category = "Buffs";
		conditions = "player call getSide == 'med'";
		conditionsMessage = "Вы должны быть сотрудником МЧС";
		timeAction = 1;
		requaredTools[] = {};
		desctiption = "";
		profession = "";
	};

	class RRPItem_Bafaut_F
	{
		finalItem = "RRPItem_Bafaut_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Nephritis", 5}};
		category = "Buffs";
		conditions = "player call getSide == 'med'";
		conditionsMessage = "Вы должны быть сотрудником МЧС";
		timeAction = 1;
		requaredTools[] = {};
		desctiption = "";
		profession = "";
	};
	class RRPItem_Omega_F
	{
		finalItem = "RRPItem_Omega_F";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"virtual","RRP_Opium", 5},{"virtual","RRP_Cocaine_Leaf", 5}};
		category = "Buffs";
		conditions = "player call getSide == 'med'";
		conditionsMessage = "Вы должны быть сотрудником МЧС";
		timeAction = 1;
		requaredTools[] = {};
		desctiption = "";
		profession = "";
	};


	/*Антирадин 10 мин в радиации*/
	/*Детоксин Снимает любую зависимость*/
	/*Бафауты отключает стамину на 5 мин, нет зависимости*/

/*
Прочее-выживание
*/
	class extItem_campFire
	{
		finalItem = "extItem_campFire";
		amount = 1;
		typeItem = "Physical";
		recipe[] = {{"Physical","extItem_woodenLog", 1},{"Physical","extItem_matches",1}};
		category = "SurvivalItems";
		conditions = "";
		conditionsMessage = "";
		timeAction = 3;
		requaredTools[] = {};
		desctiption = "Применяется для приготовление пищи.";
		profession = "";
	};

};
