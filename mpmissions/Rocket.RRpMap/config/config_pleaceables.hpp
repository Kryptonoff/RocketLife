class LifeCfgPlaceables 
{
	class 1 
	{
		displayName = "Прожектор одинарный";
		classname = "Land_PortableLight_single_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 2 
	{
		displayName = "Прожектор двойной";
		classname = "Land_PortableLight_double_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0 OR ('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 3 
	{
		displayName = "Дорожный конус с лампой";
		classname = "RoadCone_L_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0 OR ('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 4 
	{
		displayName = "Дорожный барьер (маленький)";
		classname = "RoadBarrier_small_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0 OR ('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 5 
	{
		displayName = "Дорожный барьер (большой)";
		classname = "RoadBarrier_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 6 
	{
		displayName = "Оградительная лента";
		classname = "TapeSign_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0 OR ('med' call RRPClient_groups_getSideLevel) > 0 OR license_press";
	};
	class 7 
	{
		displayName = "Отбойник";
		classname = "Land_Crash_barrier_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 8 
	{
		displayName = "Пластиковый барьер, оранжевый";
		classname = "PlasticBarrier_03_orange_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 10
	{
		displayName = "Мешок с трупом";
		classname = "Land_Bodybag_01_black_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0 OR ('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 11
	{
		displayName = "Пачка документов";
		classname = "Land_Document_01_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 12
	{
		displayName = "Противотанковый ёж";
		classname = "Land_CzechHedgehog_01_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 13 
	{
		displayName = "Баррикада из мешков с песком";
		classname = "Land_SandbagBarricade_01_half_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 14 
	{
		displayName = "Шлакбаум";
		classname = "Land_BarGate_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 15 
	{
		displayName = "Смотровая вышка";
		classname = "Land_Cargo_Patrol_V3_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class 16 
	{
		displayName = "Большой Аэропортовые фонарь";
		classname = "Land_LampAirport_F";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0 OR ('med' call RRPClient_groups_getSideLevel) > 0";
	};
	//медиковское
	class 18 
	{
		displayName = "Каталка";
		classname = "Land_Stretcher_01_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 19 
	{
		displayName = "Стойка для капельницы";
		classname = "Land_IntravenStand_01_2bags_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 20 
	{
		displayName = "Аптечка первой помощи";
		classname = "Land_FirstAidKit_01_closed_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 21 
	{
		displayName = "Носилки";
		classname = "Rimas_EMS_Stretcher";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	//press
	/*
	class 22 
	{
		displayName = "Стрелка-указатель (направо)";
		classname = "ArrowDesk_R_F";
		conditions = "license_press";
	};
	class 23
	{
		displayName = "Стрелка-указатель (налево)";
		classname = "ArrowDesk_L_F";
		conditions = "license_press";
	};
	class 24 
	{
		displayName = "Safety Post (Silver)";
		classname = "plp_up_SafetyPostSilver";
		conditions = "license_press";
	};
	class 25 
	{
		displayName = "Safety Post (Silver, Stand)";
		classname = "plp_up_SafetyPostSilverStand";
		conditions = "license_press";
	};
	class 26 
	{
		displayName = "Tire Barrier (6)";
		classname = "acd_TyreBarrier_01_line_x6_F";
		conditions = "license_press";
	};
	class 27 
	{
		displayName = "Офисный стол";
		classname = "OfficeTable_01_new_F";
		conditions = "license_press";
	};
	class 28 
	{
		displayName = "Пластиковый барьер (Большой, синий)";
		classname = "PlasticBarrier_03_blue_F";
		conditions = "license_press";
	};
	class 29 
	{
		displayName = "Хромакей";
		classname = "EXT_chromoKey";
		conditions = "license_press";
	};
	class 30
	{
		displayName = "Офисное кресло";
		classname = "Land_OfficeChair_01_F";
		conditions = "license_press";
	};
	class 31 
	{
		displayName = "Traffic Cone (Orange)";
		classname = "plp_up_TrafficConeOrange";
		conditions = "license_press";
	};
	class 32 
	{
		displayName = "Переносной фонарь (одиночный)";
		classname = "Land_PortableLight_single_F";
		conditions = "license_press";
	};
	class 33 
	{
		displayName = "Tire Barrier";
		classname = "acd_TyreBarrier_01_white_F";
		conditions = "license_press";
	};
	class 34 
	{
		displayName = "Road barrier";
		classname = "acd_RoadBarrier_F";
		conditions = "license_press";
	};
	class 35 
	{
		displayName = "Tire Barrier (Black, 1)";
		classname = "acd_TyreBarrier_01_black_F";
		conditions = "license_press";
	};
	class 36 
	{
		displayName = "Переносной фонарь (двойной)";
		classname = "Land_PortableLight_double_F";
		conditions = "license_press";
	};
	class 37 
	{
		displayName = "Входные ворота";
		classname = "Land_EntranceGate_01_narrow_F";
		conditions = "license_press";
	};
	*/
	class 38 
	{
		displayName = "Rugged Laptop (Black, Open)";
		classname = "Land_Laptop_03_black_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 39 
	{
		displayName = "Plastic Barrier";
		classname = "acd_PlasticBarrier_02_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 40
	{
		displayName = "Arrow Desk (right)";
		classname = "acd_ArrowDesk_R_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 41 
	{
		displayName = "Arrow Desk (left)";
		classname = "acd_ArrowDesk_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 42 
	{
		displayName = "Site Fence (Metal, Tarp, Blue B)";
		classname = "plp_up_SiteFenceMetalTarpBlueB";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 43 
	{
		displayName = "Tool Cart (Red)";
		classname = "acd_ToolTrolley_01_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 44 
	{
		displayName = "Portable Engine Crane";
		classname = "acd_EngineCrane_01_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 45 
	{
		displayName = "First Aid Box (Open)";
		classname = "Land_FirstAidKit_01_open_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 46 
	{
		displayName = "Tent (Shelter, Open)";
		classname = "Land_MedicalTent_01_white_generic_open_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	class 47 
	{
		displayName = "Canvas Cover (Small)";
		classname = "Land_CanvasCover_02_F";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 0";
	};
	/*
	class 48 
	{
		displayName = "Ракетная тележка";
		classname = "Land_Missle_Trolley_02_F";
		conditions = "license_press";
	};
	class 49 
	{
		displayName = "Гроб";
		classname = "Coffin_01_F";
		conditions = "license_press";
	};
	class 50 
	{
		displayName = "Мемориальный венок";
		classname = "MemorialWreath_01_Standing_F";
		conditions = "license_press";
	};
	class 51 
	{
		displayName = "Куча металлолома";
		classname = "Land_ScrapHeap_2_F";
		conditions = "license_press";
	};
	class 52 
	{
		displayName = "Портативный стол";
		classname = "Land_PortableDesk_01_black_F";
		conditions = "license_press";
	};
	class 53 
	{
		displayName = "Поддоны";
		classname = "Land_Pallet_MilBoxes_F";
		conditions = "license_press";
	};
	class 54
	{
		displayName = "Портативный кабинет";
		classname = "Land_PortableCabinet_01_medical_F";
		conditions = "license_press";
	};
	class 55
	{
		displayName = "Портативный кабинет";
		classname = "Land_PortableCabinet_01_closed_olive_F";
		conditions = "license_press";
	};
	class 56
	{
		displayName = "Портативный кабинет";
		classname = "Land_PortableCabinet_01_4drawers_black_F";
		conditions = "license_press";
	};
	class 57
	{
		displayName = "Портативный кабинет";
		classname = "Land_PortableCabinet_01_bookcase_black_F";
		conditions = "license_press";
	};
	class 58
	{
		displayName = "Рабочий стул";
		classname = "Land_DeskChair_01_black_F";
		conditions = "license_press";
	};
	class 59
	{
		displayName = "Волокнистый завод";
		classname = "Land_fiberPlant";
		conditions = "license_press";
	};
	class 60 
	{
		displayName = "Трость";
		classname = "Land_cane";
		conditions = "license_press";
	};
	class 61 
	{
		displayName = "Ноутбук";
		classname = "Land_Laptop_02_unfolded_F";
		conditions = "license_press";
	};
	class 62 
	{
		displayName = "Устройство";
		classname = "Land_Device_assembled_F";
		conditions = "license_press";
	};
	class 63 
	{
		displayName = "Букет";
		classname = "FlowerBouquet_01_F";
		conditions = "license_press";
	};
	class 64 
	{
		displayName = "Букет";
		classname = "FlowerBouquet_02_F";
		conditions = "license_press";
	};
	class 65 
	{
		displayName = "Букет";
		classname = "FlowerBouquet_03_F";
		conditions = "license_press";
	};
	class 66 
	{
		displayName = "Барьер";
		classname = "plp_up_BarrierBollardRed";
		conditions = "license_press";
	};
	class 67 
	{
		displayName = "Барьер";
		classname = "plp_up_BarrierTapeOrange2mLoose";
		conditions = "license_press";
	};
	class 68 
	{
		displayName = "Барьер";
		classname = "plp_up_BarrierTapePolice2mLoose";
		conditions = "license_press";
	};
	class 69 
	{
		displayName = "Барьер";
		classname = "plp_up_BarrierTapeYellow2mLoose";
		conditions = "license_press";
	};
	class 70 
	{
		displayName = "Барьер";
		classname = "plp_up_BollardIronABlackLightOn";
		conditions = "license_press";
	};
	class 71 
	{
		displayName = "Барьер";
		classname = "plp_up_BollardSteelGreyDrawbackHigh";
		conditions = "license_press";
	};
	class 72 
	{
		displayName = "Ворота";
		classname = "plp_up_BoomGateYellow";
		conditions = "license_press";
	};
	class 73 
	{
		displayName = "Шкатулка";
		classname = "plp_ctm_CasketLeatherBlack";
		conditions = "license_press";
	};
	class 74 
	{
		displayName = "Шкатулка";
		classname = "plp_ctm_CasketLeatherRed";
		conditions = "license_press";
	};
	class 75 
	{
		displayName = "Сундук";
		classname = "plp_cts_FootlockerBrown";
		conditions = "license_press";
	};
	class 76 
	{
		displayName = "Сундук";
		classname = "plp_ctm_FootlockerBrownOpen";
		conditions = "license_press";
	};
	class 77 
	{
		displayName = "Сундук";
		classname = "plp_cts_FootlockerRed";
		conditions = "license_press";
	};
	class 78 
	{
		displayName = "Сундук";
		classname = "plp_cts_FootlockerRedOpen";
		conditions = "license_press";
	};
	class 80 
	{
		displayName = "Забор Металл";
		classname = "plp_up_MetalFenceGrey";
		conditions = "license_press";
	};
	class 81 
	{
		displayName = "Статическая полоса с шипами вверх";
		classname = "plp_up_SpikeStripStaticUp";
		conditions = "license_press";
	};
	class 82 
	{
		displayName = "Дорожный конус";
		classname = "plp_up_TrafficConeOrange";
		conditions = "license_press";
	};
	class 83 
	{
		displayName = "Дорожный конус";
		classname = "plp_up_TrafficConeYellow";
		conditions = "license_press";
	};
	class 84 
	{
		displayName = "Деревянный барьер";
		classname = "plp_upm_WoodBarrierShortYellowLightsOn";
		conditions = "license_press";
	};
	class 85 
	{
		displayName = "Бутылка";
		classname = "Land_WaterBottle_01_full_F";
		conditions = "license_press";
	};
	class 86 
	{
		displayName = "Мешки для еды";
		classname = "Land_FoodSacks_01_cargo_brown_idap_F";
		conditions = "license_press";
	};
	class 87 
	{
		displayName = "Вода 1";
		classname = "Land_WaterBottle_01_pack_F";
		conditions = "license_press";
	};
	class 88 
	{
		displayName = "Вода 2";
		classname = "Land_WaterBottle_01_stack_F";
		conditions = "license_press";
	};
	class 89 
	{
		displayName = "Spinal Board";
		classname = "SpinalBoard_01_orange_F";
		conditions = "license_press";
	};
	class 90 
	{
		displayName = "Пищевых контейнеров";
		classname = "Land_FoodContainer_01_F";
		conditions = "license_press";
	};
	class 91 
	{
		displayName = "Коробка с рисом";
		classname = "Land_RiceBox_F";
		conditions = "license_press";
	};
	class 92 
	{
		displayName = "Canteen";
		classname = "Land_Canteen_F";
		conditions = "license_press";
	};
	class 93 
	{
		displayName = "Тыква";
		classname = "Land_Pumpkin_01_F";
		conditions = "license_press";
	};
	class 94 
	{
		displayName = "Гриндер";
		classname = "Land_Grinder_F";
		conditions = "license_press";
	};
	class 95 
	{
		displayName = "Бутановая горелка";
		classname = "Land_ButaneTorch_F";
		conditions = "license_press";
	};
	class 96 
	{
		displayName = "Деньги";
		classname = "Land_MoneyBills_01_stack_F";
		conditions = "license_press";
	};
	class 97 
	{
		displayName = "Инструментальная тележка";
		classname = "Land_ToolTrolley_01_F";
		conditions = "license_press";
	};
	class 98 
	{
		displayName = "Ящик для инструментов Красный Грязный";
		classname = "plp_ctm_ToolboxRedDirty";
		conditions = "license_press";
	};
	class 99 
	{
		displayName = "Skeleton";
		classname = "Land_HumanSkeleton_F";
		conditions = "license_press";
	};
	class 100 
	{
		displayName = "Skull";
		classname = "Land_HumanSkull_F";
		conditions = "license_press";
	};
	class 101 
	{
		displayName = "Свет";
		classname = "Land_PortableLight_02_quad_black_F";
		conditions = "license_press";
	};
	class 102 
	{
		displayName = "Моторный кран";
		classname = "Land_EngineCrane_01_F";
		conditions = "license_press";
	};
	class 103 
	{
		displayName = "Кровь";
		classname = "BloodSplatter_01_Large_New_F";
		conditions = "license_press";
	};
	class 104 
	{
		displayName = "Мешки для тел";
		classname = "Land_Bodybag_01_black_F";
		conditions = "license_press";
	};
	class 105 
	{
		displayName = "Мешки для тел";
		classname = "Land_IntravenBag_01_full_F";
		conditions = "license_press";
	};
	class 106 
	{
		displayName = "Мешок Крови";
		classname = "Land_BloodBag_F";
		conditions = "license_press";
	};
	class 107 
	{
		displayName = "Стенд";
		classname = "Land_IntravenStand_01_2bags_F";
		conditions = "license_press";
	};
	class 108 
	{
		displayName = "Куча багажа";
		classname = "Land_LuggageHeap_04_F";
		conditions = "license_press";
	};
	class 109 
	{
		displayName = "Приз";
		classname = "Land_Trophy_01_bronze_F";
		conditions = "license_press";
	};
	class 110 
	{
		displayName = "Приз";
		classname = "Land_Trophy_01_gold_F";
		conditions = "license_press";
	};
	class 111 
	{
		displayName = "Приз";
		classname = "Land_Trophy_01_silver_F";
		conditions = "license_press";
	};
	class 112 
	{
		displayName = "Блокнот";
		classname = "Land_Notepad_F";
		conditions = "license_press";
	};
	class 113 
	{
		displayName = "Газета";
		classname = "Newspaper_01_F";
		conditions = "license_press";
	};
	class 114 
	{
		displayName = "Документ";
		classname = "Land_Document_01_F";
		conditions = "license_press";
	};
	class 115 
	{
		displayName = "Ручки";
		classname = "Land_PensAndPencils_F";
		conditions = "license_press";
	};
	class 116 
	{
		displayName = "PenBlack";
		classname = "Land_PenBlack_F";
		conditions = "license_press";
	};
	class 117 
	{
		displayName = "Photoframe";
		classname = "Land_Photoframe_01_F";
		conditions = "license_press";
	};
	class 118 
	{
		displayName = "Pencil Yellow";
		classname = "Land_PencilYellow_F";
		conditions = "license_press";
	};
	class 119 
	{
		displayName = "Файл";
		classname = "Land_File1_F";
		conditions = "license_press";
	};
	class 120 
	{
		displayName = "Файл";
		classname = "Land_File_research_F";
		conditions = "license_press";
	};
	class 121 
	{
		displayName = "Деньги";
		classname = "Land_Money_F";
		conditions = "license_press";
	};
	class 122 
	{
		displayName = "Резак";
		classname = "fatum_cutter";
		conditions = "license_press";
	};
	class 123 
	{
		displayName = "HighSecB";
		classname = "plp_cts_HighSecBigWhite";
		conditions = "license_press";
	};
	class 124 
	{
		displayName = "HighSecB";
		classname = "plp_ctm_HighSecBigBlack";
		conditions = "license_press";
	};
	class 125 
	{
		displayName = " Weath Crate Big Brown";
		classname = "plp_ctm_WeathCrateBigBrown";
		conditions = "license_press";
	};
	class 126 
	{
		displayName = "Цель";
		classname = "TargetP_Inf_F";
		conditions = "license_press";
	};
	class 127 
	{
		displayName = "Цель";
		classname = "Hostage_PopUp_Moving_F";
		conditions = "license_press";
	};
	class 128 
	{
		displayName = "Цель";
		classname = "Hostage_PopUp2_Moving_90deg_F";
		conditions = "license_press";
	};
	class 129 
	{
		displayName = "Цель";
		classname = "Hostage_PopUp3_Moving_90deg_F";
		conditions = "license_press";
	};
	class 130 
	{
		displayName = "Камера";
		classname = "Land_Camera_01_F";
		conditions = "license_press";
	};
	class 131 
	{
		displayName = "Телевизор";
		classname = "Land_FlatTV_01_F";
		conditions = "license_press";
	};*/
};