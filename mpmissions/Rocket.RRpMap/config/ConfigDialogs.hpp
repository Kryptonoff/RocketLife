class NPCDialogs
{
	interactionKey = 0xDB; // Win-key by default, to get key-codes use https://community.bistudio.com/wiki/DIK_KeyCodes
	condition = "alive player"; // This is a condition of dialog to be sustained/opened. Must return bool.
	primaryColor = "#EFD334"; // Color of NPC name and and NPC title text
	secondaryColor = "#FAFAFA"; // Color of speech text, answer texts.
	class CfgDialogs
	{
		class BaseDialog
		{
			text = ""; // A text of your base dialog, do whatever you want here. Structured Text.
			randomText[] = {}; // Рандомный текст, имеет приоритет над text
			answers[] = {}; // Массив с вопросами к NPC: {title, picture, condition-string, code-string reference}
			rename[] = {}; // Array of strings: new name to use, new title to use.
			animation = ""; // Анимация при нажатии кнопки
		};

		class RRPDialog_NPC_Edu_Where: BaseDialog
		{
			randomText[] = {
				"Ты сейчас в обучающей зоне! Покинуть ее можно после прохождения обучения!"
			};
			answers[] = {
                {"Назад", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "RRPDialog_NPC_Edu_Start"},
                {"Получить служебный автомобиль дальнобойщика", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_jobs_spawnVehicle"}
			};
		};
		class RRPDialog_NPC_Edu_Start: BaseDialog
		{
			text = "Привет! Я вводный в этом островном государстве! Я расскажу тебе что делать дальше.";
			answers[] = {
				{"Начнем?", "", "", "0 call RRPClient_forBeginner_missionStart"},
				{"Я посмотрел на карту", "", "true", "1 call RRPClient_forBeginner_missionStart"},
				{"Планшет крутой", "", "true", "2 call RRPClient_forBeginner_missionStart"},
				{"Что дальше?", "", "true", "3 call RRPClient_forBeginner_missionStart"},

				{"Где я сейчас?", "", "true", "RRPDialog_NPC_Edu_Where"},
                {"До встречи", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_BOB: BaseDialog
		{
			text = "Я тут главный, девочек не трогать, плати и заходи";
			answers[] = {
                {"Понял тебя", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_LolaTaylor: BaseDialog
		{
			text = "Я пила такое, от чего охрипла, но тебе налью чего ты захочешь!";
			answers[] = {
                {"Увидимся!", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

    /* Скупщики */

       	/* Наркодилер */
		class RRP_Dialog_NPC_1_1: BaseDialog
		{
			text = "Тут всегда рады таким, как ты. Можем совершить очень интересную сделку. Для тебя... И для меня...";
			answers[] = {
			    {"Сбыть наркотики", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_RZ'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        /* Нефть */
		class RRP_Dialog_NPC_2_1: BaseDialog
		{
			text = "Торговать, чтобы заработать. Что в этом плохого?";
			answers[] = {
			    {"Продать бензин", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Gasolin'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        /* Кирпич */
		class RRP_Dialog_NPC_3_1: BaseDialog
		{
			text = "Когда продаешь редкие материалы, принимай решение осторожно. Неизвестно, когда снова может понадобиться";
			answers[] = {
			    {"Продать кирпичи", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Bricks'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        /* Горнорудка/Минералы */
		class RRP_Dialog_NPC_4_1: BaseDialog
		{
			text = "Я веду дела только с перспективными клиентами. И не торгуюсь, если речь идет о драгоценных камнях";
			answers[] = {
			    {"Сбыт руды или минералов", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Mining'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Отмывка */
		class RRP_Dialog_NPC_5_1: BaseDialog
		{
			text = "Карманники стали настолько умелыми, что при ограблении ничего не чувствуется. Осторожнее с кошельком";
			answers[] = {
			    {"Отмыть деньги", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "call RRPClient_legal_openMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Палладий */
		class RRP_Dialog_NPC_6_1: BaseDialog
		{
			text = "Если что-то понадобиться - говорите... У меня очень много работы и я не могу отвлекаться по пустякам";
			answers[] = {
			    {"Продать палладий", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Palladium'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Стекло */
		class RRP_Dialog_NPC_7_1: BaseDialog
		{
			text = "Может, вам чем-то помочь? Нет? Хм... Может, вам что-то нужно, а?";
			answers[] = {
                {"Сбыт стекла", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Glass'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Хлеб */
		class RRP_Dialog_NPC_8_1: BaseDialog
		{
			text = "Вам нужна работа? У нас большое хозяйство, и дело каждому найдется";
			answers[] = {
                {"Продажа хлеба", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Bread'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Спички */
        class RRP_Dialog_NPC_9_1: BaseDialog
		{
			text = "Не судите меня по моей внешности. Может, я и похож на мошенника, но я честный торговец";
			answers[] = {
                {"Продажа спичек", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Matches'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Фрукты */
        class RRP_Dialog_NPC_10_1: BaseDialog
		{
			text = "Я хочу приготовить кое-что вкусное. Но никак не удается найти нужные продукты";
			answers[] = {
                {"Сбыт фруктов и овощей", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Fruits'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Коллекционер */
        class RRP_Dialog_NPC_11_1: BaseDialog
		{
			text = "Вам нужна помощь опытного работника? Хм... ну, я знаю пару людей";
			answers[] = {
                {"Продать предметы", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Trash'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        /* Охота */
        class RRP_Dialog_NPC_12_1: BaseDialog
		{
			text = "На востоке открыли новые охотничьи угодья, но не стоит беспокоиться. Правда.";
			answers[] = {
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_13_1: BaseDialog
		{
			text = "Если долго смотреть в глаза животного, можно обнаружить невиданное ранее великолепие его внутреннего мира.";
			answers[] = {
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        /* Тюрьма */
		class RRP_Dialog_NPC_14_1: BaseDialog
		{
			text = "Ты руками тут ничего не трогай, бросай чернила на пол и бери лавэ.";
			answers[] = {
			    {"Сдать чернила", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_InkJail'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Гребешки */
		class RRP_Dialog_NPC_15_1: BaseDialog
		{
			text = "Если ты принес гребешки, то надеюсь они хоть немного свежие";
			answers[] = {
			    {"Продать гребешки", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_Scallops'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Торговцы (обычные) */

        class RRP_NPC_Seller_Clothing: BaseDialog
		{
		    text = "Добро пожаловать, позвольте подобрать для Вас лучший прикид";
			answers[] = {
			    {"Мужская одежда", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "true", "['bruce'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Seller_Clothing_Girl: BaseDialog
		{
		    text = "Сестренка, давай тебя приоденем, а то выглядишь как мешок картошки";
			answers[] = {
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "true", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Seller_Medic: BaseDialog
		{
		    text = "Голова болит? Сейчас подберем тебе пару анальгетиков";
			answers[] = {
			    {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "true", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Seller_Gun: BaseDialog
		{
		    text = "Запомни, спешка нужна только при ловле блох, сначала прицелься - потом стреляй";
			answers[] = {
			    {"Оружейный магазин", "\RRP_icons\NPC\RRP_Icon_Pistol.paa", "true", "['gun'] call RRPClient_system_weaponShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Seller_Diving: BaseDialog
		{
		    text = "И главное, не забудь настроить подводную рацию";
			answers[] = {
			    {"Магазин дайвинга", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "true", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Renewal: BaseDialog
		{
		    text = "Опять забыли ПТС? Ну да ладно, копия тоже сгодится";
			answers[] = {
			    {"Переоформление техники", "\RRP_icons\NPC\RRP_Icon_Gift.paa", "true", "call RRPClient_swapVeh_vehicleGive;"},
                {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['DP11_car_s','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['DP11_car_s','Car'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_NPC_Seller_Food: BaseDialog
		{
		    text = "Товары по акции? Скидочная карта? Давайте оформим?";
			answers[] = {
                {"Пробить на кассе", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "true", "['grocery_store'] call RRPClient_system_weaponShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Veh: BaseDialog
		{
			answers[] = {
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['car_g_6','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['car_g_6','Car'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['car_g_6','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Veh_2: BaseDialog
		{
			answers[] = {
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['car_g_2','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['car_g_2','Car'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['car_g_2','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Veh_3: BaseDialog
		{
			answers[] = {
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['car_p_g_1','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['car_p_g_1','Car'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['car_p_g_1','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Veh_4: BaseDialog
		{
			answers[] = {
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['car_g_3','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['car_g_3','Car'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['car_g_3','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Veh_5: BaseDialog
		{
			answers[] = {
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['gar_dp11_1','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "true", "['gar_dp11_1','Car'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['gar_dp11_1','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Air: BaseDialog
		{
		    text = "Не брезгуй автозависанием, оно спасло не одну жизнь при посадке";
			answers[] = {
                {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "((player call getSide) isEqualTo 'civ')", "['civ_air',['civ_air_kavala_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "true", "['civ_air_kavala_2','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store", "['civ_air_kavala_2','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['civ_air_kavala_2','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Air_2: BaseDialog
		{
		    text = "Не брезгуй автозависанием, оно спасло не одну жизнь при посадке";
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "((player call getSide) isEqualTo 'civ')", "['civ_air',['air_shop_kav_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "true", "['g_air_kav_1','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store", "['g_air_kav_1','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['g_air_kav_1','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Air_gov: BaseDialog
		{
		    text = "Не брезгуй автозависанием, оно спасло не одну жизнь при посадке";
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "((player call getSide) isEqualTo 'civ')", "['civ_air',['air_shop_gov']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "true", "['g_air_gov','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store", "['g_air_gov','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['g_air_gov','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_NPC_CivAirShop: BaseDialog
		{
		    text = "Не брезгуй автозависанием, оно спасло не одну жизнь при посадке";
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair", "['civ_air',['civ_air_2_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Самолеты", "\RRP_icons\NPC\RRP_Icon_Airplane.paa", "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair", "['civ_planes',['vip_r_air1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "true", "['civ_air_2','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store", "['civ_air_2','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['civ_air_2','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_CivAirShop_2: BaseDialog
		{
		    text = "Не брезгуй автозависанием, оно спасло не одну жизнь при посадке";
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair", "['civ_air',['civ_air_t_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Самолеты", "\RRP_icons\NPC\RRP_Icon_Airplane.paa", "license_air || license_flightschool_grp_plvl_1 || license_flightschool_grp_plvl_2 || license_flightschool_grp_plvl_3 || license_flightschool_grp_plvl_4 || license_falshair", "['civ_planes',['civ_air_t_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "true", "['civ_air_t_1','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store", "['civ_air_t_1','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['civ_air_t_1','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Ship: BaseDialog
		{
		    text = "Возьми больше топлива и еды, на моих лодках быстрых поездок не бывает";
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "((player call getSide) isEqualTo 'civ')", "['civ_ship',['civ_ship_5']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "true", "['civ_ship_5','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['civ_ship_5','Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Ship_2: BaseDialog
		{
		    text = "Возьми больше топлива и еды, на моих лодках быстрых поездок не бывает";
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "((player call getSide) isEqualTo 'civ')", "['civ_ship',['civ_ship_6']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "true", "['civ_ship_6','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['civ_ship_6','Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Ship_3: BaseDialog
		{
		    text = "Возьми больше топлива и еды, на моих лодках быстрых поездок не бывает";
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "((player call getSide) isEqualTo 'civ')", "['civ_ship',['civ_ship_9']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "true", "['civ_ship_9','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['civ_ship_9','Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Ship_4: BaseDialog
		{
		    text = "Возьми больше топлива и еды, на моих лодках быстрых поездок не бывает";
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "((player call getSide) isEqualTo 'civ')", "['civ_ship',['civ_ship_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "true", "['civ_ship_2','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['civ_ship_2','Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Ship_5: BaseDialog
		{
		    text = "Возьми больше топлива и еды, на моих лодках быстрых поездок не бывает";
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "((player call getSide) isEqualTo 'civ')", "['civ_ship',['civ_ship_4']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "true", "['civ_ship_4','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['civ_ship_4','Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Ship_6: BaseDialog
		{
		    text = "Возьми больше топлива и еды, на моих лодках быстрых поездок не бывает";
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "true", "['reb_ship',['reb_ship']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "true", "['reb_ship_2','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['reb_ship_2', 'Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Ship_7: BaseDialog
		{
		    text = "Возьми больше топлива и еды, на моих лодках быстрых поездок не бывает";
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "((player call getSide) isEqualTo 'civ')", "['civ_ship',['civ_ship_7']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "true", "['civ_ship_7','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['civ_ship_7', 'Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Garage_Ship_8: BaseDialog
		{
		    text = "Возьми больше топлива и еды, на моих лодках быстрых поездок не бывает";
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "((player call getSide) isEqualTo 'civ')", "['civ_ship',['g_boat_nsb']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "true", "['g_boat_nsb','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['g_boat_nsb', 'Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Port_Box: BaseDialog
		{
		    text = "Держу пари больше пяти ящиков ты не осилишь щегол!";
			answers[] = {
                {"Взять ящик", "\RRP_icons\NPC\RRP_Icon_Box.paa", "true", "['handlework','portwork'] call RRPClient_Jobs_portWorkStart;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_Car: BaseDialog
		{
		    text = "Особо не задерживайтесь, за Вами уже очередь выстроилась!";
			answers[] = {
                {"Автосалон", "\RRP_icons\NPC\RRP_Icon_Car.paa", "true", "['RRP_CivCar_1',['RRP_CarShop_1_s_1','RRP_CarShop_1_s_2']] call RRPClient_system_vehicleShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_Car_2: BaseDialog
		{
			text = "Добрый день, собираетесь приобрести автомобиль в кредит или наличными?";
			answers[] = {
                {"Автосалон", "\RRP_icons\NPC\RRP_Icon_Car.paa", "true", "['RRP_CivCar_2',['RRP_CarShop_2_s_1','RRP_CarShop_2_s_2']] call RRPClient_system_vehicleShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_Car_3: BaseDialog
		{
		    text = "Добрый день, позвольте подобрать для Вас самый лучший авто!";
			answers[] = {
                {"Автосалон", "\RRP_icons\NPC\RRP_Icon_Car.paa", "true", "['RRP_CivCar_3',['RRP_CarShop_3_s_1','RRP_CarShop_3_s_2']] call RRPClient_system_vehicleShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_motorcycles_1: BaseDialog
		{
		    text = "Добрый день, что, надоели бездушные железяки?";
			answers[] = {
                {"Мотоциклы", "\RRP_icons\NPC\RRP_Icon_Car.paa", "true", "['Rbike_shop',['RRP_motorcyclesShop_1_s_1','RRP_motorcyclesShop_1_s_2']] call RRPClient_system_vehicleShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_Truck: BaseDialog
		{
		    text = "Дружище, я надеюсь у тебя есть лицензия дальнобойщика, мне проблемы ни к чему";
			answers[] = {
                {"Магазин грузовиков", "\RRP_icons\NPC\RRP_Icon_Truck.paa", "true", "['civ_truck',['civ_truck_k_1']] call RRPClient_system_vehicleShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_Truck_2: BaseDialog
		{
		    text = "Дружище, я надеюсь у тебя есть лицензия дальнобойщика, мне проблемы ни к чему";
			answers[] = {
                {"Магазин грузовиков", "\RRP_icons\NPC\RRP_Icon_Truck.paa", "true", "['civ_truck',['civ_truck_1']] call RRPClient_system_vehicleShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_License: BaseDialog
		{
		    text = "Какая именно лицензия Вам нужна?";
			answers[] = {
                {"Магазин лицензий", "\RRP_icons\NPC\RRP_Icon_License.paa", "true", "[nil, nil, nil, ""all_license""] call Client_documents_shopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_Store: BaseDialog
		{
		    text = "Не спрашивай откуда у меня это всё, будешь брать или так и будешь глазеть?";
			answers[] = {
                {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "true", "['genstore'] call RRPClient_system_weaponShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Shop_24_7: BaseDialog
		{
		    text = "Не забудьте купить побольше ремкомплектов , говорят на дорогах необычайно крепкие кусты.";
			answers[] = {
                {"Магазин 24/7", "\RRP_icons\NPC\RRP_Icon_Shop.paa", "true", "['shop24'] call RRPClient_system_weaponShopMenu;"},
                {"Ограбить кассу", "\RRP_icons\NPC\RRP_Icon_Thief.paa", "true", "call RRPClient_system_robShops;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Slavery: BaseDialog
		{
		    text = "Ты так и будешь там возиться?";
			answers[] = {
                {"Обрести свободу", "\RRP_icons\NPC\RRP_Icon_Slavery.paa", "true", "call RRPClient_system_getoutofSlavery;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Rob: BaseDialog
		{
		    text = "Ты не шуми так братан, сейчас все сделаем в лучшем виде";
			answers[] = {
                {"Скупщик б/у", "\RRP_icons\NPC\RRP_Icon_Rob.paa", "true", "['onLoad'] call RRPClient_chopShop_action;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Fridg: BaseDialog
		{
		    text = "Господи, эти два брата меня доканают.. Давай посмотрим что там у тебя";
			answers[] = {
                {"Скупщик б/у", "\RRP_icons\NPC\RRP_Icon_Rob.paa", "true", "['onLoad'] call RRPClient_chopShop_action;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Pirat: BaseDialog
		{
		    text = "О, сухопутная крыса! Как там поживают мои конкуренты? Надеюсь подохли собаки";
			answers[] = {
                {"Скупщик б/у", "\RRP_icons\NPC\RRP_Icon_Rob.paa", "true", "['onLoad'] call RRPClient_chopShop_action;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		/* Грузоперевозки */
		/* class RRP_NPC_Cargo: BaseDialog
		{
		    text = "Я надеюсь у тебя есть подходящее авто? Ездить придется много";
			answers[] = {
                {"Заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Cargo.paa", "(vehicle player == player) && ((player call getSide) isEqualTo 'civ')", "['depo_kavala'] call RRPClient_delivery_getMissionMenu;"},
                {"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_PutCargo.paa", "(vehicle player == player) && ((player call getSide) isEqualTo 'civ')", "['depo_kavala'] call RRPClient_delivery_finishMissionMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		}; */
		class RRP_NPC_DHL: BaseDialog
		{
		    text = "Наконец то ты приехал, некогда обьяснять, быстрее одевайся и бери заказ!";
			answers[] = {
                {"Униформа DHL", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "((player call getSide) isEqualTo 'civ')", "['dhl'] call RRPClient_system_clothingMenu;"},
                {"Автомобиль DHL", "\RRP_icons\NPC\RRP_Icon_Car.paa", "((player call getSide) isEqualTo 'civ')", "call RRPClient_dhl_spawnCar;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Tow: BaseDialog
		{
		    text = "Здравия желаю! Предъявите постановление и чек об оплате штрафа";
			answers[] = {
                {"Штрафстоянка", "\RRP_icons\NPC\RRP_Icon_Tow.paa", "true", "['car_g_penalty', 'Car'] call RRPClient_garage_MarkerMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_NPC_Tractor: BaseDialog
		{
		    text = "Собрался заняться сельским хозяйством парниша? Тогда ты по адресу";
			answers[] = {
                {"Индустриальная техника", "\RRP_icons\NPC\RRP_Icon_Tractor.paa", "true", "['civ_traktors', 'civ_traktors'] call RRPClient_system_vehicleShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Торговцы (Группировочные) */
		/*Black Snow*/
		class RRP_Dialog_Shop_Ship_GRP_BlackSnow: BaseDialog
		{
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "license_blacksnow", "['civ_ship',['BS_ship_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "license_blacksnow", "['BS_ship_sh','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store", "['BS_ship_sh', 'Ship'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Car_GRP_BlackSnow: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_blacksnow", "['car_blacksnow',['BS_car_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_blacksnow", "['BS_car_spawn','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_blacksnow", "['BS_car_spawn','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_blacksnow", "['BS_car_spawn','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Air_GRP_BlackSnow: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_blacksnow", "['air_blacksnow',['BS_air_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_blacksnow", "['BS_air_spawn','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_blacksnow", "['BS_air_spawn','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_blacksnow", "['BS_air_spawn','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        class RRP_Dialog_Shop_Weapons_GRP_BlackSnow: BaseDialog
		{
			answers[] = {
			    {"Оружие BlackSnow", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_blacksnow", "['weapons_blacksnow'] call RRPClient_system_weaponShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Clothing_GRP_BlackSnow: BaseDialog
		{
			answers[] = {
			    {"Одежда BlackSnow", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_blacksnow", "['clothing_BlackSnow'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_blacksnow", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Supermarket_GRP_BlackSnow: BaseDialog
		{
			answers[] = {
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_blacksnow", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_blacksnow", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_blacksnow", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		/*Cigane*/

        class RRP_Dialog_Shop_Car_GRP_Cigane: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_cigane", "['car_cigane',['cigane_car_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_cigane", "['cigane_car_spawn','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_cigane", "['cigane_car_spawn','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_cigane", "['cigane_car_spawn','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Air_GRP_Cigane: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_cigane", "['air_cigane',['cigane_air_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_cigane", "['cigane_air_spawn','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_cigane", "['cigane_air_spawn','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_cigane", "['cigane_air_spawn','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        class RRP_Dialog_Shop_Weapons_GRP_Cigane: BaseDialog
		{
			answers[] = {
			    {"Оружие Cigane", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_cigane", "['weapons_cigane'] call RRPClient_system_weaponShopMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_cigane", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_cigane", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_cigane", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Clothing_GRP_Cigane: BaseDialog
		{
			answers[] = {
			    {"Одежда Cigane", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_cigane", "['clothing_Cigane'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_cigane", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Supermarket_GRP_Cigane: BaseDialog
		{
			answers[] = {
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_cigane", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_cigane", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_cigane", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		/*Black Wolves*/

        class RRP_Dialog_Shop_Car_GRP_blackwolves: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_blackwolves", "['car_blackwolves',['blackwolves_car_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_blackwolves", "['blackwolves_car_spawn','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_blackwolves", "['blackwolves_car_spawn','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_blackwolves", "['blackwolves_car_spawn','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Air_GRP_blackwolves: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_blackwolves", "['air_blackwolves',['blackwolves_air_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_blackwolves", "['blackwolves_air_spawn','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_blackwolves", "['blackwolves_air_spawn','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_blackwolves", "['blackwolves_air_spawn','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        class RRP_Dialog_Shop_Weapons_GRP_blackwolves: BaseDialog
		{
			answers[] = {
			    {"Оружие Black Wolves", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_blackwolves", "['weapons_blackwolves'] call RRPClient_system_weaponShopMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_blackwolves", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_blackwolves", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_blackwolves", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Clothing_GRP_blackwolves: BaseDialog
		{
			answers[] = {
			    {"Одежда Black Wolves", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_blackwolves", "['clothing_blackwolves'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_blackwolves", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Supermarket_GRP_blackwolves: BaseDialog
		{
			answers[] = {
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_blackwolves", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_blackwolves", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_blackwolves", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		
		/*La Cosa Nostra*/
        class RRP_Dialog_Shop_Car_GRP_lacosanostra: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_lacosanostra", "['car_lacosanostra',['lacosanostra_car_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_lacosanostra", "['lacosanostra_car_spawn','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_lacosanostra", "['lacosanostra_car_spawn','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_lacosanostra", "['lacosanostra_car_spawn','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Air_GRP_lacosanostra: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_lacosanostra", "['air_lacosanostra',['lacosanostra_air_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_lacosanostra", "['lacosanostra_air_spawn','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_lacosanostra", "['lacosanostra_air_spawn','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_lacosanostra", "['lacosanostra_air_spawn','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        class RRP_Dialog_Shop_Weapons_GRP_lacosanostra: BaseDialog
		{
			answers[] = {
			    {"Оружие La Cosa Nostra", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_lacosanostra", "['weapons_lcn'] call RRPClient_system_weaponShopMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_lacosanostra", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_lacosanostra", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_lacosanostra", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Clothing_GRP_lacosanostra: BaseDialog
		{
			answers[] = {
			    {"Одежда La Cosa Nostra", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_lacosanostra", "['clothing_lacosanostra'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_lacosanostra", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Supermarket_GRP_lacosanostra: BaseDialog
		{
			answers[] = {
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_lacosanostra", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_lacosanostra", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_lacosanostra", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		// Escobaro
        class RRP_Dialog_Shop_Veh_GRP_Escobaro: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_escobaro", "['R_VehShop_Escobaro',['R_Escobaro_Veh_Shop_Spawn']] call RRPClient_system_vehicleShopMenu;"},
                {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_escobaro", "['R_Escobaro_Veh_Garage_Spawn','Car'] call RRPClient_garage_MarkerMenu;"},
                {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_escobaro", "['R_Escobaro_Veh_Garage_Spawn','Car'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_escobaro", "['R_Escobaro_Veh_Garage_Spawn','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Air_GRP_Escobaro: BaseDialog
		{
			answers[] = {
                {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_escobaro", "['R_AirShop_Escobaro',['R_Escobaro_Air_Shop_Spawn']] call RRPClient_system_vehicleShopMenu;"},
                {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_escobaro", "['R_Escobaro_Air_Garage_Spawn','Air'] call RRPClient_garage_MarkerMenu;"},
                {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_escobaro", "['R_Escobaro_Air_Garage_Spawn','Air'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_escobaro", "['R_Escobaro_Air_Garage_Spawn','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Market_GRP_Escobaro: BaseDialog
		{
			answers[] = {
			    {"Оружие Escobaro", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_escobaro", "['weapons_escobaro'] call RRPClient_system_weaponShopMenu;"},
			    {"Одежда Escobaro", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_escobaro", "['R_Escobaro_Clothing_Shop'] call RRPClient_system_clothingMenu;"},
                {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_escobaro", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_escobaro", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
                {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_escobaro", "['genstore'] call RRPClient_system_weaponShopMenu;"},
                {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_escobaro", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		//Sector
        class RRP_Dialog_Shop_Veh_GRP_Sector: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_sector", "['car_Sector',['R_Sector_Veh_Shop']] call RRPClient_system_vehicleShopMenu;"},
                {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_sector", "['R_Sector_Veh_Garage','Car'] call RRPClient_garage_MarkerMenu;"},
                {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_sector", "['R_Sector_Veh_Garage','Car'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_sector", "['R_Sector_Veh_Garage','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Air_GRP_Sector: BaseDialog
		{
			answers[] = {
                {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_sector", "['air_Sector',['R_Sector_Air_Shop']] call RRPClient_system_vehicleShopMenu;"},
                {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_sector", "['R_Sector_Air_Garage','Air'] call RRPClient_garage_MarkerMenu;"},
                {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_sector", "['R_Sector_Air_Garage','Air'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_sector", "['R_Sector_Air_Garage','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Market_GRP_Sector: BaseDialog
		{
			answers[] = {
			    {"Оружие Sector", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_sector", "['weapons_Sector'] call RRPClient_system_weaponShopMenu;"},
			    {"Одежда Sector", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_sector", "['clothing_Sector'] call RRPClient_system_clothingMenu;"},
                {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_sector", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_sector", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
                {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_sector", "['genstore'] call RRPClient_system_weaponShopMenu;"},
                {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_sector", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		// Sumiyoshi Kai
        class RRP_Dialog_Shop_Veh_GRP_Sumiyoshi: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_sumiyoshi", "['RRP_VehShop_Sumiyoshi',['RRP_Sumiyoshi_Veh_Shop_Spawn']] call RRPClient_system_vehicleShopMenu;"},
                {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_sumiyoshi", "['RRP_Sumiyoshi_Veh_Garage_Spawn','Car'] call RRPClient_garage_MarkerMenu;"},
                {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_sumiyoshi", "['RRP_Sumiyoshi_Veh_Garage_Spawn','Car'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_sumiyoshi", "['RRP_Sumiyoshi_Veh_Garage_Spawn','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Air_GRP_Sumiyoshi: BaseDialog
		{
			answers[] = {
                {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_sumiyoshi", "['RRP_AirShop_Sumiyoshi',['RRP_Sumiyoshi_Air_Shop_Spawn']] call RRPClient_system_vehicleShopMenu;"},
                {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_sumiyoshi", "['RRP_Sumiyoshi_Air_Garage_Spawn','Air'] call RRPClient_garage_MarkerMenu;"},
                {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_sumiyoshi", "['RRP_Sumiyoshi_Air_Garage_Spawn','Air'] call RRPClient_system_storeVehicle;"},
                {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_sumiyoshi", "['RRP_Sumiyoshi_Air_Garage_Spawn','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Market_GRP_Sumiyoshi: BaseDialog
		{
			answers[] = {
			    {"Оружие Sumiyoshi Kai", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_sumiyoshi", "['RRP_Sumiyoshi_Weapons'] call RRPClient_system_weaponShopMenu;"},
			    {"Одежда Sumiyoshi Kai", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_sumiyoshi", "['RRP_Sumiyoshi_Clothing_Shop'] call RRPClient_system_clothingMenu;"},
                {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_sumiyoshi", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_sumiyoshi", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
                {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_sumiyoshi", "['genstore'] call RRPClient_system_weaponShopMenu;"},
                {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_sumiyoshi", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};


		//inagawakai
        class RRP_Dialog_Shop_CarAndAir_GRP_inagawakai: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_inagawakai", "['car_InagawaKai',['InagawaKai_car_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_inagawakai", "['InagawaKai_car_spawn','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_inagawakai", "['InagawaKai_car_spawn','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_inagawakai", "['InagawaKai_car_spawn','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"},
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_inagawakai", "['air_InagawaKai',['InagawaKai_air_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_inagawakai", "['InagawaKai_air_spawn','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_inagawakai", "['InagawaKai_air_spawn','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_inagawakai", "['InagawaKai_air_spawn','Air'] call RRPClient_system_insurance;"}
			};
		};
        class RRP_Dialog_Shop_Air_GRP_InagawaKai: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_inagawakai", "['air_InagawaKai',['InagawaKai_air_sh_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_inagawakai", "['InagawaKai_air_spawn_1','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_inagawakai", "['InagawaKai_air_spawn_1','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_inagawakai", "['InagawaKai_air_spawn_1','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

        class RRP_Dialog_Shop_Weapons_GRP_InagawaKai: BaseDialog
		{
			answers[] = {
			    {"Оружие Inagawa Kai", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_inagawakai", "['weapons_inagawa'] call RRPClient_system_weaponShopMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_inagawakai", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_inagawakai", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_inagawakai", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Clothing_GRP_InagawaKai: BaseDialog
		{
			answers[] = {
			    {"Одежда Inagawa Kai", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_inagawakai", "['clothing_InagawaKai'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_inagawakai", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_Shop_Supermarket_GRP_InagawaKai: BaseDialog
		{
			answers[] = {
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_inagawakai", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_inagawakai", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_inagawakai", "['civdiver'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};


		/* Anvil */
        class RRP_Dialog_NPC_GRP_43: BaseDialog
		{
			answers[] = {
			    {"Оружие ANVIL", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_anvil", "['RRP_Anvil_Gun'] call RRPClient_system_weaponShopMenu;"},
			    {"Одежда ANVIL", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_anvil", "['RRP_Anvil_Uniform'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_anvil", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_anvil", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_anvil", "['civdiver'] call RRPClient_system_clothingMenu;"},
			    {"Оружие", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_anvil", "['BASE_weapons'] call RRPClient_system_weaponShopMenu;"},
			    {"Маски", "\RRP_icons\NPC\RRP_Icon_Mask.paa", "license_anvil", "['clothing_goggles'] call RRPClient_system_clothingMenu;"},
			    {"Бутик Брюса", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_anvil", "['bruce'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_anvil", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_GRP_44: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_anvil", "['RRP_Anvil_Air',['anvil_air_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_anvil", "['anvil_air_2','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_anvil", "['anvil_air_2','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_anvil", "['anvil_air_2','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_GRP_45: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_anvil", "['RRP_Anvil_Veh',['anvil_veh_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_anvil", "['anvil_veh_2','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_anvil", "['anvil_veh_2','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_anvil", "['anvil_veh_2','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_GRP_46: BaseDialog
		{
			answers[] = {
				{"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "license_anvil", "['RRP_Anvil_Boat',['anvil_boat_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "license_anvil", "['anvil_boat_1','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store && license_anvil", "['anvil_boat_1'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Мини грп */


		/* Структуры */

        /* Тюрьма */
        class RRP_Dialog_NPC_STR_Jail_1: BaseDialog
		{
		    text = "Куда собрался? Тут я решаю куда тебе можно, а куда нет";
			answers[] = {
			    {"Переместиться к зоне добычи", "\RRP_icons\NPC\RRP_Icon_Move.paa", "true", "[player,'gather_zone_jail'] call RRPClient_system_move;"},
			    {"Переместиться в блок", "\RRP_icons\NPC\RRP_Icon_Move.paa", "true", "[player,'jail_block'] call RRPClient_system_move;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_Jail_2: BaseDialog
		{
		    text = "Куда собрался? Тут я решаю куда тебе можно, а куда нет";
			answers[] = {
			   	{"Подпольный магазин", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "true", "['RRP_JailStore'] call RRPClient_system_weaponShopMenu;"},
			    {"Переместиться на спорт площадку", "\RRP_icons\NPC\RRP_Icon_Move.paa", "true", "[player,'playground'] call RRPClient_system_move;"},
			    {"Переместиться в блок", "\RRP_icons\NPC\RRP_Icon_Move.paa", "true", "[player,'jail_block'] call RRPClient_system_move;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_Jail_3: BaseDialog
		{
		    text = "Куда собрался? Тут я решаю куда тебе можно, а куда нет";
			answers[] = {
			    {"Переместиться на спорт площадку", "\RRP_icons\NPC\RRP_Icon_Move.paa", "true", "[player,'playground'] call RRPClient_system_move;"},
			    {"Переместиться к зоне добычи", "\RRP_icons\NPC\RRP_Icon_Move.paa", "true", "[player,'gather_zone_jail'] call RRPClient_system_move;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* 7 News */
		class RRP_Dialog_NPC_STR_1: BaseDialog
		{
			answers[] = {
			    {"Оружие 7 News", "\RRP_icons\NPC\RRP_Icon_Pistol.paa", "license_press", "['7news'] call RRPClient_system_weaponShopMenu;"},
			    {"Одежда 7 News", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_press", "['press'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_press", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_press", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_press", "['civdiver'] call RRPClient_system_clothingMenu;"},
			    {"Бутик Брюса", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_press", "['bruce'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_press", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_2: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_press", "['civ_air7news',['7news_air_s']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_press", "['7news_air_s','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_press", "['7news_air_s','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_press", "['7news_air_s','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_3: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_press", "['press_car',['7news_veh_s_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_press", "['7news_veh_s_1','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_press", "['7news_veh_s_1','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_press", "['7news_veh_s_1','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		/* Police */
		class RRP_Dialog_NPC_STR_4: BaseDialog
		{
			answers[] = {
			    {"Оружие полиции", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_basic'] call RRPClient_system_weaponShopMenu;"},
			    {"Форма полиции", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['woomenCop_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_5: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['RRP_Cop_Air',['COP_air_spawn', 'COP_air_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_air_spawn','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_air_spawn','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_air_spawn','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_6: BaseDialog
		{
			answers[] = {
			    {"Техника полиции", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_car',['COP_veh_spawn','COP_veh_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_spawn','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_spawn','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_spawn','Car'] call RRPClient_system_insurance;"},
			    {"Боевая техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 5", "['COP_veh_spawn'] call RRPClient_system_getCombatVehicleMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_6_2: BaseDialog
		{
			answers[] = {
			    {"Автосалон «Форсаж»", "\RRP_icons\NPC\RRP_Icon_Car.paa", "true", "['RRP_CopCivCar_1',['COP_veh_spawn','COP_veh_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автосалон «Lemnos Motors»", "\RRP_icons\NPC\RRP_Icon_Car.paa", "true", "['RRP_CopCivCar_2',['COP_veh_spawn','COP_veh_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автосалон «De Luxe»", "\RRP_icons\NPC\RRP_Icon_Car.paa", "true", "['RRP_CopCivCar_3',['COP_veh_spawn','COP_veh_sh']] call RRPClient_system_vehicleShopMenu;"},
                {"Вернуться", "\RRP_icons\NPC\RRP_Icon_Back.paa", "true", "InitDialog"}
			};
		};
		class RRP_Dialog_NPC_STR_7: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['RRP_Cop_Air',['mi_6_air_new']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['mi_6_air_new','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['mi_6_air_new','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['mi_6_air_new','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_8: BaseDialog
		{
			answers[] = {
			    {"Техника полиции", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_car',['mi_6_veh_new']] call RRPClient_system_vehicleShopMenu;"},
			    {"Боевая техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 5", "['mi_6_veh_new'] call RRPClient_system_getCombatVehicleMenu;"},
			    {"Гражданская техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 26", "['RRP_CopCivCar',['mi_6_veh_new']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['mi_6_veh_new','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['mi_6_veh_new','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['mi_6_veh_new','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_NPC_STR_8_Ship: BaseDialog
		{
			answers[] = {
                {"Магазин лодок", "\RRP_icons\NPC\RRP_Icon_Ship.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_ship',['cop_ship_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Лодочный гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_ship_2','Ship'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_ShipGarage.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_ship_2'] call RRPClient_system_storeVehicle;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_7_2: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['RRP_Cop_Air',['cop_air_jail']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_air_jail','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_air_jail','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_air_jail','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_8_2: BaseDialog
		{
			answers[] = {
			    {"Техника полиции", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_car',['cop_veh_jail']] call RRPClient_system_vehicleShopMenu;"},
			    {"Гражданская техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 26", "['RRP_CopCivCar',['cop_veh_jail']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_veh_jail','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_veh_jail','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_veh_jail','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_9: BaseDialog
		{
			answers[] = {
			    {"Купить карту", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['Card_Police'] call RRPClient_system_weaponShopMenu;"},
			    {"Оплатить штрафы", "\RRP_icons\NPC\RRP_Icon_Ticket.paa", "true", "call RRPClient_parking_Menu;"},
			    {"Мои преступления", "\RRP_icons\NPC\RRP_Icon_Crime.paa", "true", "call RRPClient_police_crimesRequest;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		
		class RRP_Dialog_NPC_STR_10: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['RRP_Cop_Air',['COP_veh_sh_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_sh_2','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_sh_2','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_sh_2','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_11: BaseDialog
		{
			answers[] = {
			    {"Техника полиции", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['cop_car',['COP_veh_sh_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Гражданская техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('cop' call RRPClient_groups_getSideLevel) > 26", "['RRP_CopCivCar',['COP_veh_sh_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_sh_2','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && ('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_sh_2','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('cop' call RRPClient_groups_getSideLevel) > 0", "['COP_veh_sh_2','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        /* EMS */
		class RRP_Dialog_NPC_STR_10_EMS: BaseDialog
		{
			answers[] = {
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_basic'] call RRPClient_system_weaponShopMenu;"},
			    {"Форма", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med'] call RRPClient_system_clothingMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Маски", "\RRP_icons\NPC\RRP_Icon_Mask.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['clothing_goggles'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['woomenMed_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_11_EMS: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_air_hs',['med_air_sh']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_air','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && ('med' call RRPClient_groups_getSideLevel) > 0", "['med_air','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_air','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_11_2: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_air_hs',['med_air_sh_p']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_air_spawn_p','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && ('med' call RRPClient_groups_getSideLevel) > 0", "['med_air_spawn_p','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_air_spawn_p','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_12: BaseDialog
		{
			answers[] = {
			    {"Техника МЧС", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_shop',['med_car_sh','med_car']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_car','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && ('med' call RRPClient_groups_getSideLevel) > 0", "['med_car','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_car','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_12_2: BaseDialog
		{
			answers[] = {
			    {"Техника МЧС", "\RRP_icons\NPC\RRP_Icon_Car.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_shop',['med_car_sh_p']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_car_spawn_p','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && ('med' call RRPClient_groups_getSideLevel) > 0", "['med_car_spawn_p','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "('med' call RRPClient_groups_getSideLevel) > 0", "['med_car_spawn_p','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        /* Minust */
		class RRP_Dialog_NPC_STR_13: BaseDialog
		{
			answers[] = {
			    {"Оружие Мин. юстиции", "\RRP_icons\NPC\RRP_Icon_Pistol.paa", "license_judge", "['taxi'] call RRPClient_system_weaponShopMenu;"},
			    {"Одежда Мин. юстиции", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_judge", "['denchik_cloch'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_judge", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_judge", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_judge", "['civdiver'] call RRPClient_system_clothingMenu;"},
			    {"Бутик Брюса", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_judge", "['bruce'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_judge", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_15: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_judge", "['judge',['RRP_Judge_Veh_Shop_Spawn']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_judge", "['RRP_Judge_Veh_Garage_Spawn','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_judge", "['RRP_Judge_Veh_Garage_Spawn','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_judge", "['RRP_Judge_Veh_Garage_Spawn','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		/* Taxi */
		class RRP_Dialog_NPC_STR_16: BaseDialog
		{
			answers[] = {
			    {"Оружие Такси", "\RRP_icons\NPC\RRP_Icon_Pistol.paa", "license_taxi", "['taxi'] call RRPClient_system_weaponShopMenu;"},
			    {"Одежда Такси", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_taxi", "['taxi_clothing'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_taxi", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_taxi", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "license_taxi", "['civdiver'] call RRPClient_system_clothingMenu;"},
			    {"Бутик Брюса", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_taxi", "['bruce'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_taxi", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_17: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_taxi", "['taxi_air',['air_taxi_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_taxi", "['air_taxi_2','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_taxi", "['air_taxi_2','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_taxi", "['air_taxi_2','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_17_2: BaseDialog
		{
			answers[] = {
			    {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_taxi", "['taxi_air',['air_taxi_kavala']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_taxi", "['air_taxi_kavala','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_taxi", "['air_taxi_kavala','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_taxi", "['air_taxi_kavala','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_18: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_taxi", "['taxi_car',['car_taxi_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_taxi", "['car_taxi_2','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_taxi", "['car_taxi_2','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_taxi", "['car_taxi_2','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_18_2: BaseDialog
		{
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_taxi", "['taxi_car',['car_taxi_kavala']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_taxi", "['car_taxi_kavala','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_taxi", "['car_taxi_kavala','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_taxi", "['car_taxi_kavala','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		/* Правительство */
		class RRP_Dialog_NPC_STR_19: BaseDialog
		{
			text = "Здравствуйте, во что сегодня желаете одеться?";
			answers[] = {
			    {"Одежда", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "life_gov || license_admittance_goverment", "['RRP_Gov_Clothing'] call RRPClient_system_clothingMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "life_gov || license_admittance_goverment", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "life_gov || license_admittance_goverment", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Дайвинг", "\RRP_icons\NPC\RRP_Icon_Diving.paa", "life_gov || license_admittance_goverment", "['civdiver'] call RRPClient_system_clothingMenu;"},
			    {"Бутик Брюса", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "life_gov || license_admittance_goverment", "['bruce'] call RRPClient_system_clothingMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "life_gov || license_admittance_goverment", "['woomen_cloth'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_STR_20: BaseDialog
		{
			text = "Ас-саляму алейкум, какой транспорт Абдулю прогревать?";
			answers[] = {
			    {"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "life_gov || license_admittance_goverment", "['RRP_Gov_Car',['gov_veh_s_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "life_gov || license_admittance_goverment", "['gov_veh_s_1','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && life_gov || !life_garage_store && license_admittance_goverment", "['gov_veh_s_1','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "life_gov || license_admittance_goverment", "['gov_veh_s_1','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		/* Столица повстанцев */
        class RRP_Dialog_NPC_Rebel_1: BaseDialog
		{
		    text = "Смотрю ты парень не промах, для тебя найдется лучший товар на этом острове";
			answers[] = {
			    {"Пушки", "\RRP_icons\NPC\RRP_Icon_Rifle.paa", "license_reb", "['rebel'] call RRPClient_system_weaponShopMenu;"},
				{"Шмотье", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_reb", "['reb'] call RRPClient_system_clothingMenu;"},
			    {"Продажа вещей", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "true", "call RRPClient_sellItems_openMenu;"},
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_reb", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
			    {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_reb", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Женская одежда", "\RRP_icons\NPC\RRP_Icon_GirlCloth.paa", "license_reb", "['woomen_clothP'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_Rebel_2: BaseDialog
		{
		    text = "В смысле тачка не новая? Ты присмотрись какая ласточка!";
			answers[] = {
			    {"Магазин автомобилей", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_reb", "['reb_car',['reb_car_1']] call RRPClient_system_vehicleShopMenu;"},
			  //  {"Магазин грузовиков", "\RRP_icons\NPC\RRP_Icon_Truck.paa", "license_reb", "['reb_truck',['reb_car_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_reb", "['reb_car_2','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_reb", "['reb_car_2','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_reb", "['reb_car_2','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_Rebel_2_2: BaseDialog
		{
		    text = "В смысле тачка не новая? Ты присмотрись какая ласточка!";
			answers[] = {
				{"Магазин автомобилей", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_reb", "['reb_car',['car_g_reb_4','car_g_reb_5']] call RRPClient_system_vehicleShopMenu;"},
			    //{"Магазин грузовиков", "\RRP_icons\NPC\RRP_Icon_Truck.paa", "license_reb", "['reb_truck',['car_g_reb_4','car_g_reb_5']] call RRPClient_system_vehicleShopMenu;"},
			    {"Автомобильный гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "license_reb", "['car_g_reb_5','Car'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Garage.paa", "!life_garage_store && license_reb", "['car_g_reb_5','Car'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_reb", "['car_g_reb_5','Car'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_Rebel_3: BaseDialog
		{
		    text = "Не буду спрашивать умеешь ли ты летать, мое дело продать, а твое купить!";
			answers[] = {
                {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_reb", "['reb_air',['reb_air_1']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "true", "['reb_air_1','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_reb", "['reb_air_1','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['reb_air_1','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_Rebel_3_2: BaseDialog
		{
		    text = "Не буду спрашивать умеешь ли ты летать, мое дело продать, а твое купить!";
			answers[] = {
                {"Воздушная техника", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_reb", "['reb_air',['reb_v_2','reb_v_1_2']] call RRPClient_system_vehicleShopMenu;"},
			    {"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_reb", "['car_g_reb_6','Air'] call RRPClient_garage_MarkerMenu;"},
			    {"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_reb", "['car_g_reb_6','Air'] call RRPClient_system_storeVehicle;"},
			    {"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "license_reb", "['car_g_reb_6','Air'] call RRPClient_system_insurance;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_Rebel_4: BaseDialog
		{
		    text = "Гринго, наконец то ты решил присоединиться к нашему повстанческому движению! Вместе мы сила!";
			answers[] = {
			    {"Магазин лицензий", "\RRP_icons\NPC\RRP_Icon_License.paa", "true", "[nil, nil, nil, ""reb_license""] call Client_documents_shopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
        class RRP_Dialog_NPC_Rebel_5: BaseDialog
		{
		    text = "Смотрю ты парень не промах, для тебя найдется лучший товар на этом острове";
			answers[] = {
                {"Продажа вещей", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "", "['salesofjunk'] call RRPClient_system_weaponShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

		class RRP_Dialog_NPC_Anomaly_1: BaseDialog
		{
		    text = "Смотрю не густо ты сегодня принес? Может в следующий раз повезет";
			answers[] = {
                {"Продажа вещей", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "", "['salesofjunk'] call RRPClient_system_weaponShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_Anomaly_1_1: RRP_Dialog_NPC_Anomaly_1
		{
		    text = "Так так, что ты принес? Самому то не смешно? Давай неси больше!";
		};
		class RRP_Dialog_NPC_Anomaly_2: BaseDialog
		{
		    text = "Возьми с собой необходимые лекарства, спасти себя ты сможешь только сам";
			answers[] = {
                {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "true", "['pharmacy_anomaly'] call RRPClient_system_weaponShopMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_Anomaly_2_2: RRP_Dialog_NPC_Anomaly_2
		{
		    text = "Тут конечно не городская аптека, но чем перемотать рану найдется";
		};

    /* Диалоги для охраны и т.п */

        class RRP_Dialog_Guard: BaseDialog
		{
			text = "Дружище, давай без резких движений, не люблю когда нервируют";
			answers[] = {
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_Anomaly_1: BaseDialog
		{
			text = "Здравия желаю, вы находитесь на охраняемой зоне. Для прохода получите пропуск у ANVIL.";
			answers[] = {
                {"Спасибо за совет", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_Anomaly_4: BaseDialog
		{
			text = "Если собираетесь в радиоактивную зону, то возьмите с собой противогаз и химкостюм. Их можно сделать самому: «Y» >> «Крафт» >> «Экипировка» >> «Химзащита».";
			answers[] = {
                {"Спасибо за совет", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_Anomaly_5: BaseDialog
		{
			text = "Заходи брат, смотрю тебя изрядно потрепали эти твари. Тут ты сможешь перевести дыхание и найти собрата.";
			answers[] = {
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};

	/* Байки/шутки и т.д */
        class RRP_Stories_1: BaseDialog
		{
			randomText[] = {
			    "1",
			    "2",
			    "3"
			};
			answers[] = {
                {"Трави еще", "\RRP_icons\NPC\RRP_Icon_Chat.paa", "true", "RRP_Stories_1"},
                {"Вернуться", "\RRP_icons\NPC\RRP_Icon_Back.paa", "true", "InitDialog"}
			};
		};

		/* Новый год */
		class RRP_Dialog_NPC_NewYear: BaseDialog
		{
			text = "Хо-хо-хо! Ты хорошо себя вёл в этом году? Вот тебе мой подарок!";
			answers[] = {
                {"Получить подарок", "\RRP_icons\NPC\RRP_Icon_NewYear.paa", "true", "call RRPClient_lootBox_onOpenMenu;"},
				{"Рождественские шляпы", "\RRP_icons\NPC\RRP_Icon_NewYear.paa", "true", "['RRP_NewYear_Heads'] call RRPClient_system_clothingMenu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		/* SOA Продажа байков */
		class RRP_Dialog_NPC_SOA_1: BaseDialog
		{
			text = "Sons of Anarchy приветствует всех в нашем пабе. Вход строго без оружия, любая агрессия запрещена.";
			answers[] = {
                {"Магазин байков", "\RRP_icons\NPC\RRP_Icon_Bike.paa", "true", "['RRP_CivBike_1',['RRP_BikeShop_1']] call RRPClient_system_vehicleShopMenu;"},
				{"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		// Доктор хаус
		class RRP_Dialog_NPC_Surgery_1: BaseDialog
		{
			text = "У всех детей есть одна общая черта — они все кретины.";
			answers[] = {
                {"Пластическая хирургия", "\RRP_icons\NPC\RRP_Icon_Surgery.paa", "true", "call RRPClient_surgery_Menu;"},
				{"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		// Анатомия страсти
		class RRP_Dialog_NPC_Surgery_2: RRP_Dialog_NPC_Surgery_1
		{
			text = "И не так важно быть счастливым вечно. Главное, быть счастливым сейчас.";
		};
		class RRP_Dialog_NPC_flightschool_1: BaseDialog
		{
			text = "Еще один! Ты главное шлем не забудь!";
			answers[] = {
				{"Летное снаряжение", "\RRP_icons\NPC\RRP_Icon_Clothing.paa", "license_flightschool_grp_2 || license_flightschool_grp_3", "['RRP_flightschool_Uniform'] call RRPClient_system_clothingMenu;"},
                {"Универмаг", "\RRP_icons\NPC\RRP_Icon_UniShop.paa", "license_flightschool_grp_2 || license_flightschool_grp_3", "['genstore'] call RRPClient_system_weaponShopMenu;"},
			    {"Аптека", "\RRP_icons\NPC\RRP_Icon_Medic.paa", "license_flightschool_grp_2 || license_flightschool_grp_3", "['pharmacy'] call RRPClient_system_weaponShopMenu;"},
				{"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_flightschool_2: BaseDialog
		{
			text = "Не буду спрашивать умеешь ли ты летать, и так знаю что нет!";
				answers[] = {
					{"Наземная техника", "\RRP_icons\NPC\RRP_Icon_Car.paa", "license_flightschool_grp_2 || license_flightschool_grp_3", "['RRP_flightschool_Veh',['flightschool_airspawn_3','flightschool_airspawn_4']] call RRPClient_system_vehicleShopMenu;"},
					{"Вертолеты", "\RRP_icons\NPC\RRP_Icon_Heli.paa", "license_flightschool_grp_2 || license_flightschool_grp_3", "['RRP_flightschool_vAir',['flightschool_airspawn_3','flightschool_airspawn_4']] call RRPClient_system_vehicleShopMenu;"},
					{"Самолеты", "\RRP_icons\NPC\RRP_Icon_Airplane.paa", "license_flightschool_grp_2 || license_flightschool_grp_3", "['RRP_flightschool_sAir',['flightschool_airspawn_1','flightschool_airspawn_1']] call RRPClient_system_vehicleShopMenu;"},
					{"Авиационный гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "license_flightschool_grp_2", "['flightschool_airspawn_3','Air'] call RRPClient_garage_MarkerMenu;"},
					{"Поставить в гараж", "\RRP_icons\NPC\RRP_Icon_Hangar.paa", "!life_garage_store && license_flightschool_grp_2 || license_flightschool_grp_3", "['flightschool_airspawn_3','Air'] call RRPClient_system_storeVehicle;"},
					{"Застраховать транспорт", "\RRP_icons\NPC\RRP_Icon_Insurance.paa", "true", "['flightschool_airspawn_3','Air'] call RRPClient_system_insurance;"},
					{"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
				};
		};
		/* Хранитель вещичек */
		class RRP_Dialog_NPC_Rewards: BaseDialog
        {
            text = "Здравствуй, дорогой игрок. Я Гривус. Моя цель хранить всё ваши найденные подарки.";
            answers[] = {
                {"Открыть тайник", "\RRP_icons\NPC\RRP_Icon_NewYear.paa", "true", "call RRPClient_gui_rewardsDialog_show"},
                {"Лотерея", "\RRP_icons\NPC\RRP_Icon_Ticket.paa", "true", "[0] call RRPClient_lottery_checklotteryinput"},
                {"Проверить билеты", "\RRP_icons\NPC\RRP_Icon_VehRenewal.paa", "true", "[3] call RRPClient_lottery_checklotteryinput"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
            };

        };
		/* Party Meat */
		class RRP_Dialog_NPC_PartyMeat: BaseDialog
        {
            text = "Здравствуй, дорогой. Готов отправиться в мясорубку?.";
            answers[] = {
                {"Погнали!", "\RRP_icons\NPC\RRP_Icon_PartyMeat.paa", "true", "call RRPClient_partyMeat_openMenu"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
            };

        };
		//Работа
		//ДХЛ
		class RRP_Dialog_NPC_DHL: BaseDialog
		{
			randomText[] = {
				"Слушай, у меня много дел, давай или работай, или вали!",
				"Бери форму, машину и ради бога, уйди уже",
				"Ты прошлый раз разбил фару, еще раз и работу больше не получишь!",
				"Кабанчиком, кабанчиком! Форму натянул и полетел!",
				"Если увижу, что ты катаешься на служебном транспорте - у тебя будут проблемы!"
			};
			answers[] = {
                {"Взять работу курьером", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_ds_orderTake"},
                {"Купить униформу DHL", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'dhl' call RRPClient_jobs_clothSpawn"},
                {"Получить служебный автомобиль DHL", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'dhl' call RRPClient_jobs_spawnVehicle"},
                {"Вернуть служебный автомобиль", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'dhl' call RRPClient_jobs_returnVehicle"}
			};
		};
		//Дальнобойщик
		class RRP_Dialog_NPC_trucker: BaseDialog
		{
			randomText[] = {
				"Сегодня на дорогах спокойно, ну хоть когда-то",
				"Аккуратнее за DP11, мало ли что",
				"В Пиргос лучше сегодня не едь, там опять шумели",
				"Ты не видел Петровича? Давно его нет, куда-то пропал.."
			};
			answers[] = {
                {"Получить служебный автомобиль дальнобойщика", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'dlv' call RRPClient_jobs_spawnVehicle"},
                {"Вернуть служебный автомобиль", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'dlv' call RRPClient_jobs_returnVehicle"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_trucker_kavala: RRP_Dialog_NPC_trucker
		{
			answers[] = {
                {"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'depo_kavala' call RRPClient_dlv_getMissionMenu"},
				{"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'depo_kavala' call RRPClient_dlv_finishMission"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_trucker_alps: RRP_Dialog_NPC_trucker_kavala
		{
			answers[] = {
				{"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'depo_alps' call RRPClient_dlv_getMissionMenu"},
				{"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'depo_alps' call RRPClient_dlv_finishMission"},
				{"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_trucker_north: RRP_Dialog_NPC_trucker_kavala
		{
			answers[] = {
				{"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'depo_north' call RRPClient_dlv_getMissionMenu"},
				{"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'depo_north' call RRPClient_dlv_finishMission"},
				{"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_trucker_east: RRP_Dialog_NPC_trucker_kavala
		{
			answers[] = {
				{"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'depo_east' call RRPClient_dlv_getMissionMenu"},
				{"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'depo_east' call RRPClient_dlv_finishMission"},
				{"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		//Автобус
		class RRP_Dialog_NPC_bus: BaseDialog
		{
			randomText[] = {
				"Ну привет"
			};
			answers[] = {
                {"Купить униформу водителя", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'bus' call RRPClient_jobs_clothSpawn"},
                {"Получить служебный автомобиль водителя", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'bus' call RRPClient_jobs_spawnVehicle"},
                {"Вернуть служебный автомобиль", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'bus' call RRPClient_jobs_returnVehicle"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		//Электрик
		class RRP_Work_NPC_Electrician: BaseDialog
		{
			randomText[] = {
				"Ну привет"
			};
			answers[] = {
                {"Купить униформу электрика", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eln' call RRPClient_jobs_clothSpawn"},
                {"Получить служебный автомобиль электрика", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eln' call RRPClient_jobs_spawnVehicle"},
                {"Вернуть служебный автомобиль", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eln' call RRPClient_jobs_returnVehicle"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		//Биржа труда
		class RRP_Dialog_NPC_LaborExchange: BaseDialog
		{
			randomText[] = {
				"Добрый день! Чем могу вам помочь?",
				"Добрый день! Паспорт пожалуста",
				"Добрый день! У меня перерыв, подойдите через 5 минут",
				"Добрый день! Сушаю вас",
				"Добрый день! Электрики нужнаются в сотрудниках, вы подходите"
			};
			answers[] = {
                {"Биржа труда", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_jobs_jobSelection"},
                //{"Теневая работа", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_darkjobs_jobSelection"},
                //{"Взять работу курьером", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_ds_orderTake"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		//Закладчик
		class RRP_Dialog_NPC_Bookmark: BaseDialog
		{
			randomText[] = {
				"Эээ, ты валыну убери, да? Ха-ха, ну это из Сталкера или ты не шаришь?",
				"Спайсы, соли и спиды, мне вообще все до пи..",
				"Ты если стрельнуть пришел - вали",
				"Не, я сам не употребляю, у меня голова на плечах еще есть..",
				"Эх, говорила мама на программиста учись.."
			};
			answers[] = {
                {"Начать темку «Тряхнуть кассира»", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "[] call RRPClient_rob_orderTake"},
                {"Начать темку «Прикормка района»", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "[] call RRPClient_dcourrier_orderTake"},
                {"Начать темку «Нескорая помощь", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "[] call RRPClient_dcleaner_orderTake"},
                {"Начать темку «Крестовый поход»", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "[] call RRPClient_terror_orderTake"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		//ЭкологЗемля
		class RRP_Work_NPC_EcologistEarth: BaseDialog
		{
			randomText[] = {
				"Да, такие люди нам нужны..",
				"Такими темпами, остров превратиться в помойку..",
				"Сволочи! Ну как можно мусорить там, где живешь?!",
				"Я надеюсь, ты сортируешь мусор?",
				"У нас еще есть офис на пирсе..",
				"Я не понял, ты до сих пор не купил электокар, ты вообще слышал о потеплении?"
			};
			answers[] = {
                {"Купить униформу пробоотборщика грунта", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eco_gs' call RRPClient_jobs_clothSpawn"},
                {"Получить служебный автомобиль пробоотборщика грунта", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eco_gs' call RRPClient_jobs_spawnVehicle"},
                {"Вернуть служебный автомобиль", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eco_gs' call RRPClient_jobs_returnVehicle"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		//ЭкологВода
		class RRP_Work_NPC_EcologistWater: BaseDialog
		{
			randomText[] = {
				"Да, такие люди нам нужны..",
				"Такими темпами, остров превратиться в помойку..",
				"Сволочи! Ну как можно мусорить там, где живешь?!",
				"Я надеюсь, ты сортируешь мусор?",
				"Второй офис в центре Пиргоса",
				"Я не понял, ты до сих пор не купил электокар, ты вообще слышал о потеплении?"
			};
			answers[] = {
                {"Купить униформу пробоотборщика воды", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eco_ws' call RRPClient_jobs_clothSpawn"},
                {"Получить служебную лодку пробоотборщика воды", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eco_ws' call RRPClient_jobs_spawnVehicle"},
                {"Вернуть служебную лодку", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "'eco_ws' call RRPClient_jobs_returnVehicle"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		//Депо
		class RRP_Work_NPC_Depo_N: BaseDialog
		{
			randomText[] = {
				"Ну привет"
			};
			answers[] = {
                {"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_dlv_getMissionMenu"},
                {"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_dlv_getMissionMenu"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Work_NPC_Depo_W: BaseDialog
		{
			randomText[] = {
				"Ну привет"
			};
			answers[] = {
                {"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_dlv_getMissionMenu"},
                {"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_dlv_getMissionMenu"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Work_NPC_Depo_S: BaseDialog
		{
			randomText[] = {
				"Ну привет"
			};
			answers[] = {
                {"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_dlv_getMissionMenu"},
                {"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_dlv_getMissionMenu"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Work_NPC_Depo_E: BaseDialog
		{
			randomText[] = {
				"Ну привет"
			};
			answers[] = {
                {"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_dlv_getMissionMenu"},
                {"Сдать заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "call RRPClient_dlv_getMissionMenu"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Work_NPC_FlyDelivery: BaseDialog
		{
			randomText[] = {
				"Тебе нужен гражданский самолет, чтобы возить мои посылки",
				"Доставишь раньше срока, я выпишу тебе премию",
				"Летай сколько влезит, главное довези груз"
			};
			answers[] = {
				{"Взять заказ на доставку груза", "\RRP_icons\NPC\RRP_Icon_Airplane.paa", "true", "[] call RRPClient_FlyDP_startQuest"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Work_NPC_Slavery: BaseDialog
		{
			randomText[] = {
				"Я заберу всех твоих рабов, за хорошие деньги",
				"У тебя есть рабы? Нет? Нам не о чем говорить!",
				"Скажешь полиции о моей деятельности, и ты будешь моим рабом",
				"Ты не сможешь отказаться от меня, я знаю все твои тайны"
			};
			answers[] = {
				{"Продать раба", "\RRP_icons\NPC\RRP_Icon_Airplane.paa", "true", "[] call RRPClient_system_sellSlave"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
		class RRP_Dialog_NPC_StolenGold_1: BaseDialog
		{
			text = "Тут всегда рады таким, как ты. Можем совершить очень интересную сделку. Для тебя... И для меня...";
			answers[] = {
			    {"Сбыть золото", "\RRP_icons\NPC\RRP_Icon_Trade.paa", "true", "['RRP_Buyer_StolenGold'] call RRPClient_system_virt_menu;"},
                {"Уйти", "\RRP_icons\NPC\RRP_Icon_Exit.paa", "true", "_display closeDisplay 0;"}
			};
		};
	};
};
