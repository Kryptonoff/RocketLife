/**
 * Imported by rrp_3den plugin
 * Created by: FairyTale
 */

class ConfigNpc
{
	// Обучение
	class RRP_NPC_Edu_Start
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{287.668, 30318.3, 3.12644},{0.095672, 0.995413, 0},{0, 0, 1}};
		animations[] = {"HubWave_move1","HubWave_move2","Acts_hubTalk_waveHand1","Acts_hubTalk_waveHand2","Acts_hubTalk_waveHand3"};
		face = "asczHead_austin_A3";
		loadout[] = {{},{},{"Skyline_tl122_jaune","","","",{},{},""},{"U_Marshal",{}},{},{},"H_Construction_headset_vrana_F","",{"rrp_tablet","","","",{},{},""},{"","I_E_UavTerminal","tf_anprc154","","PartyPack",""}};
		name = "Джеймс Кирк";
		description = "Первый кого ты встретил";
		startDialog = "RRPDialog_NPC_Edu_Start";
		icon = "";
		condition = "(0 in (player getVariable [""rrpvar_questsList"",[0,0,0,0,0,0,0,0]]))";
	};

    /* Скупщики */

    /* Наркодилер */
	class NPC_Buyer_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{17602.8, 18913.3, 1.29896},{-0.948628, -0.316394, 0},{0, 0, 1}};
		animations[] = {"Acts_SittingJumpingSaluting_loop3"};
		face = "WhiteHead_12";
		loadout[] = {{"Skyline_AKS_Rail_01_F","","","",{"30Rnd_762x39_AKM",30},{},""},{},{},{"U_I_C_Soldier_Bandit_1_F",{{"30Rnd_762x39_AKM",3,30}}},{"RRP_vest_2_4",{}},{},"Skyline_HeadGear_Cowboy_05_F","G_Spectacles_Tinted",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Райан Блэкберн";
		description = "«Делец, занимающийся оптовым сбытом наркотиков, является главным по массовой торговли наркотиками по всему острову»";
		startDialog = "RRP_Dialog_NPC_1_1";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	/* Нефть */
    class NPC_Buyer_2
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{16550.7, 12387.8, 2.12006},{-0.0623725, 0.998053, 0},{0, 0, 1}};
		animations[] = {"Acts_Taking_Cover_From_Jets_in_loop"};
		face = "WhiteHead_17";
		loadout[] = {{},{},{},{"U_C_ConstructionCoverall_Blue_F",{{"29rnd_300BLK_STANAG",3,30}}},{},{},"H_Construction_basic_black_F","G_Respirator_blue_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Шон Ньютон";
		description = "«Скупает бензин а после развозит по другим островам. Может не стоит ему продавать?»";
		startDialog = "RRP_Dialog_NPC_2_1";
		icon = "\RRP_icons\Farm\Oil.paa";
		condition = "true";
	};
	/* Кирпич */
    class NPC_Buyer_3
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{23260.1, 20046.1, 14.056},{-0.707625, -0.706588, 0},{0, 0, 1}};
		animations[] = {"Acts_Commenting_On_Fight_loop"};
		face = "asczHead_murphy_A3";
		loadout[] = {{},{"Extremo_Tool_Shovel","","","",{},{},""},{},{"U_C_ConstructionCoverall_Red_F",{{"29rnd_300BLK_STANAG",3,30}}},{"V_Safety_orange_F",{}},{},"H_Construction_earprot_red_F","G_Respirator_white_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Чад Робертсон";
		description = "«Кажется он хочет достроить Miners в Кавале, но ему не хватает кирпичей. Куда они постоянно деваются?»";
		startDialog = "RRP_Dialog_NPC_3_1";
		icon = "\RRP_icons\Farm\Brick.paa";
		condition = "true";
	};
	/* Горнорудка/Минералы */
    class NPC_Buyer_4
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{22009.5, 21199.2, 56.6301},{-0.0566406, 0.998395, 0},{0, 0, 1}};
		animations[] = {"Acts_Taking_Cover_From_Jets_in_loop"};
		face = "asczHead_redfield_A3";
		loadout[] = {{},{"MeleePickaxe","","","",{},{},""},{},{"U_C_Blouson_Brun",{{"20Rnd_762x51_Fal",3,20}}},{},{"B_Carryall_cbr",{}},"H_Hat_grey","murshun_cigs_cig2",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Шаун Дэвис";
		description = "«Коллекционирует разную руду и минералы, но об этом мало кому известно. Является главным поставщиком камня на острове»";
		startDialog = "RRP_Dialog_NPC_4_1";
		icon = "\RRP_icons\Farm\Corundum.paa";
		condition = "true";
	};
	/* Отмывка */
    class NPC_Buyer_5
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{22733.2, 13840.3, 2.20378},{0.902863, -0.429928, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_14";
		loadout[] = {{"Skyline_AKS_Rail_01_F","","acc_pointer_IR","optic_ACO_grn",{"30Rnd_762x39_AKM",30},{},""},{},{},{"U_BG_Guerilla2_2",{{"30Rnd_762x39_AKM",2,30}}},{"V_PlateCarrier1_rgr",{{"30Rnd_762x39_AKM",1,30}}},{},"","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Дуглас Дэвис";
		description = "«Помогает скрыть истинный источник дохода. А может сливает информацию FBI?»";
		startDialog = "RRP_Dialog_NPC_5_1";
		icon = "\RRP_icons\NPC\RRP_Icon_Trade.paa";
		condition = "true";
	};
	/* Палладий */
    class NPC_Buyer_6
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{14164.1, 21266.5, 77.3987},{-0.212297, -0.977205, 0},{0, 0, 1}};
		animations[] = {"Acts_Accessing_Computer_Loop"};
		face = "asczHead_josephe_A3";
		loadout[] = {{},{},{},{"U_C_CBRN_Suit_01_White_F",{}},{},{},"","G_RegulatorMask_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Александер Скотт";
		description = "«Ученый, который прибыл для исследования палладия. Будьте осторожны, его охраняют военные»";
		startDialog = "RRP_Dialog_NPC_6_1";
		icon = "\RRP_icons\Farm\Palladium.paa";
		condition = "true";
	};
	/* Стекло */
    class NPC_Buyer_7
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{15766.7, 10652, 26.0866},{-0.566536, -0.824037, 0},{0, 0, 1}};
		animations[] = {"Acts_Accessing_Computer_Loop"};
		face = "WhiteHead_03";
		loadout[] = {{},{},{},{"U_C_Poloshirt_redwhite",{}},{},{},"H_Hat_brown","G_Spectacles_Tinted",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Энди Уокер";
		description = "«Скупает большими партиями стеклотары и гонит в них самогон»";
		startDialog = "RRP_Dialog_NPC_7_1";
		icon = "\RRP_icons\Farm\Glass.paa";
		condition = "true";
	};
	/* Хлеб */
    class NPC_Buyer_8
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{21550.1, 16260.7, 18.2885},{-0.558514, -0.829495, 0},{0, 0, 1}};
		animations[] = {"HubSittingChairUC_idle3"};
		face = "asczHead_vlk_A3";
		loadout[] = {{},{},{},{"U_C_Uniform_Farmer_01_F",{}},{},{},"H_Hat_Safari_sand_F","G_Squares",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Дональд Кирби";
		description = "«Занимается скупкой хлеба в большом количестве, а после поставляет в магазины»";
		startDialog = "RRP_Dialog_NPC_8_1";
		icon = "\RRP_icons\Farm\Bread.paa";
		condition = "true";
	};
	/* Спички */
    class NPC_Buyer_9
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{19342, 16537.7, 20.6068},{0.864205, 0.503141, 0},{0, 0, 1}};
		animations[] = {"Exile_RouletteSitting01_Animation01"};
		face = "asczHead_josephe_A3";
		loadout[] = {{},{},{},{"U_C_Uniform_Scientist_02_formal_F",{}},{},{"B_CivilianBackpack_01_Everyday_Vrana_F",{}},"rds_Villager_cap3","immersion_pops_pop0",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Грир Уильямс";
		description = "«Покупает спички а после продает в своем ларьке»";
		startDialog = "RRP_Dialog_NPC_9_1";
		icon = "\RRP_icons\Farm\Matches.paa";
		condition = "true";
	};
	/* Фрукты */
    class NPC_Buyer_10
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3408.85, 14139, 12.8252},{-0.0642189, 0.997936, 0},{0, 0, 1}};
		animations[] = {"Acts_Accessing_Computer_Loop"};
		face = "Fem_1";
		loadout[] = {{},{},{},{"EF_FEM_4_7R",{}},{},{},"EF_FHcap_W","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Луиза Спаньоли";
		description = "«Занимается перепродажей фруктов в холодных странах»";
		startDialog = "RRP_Dialog_NPC_10_1";
		icon = "\RRP_icons\virtItems\apple.paa";
		condition = "true";
	};
	/* Коллекционер */
    class NPC_Buyer_11
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9269.43, 12646, 17.1214},{0.966475, -0.256762, 0},{0, 0, 1}};
		animations[] = {"Exile_RouletteSitting01_Animation01"};
		face = "asczHead_plumber_A3";
		loadout[] = {{},{},{},{"U_I_C_Soldier_Bandit_5_F",{}},{"V_G_Ceinturon",{}},{},"H_Hat_grey","murshun_cigs_cig0",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Шарль Кэмпбелл";
		description = "«Старьевщик, который любит коллекционировать драгоценные предметы»";
		startDialog = "RRP_Dialog_NPC_11_1";
		icon = "\RRP_icons\Farm\Scrap.paa";
		condition = "true";
	};
	/* Охота */
    class NPC_Buyer_12
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{8395.85, 20019.8, 54.9152},{0.998451, 0.0556473, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "Barklem";
		loadout[] = {{"Skyline_Mosin9130_01_F","","","",{"5Rnd_762x54_Mosin",5},{},""},{},{},{"U_C_HunterBody_grn",{{"5Rnd_762x54_Mosin",2,5}}},{},{},"H_Hat_brown","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джекоб Джонсон";
		description = "«Управляющий охотничьих угодий, который может выкупить шкуры животных»";
		startDialog = "RRP_Dialog_NPC_12_1";
		icon = "\RRP_icons\Farm\AnimalSkin.paa";
		condition = "true";
	};
    class NPC_Buyer_13
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{23230.7, 21857.8, 33.031},{-0.81446, -0.58022, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "asczHead_sokolov_A3";
		loadout[] = {{"Skyline_Mosin9130_01_F","","","",{"5Rnd_762x54_Mosin",5},{},""},{},{},{"U_C_E_LooterJacket_01_F",{{"5Rnd_762x54_Mosin",1,20}}},{},{},"H_Booniehat_khk","murshun_cigs_cig0",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Ивэн О'Коннор";
		description = "«Управляющий охотничьих угодий, который может выкупить шкуры животных»";
		startDialog = "RRP_Dialog_NPC_13_1";
		icon = "\RRP_icons\Farm\AnimalSkin.paa";
		condition = "true";
	};
	/* Тюрьма */
    class NPC_Buyer_14
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{2936.31, 17807.5, 49.5811},{0.854616, 0.51926, 0},{0, 0, 1}};
		animations[] = {"Acts_CivilIdle_1"};
		face = "WhiteHead_05";
        loadout[] = {{},{},{},{"mgsr_robe_olive_muddy",{}},{},{},"mgsr_eyepatch","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Уильям Филипс";
		description = "«Знаменитый кольщик, набивает тюремные наколки, а также скупает чернила»";
		startDialog = "RRP_Dialog_NPC_14_1";
		icon = "\RRP_icons\Farm\Ink.paa";
		condition = "true";
	};
	/* Гребешки */
    class NPC_Buyer_15
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{17754, 16848.4, 57.9264},{-0.30536, -0.952237, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_05";
        loadout[] = {{},{},{},{"U_I_L_Uniform_01_tshirt_olive_F",{{"5Rnd_762x54_Mosin",3,13}}},{"V_SmershVest_01_radio_F",{}},{},"H_Bandanna_camo","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джефф Сноуи";
		description = "«Скупает мясо гребешков, которое после поставляет знатным буржуям»";
		startDialog = "RRP_Dialog_NPC_15_1";
		icon = "";
		condition = "true";
	};

	/* Торговцы (обычные) */

    class NPC_Seller_Clothing
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3700.01, 13119.1, 4.50621},{-6.04789e-006, -0.982477, -0.186385},{0, -0.186385, 0.982477}};
		animations[] = {"PLP_AA_actspercmstpsnonwnondnon_marianq_tvstudioman_disapearlostblend_enableFire"};
		face = "GreekHead_A3_07";
		loadout[] = {{},{},{},{"U_C_Poloshirt_redwhite",{}},{},{},"H_Hat_grey","",{},{"","","","","",""}};
		name = "Джейк Уайт";
		description = "«Завсегдатые его бутика поговаривают, что когда-то он одевал самого Губернатора»";
		startDialog = "RRP_NPC_Seller_Clothing";
		icon = "\RRP_icons\NPC\RRP_Icon_Clothing.paa";
		condition = "true";
	};
	class NPC_Seller_Clothing_2: NPC_Seller_Clothing
	{
		objPosition[] = {{12859.5, 16692.1, 82.4925},{-0.910794, 0.41286, 0},{0, 0, 1}};
		animations[] = {"Acts_hubTalk_crackNuckles3"};
		face = "asczHead_nevim_A3";
		name = "Оливер Келли";
	};
	class NPC_Seller_Clothing_3: NPC_Seller_Clothing
	{
		objPosition[] = {{16602.6, 12697.2, 13.7579},{0.807963, -0.589233, 0},{0, 0, 1}};
		face = "AfricanHead_01";
		name = "Оливер Тэйлор";
	};
	class NPC_Seller_Clothing_4: NPC_Seller_Clothing
	{
		objPosition[] = {{14046.6, 18814.4, 24.0066},{-0.50604, -0.86251, 0},{0, 0, 1}};
		face = "WhiteHead_02";
		name = "Мэтью Байх";
	};
	class NPC_Seller_Clothing_Girl
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3699.31, 13118.6, 8.30347},{0.999733, 0.0230885, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_actspercmstpsnonwnondnon_marianq_tvstudioman_disapearlostblend_enableFire"};
		face = "Fem_2";
		loadout[] = {{},{},{},{"EF_FEM_10A_BWK",{}},{},{},"","",{},{"","","","","",""}};
		name = "Милла Тернер";
		description = "«Местная модница, таскает одежду из Вьетнама, но всех уверяет что из Италии»";
		startDialog = "RRP_NPC_Seller_Clothing_Girl";
		icon = "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa";
		condition = "true";
	};
	class NPC_Seller_Clothing_Girl_2: NPC_Seller_Clothing_Girl
	{
		objPosition[] = {{12857, 16687.2, 82.4925},{-0.910794, 0.41286, 0},{0, 0, 1}};
		animations[] = {"Acts_hubTalk_stretchBody3"};
		name = "Лия Келли";
	};
	class NPC_Seller_Clothing_Girl_3: NPC_Seller_Clothing_Girl
	{
		objPosition[] = {{16601.4, 12694.3, 17.6619},{0.588499, 0.808498, 0},{0, 0, 1}};
		name = "Шарли Дорган";
	};
	class NPC_Seller_Clothing_Girl_4: NPC_Seller_Clothing_Girl
	{
		objPosition[] = {{14043.1, 18815.4, 27.9108},{0.878059, -0.478553, 0},{0, 0, 1}};
		name = "Эбби Дорган";
	};
	class NPC_Seller_Medic
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3711.11, 13118.3, 4.56538},{0.0137703, -0.999905, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "ZULU_BRIEF_08";
		loadout[] = {{},{},{},{"Rimas_EMS_Doctor3",{}},{},{},"Rimas_EMS_Bandana_W","G_Respirator_white_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Колин Кирби";
		description = "«В прошлом выпускник Медицинской Академии, а ныне владелец сети аптек»";
		startDialog = "RRP_NPC_Seller_Medic";
		icon = "\RRP_icons\NPC\RRP_Icon_Medic.paa";
		condition = "true";
	};
	class NPC_Seller_Medic_2: NPC_Seller_Medic
	{
		objPosition[] = {{12863.3, 16700.8, 82.4035},{-0.916004, 0.40117, 0},{0, 0, 1}};
		face = "asczHead_olson_A3";
		name = "Чад О'Брайан";
	};
	class NPC_Seller_Medic_3: NPC_Seller_Medic
	{
		objPosition[] = {{16723, 12758.5, 19.436},{-0.84385, 0.536579, 0},{0, 0, 1}};
		face = "WhiteHead_15";
		name = "Дэниэл Мерфи";
	};
	class NPC_Seller_Medic_4: NPC_Seller_Medic
	{
		objPosition[] = {{25731.5, 21350.6, 20.7895},{-0.721198, -0.692729, 0},{0, 0, 1}};
		face = "AfricanHead_02";
		name = "Кори Байх";
	};
	class NPC_Seller_Medic_5: NPC_Seller_Medic
	{
		objPosition[] = {{14037.5, 18819.7, 23.9677},{-0.419976, -0.907535, 0},{0, 0, 1}};
		face = "asczHead_mctavish_A3";
		name = "Льюис Моррис";
	};
	class NPC_Seller_Gun
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3667.25, 13248.4, 4.51076},{-0.879257, 0.476347, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_table1"};
		face = "asczHead_vlk_A3";
		loadout[] = {{},{},{},{"U_I_G_resistanceLeader_F",{}},{},{},"H_Hat_tan","murshun_cigs_cig0",{},{"","","","","",""}};
		name = "Тайлер Джонс";
		description = "«Настоящий оружейник и милитарист. Подберет для Вас ствол для самообороны и охоты, при наличии лицензии естественно»";
		startDialog = "RRP_NPC_Seller_Gun";
		icon = "\RRP_icons\NPC\RRP_Icon_Pistol.paa";
		condition = "true";
	};
	class NPC_Seller_Gun_2: NPC_Seller_Gun
	{
		objPosition[] = {{16914.5, 12750.3, 18.7878},{-0.678901, 0.73423, 0},{0, 0, 1}};
		face = "WhiteHead_06";
		name = "Чарли Кирби";
	};
	class NPC_Seller_Diving
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3359.32,12769.5,1.92594},{0.999992,-0.00391284,0},{0, 0, 1}};
		animations[] = {"InBaseMoves_table1"};
		face = "Barklem";
		loadout[] = {{},{},{},{"U_B_Wetsuit",{}},{},{},"","G_Spectacles",{},{"","","","","",""}};
		name = "Люк Дэвис";
		description = "«Известный аквалангист, поможет подобрать тебе первое снаряжение для погружений»";
		startDialog = "RRP_NPC_Seller_Diving";
		icon = "\RRP_icons\NPC\RRP_Icon_Diving.paa";
		condition = "true";
	};
	class NPC_Seller_Diving_2: NPC_Seller_Diving
	{
		objPosition[] = {{16662.2, 12836.1, 17.7495},{0.515184, 0.857079, 0},{0, 0, 1}};
		name = "Крис Мерфи";
		face = "WhiteHead_16";
	};
	class NPC_Renewal
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{12782.3, 16716.3, 82.6526},{0.530344, 0.847783, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "Barklem";
		loadout[] = {{},{},{},{"U_C_Man_casual_1_F",{}},{},{},"H_Hat_checker","G_Squares",{},{"","","","","",""}};
		name = "Дуан Уилсон";
		description = "«Главный автоюрист острова, переоформит ваше т/с в считанные минуты»";
		startDialog = "RRP_NPC_Renewal";
		icon = "\RRP_icons\NPC\RRP_Icon_Gift.paa";
		condition = "true";
	};
	class NPC_Food
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3711.99, 13082, 5.46378},{-0.0159975, 0.999872, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "TCGM_Fem_StoneBun";
		loadout[] = {{},{},{},{"rds_uniform_Villager1",{}},{},{},"","",{},{"","","","","",""}};
		name = "Томара Иванна";
		description = "«Продавщица со стажем. Главное не спрашивайте за акции, без паспорта сигареты не продает»";
		startDialog = "RRP_NPC_Seller_Food";
		icon = "\RRP_icons\NPC\RRP_Icon_Gift.paa";
		condition = "true";
	};
	class NPC_Garage_Veh
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3605.92, 13093.6, 4.07449},{0.873491, 0.48684, 0},{0, 0, 1}};
		animations[] = {"Exile_RouletteSitting01_Animation01"};
		face = "asczHead_josephe_A3";
		loadout[] = {{},{},{},{"U_C_Poloshirt_blue",{}},{},{},"H_Hat_brown","G_Spectacles",{},{"","","","","",""}};
		name = "Кайл Томсон";
		description = "«Обратись к нему, чтобы припарковать свое авто в гараж»";
		startDialog = "RRP_NPC_Garage_Veh";
		icon = "\RRP_icons\NPC\RRP_Icon_Garage.paa";
		condition = "true";
	};
	class NPC_Garage_Veh_2: NPC_Garage_Veh
	{
		objPosition[] = {{25814.9, 21451.7, 21.5994},{-0.733028, 0.680198, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		name = "Эштон Конрад";
		face = "asczHead_nevim_A3";
		startDialog = "RRP_NPC_Garage_Veh_2";
	};
	class NPC_Garage_Veh_3: NPC_Garage_Veh
	{
		objPosition[] = {{16716, 12893.6, 18.1794},{0.725889, -0.687812, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		name = "Лайам Ли";
		face = "WhiteHead_07";
		startDialog = "RRP_NPC_Garage_Veh_3";
	};
	class NPC_Garage_Veh_4: NPC_Garage_Veh
	{
		objPosition[] = {{14040.3, 18843.8, 24.1335},{-0.854017, 0.520245, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		name = "Сайкс Хьюз";
		face = "asczHead_voodoo_A3";
		startDialog = "RRP_NPC_Garage_Veh_4";
	};
	class NPC_Garage_Veh_5: NPC_Garage_Veh
	{
		objPosition[] = {{9116.39, 15774.9, 116.428},{-0.450611, 0.89272, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		name = "Оуэн Лихи";
		face = "asczHead_vlk_A3";
		startDialog = "RRP_NPC_Garage_Veh_5";
	};
	class NPC_Garage_Air
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3606.56, 13191.6, 3.94928},{-0.983391, 0.181499, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_austin_A3";
		loadout[] = {{},{},{},{"U_I_pilotCoveralls",{}},{},{},"H_PilotHelmetHeli_O","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джек Ли";
		description = "«Собираешься прикупить авиатранспорт? Тогда ты по адресу»";
		startDialog = "RRP_NPC_Garage_Air";
		icon = "\RRP_icons\NPC\RRP_Icon_Heli.paa";
		condition = "true";
	};
	class NPC_Garage_Air_2: NPC_Garage_Air
	{
		objPosition[] = {{16533.2, 12545.6, 2.26947},{0.736643, 0.676282, 0},{0, 0, 1}};
		name = "Шарль Тернер";
		startDialog = "RRP_NPC_Garage_Air_2";
	};
	class RRP_NPC_Garage_Air_gov: NPC_Garage_Air
	{
		objPosition[] = {{3572.58, 14466.7, 21.9193},{0.920284, -0.391252, 0},{0, 0, 1}};
		name = "Шарль Тернер";
		startDialog = "RRP_NPC_Garage_Air_gov";
	};
	class NPC_Garage_Ship
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3039.84, 12656.1, 2.12664},{0.634071, -0.773275, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_austin_A3";
		loadout[] = {{},{},{},{"U_C_Poor_1",{}},{},{},"H_Hat_blue","",{},{"","","","","",""}};
		name = "Тобу Мартинес";
		description = "«Кто то говорит, что раньше он был криминальным авторитетом, но все его знают как отличного поставщика лодок»";
		startDialog = "RRP_NPC_Garage_Ship";
		icon = "\RRP_icons\NPC\RRP_Icon_Ship.paa";
		condition = "true";
	};
	class NPC_Garage_Ship_2: NPC_Garage_Ship
	{
		objPosition[] = {{17774.3, 18217.3, 1.98111},{0.78015, -0.625592, 0},{0, 0, 1}};
		name = "Мэттью Джексон";
		startDialog = "RRP_NPC_Garage_Ship_2";
	};
	class NPC_Garage_Ship_3: NPC_Garage_Ship
	{
		objPosition[] = {{21933.8, 5944.53, 2.80845},{-0.893035, 0.449988, 0},{0, 0, 1}};
		name = "Джек Кларк";
		startDialog = "RRP_NPC_Garage_Ship_3";
	};
	class NPC_Garage_Ship_4: NPC_Garage_Ship
	{
		objPosition[] = {{12709.5, 14227.6, 1.99892},{0.833384, -0.552695, 0},{0, 0, 1}};
		name = "Оливер Дорган";
		startDialog = "RRP_NPC_Garage_Ship_4";
	};
	class NPC_Garage_Ship_5: NPC_Garage_Ship
	{
		objPosition[] = {{16339.5, 12464.3, 2.30649},{0.999902, 0.0140173, 0},{0, 0, 1}};
		name = "Джордж Рид";
		startDialog = "RRP_NPC_Garage_Ship_5";
	};
	class NPC_Garage_Ship_6: NPC_Garage_Ship
	{
		objPosition[] = {{10163.4, 10433.1, 0.471763},{0.557101, 0.830445, 0},{0, 0, 1}};
		name = "Томас Эванс";
		startDialog = "RRP_NPC_Garage_Ship_6";
	};
	class NPC_Garage_Ship_7: NPC_Garage_Ship
	{
		objPosition[] = {{26698.2, 20442.2, 1.62136},{-0.350405, 0.936598, 0},{0, 0, 1}};
		name = "Генри Вуд";
		startDialog = "RRP_NPC_Garage_Ship_7";
	};
	class NPC_Garage_Ship_8: NPC_Garage_Ship
	{
		objPosition[] = {{21843.4, 10893.3, 1.84269},{0.998168, 0.0604951, 0},{0, 0, 1}};
		name = "Люк Кларк";
		startDialog = "RRP_NPC_Garage_Ship_8";
	};
	class NPC_Port_Box
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3332.99, 12920.8, 2.02801},{0.530726, -0.847543, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_grey_A3";
		loadout[] = {{},{},{},{"U_C_Man_casual_5_F",{}},{},{},"H_Hat_blue","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Кайл Уокер";
		description = "«Бригадир в порту, хочешь немного подзаработать, обратись к нему»";
		startDialog = "RRP_NPC_Port_Box";
		icon = "\RRP_icons\NPC\RRP_Icon_Box.paa";
		condition = "true";
	};
	/* Автосалон */
	class NPC_Shop_Car
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3756.76, 13361.3, 7.73428},{-0.884778, 0.466013, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "WhiteHead_04";
		loadout[] = {{},{},{},{"U_RRPw_C_Djella_05",{}},{},{},"RRPw_H_cloth_5_B","G_Squares",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Жиль Джонс";
		description = "«Данные машины не для искушенного покупателя, но из точки А в точку Б довезут»";
		startDialog = "RRP_NPC_Shop_Car";
		icon = "\RRP_icons\NPC\RRP_Icon_Car.paa";
		condition = "true";
	};
	class NPC_Shop_Car_2: NPC_Shop_Car
	{
		objPosition[] = {{3537.27, 12996.4, 8.34963},{-0.642852, 0.76599, 0},{0, 0, 1}};
		face = "WhiteHead_11";
		loadout[] = {{},{},{},{"U_C_FormalSuit_01_khaki_F",{}},{},{},"Christmas_Hat_Side_Wearable","G_Squares_Tinted",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		description = "«Бюджетный автосалон, где вы можете приобрести автомобиль на каждый день»";
		name = "Колин Джонсон";
		startDialog = "RRP_NPC_Shop_Car_2";
	};
	class NPC_Shop_Car_3: NPC_Shop_Car
	{
		objPosition[] = {{12769.6, 16632.9, 83.1147},{0.659479, 0.751723, 0},{0, 0, 1}};
		face = "WhiteHead_01";
		loadout[] = {{},{},{},{"U_C_FormalSuit_01_tshirt_gray_F",{}},{},{},"Christmas_Hat_Reindeer_Wearable","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		description = "«Автосалон для состоятельных особ, вы не покупаете авто - вы покупаете статус»";
		name = "Дэвид Бейкер";
		startDialog = "RRP_NPC_Shop_Car_3";
	};
	class NPC_Shop_Motorcycles_1: NPC_Shop_Car
	{		
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{14056.6, 18909.6, 26.5144},{0.851205, -0.524833, 0},{0, 0, 1}};
		animations[] = {"HubSittingAtTableU_idle1"};
		face = "asczHead_olson_A3";
		loadout[] = {{},{},{},{"U_C_FormalSuit_01_tshirt_gray_F",{}},{},{},"Christmas_Hat_Reindeer_Wearable","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		description = "«Тут можно купить верного, стального коня»";
		name = "Адам Галлиуэлл"; 
		startDialog = "RRP_NPC_Shop_motorcycles_1";
	};
	class NPC_Shop_Truck
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3253.87, 12445.7, 6.81415},{-0.297472, 0.95473, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "WhiteHead_08";
		loadout[] = {{},{},{},{"U_C_Poloshirt_redwhite",{}},{},{},"","G_Squares",{},{"","","","","",""}};
		name = "Джордж Итон";
		description = "«Продает технику для грузоперевозок и добычи ископаемых»";
		startDialog = "RRP_NPC_Shop_Truck";
		icon = "\RRP_icons\NPC\RRP_Icon_Truck.paa";
		condition = "true";
	};
	class NPC_Shop_Truck_2: NPC_Shop_Truck
	{
		objPosition[] = {{17009.6, 12898.4, 15.966},{-0.460645, -0.887584, 0},{0, 0, 1}};
		face = "asczHead_foley_A3";
		name = "Рис Дэвис";
		startDialog = "RRP_NPC_Shop_Truck_2";
	};
	class NPC_Shop_Tractor
	{
	    objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{6834.57, 15800.8, 51.2378},{-0.998163, 0.0605889, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "GreekHead_A3_09";
		loadout[] = {{},{},{},{"U_C_Poloshirt_redwhite",{}},{},{},"","G_Squares",{},{"","","","","",""}};
		name = "Дилан Грин";
		description = "«Крупнейший поставщик индустриальной техники»";
		startDialog = "RRP_NPC_Tractor";
		icon = "\RRP_icons\NPC\RRP_Icon_Tractor.paa";
		condition = "true";
	};
    class NPC_Shop_Air
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{11671.5, 11957.8, 23.3522},{-0.519797, -0.85429, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_austin_A3";
		loadout[] = {{},{},{},{"U_I_pilotCoveralls",{}},{},{},"H_PilotHelmetHeli_O","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Кэмерон Прайс";
		description = "«Собираешься прикупить авиатранспорт? Тогда ты по адресу»";
		startDialog = "RRP_NPC_CivAirShop";
		icon = "\RRP_icons\NPC\RRP_Icon_Airplane.paa";
		condition = "true";
	};
	class NPC_Shop_Air_2: NPC_Shop_Air
	{
		objPosition[] = {{26780.5, 24646.5, 20.9993},{0.798103, -0.602521, 0},{0, 0, 1}};
		face = "WhiteHead_16";
		name = "Тайлер Халл";
		startDialog = "RRP_NPC_CivAirShop_2";
	};
	// class NPC_DHL
	// {
    //     objectClassName = "RRP_NPC_Talk";
	// 	objPosition[] = {{3919.81, 13584.4, 16.2872},{-0.637689, 0.770294, 0},{0, 0, 1}};
	// 	animations[] = {"HubStandingUA_move1"};
	// 	face = "asczHead_mctavish_A3";
	// 	loadout[] = {{},{},{},{"rimas_dhl_Employee",{}},{},{},"","",{},{"","","","","",""}};
	// 	name = "Оливер Моррис";
	// 	description = "«Менеджер по поставкам DHL»";
	// 	startDialog = "RRP_NPC_DHL";
	// 	icon = "\RRP_icons\NPC\RRP_Icon_PutCargo.paa";
	// 	condition = "true";
	// };
	class NPC_Shop_License
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3720.95, 13148, 4.26829},{-0.997549, -0.0699729, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_foley_A3";
		loadout[] = {{},{},{},{"U_B_GEN_Soldier_F",{}},{},{},"H_Bandanna_blu","G_Spectacles",{},{"","","","","",""}};
		name = "Харви Купер";
		description = "«Для того чтобы начать заниматься какой-либо деятельность, не забудь оформить лицензию»";
		startDialog = "RRP_NPC_Shop_License";
		icon = "\RRP_icons\NPC\RRP_Icon_License.paa";
		condition = "true";
	};
	class NPC_Shop_License_2: NPC_Shop_License
	{
		objPosition[] = {{12843.3, 16709.2, 82.4546},{0.898829, -0.438298, 0},{0, 0, 1}};
		face = "AfricanHead_03";
        name = "Крис Паркер";
	};
	class NPC_Shop_License_3: NPC_Shop_License
	{
		objPosition[] = {{16551.7, 12777.9, 14.9909},{0.447214, 0.894427, 0},{0, 0, 1}};
		face = "asczHead_voodoo_A3";
        name = "Джейми Дайтон";
	};
	class NPC_Shop_License_4: NPC_Shop_License
	{
		objPosition[] = {{14033.2, 18822.4, 24.3678},{-0.874458, 0.485101, 0},{0, 0, 1}};
		face = "asczHead_beardy_A3";
        name = "Джек Грин";
	};
	class NPC_Shop_Store
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3721.2, 13118, 4.67599},{-3.25841e-007, -1, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_table1"};
		face = "GreekHead_A3_09";
		loadout[] = {{},{},{},{"U_C_Poloshirt_salmon",{}},{},{},"H_StrawHat_dark","",{},{"","","","","",""}};
		name = "Райан Харрис";
		description = "«В данном магазине можно купить от спичек до прибора ночного видения»";
		startDialog = "RRP_NPC_Shop_Store";
		icon = "\RRP_icons\NPC\RRP_Icon_UniShop.paa";
		condition = "true";
	};
	class NPC_Shop_Store_2: NPC_Shop_Store
	{
		objPosition[] = {{12838.3, 16698.6, 82.4546},{0.898829, -0.438298, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_think"};
		face = "GreekHead_A3_07";
		name = "Джеймс Уайт";
	};
	class NPC_Shop_Store_3: NPC_Shop_Store
	{
		objPosition[] = {{25724.5, 21357.9, 20.7899},{-0.702589, -0.711596, 0},{0, 0, 1}};
		face = "asczHead_redfield_A3";
		name = "Люк Эбби";
	};
	class NPC_Shop_Store_4: NPC_Shop_Store
	{
		objPosition[] = {{14034.9, 18821.3, 27.8721},{0.881083, -0.472962, 0},{0, 0, 1}};
		face = "WhiteHead_07";
		name = "Джейми Робинсон";
	};
	class NPC_Shop_Store_5: NPC_Shop_Store
	{
		objPosition[] = {{16562.3, 12734, 14.4541},{0.625295, 0.780388, 0},{0, 0, 1}};
		face = "AfricanHead_03";
		name = "Томас Тэйлор";
	};
    class NPC_Shop_24_7
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9210.45, 12098.6, 18.1577},{-0.852852, -0.522153, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_plumber_A3";
		loadout[] = {{},{},{},{"U_C_ArtTShirt_01_v5_F",{}},{},{},"H_Bandanna_blu","G_Squares",{},{"","","","","",""}};
		name = "Каллум Янг";
		description = "«Забыл канистру в гараже? Не беда! Тут вы можете приобрести все необходимое в дорогу»";
		startDialog = "RRP_NPC_Shop_24_7";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Shop_24_7_2: NPC_Shop_24_7
	{
	    objPosition[] = {{8493.01, 18280.1, 177.739},{-0.028877, -0.999583, 0},{0, 0, 1}};
	    face = "WhiteHead_16";
	    name = "Теренс Галлиуэлл";
	};
	class NPC_Shop_24_7_3: NPC_Shop_24_7
	{
	    objPosition[] = {{11850, 14143.2, 12.6821},{-0.70902, 0.705188, 0},{0, 0, 1}};
	    face = "asczHead_plumber_A3";
	    name = "Люк Уоррен";
	};
	class NPC_Shop_24_7_4: NPC_Shop_24_7
	{
	    objPosition[] = {{14242.4, 18316.8, 18.6057},{-0.946117, -0.323825, 0},{0, 0, 1}};
	    face = "WhiteHead_03";
	    name = "Льюис Джонсон";
	};
	class NPC_Shop_24_7_5: NPC_Shop_24_7
	{
	    objPosition[] = {{4028.52, 12592.5, 25.9071},{-0.89961, -0.436695, 0},{0, 0, 1}};
	    face = "WhiteHead_13";
	    name = "Пол Смит";
	};
	class NPC_Shop_24_7_6: NPC_Shop_24_7
	{
	    objPosition[] = {{6797.75, 15579.5, 41.0986},{0.161431, -0.986884, 0},{0, 0, 1}};
	    face = "asczHead_troska_A3";
	    name = "Сайкс Хьюз";
	};
	class NPC_Shop_24_7_7: NPC_Shop_24_7
	{
	    objPosition[] = {{14174.3, 16526, 16.9024},{-0.782647, 0.622466, 0},{0, 0, 1}};
	    face = "WhiteHead_17";
	    name = "Бен Гаррисон";
	};
	class NPC_Shop_24_7_8: NPC_Shop_24_7
	{
	    objPosition[] = {{19953.9, 11428.5, 60.2151},{0.746709, 0.665151, 0},{0, 0, 1}};
	    face = "WhiteHead_14";
	    name = "Генри Грин";
	};
	class NPC_Shop_24_7_9: NPC_Shop_24_7
	{
	    objPosition[] = {{12044, 15809.4, 27.7801},{-0.0809216, 0.99672, 0},{0, 0, 1}};
	    face = "asczHead_stick_A3";
	    name = "Харви Робинсон";
	};
	class NPC_Shop_24_7_10: NPC_Shop_24_7
	{
	    objPosition[] = {{15317.2, 17597.8, 16.7332},{0.0143184, -0.999897, 0},{0, 0, 1}};
	    face = "WhiteHead_11";
	    name = "Аарон Мерфи";
	};
	class NPC_Shop_24_7_11: NPC_Shop_24_7
	{
	    objPosition[] = {{20766.5, 16662, 37.3117},{0.864246, -0.503069, 0},{0, 0, 1}};
	    face = "WhiteHead_18";
	    name = "Шарль Уокер";
	};
	class NPC_Shop_24_7_12: NPC_Shop_24_7
	{
	    objPosition[] = {{25687, 21391.2, 21.2049},{0.741323, -0.671149, 0},{0, 0, 1}};
	    face = "WhiteHead_17";
	    name = "Мэтью Паркер";
	};
	class NPC_Shop_24_7_13: NPC_Shop_24_7
	{
	    objPosition[] = {{23358, 19813.8, 13.0437},{0.690816, -0.72303, 0},{0, 0, 1}};
	    face = "asczHead_mctavish_A3";
	    name = "Райан Мартинес";
	};
	class NPC_Shop_24_7_14: NPC_Shop_24_7
	{
	    objPosition[] = {{17436.9, 13938.1, 5.73613},{-0.986199, 0.165566, 0},{0, 0, 1}};
	    face = "asczHead_brown_A3";
	    name = "Реджи Филипс";
	};
	class NPC_Shop_24_7_15: NPC_Shop_24_7
	{
	    objPosition[] = {{16827.8, 15471.7, 12.2951},{0.939507, 0.342529, 0},{0, 0, 1}};
	    face = "asczHead_redfield_A3";
	    name = "Уильям Андерсон";
	};
    class NPC_Slavery
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{2151.65, 11577.3, 3.78669},{0.0667115, 0.997772, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_03";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_BG_Guerilla1_2_F",{{"30Rnd_762x39_Mag_F",3,30}}},{},{},"H_Booniehat_wdl","",{},{"","","","","",""}};
		name = "Финли Джеймсон";
		description = "«Старый работорговец»";
		startDialog = "RRP_NPC_Slavery";
		icon = "\RRP_icons\NPC\RRP_Icon_Slavery.paa";
		condition = "true";
	};
	class NPC_Rob
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{5830.19, 20313.2, 217.748},{0.999737, 0.0229167, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_olson_A3";
		loadout[] = {{},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"U_C_Journalist",{{"KA_17Rnd_9x19_Mag",3,17}}},{"Constant_vest_2p2",{}},{},"H_Hat_grey","G_Bandanna_aviator",{},{"","","","","",""}};
		name = "Джилиан Халл";
		description = "«Перебьет номера на вашем авто, либо купит твоё корыто на запчасти»";
		startDialog = "RRP_NPC_Rob";
		icon = "\RRP_icons\NPC\RRP_Icon_Rob.paa";
		condition = "true";
	};
	class NPC_Rob_2
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{15409.7, 15880.9, 4.41625},{-0.184289, 0.982872, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_olson_A3";
		loadout[] = {{},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"U_C_Journalist",{{"KA_17Rnd_9x19_Mag",3,17}}},{"Constant_vest_2p2",{}},{},"H_Hat_grey","G_Bandanna_aviator",{},{"","","","","",""}};
		name = "Джилиан Халл Младший";
		description = "«Перебьет номера на вашем авто, либо купит твоё корыто на запчасти»";
		startDialog = "RRP_NPC_Rob";
		icon = "\RRP_icons\NPC\RRP_Icon_Rob.paa";
		condition = "true";
	};
	class NPC_Rob_4
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{27661.6, 24628.4, 7.26245},{0.0165723, -0.999863, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_olson_A3";
		loadout[] = {{},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"U_C_Journalist",{{"KA_17Rnd_9x19_Mag",3,17}}},{"Constant_vest_2p2",{}},{},"H_Hat_grey","G_Bandanna_aviator",{},{"","","","","",""}};
		name = "Кирпич Фридж";
		description = "«Перебьет номера на вашем авто, либо купит твоё корыто на запчасти»";
		startDialog = "RRP_NPC_Fridg";
		icon = "\RRP_icons\NPC\RRP_Icon_Rob.paa";
		condition = "true";
	};
	class NPC_Rob_3: NPC_Rob
	{
		objPosition[] = {{17931.4, 1688.19, 2.27916},{-0.994447, -0.105242, 0},{0, 0, 1}};
		startDialog = "RRP_NPC_Pirat";
		face = "asczHead_beardy_A3";
		name = "Уильям Уайт";
	};
	/* Грузоперевозки */
	/* class NPC_Cargo
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3756.64, 12380.6, 34.4098},{0.670828, -0.741613, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "WhiteHead_15";
		loadout[] = {{},{},{},{"U_C_ArtTShirt_01_v6_F",{}},{"V_Safety_orange_F",{}},{},"","",{},{"","","","","",""}};
		name = "Джон Джонс";
		description = "«Срочно понадобились деньги? Обратись к нему, всегда найдется работа по доставке груза»";
		startDialog = "RRP_NPC_Cargo";
		icon = "\RRP_icons\NPC\RRP_Icon_Cargo.paa";
		condition = "true";
	};
	class NPC_Cargo_2: NPC_Cargo
	{
		objPosition[] = {{21858.4, 5979.36, 2.79792},{-0.588858, 0.808236, 0},{0, 0, 1}};
		name = "Ян Халл";
	};
	class NPC_Cargo_3: NPC_Cargo
	{
		objPosition[] = {{11553.9, 11917.9, 23.8568},{0.874007, -0.485914, 0},{0, 0, 1}};
		name = "Дилан Мур";
	}; */


	/* Торговцы (Группировочные) */

	/* Anvil */
	class NPC_Seller_Anvil
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{7767.19, 6545.83, 14.5019},{-0.801767, -0.597636, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_21";
        loadout[] = {{"AKM_ADIDAS","","","optic_Yorris",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30},{"1Rnd_HE_Grenade_shell",1,1}}},{"V_RRPw_PlateCarrier2_desert",{{"1Rnd_HE_Grenade_shell",2,1}}},{},"RRPw_H_PASGT_goggles_UN_F","G_Balaclava_snd_RRPw",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Экипировка";
		description = "«Торговец группировки Anvil»";
		startDialog = "RRP_Dialog_NPC_GRP_43";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Air_Anvil
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{7733.12, 6511.45, 14.4895},{-0.669867, 0.742481, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_05";
        loadout[] = {{"AKM_ADIDAS","","","optic_Yorris",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30},{"1Rnd_HE_Grenade_shell",1,1}}},{"V_RRPw_PlateCarrier2_desert",{{"1Rnd_HE_Grenade_shell",2,1}}},{},"RRPw_H_PASGT_goggles_UN_F","G_Balaclava_snd_RRPw",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Воздушная техника";
		description = "«Торговец группировки Anvil»";
		startDialog = "RRP_Dialog_NPC_GRP_44";
		icon = "\RRP_icons\NPC\RRP_Icon_Heli.paa";
		condition = "true";
	};
	class NPC_Veh_Anvil
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{7722.99, 6533.91, 14.4929},{0.730127, -0.683312, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "asczHead_troska_A3";
		loadout[] = {{"AKM_ADIDAS","","","optic_Yorris",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30},{"1Rnd_HE_Grenade_shell",1,1}}},{"V_RRPw_PlateCarrier2_desert",{{"1Rnd_HE_Grenade_shell",2,1}}},{},"RRPw_H_PASGT_goggles_UN_F","G_Balaclava_snd_RRPw",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Наземная техника";
		description = "«Торговец группировки Anvil»";
		startDialog = "RRP_Dialog_NPC_GRP_45";
		icon = "\RRP_icons\NPC\RRP_Icon_Car.paa";
		condition = "true";
	};
	class NPC_Boat_Anvil
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{7719.73, 6495.77, 14.4936},{0.67366, 0.739042, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "asczHead_troska_A3";
		loadout[] = {{"AKM_ADIDAS","","","optic_Yorris",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30},{"1Rnd_HE_Grenade_shell",1,1}}},{"V_RRPw_PlateCarrier2_desert",{{"1Rnd_HE_Grenade_shell",2,1}}},{},"RRPw_H_PASGT_goggles_UN_F","G_Balaclava_snd_RRPw",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Водная техника";
		description = "«Торговец группировки Anvil»";
		startDialog = "RRP_Dialog_NPC_GRP_46";
		icon = "\RRP_icons\NPC\RRP_Icon_Ship.paa";
		condition = "true";
	};
	//
	class RRPgroup_Shop_Ship_BlackSnow
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17215.3, 22155.1, 3.94708},{0.906183, -0.422885, 0},{0, 0, 1}};
		animations[] = {"ZULU_SITING_06"};
		face = "asczHead_voodoo_A3";
		loadout[] = {{"arifle_mas_aks74","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_fighter",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{"BS_Backpack",{}},"BS_Beret","",{},{"","","","","",""}};
		name = "Томас Уолш";
		description = "";
		startDialog = "RRP_Dialog_Shop_Ship_GRP_BlackSnow";
		icon = "";
		condition = "true";
	};

	class RRPgroup_Shop_Car_BlackSnow
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17116.9, 22193.9, 3.77264},{0.998435, 0.0559256, 0},{0, 0, 1}};
		animations[] = {};
		face = "asczHead_sokolov_A3";
		loadout[] = {{},{},{},{"BS_form_fighter",{}},{"BS_vest",{}},{},"Skyline_HeadGear_Bandana_03_F","TRYK_Beard4",{},{"","","","","",""}};
		name = "Тэвиш Байх";
		description = "";
		startDialog = "RRP_Dialog_Shop_Car_GRP_BlackSnow";
		icon = "";
		condition = "true";
	};

	class RRPgroup_Shop_Air_BlackSnow
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17144.6, 22197.2, 3.77436},{-0.994639, -0.103412, 0},{0, 0, 1}};
		animations[] = {};
		face = "WhiteHead_16";
		loadout[] = {{},{},{},{"BS_form_fighter",{}},{"BS_vest",{}},{},"Skyline_HeadGear_Bandana_03_F","TRYK_Beard4",{},{"","","","","",""}};
		name = "Джозеф Уоррен";
		description = "";
		startDialog = "RRP_Dialog_Shop_Air_GRP_BlackSnow";
		icon = "";
		condition = "true";
	};

	class RRPgroup_Shop_Weapons_BlackSnow
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{17139.5, 22174.3, 4.01789},{0.427626, -0.903956, 0},{0, 0, 1}};
		animations[] = {"ZULU_BRIEF_08"};
		face = "GreekHead_A3_08";
		loadout[] = {{},{},{},{"BS_form_fighter",{}},{"BS_vest",{}},{},"Skyline_HeadGear_Bandana_03_F","TRYK_Beard4",{},{"","","","","",""}};
		name = "Джозев Сикс";
		description = "";
		startDialog = "RRP_Dialog_Shop_Weapons_GRP_BlackSnow";
		icon = "";
		condition = "true";
	};
	class RRPgroup_Shop_Clothing_BlackSnow
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{17142.5, 22174.2, 4.09882},{0.0272066, -0.99963, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_table1"};
		face = "asczHead_plumber_A3";
		loadout[] = {{"arifle_mas_aks74u","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_officer",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{},"BS_Beret","",{},{"","","","","",""}};
		name = "Маркус Дрим";
		description = "";
		startDialog = "RRP_Dialog_Shop_Clothing_GRP_BlackSnow";
		icon = "";
		condition = "true";
	};
	class RRPgroup_Shop_Supermarket_BlackSnow
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{17145.2, 22174.3, 4.11482},{0.00813323, -0.999967, 0},{0, 0, 1}};
		animations[] = {"HubSittingAtTableU_idle1"};
		face = "WhiteHead_15";
		loadout[] = {{"Winchester1897_01","","","",{"6Rnd_00_Buckshot_Magazine",6},{},""},{},{},{"BS_form_fighter",{{"6Rnd_00_Buckshot_Magazine",3,6}}},{"BS_vest",{}},{},"BS_Cap","",{},{"","","","","",""}};
		name = "Алекс Джеферсон";
		description = "";
		startDialog = "RRP_Dialog_Shop_Supermarket_GRP_BlackSnow";
		icon = "";
		condition = "true";
	};
	//неактивные нпс визуалы
		class RRPgroup_BlackSnow_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{17140.8, 22162.4, 4.0184},{0.981581, 0.191046, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1Man_IK"};
		face = "AfricanHead_02";
		loadout[] = {{"Winchester1897_01","","","",{"6Rnd_00_Buckshot_Magazine",6},{},""},{},{},{"BS_form_fighter",{{"6Rnd_00_Buckshot_Magazine",3,6}}},{"BS_vest",{}},{},"BS_Cap","",{},{"","","","","",""}};
		name = "Зимбабуа Аль Азиз";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	//
	class RRPgroup_BlackSnow_2
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17109.5, 22085.5, 3.88962},{0.732221, -0.681068, 0},{0, 0, 1}};
		animations[] = {"AA_x01zoldak1"};
		face = "asczHead_troska_A3";
		loadout[] = {{"arifle_mas_aks74u","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_cadet",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{"BS_Backpack",{}},"BS_Cap","G_Bandanna_sport",{},{"","","","","",""}};
		name = "Джим Паттерсон";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRPgroup_BlackSnow_3
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17139.9, 22115.7, 24.0874},{0.0893275, -0.996002, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_table1"};
		face = "asczHead_olson_A3";
		loadout[] = {{"arifle_mas_aks74","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_fighter",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{"BS_Backpack",{}},"BS_Beret","",{},{"","","","","",""}};
		name = "Бойд Трэверс";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRPgroup_BlackSnow_4
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17139.1, 22117.4, 24.0874},{-0.918633, 0.395111, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1Man_enableFire"};
		face = "WhiteHead_17";
		loadout[] = {{"srifle_mas_m24","","","optic_mas_zeiss",{"5Rnd_mas_762x51_Stanag",5},{},""},{},{},{"BS_form_fighter",{{"5Rnd_mas_762x51_Stanag",3,5}}},{"BS_vest",{}},{"BS_Backpack",{}},"H_Watchcap_blk","G_RM_SWAT_Balaclava",{},{"","","","","",""}};
		name = "Скотт Вэбб";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRPgroup_BlackSnow_5
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17112.8, 22092, 4.17099},{-0.955443, -0.295177, 0},{0, 0, 1}};
		animations[] = {"AG_slavicSquat_loop"};
		face = "GreekHead_A3_09";
		loadout[] = {{"arifle_mas_aks74u","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_cadet",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{"BS_Backpack",{}},"BS_Cap","murshun_cigs_cig2",{},{"","","","","",""}};
		name = "Джеймс Салливан";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRPgroup_BlackSnow_6
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17154, 22132.9, 3.91885},{0.0120474, 0.999927, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_ActsPercMstpSlowWrflDnon_Listening_Hgun"};
		face = "WhiteHead_11";
		loadout[] = {{"arifle_mas_aks74u","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_cadet",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{"BS_Backpack",{}},"BS_Cap","G_Bandanna_sport",{},{"","","","","",""}};
		name = "Бобби МакАфи";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRPgroup_BlackSnow_7
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17150.6, 22133.1, 3.91885},{0.340649, 0.940191, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "AfricanHead_01";
		loadout[] = {{"arifle_mas_aks74u","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_cadet",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{"BS_Backpack",{}},"BS_Cap","G_Bandanna_blk",{},{"","","","","",""}};
		name = "Мерритт Эдсон";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRPgroup_BlackSnow_8
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17190.5, 22156.2, 3.81539},{-0.986834, -0.161737, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1Man"};
		face = "WhiteHead_14";
		loadout[] = {{"arifle_mas_aks74u","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_cadet",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{"BS_Backpack",{}},"BS_Cap","G_Bandanna_sport",{},{"","","","","",""}};
		name = "Билсон Смит";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRPgroup_BlackSnow_9
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{17122.3, 22124.3, 3.90675},{-0.135114, -0.99083, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1Man"};
		face = "WhiteHead_06";
		loadout[] = {{"arifle_mas_aks74u","","","",{"30Rnd_mas_545x39_mag",30},{},""},{},{},{"BS_form_cadet",{{"30Rnd_mas_545x39_mag",3,30}}},{"BS_vest",{}},{"BS_Backpack",{}},"BS_Cap","",{},{"","","","","",""}};
		name = "Джимми Шепард";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};	
	
	// lacosanostra	
	class RRPgroup_Shop_Weapons_GRP_lacosanostra
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9173.3, 19202.4, 272.815},{0.998247, -0.0591828, 0},{0, 0, 1}};
		animations[] = {"ZULU_BRIEF_071"};
		face = "asczHead_novotny_A3";
		loadout[] = {{},{},{},{"Azar_Suit_ANZUS",{}},{},{},"","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Бернардо Провенцано"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Weapons_GRP_lacosanostra"; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Shop_Clothing_lacosanostra
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9174.66, 19201.1, 272.823},{0.0404108, 0.999183, 0},{0, 0, 1}};
		animations[] = {"ZULU_BRIEF_061"};
		face = "asczHead_brown_A3";
		loadout[] = {{},{},{},{"Azar_Suit_ANZUS",{}},{},{},"","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Альберт Анастасия"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Clothing_GRP_lacosanostra"; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Shop_Supermarket_lacosanostra
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9176.7, 19201.1, 272.823},{0.0404108, 0.999183, 0},{0, 0, 1}};
		animations[] = {"ZULU_BRIEF_052"};
		face = "WhiteHead_08";
		loadout[] = {{},{},{},{"Azar_Suit_ANZUS",{}},{},{},"","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Льюис Андерсон"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Supermarket_GRP_lacosanostra"; 
		icon = ""; 
		condition = "true";
	};	
	class RRPgroup_Shop_Air_lacosanostra
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9152.85, 19210.6, 272.674},{0.984967, -0.172743, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "asczHead_spanel_A3";
		loadout[] = {{},{},{},{"Azar_Suit_ANZUS",{}},{},{},"","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Джо Профачи"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Air_GRP_lacosanostra"; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Shop_Car_lacosanostra
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9231.91, 19191.6, 272.624},{0.955616, -0.294617, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "asczHead_grey_A3";
		loadout[] = {{},{},{},{"Azar_Suit_ANZUS",{}},{},{},"","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Роя Де Мео"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Car_GRP_lacosanostra"; 
		icon = ""; 
		condition = "true";
	};

	// La Escobaro Family
	class R_GRP_Escobaro_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{27836.1, 22759.8, 4.44144},{0.723425, 0.690403, 0},{0, 0, 1}};
        animations[] = {"Acts_Taking_Cover_From_Jets_in_loop"};
        face = "asczHead_voodoo_A3";
        loadout[] = {{},{},{},{"R_Clothing_Escobaro_03",{}},{"R_Vest_Escobaro_01",{}},{},"FlatCap_black_S","",{},{"","","","","",""}};
        name = "Джекоб Эккер";
        description = "";
        startDialog = "RRP_Dialog_Shop_Veh_GRP_Escobaro";
        icon = "";
        condition = "true";
    };
	class R_GRP_Escobaro_Air_Trader_01: R_GRP_Escobaro_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{27809.4, 22765.9, 4.44144},{0.683722, -0.729742, 0},{0, 0, 1}};
        animations[] = {"HubStandingUA_move1"};
        face = "WhiteHead_14";
        loadout[] = {{},{},{},{"U_I_pilotCoveralls",{}},{},{},"H_PilotHelmetHeli_O","",{},{"","","","","",""}};
        name = "Шарль Бирн";
        startDialog = "RRP_Dialog_Shop_Air_GRP_Escobaro";
    };
    class R_GRP_Escobaro_Market_Trader_01: R_GRP_Escobaro_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{27849.2, 22784.3, 5.25717},{0.719708, -0.694277, 0},{0, 0, 1}};
        animations[] = {"HubSittingAtTableU_idle1"};
        face = "asczHead_troska_A3";
        loadout[] = {{},{},{},{"R_Clothing_Escobaro_03",{}},{"R_Vest_Escobaro_01",{}},{},"FlatCap_black_S","",{},{"","","","","",""}};
        name = "Брэдли Морган";
        startDialog = "RRP_Dialog_Shop_Market_GRP_Escobaro";
    };
	class R_GRP_Escobaro_NPC_01: R_GRP_Escobaro_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{27836.2, 22734.2, 11.953},{-0.502207, 0.864747, 0},{0, 0, 1}};
        animations[] = {"AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1Man"};
        face = "WhiteHead_18";
        loadout[] = {{"arifle_mas_ak_74m","","","",{"30Rnd_545x39_Mag_F",30},{},""},{},{},{"R_Clothing_Escobaro_02",{{"30Rnd_545x39_Mag_F",3,30}}},{"R_Vest_Escobaro_01",{}},{},"pat_durag_green","",{},{"","","","","",""}};
        name = "Итан Эккер";
        startDialog = "";
    };
	class R_GRP_Escobaro_NPC_02: R_GRP_Escobaro_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{27830, 22798.4, 8.67044},{-0.440425, 0.897789, 0},{0, 0, 1}};
        animations[] = {"Acts_Briefing_SA_Loop"};
        face = "asczHead_stick_A3";
        loadout[] = {{"arifle_mas_ak_74m_sf","","","optic_Yorris",{"30Rnd_545x39_Mag_F",30},{},""},{},{},{"R_Clothing_Escobaro_03",{{"30Rnd_545x39_Mag_F",3,30}}},{"R_Vest_Escobaro_01",{}},{},"TRYK_r_cap_blk_Glasses","",{},{"","","","","",""}};
        name = "Конор Итон";
        startDialog = "";
    };

	// Sumiyoshi Kai
	class RRP_GRP_Sumiyoshi_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{23757.7, 16696.7, 2.68462},{-0.616473, -0.787376, 0},{0, 0, 1}};
        animations[] = {"Acts_Taking_Cover_From_Jets_in_loop"};
        face = "asczHead_voodoo_A3";
        loadout[] = {{},{},{},{"RRP_Uniform_Sumiyoshi_01",{}},{},{},"RRP_Headgear_Sumiyoshi_03","",{},{"","","","","",""}};
        name = "Аарон Паркер";
        description = "";
        startDialog = "RRP_Dialog_Shop_Veh_GRP_Sumiyoshi";
        icon = "";
        condition = "true";
    };
	class RRP_GRP_Sumiyoshi_Air_Trader_01: RRP_GRP_Sumiyoshi_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{23773.2, 16674, 2.56144},{-0.0542882, 0.998525, 0},{0, 0, 1}};
        animations[] = {"HubStandingUA_move1"};
        face = "WhiteHead_14";
        loadout[] = {{},{},{},{"U_I_pilotCoveralls",{}},{},{},"H_PilotHelmetHeli_O","",{},{"","","","","",""}};
        name = "Самюэль Джонс";
        startDialog = "RRP_Dialog_Shop_Air_GRP_Sumiyoshi";
    };
    class RRP_GRP_Sumiyoshi_Market_Trader_01: RRP_GRP_Sumiyoshi_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{23765, 16699.6, 3.26573},{-0.996563, -0.0828431, 0},{0, 0, 1}};
        animations[] = {"HubStandingUA_move1"};
        face = "asczHead_nevim_A3";
        loadout[] = {{},{},{},{"RRP_Uniform_Sumiyoshi_03",{}},{"RRP_Vest_Sumiyoshi_01",{}},{},"RRP_Headgear_Sumiyoshi_01","",{},{"","","","","",""}};
        name = "Каллум Мартин";
        startDialog = "RRP_Dialog_Shop_Market_GRP_Sumiyoshi";
    };
	class RRP_GRP_Sumiyoshi_NPC_01: RRP_GRP_Sumiyoshi_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{23747.4, 16758, 2.56144},{-0.998985, 0.0450363, 0},{0, 0, 1}};
        animations[] = {"HubSittingChairA_move1"};
        face = "WhiteHead_19";
        loadout[] = {{"arifle_mas_ak12_sf","","","optic_Yorris",{"30Rnd_545x39_Mag_F",30},{},""},{},{},{"RRP_Uniform_Sumiyoshi_03",{{"30Rnd_545x39_Mag_F",3,30}}},{"RRP_Vest_Sumiyoshi_01",{}},{},"RRP_Headgear_Sumiyoshi_01","",{},{"","","","","",""}};
        name = "Уильям Уилсон";
        startDialog = "";
    };
	class RRP_GRP_Sumiyoshi_NPC_02: RRP_GRP_Sumiyoshi_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{23790.6, 16774.9, 2.67144},{0.990454, -0.137847, 0},{0, 0, 1}};
        animations[] = {"Acts_AidlPercMstpSloWWrflDnon_warmup_2_loop"};
        face = "WhiteHead_05";
        loadout[] = {{"arifle_mas_ak12_sf","","","optic_Yorris",{"30Rnd_545x39_Mag_F",30},{},""},{},{},{"RRP_Uniform_Sumiyoshi_02",{{"30Rnd_545x39_Mag_F",3,30}}},{"RRP_Vest_Sumiyoshi_01",{}},{},"RRP_Headgear_Sumiyoshi_03","",{},{"","","","","",""}};
        name = "Дилан Фолкнер";
        startDialog = "";
    };
	class RRP_GRP_Sumiyoshi_NPC_03: RRP_GRP_Sumiyoshi_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{23806.4, 16745.9, 11.4914},{-0.95925, 0.282559, 0},{0, 0, 1}};
        animations[] = {"Acts_AidlPercMstpSloWWrflDnon_warmup_3_loop"};
        face = "asczHead_murphy_A3";
        loadout[] = {{"arifle_mas_ak12_sf","","","optic_Yorris",{"30Rnd_545x39_Mag_F",30},{},""},{},{},{"RRP_Uniform_Sumiyoshi_02",{{"30Rnd_545x39_Mag_F",3,30}}},{"RRP_Vest_Sumiyoshi_01",{}},{},"RRP_Headgear_Sumiyoshi_02","RRP_Glasses_Sumiyoshi_01",{},{"","","","","",""}};
        name = "Чарли Уокер";
        startDialog = "";
    };

	// Sector
	class R_GRP_Sector_Veh_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20362.7, 18729.2, 68.0186},{-0.206895, -0.978363, 0},{0, 0, 1}};
        animations[] = {"HubSittingChairUA_idle3"};
        face = "asczHead_nevim_A3";
        loadout[] = {{},{},{},{"RRPClothing_uniform_3_Sector",{}},{},{},"AG_Beret_Orange","G_Aviator",{},{"","","","","",""}};
        name = "Чад Джексон";
        description = "";
        startDialog = "RRP_Dialog_Shop_Veh_GRP_Sector";
        icon = "";
        condition = "true";
    };
	class R_GRP_Sector_Air_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20341.4, 18788.2, 68.0483},{-0.707107, -0.707107, 0},{0, 0, 1}};
        animations[] = {"Acts_AidlPercMstpSloWWpstDnon_warmup_1_loop"};
        face = "WhiteHead_03";
        loadout[] = {{},{},{"RH_g17","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"RRPClothing_uniform_1_Sector",{{"RH_17Rnd_9x19_g17",3,17}}},{},{"Rimas_EMS_Belt_Black",{}},"H_G_Beret_LTN","G_mas_wpn_gog",{},{"","","","","",""}};
        name = "Гарри Роллинз";
        description = "";
        startDialog = "RRP_Dialog_Shop_Air_GRP_Sector";
        icon = "";
        condition = "true";
    };
    class R_GRP_Sector_Market_Trader_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20318.4, 18771.7, 68.276},{-0.989203, 0.146549, 0},{0, 0, 1}};
        animations[] = {"AidlPsqtMstpSnonWnonDnon_1"};
        face = "AfricanHead_03";
        loadout[] = {{},{},{"RH_g17","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"RRPClothing_uniform_3_Sector",{{"RH_17Rnd_9x19_g17",2,17}}},{"RRPClothing_vest_3_Sector",{{"RH_17Rnd_9x19_g17",1,17}}},{},"AG_Beret_Orange","",{},{"","","","","",""}};
        name = "Дэниэл Кобурн";
        description = "";
        startDialog = "RRP_Dialog_Shop_Market_GRP_Sector";
        icon = "";
        condition = "true";
    };
	class R_GRP_Sector_NPC_01
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20315.1, 18759.4, 68.063},{0.614959, -0.788559, 0},{0, 0, 1}};
        animations[] = {"InBaseMoves_SittingRifle1"};
        face = "WhiteHead_08";
        loadout[] = {{"arifle_mas_ak12_sf","","","optic_Yorris",{"30Rnd_545x39_Mag_F",30},{},""},{},{},{"RRPClothing_uniform_3_Sector",{{"30Rnd_545x39_Mag_F",2,30}}},{},{},"AG_Beret_Orange","",{},{"","","","","",""}};
        name = "Крис Мур";
        description = "";
        startDialog = "";
        icon = "";
        condition = "true";
    };
	class R_GRP_Sector_NPC_02
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20337.8, 18729.9, 68.037},{0.192745, -0.981249, 0},{0, 0, 1}};
        animations[] = {"Acts_AidlPercMstpSlowWrflDnon_warmup01"};
        face = "asczHead_stick_A3";
        loadout[] = {{"arifle_mas_ak_74m_sf","","","optic_Yorris",{"30Rnd_545x39_Mag_F",30},{},""},{},{},{"RRPClothing_uniform_1_Sector",{{"30Rnd_545x39_Mag_F",3,30}}},{"RRPClothing_vest_1_Sector",{}},{},"RRPClothing_cap_1_Sector","G_mas_wpn_wrap_mask_b",{},{"","","","","",""}};
        name = "Пол Кларк";
        description = "";
        startDialog = "";
        icon = "";
        condition = "true";
    };
	class R_GRP_Sector_NPC_03
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20311.9, 18773.9, 75.34},{-0.25607, -0.966658, 0},{0, 0, 1}};
        animations[] = {"AA_ActsPercMwlkSlowWrflDnon_PatrolingBase3"};
        face = "asczHead_olson_A3";
        loadout[] = {{"arifle_mas_ak_74m","","","",{"30Rnd_545x39_Mag_F",30},{},""},{},{},{"RRPClothing_uniform_2_Sector",{{"30Rnd_545x39_Mag_F",3,30}}},{"RRPClothing_vest_2_Sector",{}},{},"RRPClothing_cap_3_Sector","G_Aviator",{},{"","","","","",""}};
        name = "Шон Грин";
        description = "";
        startDialog = "";
        icon = "";
        condition = "true";
    };
	class R_GRP_Sector_NPC_04
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20318.1, 18796.2, 68.0347},{-0.808007, 0.589173, 0},{0, 0, 1}};
        animations[] = {"Acts_ExecutionVictim_Loop"};
        face = "GreekHead_A3_09";
        loadout[] = {{},{},{"RH_g17","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"RP_bigcop_bob_v2",{{"RH_17Rnd_9x19_g17",2,17}}},{"RP_bob_vest_v1",{}},{"RP_bob_bag",{}},"RP_bob_cap","immersion_pops_pop0",{},{"","","","","",""}};
        name = "Кори Джонс";
        description = "";
        startDialog = "";
        icon = "";
        condition = "true";
    };
	class R_GRP_Sector_NPC_05
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20313.7, 18793.6, 68.072},{-0.45865, -0.888617, 0},{0, 0, 1}};
        animations[] = {"Static_Dead"};
        face = "vvv_head_swat";
        loadout[] = {{},{},{"RH_g17","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"U_mas_rus_O_Gorka_uniform_q",{{"RH_17Rnd_9x19_g17",2,17}}},{"RM_SWAT_Vest_Blue_01",{}},{"Rimas_EMS_Belt_Black",{}},"","",{},{"","","","","",""}};
        name = "Шон Купер";
        description = "";
        startDialog = "";
        icon = "";
        condition = "true";
    };
	class R_GRP_Sector_NPC_06
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20318.7, 18794.1, 68.049},{-0.622538, 0.78259, 0},{0, 0, 1}};
        animations[] = {"Acts_Executioner_StandingLoop"};
        face = "asczHead_voodoo_A3";
        loadout[] = {{},{},{"RH_g17","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"RRPClothing_uniform_3_Sector",{{"RH_17Rnd_9x19_g17",2,17}}},{"RRPClothing_vest_3_Sector",{{"RH_17Rnd_9x19_g17",1,17}}},{},"rds_Villager_cap2","",{},{"","","","","",""}};
        name = "Бен Уокер";
        description = "";
        startDialog = "";
        icon = "";
        condition = "true";
    };
	class R_GRP_Sector_NPC_07
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{20315.7, 18797.2, 68.1161},{0.851769, -0.523918, 0},{0, 0, 1}};
        animations[] = {"InBaseMoves_sitHighUp1"};
        face = "WhiteHead_17";
        loadout[] = {{"arifle_mas_ak_74m_sf","","","optic_Yorris",{"30Rnd_545x39_Mag_F",30},{},""},{},{"RH_g17","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"RRPClothing_uniform_1_Sector",{{"RH_17Rnd_9x19_g17",2,17},{"30Rnd_545x39_Mag_F",3,30}}},{"RRPClothing_vest_1_Sector",{{"RH_17Rnd_9x19_g17",1,17}}},{},"RRPClothing_cap_1_Sector","G_mas_wpn_wrap_mask_b",{},{"","","","","",""}};
        name = "Чарли Джонсон";
        description = "";
        startDialog = "";
        icon = "";
        condition = "true";
    };



	//inagawakai	
    class RRPgroup_Shop_Clothing_blackwolves
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{6024.23, 16271.3, 43.5273},{-0.306568, -0.951849, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "WhiteHead_07";
		loadout[] = {{},{},{},{"my_biker",{}},{},{},"Skyline_HeadGear_Cowboy_05_F","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Дэниэл Вуд";
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Clothing_GRP_blackwolves"; 
		icon = ""; 
		condition = "true";
	};
    class RRPgroup_Shop_Weapons_GRP_blackwolves
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{6028.22, 16271.2, 43.5273},{-0.299482, -0.954102, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "asczHead_grey_A3";
		loadout[] = {{},{},{},{"my_biker",{}},{},{},"Skyline_HeadGear_Cowboy_05_F","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Брайан Томпсон"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Weapons_GRP_blackwolves"; 
		icon = ""; 
		condition = "true";
	};
    class RRPgroup_Shop_Air_blackwolves
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{6006.03, 16248, 42.9576},{0.303851, 0.95272, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "WhiteHead_07";
		loadout[] = {{},{},{},{"my_biker",{}},{},{},"Skyline_HeadGear_Cowboy_05_F","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Пардэ Гонзалес";
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Air_GRP_blackwolves"; 
		icon = ""; 
		condition = "true";
	};
		class RRPgroup_Shop_CarAndAir_blackwolves
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{6001.34, 16271, 43.3267},{-0.306568, -0.951849, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "WhiteHead_07";
		loadout[] = {{},{},{},{"my_biker",{}},{},{},"Skyline_HeadGear_Cowboy_05_F","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Билли Харингтон"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Car_GRP_blackwolves"; 
		icon = ""; 
		condition = "true";
	};

	//inagawakai	
		class RRPgroup_Shop_Clothing_InagawaKai
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13800.3, 20199.4, 36.066},{-0.295976, 0.955195, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "WhiteHead_10";
		loadout[] = {{},{},{},{"vvv_character_agente_473",{}},{},{},"","G_WirelessEarpiece_F",{},{"","","","","",""}};
		name = "Сикарио Сай"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Clothing_GRP_InagawaKai"; 
		icon = ""; 
		condition = "true";
	};
		class RRPgroup_Shop_Weapons_GRP_InagawaKai
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13801.9, 20200.8, 36.0664},{-0.627329, 0.778754, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "GreekHead_A3_05";
		loadout[] = {{},{},{},{"vvv_character_agente_473",{}},{},{},"","G_WirelessEarpiece_F",{},{"","","","","",""}};
		name = "Муши Аль Зидо"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Weapons_GRP_InagawaKai"; 
		icon = ""; 
		condition = "true";
	};
		class RRPgroup_Shop_Air_inagawakai
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13807, 20210.2, 35.8659},{-0.926623, -0.375993, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "asczHead_hammond_A3";
		loadout[] = {{},{},{},{"vvv_character_agente_473",{}},{},{},"","G_WirelessEarpiece_F",{},{"","","","","",""}};
		name = "Касио Чан"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Air_GRP_InagawaKai"; 
		icon = ""; 
		condition = "true";
	};
		class RRPgroup_Shop_CarAndAir_inagawakai
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13850.8, 20167.6, 35.4292},{0.956563, 0.291524, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "WhiteHead_11";
		loadout[] = {{},{},{},{"vvv_character_agente_473",{}},{},{},"","G_WirelessEarpiece_F",{},{"","","","","",""}};
		name = "Сироку Ай Кихиро"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_CarAndAir_GRP_inagawakai"; 
		icon = ""; 
		condition = "true";
	};
	//	
	class RRPgroup_inagawakai_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13825.9, 20165.7, 35.1991},{0.28263, 0.959229, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Lamb_Hgun"};
		face = "asczHead_plumber_A3";
		loadout[] = {{"hgun_mas_mp7_F","","","optic_Yorris",{"40Rnd_mas_46x30_Mag",40},{},""},{},{},{"U_C_FormalSuit_01_tshirt_black_F",{{"40Rnd_mas_46x30_Mag",2,40}}},{},{},"H_MilCap_ocamo","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = "Джордж Браун"; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_inagawakai_2
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13819.1, 20163, 35.0861},{0.429597, -0.903021, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1ManCopy"};
		face = "WhiteHead_09";
		loadout[] = {{"hgun_mas_mp7_F","","","optic_Yorris",{"40Rnd_mas_46x30_Mag",40},{},""},{},{},{"U_C_FormalSuit_01_tshirt_black_F",{{"40Rnd_mas_46x30_Mag",2,40}}},{},{},"H_MilCap_ocamo","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = "Дилан Нельсон"; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_inagawakai_3
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13776.1, 20205.1, 35.7985},{-0.868746, 0.495257, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Lamb_Hgun"};
		face = "WhiteHead_21";
		loadout[] = {{"hgun_mas_mp7_F","","","optic_Yorris",{"40Rnd_mas_46x30_Mag",40},{},""},{},{},{"U_C_FormalSuit_01_tshirt_black_F",{{"40Rnd_mas_46x30_Mag",2,40}}},{},{},"H_MilCap_ocamo","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = "Дэниэл Харрис"; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_inagawakai_4
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13805.1, 20196.6, 36.0452},{-0.498471, -0.866906, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1ManCopy"};
		face = "WhiteHead_14";
		loadout[] = {{"hgun_mas_mp7_F","","","optic_Yorris",{"40Rnd_mas_46x30_Mag",40},{},""},{},{},{"U_C_FormalSuit_01_tshirt_black_F",{{"40Rnd_mas_46x30_Mag",2,40}}},{},{},"H_MilCap_ocamo","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = "Натан Смит"; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_inagawakai_5
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{13854.9, 20187.5, 35.8038},{-0.45253, 0.891749, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1ManCopy"};
		face = "WhiteHead_10";
		loadout[] = {{"hgun_mas_mp7_F","","","optic_Yorris",{"40Rnd_mas_46x30_Mag",40},{},""},{},{},{"U_C_FormalSuit_01_tshirt_black_F",{{"40Rnd_mas_46x30_Mag",2,40}}},{},{},"H_MilCap_ocamo","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = "Сайкс Джексон"; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};



	//Black Panters
	class RRPgroup_Shop_Weapons_Cigane
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23682.3, 24263.3, 61.7611},{0.961198, 0.275859, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_table1"};
		face = "Barklem";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Bomber_Jacket1",{{"RH_30Rnd_9x19_UZI",3,30}}},{"Gsg9_PlateCarrier_Black_Assault",{}},{},"d3s_CAP_Headgear","",{},{"","","","","",""}};
		name = "Джей Зи"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Weapons_GRP_Cigane"; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Shop_Clothing_Cigane
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23681.5, 24266.2, 61.5856},{0.974595, 0.223975, 0},{0, 0, 1}};
		animations[] = {"PLP_vehicle_passenger_stand_2_Idle_Unarmed_Idling_Hgun"};
		face = "AfricanHead_03";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Bomber_Jacket1",{{"RH_30Rnd_9x19_UZI",3,30}}},{"Gsg9_PlateCarrier_Black_Assault",{}},{},"d3s_CAP_Headgear","",{},{"","","","","",""}};
		name = "Майк МаУэшггер"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Clothing_GRP_Cigane"; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Shop_Car_Cigane
	{
		objectClassName = "RRP_NPC_Trader"; //тачки
		objPosition[] = {{23741.3, 24208.3, 60.1849},{-0.967823, -0.251634, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_table1"};
		face = "TanoanHead_A3_07";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Bomber_Jacket1",{{"RH_30Rnd_9x19_UZI",3,30}}},{"Gsg9_PlateCarrier_Black_Assault",{}},{},"d3s_CAP_Headgear","",{},{"","","","","",""}};
		name = "Тории Лоу"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Car_GRP_Cigane"; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Shop_Air_Cigane
	{
		objectClassName = "RRP_NPC_Trader";//верты
		objPosition[] = {{23740.7, 24210.6, 60.0178},{-0.985533, -0.169486, 0},{0, 0, 1}};
		animations[] = {"PLP_vehicle_passenger_stand_2_Idle_Unarmed_Idling_Hgun"};
		face = "TanoanHead_A3_08";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Bomber_Jacket1",{{"RH_30Rnd_9x19_UZI",3,30}}},{"Gsg9_PlateCarrier_Black_Assault",{}},{},"d3s_CAP_Headgear","",{},{"","","","","",""}};
		name = "Стив"; 
		description = ""; 
		startDialog = "RRP_Dialog_Shop_Air_GRP_Cigane"; 
		icon = ""; 
		condition = "true";
	};
	//неписи визуалы
	class RRPgroup_Cigane_1
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23696.5, 24261.5, 61.3886},{-0.738674, -0.674063, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Lamb_Hgun"};
		face = "AfricanHead_01";
		loadout[] = {{},{},{"RH_Deagleg","","","",{"RH_7Rnd_50_AE",7},{},""},{"PAT_nigga5",{{"RH_7Rnd_50_AE",2,7}}},{},{},"pat_cap_nigga_back","G_mas_wpn_wrap_gog_b",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_2
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23696.5, 24260.9, 61.4654},{-0.438424, -0.898768, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "AfricanHead_02";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Clothing_Style6",{}},{},{},"pat_cap9_front","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_3
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23686, 24268.5, 61.6284},{-0.997797, 0.0663365, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1Man_enableFire"};
		face = "asczHead_josephe_A3";
		loadout[] = {{"arifle_mas_akms","","","",{"30Rnd_mas_762x39_mag",30},{},""},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Bomber_Jacket1",{{"RH_30Rnd_9x19_UZI",3,30},{"30Rnd_mas_762x39_mag",3,30}}},{"Gsg9_PlateCarrier_Black_Assault",{}},{},"pat_cap_nigga","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_4
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23716.6, 24269.1, 61.716},{-0.997797, 0.0663365, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1Man_enableFire"};
		face = "asczHead_murphy_A3";
		loadout[] = {{"Winchester1897_01","","","",{"6Rnd_00_Buckshot_Magazine",6},{},""},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Bomber_Jacket1",{{"RH_30Rnd_9x19_UZI",3,30},{"6Rnd_00_Buckshot_Magazine",3,6}}},{"Gsg9_PlateCarrier_Black_Assault",{}},{},"pat_cap_nigga","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_5
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23681, 24202.8, 58.6363},{0.808365, 0.588682, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_ActsPercMstpSnonWnonDnon_MarianQ_shot1Man_enableFire"};
		face = "Barklem";
		loadout[] = {{"Winchester1897_01","","","",{"6Rnd_00_Buckshot_Magazine",6},{},""},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Bomber_Jacket1",{{"RH_30Rnd_9x19_UZI",3,30},{"6Rnd_00_Buckshot_Magazine",3,6}}},{"Gsg9_PlateCarrier_Black_Assault",{}},{},"pat_cap_nigga","G_mas_wpn_gog_d",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_6
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23718, 24249.4, 60.4507},{0.566529, -0.824042, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_ActsPpneMstpSnonWnonDnon_Injured1_enableFire"};
		face = "AfricanHead_03";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Clothing_tolstovka_2",{}},{},{},"pat_durag_black","murshun_cigs_cig3",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_7
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23719.9, 24249.1, 60.4733},{-0.575391, 0.817878, 0},{0, 0, 1}};
		animations[] = {"AG_slavicSquat_loop"};
		face = "TanoanHead_A3_07";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"Johny_Club_ANZUS",{}},{},{},"AG_Dreadlocks","murshun_cigs_cig3",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_8
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23719.5, 24250.5, 60.5004},{-0.0294003, -0.999568, 0},{0, 0, 1}};
		animations[] = {"AG_slavicSquat_loop"};
		face = "TanoanHead_A3_08";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"RRP_Ridus_Jacket_BLK",{}},{},{},"d3s_CAP_Headgear","G_Squares_Tinted",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_9
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23680.5, 24284.1, 60.9105},{-0.75579, -0.654814, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_ActsPpneMstpSnonWnonDnon_Injured2_enableFire"};
		face = "AfricanHead_01";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"mgsr_robe_olive_muddy",{}},{},{},"AG_Dreads","",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};
	class RRPgroup_Cigane_10
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{23679.7, 24282.5, 60.7072},{0.789352, -0.613941, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPpneMstpSnonWnonDnon_Injured1"};
		face = "AfricanHead_02";
		loadout[] = {{},{},{"RH_muzi","","","",{"RH_30Rnd_9x19_UZI",30},{},""},{"mgsr_robe_blue_muddy",{{"RH_30Rnd_9x19_UZI",2,30}}},{},{},"","",{},{"","","","","",""}};
		name = ""; 
		description = ""; 
		startDialog = ""; 
		icon = ""; 
		condition = "true";
	};


	/* Мини грп */

	/* Структуры */

	/* Тюрьма */
	class NPC_Move_Jail_1
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3002.16, 17780.6, 49.5811},{0.0761084, -0.9971, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_05";
        loadout[] = {{"arifle_MX_Black_F","","","optic_Yorris",{"30Rnd_65x39_caseless_black_mag",30},{},""},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"pd_form_unif_SSE",{{"KA_17Rnd_9x19_Mag",3,17},{"29rnd_300BLK_STANAG",3,30}}},{"pd_form_unif_bron_1",{}},{},"pol_beret_1","G_Aviator",{},{"","","","","",""}};
		name = "Льюис Кобурн";
		description = "«Следит за порядком на тюрьме, и мышь не пробежит без его ведома»";
		startDialog = "RRP_Dialog_NPC_STR_Jail_1";
		icon = "\RRP_icons\NPC\RRP_Icon_Move.paa";
		condition = "true";
	};
	class NPC_Move_Jail_2: NPC_Move_Jail_1
	{
		objPosition[] = {{2984.41, 17803.4, 49.5811},{-0.741204, 0.671279, 0},{0, 0, 1}};
		face = "asczHead_plumber_A3";
		name = "Эдвард О'Брайан";
		startDialog = "RRP_Dialog_NPC_STR_Jail_2";
	};
	class NPC_Move_Jail_3: NPC_Move_Jail_1
	{
		objPosition[] = {{2986.74, 17801.2, 49.6031},{0.999908, 0.0135535, 0},{0, 0, 1}};
		face = "asczHead_plumber_A3";
		name = "Джошуа Скотт";
		startDialog = "RRP_Dialog_NPC_STR_Jail_3";
	};

	/* 7 News */
	class NPC_Seller_7News
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{4608.9, 15391.2, 259.339},{-0.892048, 0.45194, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_loop"};
		face = "WhiteHead_05";
        loadout[] = {{},{},{},{"U_C_Poor_1",{}},{"V_Press_F",{}},{},"H_Hat_blue","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Экипировка";
		description = "«Торговец 7 News»";
		startDialog = "RRP_Dialog_NPC_STR_1";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Air_7News
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{4555.74, 15419.1, 258.991},{0.913152, -0.407618, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_loop"};
		face = "WhiteHead_05";
        loadout[] = {{},{},{},{"U_C_Poor_1",{}},{"V_Press_F",{}},{},"H_Hat_blue","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Воздушная техника";
		description = "«Торговец 7 News»";
		startDialog = "RRP_Dialog_NPC_STR_2";
		icon = "\RRP_icons\NPC\RRP_Icon_Heli.paa";
		condition = "true";
	};
	class NPC_Veh_7News
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{4566.39, 15401.5, 259.124},{0.125047, -0.992151, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_loop"};
		face = "asczHead_troska_A3";
		loadout[] = {{},{},{},{"U_C_Poor_1",{}},{"V_Press_F",{}},{},"H_Hat_blue","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Наземная техника";
		description = "«Торговец 7 News»";
		startDialog = "RRP_Dialog_NPC_STR_3";
		icon = "\RRP_icons\NPC\RRP_Icon_Car.paa";
		condition = "true";
	};

	/* Minust */
	class NPC_Seller_Minust
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3692.8, 13402.4, 8.78585},{-0.808057, 0.589104, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_loop"};
		face = "asczHead_novotny_A3";
        loadout[] = {{},{},{},{"vvv_character_agente_473",{}},{"NC_PBDFG2_B_1",{}},{},"Skyline_HeadGear_Cowboy_05_F","",{},{"","","","","",""}};
		name = "Экипировка";
		description = "«Торговец Мин. юстиции»";
		startDialog = "RRP_Dialog_NPC_STR_13";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Veh_Minust
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{3663.3, 13372.7, 7.20383},{-0.94509, -0.32681, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_loop"};
		face = "asczHead_neumann_A3";
		loadout[] = {{},{},{},{"vvv_character_agente_473",{}},{"NC_PBDFG2_B_1",{}},{},"Skyline_HeadGear_Cowboy_05_F","",{},{"","","","","",""}};
		name = "Наземная техника";
		description = "«Торговец Мин. юстиции»";
		startDialog = "RRP_Dialog_NPC_STR_15";
		icon = "\RRP_icons\NPC\RRP_Icon_Car.paa";
		condition = "true";
	};

	/* Taxi 
	class NPC_Seller_Taxi
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{12794.6, 16731.4, 82.3621},{-0.443326, -0.89636, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_loop"};
		face = "asczHead_novotny_A3";
        loadout[] = {{},{},{},{"Rimas_taxi",{}},{"V_Taxi_yellow_F",{}},{},"TAXI_Mcap_1","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Экипировка";
		description = "«Торговец Такси»";
		startDialog = "RRP_Dialog_NPC_STR_16";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Seller_Taxi_2: NPC_Seller_Taxi
	{
		objPosition[] = {{3797.83, 13292.3, 6.52186},{-0.75808, 0.652161, 0},{0, 0, 1}};
	};
	class NPC_Air_Taxi
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{12795.6, 16711, 82.3621},{0.412053, -0.91116, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_loop"};
		face = "WhiteHead_03";
        loadout[] = {{},{},{},{"Rimas_taxi",{}},{"V_Taxi_yellow_F",{}},{},"TAXI_Mcap_1","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Воздушная техника";
		description = "«Торговец Такси»";
		startDialog = "RRP_Dialog_NPC_STR_17";
		icon = "\RRP_icons\NPC\RRP_Icon_Heli.paa";
		condition = "true";
	};
	class NPC_Air_Taxi_2: NPC_Air_Taxi
	{
		objPosition[] = {{3781.11, 13263.7, 5.86994},{0.113629, 0.993523, 0},{0, 0, 1}};
		startDialog = "RRP_Dialog_NPC_STR_17_2";
	};
	class NPC_Veh_Taxi
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{12796.6, 16713.9, 82.3621},{-0.887663, 0.460494, 0},{0, 0, 1}};
		animations[] = {"HubBriefing_loop"};
		face = "asczHead_neumann_A3";
		loadout[] = {{},{},{},{"Rimas_taxi",{}},{"V_Taxi_yellow_F",{}},{},"TAXI_Mcap_1","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Наземная техника";
		description = "«Торговец Такси»";
		startDialog = "RRP_Dialog_NPC_STR_18";
		icon = "\RRP_icons\NPC\RRP_Icon_Car.paa";
		condition = "true";
	};
	class NPC_Veh_Taxi_2: NPC_Veh_Taxi
	{
		objPosition[] = {{3790.18, 13283.1, 6.52186},{-0.728581, -0.68496, 0},{0, 0, 1}};
		startDialog = "RRP_Dialog_NPC_STR_18_2";
	};
	*/
	/* Police */
	class NPC_Seller_PD
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3704.9, 12626.4, 27.7622},{-0.0464069, -0.998923, 0},{0, 0, 1}};
		animations[] = {"HubStandingUB_idle2"};
		face = "WhiteHead_05";
        loadout[] = {{},{},{"DDOPP_X26_b","","","",{"DDOPP_1Rnd_X26",1},{},""},{"pd_form_unif_PR",{{"DDOPP_1Rnd_X26",3,1}}},{"pd_form_unif_bron_1",{}},{},"pol_cap_1","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Экипировка";
		description = "«Торговец полицейского департамента»";
		startDialog = "RRP_Dialog_NPC_STR_4";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Seller_FBI: NPC_Seller_PD
	{
		objPosition[] = {{3690.67, 12569.7, 23.4502},{0.898077, 0.439838, 0},{0, 0, 1}};
	};
	class NPC_Seller_Jail: NPC_Seller_PD
	{
	    objPosition[] = {{3025.04, 17803.8, 49.5811},{0.997993, 0.0633228, 0},{0, 0, 1}};
	};
	class NPC_Seller_KPP: NPC_Seller_PD
	{	
		objPosition[] = {{5156.17, 14547.5, 17.4357},{-0.993002, 0.1181, 0},{0, 0, 1}};

	};
	class NPC_Air_PD
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3690.73, 12612.3, 32.0737},{0.983349, -0.181728, 0},{0, 0, 1}};
		animations[] = {"HubStandingUB_idle2"};
		face = "WhiteHead_05";
        loadout[] = {{},{},{"DDOPP_X26_b","","","",{"DDOPP_1Rnd_X26",1},{},""},{"pd_form_unif_PR",{{"DDOPP_1Rnd_X26",3,1}}},{"pd_form_unif_bron_1",{}},{},"pol_cap_1","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Воздушная техника";
		description = "«Торговец полицейского департамента»";
		startDialog = "RRP_Dialog_NPC_STR_5";
		icon = "\RRP_icons\NPC\RRP_Icon_Heli.paa";
		condition = "true";
	};
	class NPC_Air_FBI: NPC_Air_PD
	{
	    objPosition[] = {{7505.68, 16679.3, 233.611},{-0.989962, -0.141331, 0},{0, 0, 1}};
		name = "Джилиан Уоррен"; 
	    startDialog = "RRP_Dialog_NPC_STR_7";
	};
	class NPC_Air_KPP: NPC_Air_PD
	{
		objPosition[] = {{5168.75, 14529.6, 17.2668},{-0.99039, 0.138302, 0},{0, 0, 1}};
		name = "Джек Эванс"; 
	    startDialog = "RRP_Dialog_NPC_STR_10";
	};
	class NPC_Veh_KPP: NPC_Air_PD
	{
		objPosition[] = {{5168.87, 14526.7, 17.2985},{-0.948252, 0.31752, 0},{0, 0, 1}};
	    startDialog = "RRP_Dialog_NPC_STR_11";
	};
	class NPC_Air_Jail: NPC_Air_PD
	{
	    objPosition[] = {{3057.06, 17773.7, 49.5811},{-0.639169, 0.769067, 0},{0, 0, 1}};
	    startDialog = "RRP_Dialog_NPC_STR_7_2";
	};
	class NPC_Veh_PD
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{3676.66, 12613.3, 23.3536},{-0.993547, 0.113422, 0},{0, 0, 1}};
		animations[] = {"HubStandingUB_idle2"};
		face = "asczHead_troska_A3";
		loadout[] = {{},{},{"DDOPP_X26_b","","","",{"DDOPP_1Rnd_X26",1},{},""},{"pd_form_unif_PR",{{"DDOPP_1Rnd_X26",3,1}}},{"pd_form_unif_bron_1",{}},{},"pol_cap_1","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Наземная техника";
		description = "«Торговец полицейского департамента»";
		startDialog = "RRP_Dialog_NPC_STR_6";
		icon = "\RRP_icons\NPC\RRP_Icon_Car.paa";
		condition = "true";
	};
    class NPC_Veh_FBI: NPC_Veh_PD
	{
	    objPosition[] = {{7520.47, 16706, 233.611},{-0.993603, 0.112934, 0},{0, 0, 1}};
	    startDialog = "RRP_Dialog_NPC_STR_8";
	};
	class NPC_Veh_Jail: NPC_Veh_PD
	{
	    objPosition[] = {{3040.82, 17813.8, 49.5811},{0.714752, -0.699378, 0},{0, 0, 1}};
	    startDialog = "RRP_Dialog_NPC_STR_8_2";
	};
    class NPC_Ship_PD
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{3615.43, 12604, 23.1496},{0.993966, -0.109688, 0},{0, 0, 1}};
		animations[] = {"HubStandingUB_idle2"};
		face = "asczHead_troska_A3";
		loadout[] = {{},{},{"DDOPP_X26_b","","","",{"DDOPP_1Rnd_X26",1},{},""},{"pd_form_unif_PR",{{"DDOPP_1Rnd_X26",3,1}}},{"pd_form_unif_bron_1",{}},{},"pol_cap_1","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Водная техника";
		description = "";
		startDialog = "RRP_Dialog_NPC_STR_8_Ship";
		icon = "\RRP_icons\NPC\RRP_Icon_Ship.paa";
		condition = "true";
	};
	class NPC_CheckCrime_PD_1
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{3688.65, 12611.2, 23.6606},{0.567317, 0.8235, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "asczHead_troska_A3";
		loadout[] = {{},{},{"DDOPP_X26_b","","","",{"DDOPP_1Rnd_X26",1},{},""},{"pd_form_unif_PR",{{"DDOPP_1Rnd_X26",3,1}}},{"pd_form_unif_bron_1",{}},{},"pol_cap_1","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Каллум Уард";
		description = "«Обратившись к инспектору, вы можете оплатить штраф, а также получить справку о правонарушениях»";
		startDialog = "RRP_Dialog_NPC_STR_9";
		icon = "\RRP_icons\NPC\RRP_Icon_Ticket.paa";
		condition = "true";
	};
	class NPC_CheckCrime_PD_2: NPC_CheckCrime_PD_1
	{
        objPosition[] = {{3757.26, 13021.6, 7.81718},{-0.998544, -0.0539484, 0},{0, 0, 1}};
		name = "Натан Миллер";
	};
	class NPC_CheckCrime_PD_3: NPC_CheckCrime_PD_1
	{
        objPosition[] = {{12777.3, 16646.6, 83.1015},{0.90376, 0.428039, 0},{0, 0, 1}};
		name = "Коннор Уоррен";
	};
	/* Штрафстоянка */
	class NPC_Tow_PD_1: NPC_CheckCrime_PD_1
	{
        objPosition[] = {{6164.19, 15143.3, 25.1227},{0.742065, 0.670328, 0},{0, 0, 1}};
		name = "Тэвиш Уильямс";
		description = "«Забрать авто со штрафстоянки, можно только после предъявления чека об оплате штрафа»";
		startDialog = "RRP_NPC_Tow";
        icon = "\RRP_icons\NPC\RRP_Icon_Tow.paa";
	};

    /* EMS */
	class NPC_Seller_EMS
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3760.31, 12998.7, 7.91433},{-0.996932, 0.0782718, 0},{0, 0, 1}};
		animations[] = {"HubStandingUB_idle2"};
		face = "WhiteHead_05";
        loadout[] = {{},{},{},{"Rimas_EMS_Doctor2",{}},{},{},"","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Экипировка";
		description = "«Торговец МЧС»";
		startDialog = "RRP_Dialog_NPC_STR_10_EMS";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Seller_EMS_2: NPC_Seller_EMS
	{
		objPosition[] = {{17027.8, 12793.1, 16.4502},{0.755323, 0.655353, 0},{0, 0, 1}};
	};
	class NPC_Air_EMS
	{
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3738.39, 13001.2, 21.5736},{0.968733, -0.248107, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Orlando_Hgun_enableFire"};
		face = "WhiteHead_05";
        loadout[] = {{},{},{},{"Rimas_EMS_Doctor2",{}},{},{},"","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Воздушная техника";
		description = "«Торговец МЧС»";
		startDialog = "RRP_Dialog_NPC_STR_11_EMS";
		icon = "\RRP_icons\NPC\RRP_Icon_Heli.paa";
		condition = "true";
	};
	class NPC_Air_EMS_2: NPC_Air_EMS
	{
		objPosition[] = {{17014.1, 12802.6, 30.1124},{0.72775, -0.685843, 0},{0, 0, 1}};
		startDialog = "RRP_Dialog_NPC_STR_11_2";
	};
	class NPC_Veh_EMS
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{3771.3, 12992.2, 7.87803},{0.968733, -0.248107, 0},{0, 0, 1}};
		animations[] = {"HubStandingUB_idle2"};
		face = "asczHead_troska_A3";
		loadout[] = {{},{},{},{"Rimas_EMS_Doctor2",{}},{},{},"","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Наземная техника";
		description = "«Торговец МЧС»";
		startDialog = "RRP_Dialog_NPC_STR_12";
		icon = "\RRP_icons\NPC\RRP_Icon_Car.paa";
		condition = "true";
	};
	class NPC_Veh_EMS_2: NPC_Veh_EMS
	{
        objPosition[] = {{17012.8, 12811.4, 16.4211},{0, 1, 0},{0, 0, 1}};
		startDialog = "RRP_Dialog_NPC_STR_12_2";
	};


	/* Столица повстанцев */
    class NPC_Trader_Rebel_1
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{11233, 8756.82, 172.801},{0.986789, -0.16201, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SC_Loop"};
		face = "asczHead_vlk_A3";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_C_Soldier_Bandit_1_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_PlateCarrier2_wdl",{}},{},"H_Hat_tan","immersion_cigs_cigar4",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Дэниэл Конрад";
		description = "«Торговец нелегальными вещами, ввезенными подпольно. Продаст все необходимое для того чтобы пойти на дело»";
		startDialog = "RRP_Dialog_NPC_Rebel_1";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	/*
	class NPC_Trader_Rebel_1_2: NPC_Trader_Rebel_1
	{
        objPosition[] = {{9152.82, 21663.8, 14.4029},{0.827998, 0.560731, 0},{0, 0, 1}};
        name = "Брайан Шпигельман";
	};
	class NPC_Trader_Rebel_1_3: NPC_Trader_Rebel_1
	{
		objPosition[] = {{23724.3, 24273.7, 61.7154},{-0.83043, -0.557123, 0},{0, 0, 1}};
        name = "Брайан Шпигельман";
	};*/
	class NPC_Trader_Rebel_2
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{11239.3, 8755.69, 172.793},{-0.0086057, -0.999963, 0},{0, 0, 1}};
		animations[] = {"Acts_JetsCrewaidF_idle"};
		face = "asczHead_vlk_A3";
		loadout[] = {{},{},{"KA_Glock_18_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"U_I_L_Uniform_01_deserter_F",{{"KA_17Rnd_9x19_Mag",3,17}}},{"V_SmershVest_01_radio_F",{}},{},"H_Hat_camo","G_Bandanna_aviator",{},{"","","","","",""}};
		name = "Люк Кэмпбелл";
		description = "«У него вы можете купить авто, не совсем прозрачного происхождения»";
		startDialog = "RRP_Dialog_NPC_Rebel_2";
		icon = "\RRP_icons\NPC\RRP_Icon_Car.paa";
		condition = "true";
	};
	class NPC_Trader_Rebel_2_2: NPC_Trader_Rebel_2
	{
        objPosition[] = {{9158.1, 21667.3, 14.3856},{0.650502, -0.759505, 0},{0, 0, 1}};
        startDialog = "RRP_Dialog_NPC_Rebel_2_2";
        name = "Шон Мерфи";
	};
	class NPC_Trader_Rebel_3
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{11236, 8722.71, 172.77},{0.0434373, 0.999056, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_01";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"U_I_L_Uniform_01_tshirt_olive_F",{{"KA_17Rnd_9x19_Mag",3,17},{"30Rnd_762x39_Mag_F",2,30}}},{"V_CarrierRigKBT_01_light_Olive_F",{{"30Rnd_762x39_Mag_F",1,30}}},{},"H_Shemag_olive","",{},{"","","","","",""}};
		name = "Эдвард Янг";
		description = "«Бывший военный летчик, а ныне продавец воздушной техники для серьезных клиентов»";
		startDialog = "RRP_Dialog_NPC_Rebel_3";
		icon = "\RRP_icons\NPC\RRP_Icon_Heli.paa";
		condition = "true";
	};
	class NPC_Trader_Rebel_3_2: NPC_Trader_Rebel_3
	{
        objPosition[] = {{9164.56, 21671.3, 14.3888},{0.655057, -0.75558, 0},{0, 0, 1}};
        startDialog = "RRP_Dialog_NPC_Rebel_3_2";
        name = "Конор Грин";
	};
	class NPC_Trader_Rebel_4
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{11217.1, 8669.59, 172.831},{0.0435676, 0.99905, 0},{0, 0, 1}};
		animations[] = {"Acts_JetsCrewaidF_idle"};
		face = "WhiteHead_03";
		loadout[] = {{},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"U_I_L_Uniform_01_deserter_F",{{"KA_17Rnd_9x19_Mag",3,17}}},{"V_SmershVest_01_F",{}},{},"H_ParadeDressCap_01_US_F","G_Aviator",{},{"","","","","",""}};
		name = "Бенито Кастро";
		description = "«Троюродный племянник Фиделя Кастро, агитирующий за свержение власти и вербовку повстанцев»";
		startDialog = "RRP_Dialog_NPC_Rebel_4";
		icon = "\RRP_icons\NPC\RRP_Icon_Rebel.paa";
		condition = "true";
	};
	class NPC_Trader_Rebel_4_2: NPC_Trader_Rebel_4
	{
        objPosition[] ={{9177.7,21679.2,14.9552},{0.525083,-0.851051,0},{0, 0, 1}};
	};
    class NPC_Trader_Rebel_5_1
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{11243.5, 8755.4, 172.855},{-0.305629, -0.952151, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SC_Loop"};
		face = "asczHead_vlk_A3";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_C_Soldier_Bandit_1_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_PlateCarrier2_wdl",{}},{},"H_Hat_tan","immersion_cigs_cigar4",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джексон Торгаш";
		description = "«Торговец нелегальными вещами, ввезенными подпольно. Продаст все необходимое для того чтобы пойти на дело»";
		startDialog = "RRP_Dialog_NPC_Rebel_5";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
    class NPC_Trader_Rebel_5_2
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{9171.32, 21668.6, 14.3963},{0.207682, -0.978196, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SC_Loop"};
		face = "asczHead_vlk_A3";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_C_Soldier_Bandit_1_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_PlateCarrier2_wdl",{}},{},"H_Hat_tan","immersion_cigs_cigar4",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Даниил Мусор";
		description = "«Торговец нелегальными вещами, ввезенными подпольно. Продаст все необходимое для того чтобы пойти на дело»";
		startDialog = "RRP_Dialog_NPC_Rebel_5";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Secure_Rebel_0
	{
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{11259.7, 8738.08, 172.795},{-0.999443, -0.0333581, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_patrolling2"};
		face = "WhiteHead_05";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_E_Uniform_01_tanktop_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_CarrierRigKBT_01_light_Olive_F",{}},{},"H_HelmetB_tna_F","H_Shemag_olive_hs",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Диксон Фолкнер";
		description = "«Занимается охраной общественного порядка»";
		startDialog = "";
		icon = "\RRP_icons\NPC\RRP_Icon_Guard.paa";
		condition = "true";
	};
	class NPC_Secure_Rebel_1: NPC_Secure_Rebel_0
	{
        objPosition[] = {{11218.1, 8711.11, 172.795},{0, 1, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMwlkSlowWrflDnon_PatrolingBase3"};
		face = "WhiteHead_05";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_E_Uniform_01_tanktop_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_SmershVest_01_F",{}},{},"H_HelmetB_tna_F","H_Shemag_olive_hs",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джек Томас";
	};
	class NPC_Secure_Rebel_1_2: NPC_Secure_Rebel_1
	{
        objPosition[] = {{9167.89, 21647.8, 14.4309},{0, 1, 0},{0, 0, 1}};
        name = "Шарль Фолкнер";
	};
	class NPC_Secure_Rebel_2: NPC_Secure_Rebel_0
	{
        objPosition[] = {{11273.3, 8651.25, 186.126},{0.791273, -0.611463, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "AfricanHead_01";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_E_Uniform_01_tanktop_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_CarrierRigKBT_01_light_Olive_F",{}},{},"H_HelmetB_tna_F","H_Shemag_olive_hs",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Дилан Барр";
		startDialog = "RRP_Dialog_Guard";
	};
	class NPC_Secure_Rebel_2_2: NPC_Secure_Rebel_2
	{
        objPosition[] = {{9187.92,21674.1,17.4801},{0.896757,-0.442522,0},{0, 0, 1}};
        name = "Гаррисон Сюарт";
	};
	class NPC_Secure_Rebel_2_3: NPC_Secure_Rebel_2
	{
        objPosition[] = {{9210.05,21602.4,19.1935},{-0.168082,0.985773,0},{0, 0, 1}};
        name = "Дилан Уоррен";
        face = "WhiteHead_13";
	};
	class NPC_Secure_Rebel_3: NPC_Secure_Rebel_0
	{
        objPosition[] = {{11188.5, 8766.05, 175.584},{0.955299, 0.29564, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_08";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_E_Uniform_01_tanktop_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_CarrierRigKBT_01_light_Olive_F",{}},{},"H_HelmetB_tna_F","H_Shemag_olive_hs",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Чад Эдвардс";
		startDialog = "RRP_Dialog_Guard";
	};
	class NPC_Secure_Rebel_4: NPC_Secure_Rebel_0
	{
        objPosition[] = {{11178.2, 8652.65, 172.733},{0.770067, 0.637963, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "asczHead_josephe_A3";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_E_Uniform_01_tanktop_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_SmershVest_01_F",{}},{},"H_HelmetB_tna_F","H_Shemag_olive_hs",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джордж Дайтон";
		startDialog = "RRP_Dialog_Guard";
	};
	class NPC_Secure_Rebel_5: NPC_Secure_Rebel_0
	{
        objPosition[] = {{11216.5, 8667.6, 174.295},{-0.0130803, 0.999914, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_03";
		loadout[] = {{"arifle_AKM_F","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_E_Uniform_01_tanktop_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_CarrierRigKBT_01_light_Olive_F",{}},{},"H_HelmetB_tna_F","H_Shemag_olive_hs",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Дэвид Джонсон";
		startDialog = "RRP_Dialog_Guard";
	};


    /* Обычные НПС */

    /* Палладий (Охрана) */
    class NPC_Secure_Palladium_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{14169.7, 21268.8, 77.4346},{0.537918, -0.842997, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_10";
		loadout[] = {{"SMG_02_F","muzzle_snds_L","acc_pointer_IR","optic_Yorris",{"30Rnd_9x21_Mag_SMG_02",30},{},""},{},{},{"U_B_CBRN_Suit_01_Wdl_F",{{"30Rnd_9x21_Mag_SMG_02",3,30}}},{"V_PlateCarrierSpec_wdl",{}},{"B_CombinationUnitRespirator_01_F",{}},"","G_RegulatorMask_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Оскар Мур";
		description = "«Занимается охраной общественного порядка»";
		startDialog = "RRP_Dialog_Guard";
		icon = "\RRP_icons\NPC\RRP_Icon_Guard.paa";
		condition = "true";
	};
	class NPC_Secure_Palladium_2: NPC_Secure_Palladium_1
	{
		objPosition[] = {{14143.4, 21243.6, 80.3572},{0.999751, -0.0223208, 0},{0, 0, 1}};
		face = "WhiteHead_07";
		name = "Лайам Джонс";
	};
    class NPC_Secure_Palladium_3: NPC_Secure_Palladium_1
	{
		objPosition[] = {{14150.7, 21247.9, 77.3259},{0.0552474, -0.998473, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_repairVehiclePne"};
		face = "asczHead_voodoo_A3";
		loadout[] = {{},{},{},{"U_B_CBRN_Suit_01_Wdl_F",{}},{"V_PlateCarrierSpec_wdl",{}},{},"","G_RegulatorMask_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Мэтью Робинсон";
		startDialog = "";
	};

	/* Коллекционер */
    class NPC_Scrap_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9275.04, 12645.1, 17.0999},{0.786759, -0.61726, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_repairVehiclePne"};
		face = "WhiteHead_04";
		loadout[] = {{},{},{},{"U_C_Poloshirt_tricolour",{}},{},{},"H_StrawHat","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джордж Уолш";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};

    /* Аномальная зона */
    class NPC_Anomaly_Soldier_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{7776.46, 6583.51, 14.5067},{0.697781, 0.716311, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_20";
		loadout[] = {{"AKM_ADIDAS","","","optic_Yorris",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30},{"1Rnd_HE_Grenade_shell",1,1}}},{"V_RRPw_PlateCarrier2_desert",{{"1Rnd_HE_Grenade_shell",2,1}}},{},"RRPw_H_PASGT_goggles_UN_F","G_Balaclava_snd_RRPw",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Тобу Кэмпбелл";
		description = "";
		startDialog = "";
		icon = "\RRP_icons\NPC\RRP_Icon_Guard.paa";
		condition = "true";
	};
	class NPC_Anomaly_Soldier_3: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7751.89, 6585.6, 16.8956},{0.976425, 0.215859, 0},{0, 0, 1}};
		animations[] = {"AidlPpneMstpSrasWrflDnon_G02"};
		face = "WhiteHead_05";
		loadout[] = {{"MMG_01_tan_F","","","",{"150Rnd_93x64_Mag",200},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_RRPw_PlateCarrier2_desert",{}},{},"RRPw_H_PASGT_basic_UN_F","G_Balaclava_snd_RRPw",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Харви Миллер";
	};
	class NPC_Anomaly_Soldier_12: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7687.49, 6521.54, 14.4812},{0.351155, -0.936317, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMwlkSlowWrflDnon_PatrolingBase3"};
		face = "AfricanHead_02";
		loadout[] = {{"arifle_MX_Black_F","","","optic_Yorris",{"30Rnd_65x39_caseless_black_mag",30},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_RRPw_PlateCarrier2_desert",{}},{},"RRPw_H_PASGT_basic_UN_F","G_Balaclava_snd_RRPw",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Райан Джонсон";
	};
	class NPC_Anomaly_Soldier_13: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7670.11, 6507.23, 17.1127},{-0.417756, -0.908559, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "asczHead_austin_A3";
		loadout[] = {{"MMG_01_tan_F","","","",{"150Rnd_93x64_Mag",200},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_RRPw_UN_Vest_F",{}},{},"RRPw_H_PASGT_goggles_UN_F","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Мэттью Коллинз";
	};
	class NPC_Anomaly_Soldier_14: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7678.82, 6502.27, 14.4939},{-0.87891, -0.476988, 0},{0, 0, 1}};
		animations[] = {"AidlPpneMstpSrasWrflDnon_G02"};
		face = "WhiteHead_07";
		loadout[] = {{"MMG_01_tan_F","","","optic_Yorris",{"150Rnd_93x64_Mag",100},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_RRPw_PlateCarrier2_desert",{}},{},"RRPw_H_PASGT_goggles_UN_F","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Оскар Робинсон";
	};
	class NPC_Anomaly_Soldier_15: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7673.59, 6496.73, 15.6615},{-0.691023, 0.722833, 0},{0, 0, 1}};
		animations[] = {"Acts_SittingJumpingSaluting_loop3"};
		face = "asczHead_stick_A3";
		loadout[] = {{"arifle_MX_Black_F","","","optic_Yorris",{"30Rnd_65x39_caseless_black_mag",30},{},""},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_RRPw_PlateCarrier2_desert",{}},{},"RRPw_H_PASGT_goggles_UN_F","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Элфи Барр";
	};
	class NPC_Anomaly_Soldier_16: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7687.45, 6511.84, 15.7219},{0.613226, -0.789908, 0},{0, 0, 1}};
		animations[] = {"HubSittingChairUB_idle1"};
		face = "asczHead_beardy_A3";
		loadout[] = {{},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_RRPw_PlateCarrier2_desert",{}},{},"RRPw_H_Tank_tan_F","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Натан Байх";
	};
	class NPC_Anomaly_Soldier_17: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7676.58, 6515.16, 14.5669},{0.774694, -0.632336, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_01";
		loadout[] = {{"arifle_MXC_Black_F","","","optic_Yorris",{"30Rnd_65x39_caseless_black_mag",30},{},""},{},{},{"U_B_CBRN_Suit_01_Wdl_F",{{"30Rnd_65x39_caseless_black_mag",3,30}}},{"V_PlateCarrier1_wdl",{}},{},"","G_AirPurifyingRespirator_02_olive_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джордж Купер";
	};
	class NPC_Anomaly_Soldier_18: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7673.09, 6524.79, 15.1357},{0.295095, -0.955468, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_01";
		loadout[] = {{"arifle_MXC_Black_F","","","optic_Yorris",{"30Rnd_65x39_caseless_black_mag",30},{},""},{},{},{"U_B_CBRN_Suit_01_Wdl_F",{{"30Rnd_65x39_caseless_black_mag",3,30}}},{"V_PlateCarrierSpec_wdl",{}},{},"","G_AirPurifyingRespirator_02_olive_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Монтгомери Хилл";
	};
	class NPC_Anomaly_Soldier_19: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7788.15, 6554.38, 14.4685},{-0.574033, 0.818832, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_05";
		loadout[] = {{"arifle_MXC_Black_F","","","optic_Yorris",{"30Rnd_65x39_caseless_black_mag",30},{},""},{},{},{"U_B_CBRN_Suit_01_Wdl_F",{{"30Rnd_65x39_caseless_black_mag",3,30}}},{"V_PlateCarrier2_wdl",{}},{},"","G_AirPurifyingRespirator_02_olive_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Лукас Роллинз";
	};
	class NPC_Anomaly_Soldier_20: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{7676.29, 6521.73, 15.1353},{0.847019, 0.531563, 0},{0, 0, 1}};
		animations[] = {"Acts_trailer_campScientist"};
		face = "WhiteHead_12";
		loadout[] = {{},{},{},{"U_C_CBRN_Suit_01_White_F",{}},{},{},"","G_AirPurifyingRespirator_02_black_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Чад Робертс";
	};

    class NPC_Anomaly_Officer_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{7770.61, 6579.34, 14.5067},{-0.262079, 0.965046, 0},{0, 0, 1}};
		animations[] = {"HubStandingUB_idle2"};
		face = "asczHead_murphy_A3";
		loadout[] = {{},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_RRPw_PlateCarrier2_desert",{}},{},"RRPw_H_Beret_Colonel","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Макс Хьюз";
		description = "«Если с ним договориться, то он может пропустить в зону»";
		startDialog = "RRP_Dialog_Anomaly_1";
		icon = "\RRP_icons\NPC\RRP_Icon_Chat.paa";
		condition = "true";
	};
	class NPC_Anomaly_Officer_4
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{7665.52, 6520.86, 15.136},{0.857793, 0.513995, 0},{0, 0, 1}};
		animations[] = {"HubStandingUB_idle2"};
		face = "AfricanHead_03";
		loadout[] = {{},{},{},{"U_RRPw_UN_Camo2",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_RRPw_PlateCarrier2_desert",{}},{},"RRPw_H_Beret_Colonel","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Джеймс Тэйлор";
		description = "«Прежде чем зайти в зону, пройди у него инструктаж, может дать полезный совет»";
		startDialog = "RRP_Dialog_Anomaly_4";
		icon = "\RRP_icons\NPC\RRP_Icon_Chat.paa";
		condition = "true";
	};

	class NPC_Anomaly_Scienist_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{11237.3, 8723.25, 172.77},{0.0279497, 0.999609, 0},{0, 0, 1}};
		//objPosition[] = {{7794.57, 6557.18, 14.4851},{-0.645403, 0.763842, 0},{0, 0, 1}};
		animations[] = {"Acts_Accessing_Computer_Loop"};
		face = "WhiteHead_18";
		loadout[] = {{},{},{},{"U_C_CBRN_Suit_01_Blue_F",{}},{},{},"","G_AirPurifyingRespirator_02_black_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Квинтон Эккер";
		description = "«Сотрудник института мутаций, скупает всякое барахло и радиоактивные находки из зоны»";
		startDialog = "RRP_Dialog_NPC_Anomaly_1";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Anomaly_Scienist_2
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{7670.84, 6515.07, 15.1357},{0.758146, 0.652084, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_nevim_A3";
		loadout[] = {{},{},{},{"U_C_CBRN_Suit_01_White_F",{}},{},{},"","G_AirPurifyingRespirator_02_black_F",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Уильям МакДональд";
		description = "«Продавец медицинских препаратов, для того чтобы проще было выжить в зоне»";
		startDialog = "RRP_Dialog_NPC_Anomaly_2";
		icon = "\RRP_icons\NPC\RRP_Icon_Medic.paa";
		condition = "true";
	};

	class NPC_Anomaly_Zombie_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{7676.82, 6522.34, 15.71},{-0.902643, 0.43039, 0},{0, 0, 1}};
		animations[] = {"Mk34_Dead"};
		face = "SM_Zombie26";
		loadout[] = {{},{},{},{"U_RRPw_UN_Camo2",{}},{"V_RRPw_PlateCarrier2_desert",{}},{},"","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class NPC_Anomaly_Zombie_2: NPC_Anomaly_Zombie_1
	{
		objPosition[] = {{7685.87, 6524.2, 14.4616},{0.0709816, 0.997478, 0},{0, 0, 1}};
		animations[] = {"AinjPpneMstpSnonWrflDnon_injuredHealed"};
		face = "RyanZombieNoFace";
		loadout[] = {{},{},{},{"U_C_Poor_1",{}},{},{},"","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
	};

    class NPC_Anomaly_Trader_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3402.42, 4398.86, 144.173},{-0.569902, 0.821712, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "AfricanHead_03";
		loadout[] = {{"AKM_ADIDAS","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_E_Uniform_01_tanktop_F",{{"30Rnd_762x39_Mag_F",3,30}}},{"V_TacChestrig_grn_F",{}},{},"H_Booniehat_oli","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Эштон Робертс";
		description = "«Типичный коммерсант, наживается на тех кого натянула зона»";
		startDialog = "RRP_Dialog_NPC_Anomaly_1";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Anomaly_Trader_2
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3395.84, 4393.96, 144.017},{-0.565455, 0.824779, 0},{0, 0, 1}};
		animations[] = {"Acts_JetsShooterIdle"};
		face = "AfricanHead_03";
		loadout[] = {{},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"U_I_L_Uniform_01_deserter_F",{{"KA_17Rnd_9x19_Mag",3,17}}},{"V_PlateCarrier1_wdl",{}},{},"H_Bandanna_camo","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Льюис Кирби";
		description = "«Вы бы не обратились к нему за медицинской помощью на материке, но ситуация диктует свои условия»";
		startDialog = "RRP_Dialog_NPC_Anomaly_2";
		icon = "\RRP_icons\NPC\RRP_Icon_Medic.paa";
		condition = "true";
	};

	class NPC_Anomaly_Guard_1: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{3368.94, 4427.35, 143.978},{0.166978, 0.985961, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "WhiteHead_09";
		loadout[] = {{"AKM_ADIDAS","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_L_Uniform_01_deserter_F",{{"30Rnd_762x39_Mag_F",2,30}}},{"V_CarrierRigKBT_01_light_Olive_F",{}},{},"H_Watchcap_camo","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Итан Джонс";
		description = "«Выживший, который хорошо ориентируется в данной местности»";
		startDialog = "RRP_Dialog_Anomaly_5";
		icon = "\RRP_icons\NPC\RRP_Icon_Chat.paa";
	};
	class NPC_Anomaly_Guard_2: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{3383.22, 4402.75, 143.978},{0, 1, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMwlkSlowWrflDnon_PatrolingBase3"};
		face = "WhiteHead_20";
		loadout[] = {{"AKM_ADIDAS","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_C_Soldier_Bandit_1_F",{{"30Rnd_762x39_Mag_F",2,30}}},{"V_CarrierRigKBT_01_light_Olive_F",{}},{},"H_Watchcap_camo","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Лукас Блэкберн";
	};
	class NPC_Anomaly_Guard_3: NPC_Anomaly_Soldier_1
	{
		objPosition[] = {{3368.78, 4393.9, 143.978},{0.548633, 0.836064, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_patrolling2"};
		face = "asczHead_price_A3";
		loadout[] = {{"AKM_ADIDAS","","","",{"30Rnd_762x39_Mag_F",30},{},""},{},{},{"U_I_E_Uniform_01_sweater_F",{{"30Rnd_762x39_Mag_F",2,30}}},{"V_CarrierRigKBT_01_light_Olive_F",{}},{},"H_Watchcap_camo","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Реджи Гаррисон";
	};

	/* Правительство */
	class NPC_ShopItem_Gov_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3580.63, 14448.5, 21.872},{0.0231645, 0.999732, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_murphy_A3";
		loadout[] = {{},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"SP_suit_1",{{"KA_17Rnd_9x19_Mag",1,17}}},{"TAC_V_Sheriff_BA_TB7",{}},{},"Christmas_Hat_Side_Wearable","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Уоллас Скотт";
		description = "«Начальник личной охраны губернатора, полностью отвечает за жизнеобеспечение первого лица»";
		startDialog = "RRP_Dialog_NPC_STR_19";
		icon = "\RRP_icons\NPC\RRP_Icon_Shop.paa";
		condition = "true";
	};
	class NPC_Garage_Gov_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3597.68, 14446.5, 21.8553},{-0.288617, -0.957445, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_murphy_A3";
		loadout[] = {{},{},{},{"U_C_Poloshirt_salmon",{}},{},{},"","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Абдуль Мур";
		description = "«Начальник автопарка правительственной техники»";
		startDialog = "RRP_Dialog_NPC_STR_20";
		icon = "\RRP_icons\NPC\RRP_Icon_Garage.paa";
		condition = "true";
	};
    class NPC_Guard_Gov_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3636.42, 14388.9, 34.0323},{0.616514, -0.787344, 0},{0, 0, 1}};
		animations[] = {"Acts_Briefing_SA_Loop"};
		face = "asczHead_josephe_A3";
		loadout[] = {{"arifle_MXC_Black_F","","","",{"30Rnd_65x39_caseless_black_mag",30},{},""},{},{"KA_Glock_17_Single","","","",{"KA_17Rnd_9x19_Mag",17},{},""},{"U_C_FormalSuit_01_tshirt_black_F",{{"30Rnd_65x39_caseless_black_mag",2,30}}},{},{},"","G_Aviator",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Итан Ньютон";
		description = "";
		startDialog = "";
		icon = "\RRP_icons\NPC\RRP_Icon_Guard.paa";
		condition = "true";
	};
	class NPC_Guard_Gov_2: NPC_Guard_Gov_1
	{
		objPosition[] = {{3594.69, 14446.9, 24.9821},{0.514126, -0.857715, 0},{0, 0, 1}};
		face = "asczHead_austin_A3";
		name = "Тайлер Прайс";
	};
	class NPC_Guard_Gov_3: NPC_Guard_Gov_1
	{
		objPosition[] = {{3564.86, 14433.4, 22.0069},{0.95535, -0.295476, 0},{0, 0, 1}};
		animations[] = {"AA_ActsPercMwlkSlowWrflDnon_PatrolingBase3"};
		face = "WhiteHead_20";
		name = "Пол Дэвис";
	};
	class NPC_Guard_Gov_4: NPC_Guard_Gov_1
	{
		objPosition[] = {{3581.5, 14481.3, 23.836},{0.0535815, -0.998563, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_patrolling2"};
		face = "WhiteHead_02";
		name = "Джекоб Кларк";
	};

	/* Новый год */
	/*
	class NPC_NewYear_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3652.24, 13108.1, 3.91334},{-0.999312, -0.0370852, 0},{0, 0, 1}};
		animations[] = {"Acts_CivilIdle_1"};
		face = "TanoanHead_A3_09";
		loadout[] = {{},{},{},{"xmas_santa_uniform",{}},{},{},"","",{},{"ItemMap","ItemGPS","tf_anprc148jem_1","ItemCompass","Itemwatch",""}};
		name = "Санта Клаус";
		description = "«Рождественский дед, раз в году исполняющий самые заветные желания»";
		startDialog = "RRP_Dialog_NPC_NewYear";
		icon = "\RRP_icons\NPC\RRP_Icon_NewYear.paa";
		condition = "true";
	};
	class NPC_NewYear_2: NPC_NewYear_1
	{
		objPosition[] = {{16559.3, 12787, 14.314},{0.8287, -0.559694, 0},{0, 0, 1}};
	};
	class NPC_NewYear_3: NPC_NewYear_1
	{
		objPosition[] = {{25719, 21315.4, 19.9133},{-0.717519, 0.696539, 0},{0, 0, 1}};
	};
	class NPC_NewYear_4: NPC_NewYear_1
	{
		objPosition[] = {{14051, 18801.5, 23.9816},{-0.417781, -0.908548, 0},{0, 0, 1}};
	};
	class NPC_NewYear_5: NPC_NewYear_1
	{
		objPosition[] = {{11205.7, 8710.75, 172.798},{0.791209, -0.611546, 0},{0, 0, 1}};
	};
	class NPC_NewYear_6: NPC_NewYear_1
	{
		objPosition[] = {{12839.1, 16685.5, 82.3391},{0.963256, -0.268584, 0},{0, 0, 1}};
	};
	class NPC_NewYear_7: NPC_NewYear_1
	{
		objPosition[] = {{9208.32, 21648, 14.7467},{-0.950495, -0.310739, 0},{0, 0, 1}};
	};
	*/
	class RRP_NPC_Surgery_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{16998.8, 12781.8, 16.4632},{0.645277, 0.763949, 0},{0, 0, 1}};
		animations[] = {"AG_wallLeaning_loop"};
		face = "Fem_1";
		loadout[] = {{},{},{},{"EMS_Woman_6",{}},{},{},"","EF_FSG_BW",{},{"","","","","",""}};
		name = "Мередит Грей";
		description = "«Работала в Сиэтл Грейс, теперь лучший пластический хирург на Лемносе»";
		startDialog = "RRP_Dialog_NPC_Surgery_2";
		icon = "\RRP_icons\NPC\RRP_Icon_Surgery.paa";
		condition = "true";
	};
	class RRP_NPC_Surgery: RRP_NPC_Surgery_1
	{
		objPosition[] = {{3749.76,13002.2,7.96518},{-0.630774,0.775967,0},{0, 0, 1}};
		face = "WhiteHead_08";
		loadout[] = {{},{},{},{"Rimas_EMS_Doctor3",{}},{},{},"","EF_FSG_BW",{},{"","","","","",""}};
		name = "Грегори Хаус";
		description = "«Искусный пластический хирург»";
		startDialog = "RRP_Dialog_NPC_Surgery_1";
	};
	//Авиашкола
	class RRP_NPC_FlightSh_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{14643.1, 16814.9, 18.0324},{-0.65005, -0.759892, 0},{0, 0, 1}};
		animations[] = {"AG_wallLeaning_loop"};
		face = "WhiteHead_08";
		loadout[] = {{},{},{},{"U_I_pilotCoveralls",{}},{},{},"H_CrewHelmetHeli_I_E","",{},{"","","","","",""}};
		name = "Шон Барр";
		description = "«Продает сняряжение для начинающих летчиков»";
		startDialog = "RRP_Dialog_NPC_flightschool_1";
		icon = "\RRP_icons\NPC\RRP_Icon_Heli.paa";
		condition = "true";
	};
	class RRP_NPC_FlightSh_2: RRP_NPC_FlightSh_1
	{
		objPosition[] = {{14677.1, 16777.7, 17.9074},{-0.791741, 0.610857, 0},{0, 0, 1}};
		face = "WhiteHead_08";
		loadout[] = {{},{},{},{"U_I_pilotCoveralls",{}},{},{},"H_CrewHelmetHeli_B","",{},{"","","","","",""}};
		name = "Кэмерон Робертсон";
		description = "«Продает авиа технику»";
		startDialog = "RRP_Dialog_NPC_flightschool_2";
	};

	/* Party Meat
	class RRP_NPC_PartyMeat//Кавала
    {
        objectClassName = "RRP_NPC_Talk";
        objPosition[] = {{3665.92, 13110.1, 3.9916},{-0.997276, -0.0737635, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_holdleft_idle1"};
		loadout[] = {{"MMG_02_sand_F","","","optic_Yorris",{"130Rnd_338_Mag",130},{},"bipod_01_F_blk"},{},{},{"A3L_SECRET",{}},{"TAC_CR4_RG",{{"130Rnd_338_Mag",1,130}}},{"tf_anarc164",{}},"H_Construction_earprot_red_F","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
        name = "Костян Мясник";
        description = "«Вступите в схватку с такими же безбашенными как и вы! Попадите в топ и получите уникальный бонус!»";
        startDialog = "RRP_Dialog_NPC_PartyMeat";
        icon = "\RRP_icons\NPC\RRP_Icon_PartyMeat.paa";
        condition = "true";
    };
	*/
	/* Хранитель вещичек */
	class RRP_NPC_Rewards_1//Кавала
    {
        objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3666.77, 13117.1, 4.00418},{-0.00062832, -1, 0},{0, 0, 1}};
        animations[] = {"Acts_Explaining_EW_Idle01"};
        face = "TanoanHead_A3_09";
        loadout[] = {{},{},{},{"vvv_traje_robot_1",{}},{},{},"","",{"rrp_tablet","","","",{},{},""},{"","","","","",""}};
        name = "Гривус";
        description = "«Обратившись к данному роботу, вы всегда сможете забрать все полученные подарки»";
        startDialog = "RRP_Dialog_NPC_Rewards";
        icon = "\RRP_icons\NPC\RRP_Icon_NewYear.paa";
        condition = "true";
    };
	class RRP_NPC_Rewards_2: RRP_NPC_Rewards_1//ДП11
    {
		objPosition[] = {{9039.2, 15717.6, 112.111},{-0.985402, -0.170244, 0},{0, 0, 1}};
	};
	class RRP_NPC_Rewards_3: RRP_NPC_Rewards_1//Переоформление над Аэро
    {
		objPosition[] = {{12848, 16678.8, 82.3391},{-0.451175, 0.892435, 0},{0, 0, 1}};
	};
	class RRP_NPC_Rewards_4: RRP_NPC_Rewards_1//Атира
    {
		objPosition[] = {{14039.5, 18788.1, 24.3414},{-0.36419, -0.931325, 0},{0, 0, 1}};
	};
	class RRP_NPC_Rewards_5: RRP_NPC_Rewards_1//Столица андитизма
    {
		objPosition[] = {{11228.4, 8716.2, 172.77},{-0.999684, -0.0251441, 0},{0, 0, 1}};
	};
	class RRP_NPC_Rewards_6: RRP_NPC_Rewards_1//Пиргос
    {
		objPosition[] = {{16626.9, 12753.7, 14.374},{0.808506, -0.588488, 0},{0, 0, 1}};
	};
	class RRP_NPC_Rewards_7: RRP_NPC_Rewards_1 //Повстацы Север вверху
    {
		objPosition[] = {{25705.9, 21299.1, 19.4202},{-0.719582, 0.694407, 0},{0, 0, 1}};
	};
	class RRP_NPC_Rewards_8: RRP_NPC_Rewards_1 //Повстацы Север вверху
    {
		objPosition[] = {{9160, 21644.3, 14.5104},{0.820935, 0.571022, 0},{0, 0, 1}};
	};
	//Неписи Джеймса
	class RRP_NPC_James_Buffy
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{8995.82, 15718.1, 111.86},{-0.0804948, 0.996755, 0},{0, 0, 1}};
		animations[] = {"AG_wallLeaning_loop"};
		face = "TCGM_Fem_Eilish";
		loadout[] = {{},{},{},{"TCGM_f_Thong_Poker",{}},{},{},"","",{},{"","","","","",""}};
		name = "Баффи Басти";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRP_NPC_James_Lana
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{9004.03, 15718.7, 111.86},{-0.837175, 0.546935, 0},{0, 0, 1}};
		animations[] = {"ZULU_BRIEF_072"};
		face = "WhiteHead_07";
		loadout[] = {{},{},{},{"A3L_Bikini_Girl",{}},{},{},"","",{},{"","","","","",""}};
		name = "Лана Роудс";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRP_NPC_James_Anjel
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{9003.17, 15719, 111.86},{0.913985, -0.405748, 0},{0, 0, 1}};
		animations[] = {"AG_cigaretSmoke_loop"};
		face = "TCGM_Fem_Stone";
		loadout[] = {{},{},{},{"TCGM_f_Thong_Blk",{}},{},{},"","",{"rrp_sigaret","","","",{},{},""},{"","","","","",""}};
		name = "Анжел Уайт";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRP_NPC_James_Lili
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{8996.63, 15707.8, 113.12},{0.026177, -0.999657, 0},{0, 0, 1}};
		animations[] = {"ZULU_Dance_samba","ZULU_Dance_twerk"};
		face = "WhiteHead_12";
		loadout[] = {{},{},{},{"vvv_character_prosti",{}},{},{},"","",{},{"","","","","",""}};
		name = "Лили Лоу";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	class RRP_NPC_James_Lola
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{8996.67, 15700, 112.132},{0, 1, 0},{0, 0, 1}};
		animations[] = {"PLP_HubBriefing_loop_Hgun"};
		face = "AfricanHead_03";
		loadout[] = {{},{},{},{"A3L_Bikini_Girl",{}},{},{},"","",{},{"","","","","",""}};
		name = "Лола Тейлор";
		description = "Звезда местного масштаба, если ты понимаешь о чем я ;)";
		startDialog = "RRP_Dialog_NPC_LolaTaylor";
		icon = "";
		condition = "true";
	};
	class RRP_NPC_James_Bob
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{9010.8, 15705.9, 111.86},{0.999994, -0.0034732, 0},{0, 0, 1}};
		animations[] = {"ZULU_BRIEF_01","ZULU_BRIEF_02","ZULU_BRIEF_03","ZULU_BRIEF_04","ZULU_BRIEF_051","ZULU_BRIEF_052","ZULU_BRIEF_061","ZULU_BRIEF_081"};
		face = "WhiteHead_07";
		loadout[] = {{},{},{},{"RP_bigciv_bob_v1",{}},{},{},"Skyline_HeadGear_Cowboy_05_F","G_Aviator",{},{"","","","","",""}};
		name = "Боб";
		description = "Охранник местной стрипухи";
		startDialog = "RRP_Dialog_NPC_BOB";
		icon = "";
		condition = "true";
	};
	class RRP_NPC_James_Pamela
	{
		objectClassName = "RRP_NPC_Trader";
		objPosition[] = {{3410.21, 12814.1, 1.75874},{-0.824403, -0.566003, 0},{0, 0, 1}};
		animations[] = {"ZULU_BRIEF_01","ZULU_BRIEF_02","ZULU_BRIEF_03","ZULU_BRIEF_04","ZULU_BRIEF_051","ZULU_BRIEF_052","ZULU_BRIEF_061","ZULU_BRIEF_081"};
		face = "TCGM_Fem_Fox";
		loadout[] = {{},{},{},{"TCGM_f_Thong_Flowers",{}},{},{},"","G_Tactical_Black",{},{"","","","","",""}};
		name = "Памела Андерсон";
		description = "";
		startDialog = "";
		icon = "";
		condition = "true";
	};
	//работы 2,0
    /* DHL */
	class RRP_Work_NPC_DHL
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3120.14, 12494.9, 3.00376},{0.781292, 0.624166, 0},{0, 0, 1}};
		animations[] = {"HubSittingAtTableU_idle1"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{},{"rimas_dhl_Employee",{}},{},{},"rimas_dhl_Cap","",{},{"","","","","",""}};
		name = "Олег";
		description = "«Главный сортировщик»";
		startDialog = "RRP_Dialog_NPC_DHL";
		icon = "\welmen_newmarks\icons\welmen_transport_cargo-depot.paa";
		condition = "true";
	};
	//Дальнобойщик
	class RRP_Work_NPC_trucker
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3277.75, 12486.5, 8.145},{0.941123, 0.338065, 0},{0, 0, 1}};
		animations[] = {"HubSittingAtTableU_idle1"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{},{"rimas_dhl_Employee",{}},{},{},"rimas_dhl_Cap","",{},{"","","","","",""}};
		name = "Людмила Сергеевна";
		description = "«Логист»";
		startDialog = "RRP_Dialog_NPC_trucker";
		icon = "\welmen_newmarks\icons\welmen_transport_cargo-depot.paa";
		condition = "true";
	};
	//Дальнобойщик
	class RRP_Work_NPC_trucker_1
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3072.906, 12187.697, 14.75},{0, 0, 0},{0, 0, 1}};
		animations[] = {"HubSittingAtTableU_idle1"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{},{"rimas_dhl_Employee",{}},{},{},"rimas_dhl_Cap","",{},{"","","","","",""}};
		name = "Людмила Сергеевна";
		description = "«Логист»";
		startDialog = "RRP_Dialog_NPC_trucker_kavala";
		icon = "\welmen_newmarks\icons\welmen_transport_cargo-depot.paa";
		condition = "true";
	};
	class RRP_Work_NPC_trucker_2: RRP_Work_NPC_trucker_1
	{
		objPosition[] = {{16950.9,12160.8,15.5994},{0.0356906,0.999363,0},{0, 0, 1}};
		startDialog = "RRP_Dialog_NPC_trucker_alps";
	};
	class RRP_Work_NPC_trucker_3: RRP_Work_NPC_trucker_1
	{
		objPosition[] = {{9319.71,20266.9,99.55},{0, 0, 0},{0, 0, 1}};
		startDialog = "RRP_Dialog_NPC_trucker_north";
	};
	class RRP_Work_NPC_trucker_4: RRP_Work_NPC_trucker_1
	{
		objPosition[] = {{27041.6, 23232.9, 21.6243},{-0.769916, -0.638145, 0},{0, 0, 1}};
		startDialog = "RRP_Dialog_NPC_trucker_east";
	};
	//Автобус
	class RRP_Work_NPC_bus
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{3214.44, 12946, 3.1908},{0.678449, -0.734648, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{},{"rds_uniform_Woodlander4",{}},{},{},"","",{},{"ItemMap","","","ItemCompass","Itemwatch",""}};
		name = "Михалый Палыч";
		description = "«Старший водитель»";
		startDialog = "RRP_Dialog_NPC_bus";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	//Электрик
	class RRP_Work_NPC_Electrician
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{6383.08, 14904.2, 36.2341},{0.889579, -0.45678, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{},{"A3L_Worker_Outfit",{}},{},{},"","",{},{"","","","","",""}};
		name = "Дуан Кларк"; 
		description = "«Старший электрик»";
		startDialog = "RRP_Work_NPC_Electrician";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	//Биржа труда
	class RRP_Work_NPC_LaborExchange
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{16625.049, 12731.428, 15},{0, 0, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{},{"A3L_Worker_Outfit",{}},{},{},"","",{},{"","","","","",""}};
		name = "Боб Зин"; 
		description = "«Секретарь»";
		startDialog = "RRP_Dialog_NPC_LaborExchange";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	//Курьер
	class RRP_Work_NPC_Courier
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{17371.8, 13544.2, 8.39749},{-0.173754, 0.984789, 0},{0, 0, 1}};
		animations[] = {"PLP_AA_m6aS2Lamb_Hgun"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{"RH_g19","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"U_I_C_Soldier_Bandit_2_F",{{"RH_17Rnd_9x19_g17",3,17}}},{},{},"","",{},{"","","","","",""}};
		name = "Путьевод"; 
		description = "«Куратор»";
		startDialog = "RRP_Dialog_NPC_Bookmark";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	//ЭкологЗемля
	class RRP_Work_NPC_EcologistEarth
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{16550.8, 12779.3, 14.991},{-0.0494096, 0.998779, 0},{0, 0, 1}};
		animations[] = {"InBaseMoves_table1"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{"RH_g19","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"U_C_FormalSuit_01_black_F",{}},{},{},"","",{},{"","","","","",""}};
		name = "Райан Гриффитс";
		description = "«Эколог Земной»";
		startDialog = "RRP_Work_NPC_EcologistEarth";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	//ЭкологВода
	class RRP_Work_NPC_EcologistWater
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{16453.3, 12448.8, 2.36713},{0.94543, -0.325826, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{"RH_g19","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"U_B_survival_uniform",{}},{},{},"","",{},{"","","","","",""}};
		name = "Стив Морсон";
		description = "«Эколог Водный»";
		startDialog = "RRP_Work_NPC_EcologistWater";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	//Депо
	class RRP_Work_NPC_Depo_N
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{14313, 18996.7, 36.9041},{0.703592, -0.710604, 0},{0, 0, 1}};
		animations[] = {"AA_x01Lamb_IK"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{"RH_g19","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"U_B_survival_uniform",{}},{},{},"","",{},{"","","","","",""}};
		name = "Стив Морсон";
		description = "«Депо Север»";
		startDialog = "RRP_Dialog_Depo_N";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	class RRP_Work_NPC_Depo_W
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{4679.74, 14227.8, 27.5969},{0.703592, -0.710604, 0},{0, 0, 1}};
		animations[] = {"AA_x01Lamb_IK"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{"RH_g19","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"U_B_survival_uniform",{}},{},{},"","",{},{"","","","","",""}};
		name = "Стив Морсон";
		description = "«Депо Запад»";
		startDialog = "RRP_Dialog_NPC_Depo_W";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	class RRP_Work_NPC_Depo_S
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{20367.5, 6074.54, 66.7318},{0.648861, 0.760907, 0},{0, 0, 1}};
		animations[] = {"AA_x01Lamb_IK"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{"RH_g19","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"U_B_survival_uniform",{}},{},{},"","",{},{"","","","","",""}};
		name = "Стив Морсон";
		description = "«Депо Юг»";
		startDialog = "RRP_Dialog_NPC_Depo_S";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	class RRP_Work_NPC_Depo_E
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{26876.5, 23804, 13.7516},{0.806908, -0.590678, 0},{0, 0, 1}};
		animations[] = {"AA_x01Lamb_IK"};
		face = "asczHead_picleson_A3";
		loadout[] = {{},{},{"RH_g19","","","",{"RH_17Rnd_9x19_g17",17},{},""},{"U_B_survival_uniform",{}},{},{},"","",{},{"","","","","",""}};
		name = "Стив Морсон";
		description = "«Депо Восток»";
		startDialog = "RRP_Dialog_NPC_Depo_E";
		icon = "\RRP_icons\virtItems\marijuana.paa";
		condition = "true";
	};
	class RRP_Work_NPC_FP_1
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{14678.5, 16776.2, 17.9074},{0.675436, -0.737419, 0},{0, 0, 1}};
		animations[] = {"AG_yoyo"};
		face = "WhiteHead_29";
		loadout[] = {{},{},{},{"U_C_IDAP_Man_Jeans_F",{}},{"accs_vest_001_a",{}},{},"","",{},{"","O_UavTerminal","extItem_SmartPhone","ItemCompass","Lamington",""}};
		name = "Чарльз Линдберг"; 
		description = "Диспетчер FlyDelivery"; 
		startDialog = "RRP_Work_NPC_FlyDelivery"; 
		icon = "\RRP_icons\NPC\RRP_Icon_Airplane.paa"; 
		condition = "true";
	};
	class RRP_Work_NPC_FP
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{26768, 24631, 21.6779},{0.675436, -0.737419, 0},{0, 0, 1}};
		animations[] = {"AG_yoyo"};
		face = "WhiteHead_29";
		loadout[] = {{},{},{},{"U_C_IDAP_Man_Jeans_F",{}},{"accs_vest_001_a",{}},{},"","",{},{"","O_UavTerminal","extItem_SmartPhone","ItemCompass","Lamington",""}};
		name = "Матиас Руст"; 
		description = "Диспетчер FlyDelivery"; 
		startDialog = "RRP_Work_NPC_FlyDelivery"; 
		icon = "\RRP_icons\NPC\RRP_Icon_Airplane.paa"; 
		condition = "true";
	};
	class NPC_Slaver
	{
		objectClassName = "RRP_NPC_QuestTrader";
		objPosition[] = {{14092.2, 11555.7, 10.8798},{0.883708, 0.263957, 0.386505},{-0.400717, 0, 0.916202}};
		animations[] = {"ZULU_Siting_053"};
		face = "WhiteHead_27";
		loadout[] = {{},{},{"RH_Deagleg","","","",{"RH_7Rnd_50_AE",7},{},""},{"U_C_man_sport_1_F",{{"RH_7Rnd_50_AE",2,7}}},{},{},"drrpg_chineseHat_02","EF_RG1",{},{"","","","","","AG_PoliceThing"}};
		name = "Диего Кано"; 
		description = "Работорговец из Португалии"; 
		startDialog = "RRP_Work_NPC_Slavery"; 
		icon = ""; 
		condition = "true";
	};

	class NPC_Buyer_StolenGold_01
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{15555.3, 22482.1, 6.71528},{0.235061, 0.971981, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_mctavish_A3";
		loadout[] = {{},{},{},{"d3s_uniform_jbib_008_fb",{}},{},{},"AG_Beret_Black","G_Squares_Tinted",{},{"","","","","",""}};
		name = "Эд Джексон"; 
		description = ""; 
		startDialog = "RRP_Dialog_NPC_StolenGold_1"; 
		icon = ""; 
		condition = "true";
	};
	class NPC_Buyer_StolenGold_02
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{15160.8, 10981.7, 9.00992},{-0.0282692, 0.9996, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_mctavish_A3";
		loadout[] = {{},{},{},{"d3s_uniform_jbib_008_fb",{}},{},{},"AG_Beret_Black","G_Squares_Tinted",{},{"","","","","",""}};
		name = "Райан О'Коннор"; 
		description = ""; 
		startDialog = "RRP_Dialog_NPC_StolenGold_1"; 
		icon = ""; 
		condition = "true";
	};
	class NPC_Buyer_StolenGold_03
	{
		objectClassName = "RRP_NPC_Talk";
		objPosition[] = {{14250.6, 12980.6, 7.58851},{-0.559658, -0.828724, 0},{0, 0, 1}};
		animations[] = {"HubStandingUA_move1"};
		face = "asczHead_foley_A3";
		loadout[] = {{},{},{},{"d3s_uniform_jbib_008_fb",{}},{},{},"AG_Beret_Black","G_Squares_Tinted",{},{"","","","","",""}};
		name = "Ноа Хьюз"; 
		description = ""; 
		startDialog = "RRP_Dialog_NPC_StolenGold_1"; 
		icon = ""; 
		condition = "true";
	};

};
