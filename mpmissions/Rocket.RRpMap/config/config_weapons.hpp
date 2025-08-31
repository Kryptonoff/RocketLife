#define true 1
#define false 0

class LifeCfgWeaponShops
{

  class labs_items {
    items[] = {
      {"srifle_LRR_F", 1},
      {"srifle_DMR_05_blk_F", 1},
      {"LMG_Zafir_F", 1},
      {"launch_RPG32_F", 1}
    };
  };

  class RRP_license_flightschool_Gun
  {
    displayName = "Магазин Летной Школы";
    conditions = "license_flightschool";
    conditionMessage = "";
    groupID = 28;
    pushVIPitems = false;
    items[] = {
        {"murshun_cigs_lighter", 1},
        {"murshun_cigs_cigpack", 1},
        {"immersion_pops_poppack", 1}
    };
  };

  class cop_basic
  {
    displayName = "Оружейная полиции";
    conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
    conditionMessage = "";
    groupID = 1;
    pushVIPitems = true;
    items[] = {
        {"optic_Yorris", 1},
        {"optic_mas_aim_c", 1},
        {"optic_mas_aim", 1},
        {"ItemGPS", 1},
        {"Binocular", 1},
        {"extItem_Buffout", 1},
        {"extItem_grinder", 1},
        {"ItemCompass", 1},
        {"tf_microdagr", 1},
        {"tf_rf7800str", 1},
        {"tf_anprc152", 1},
        {"DDOPP_X26_b", 1},
        {"RRPItem_perventinSyringe", 1},
        {"RRPItem_perventiPills_1_1", 1},
        {"extItem_ItemRepairKit", 1},
        {"extItem_MetalWire", 1},
        {"extItem_bottleclean_100", 1},
        {"RRPItem_Canteen_Empty_L", 1},
        {"extItem_matches", 1},
        {"extItem_Fuelcan", 1},
        {"Skyline_Bouclier_Flashlight_01_F", 1},
        {"extItem_metalDetector", 1},
        {"Oase_ID_Card_Police", 1},

        {"optic_ACO_grn",1},
        {"optic_Aco",1},
        {"optic_Aco_smg", 1},
        {"optic_ACO_grn_smg", 1},

        {"arifle_XMS_Shot_RRPw"},
        {"arifle_SPAR_01_blk_F"},
        {"arifle_mas_mk16_l"},

        {"arifle_AKM_F",1},
        {"arifle_AKS_F",1},
        {"Skyline_AugA1_01_F",1},
        {"arifle_mas_g3",1},
        {"srifle_mas_hk417",1},
        {"arifle_Katiba_F",1},
        {"arifle_mas_m27",1},
        {"srifle_DMR_01_F",1},
        {"arifle_mas_mk17",1},
        {"srifle_mas_sr25",1},

        //9mm
        {"arifle_mas_mp5"}, //7k
		//.12
        {"Winchester1897_01"}, //7k
        {"prpl_benelli_14_pgs_rail"}, //9k
        //556
        {"arifle_mas_arx_l"}, //18k
        {"arifle_mas_g36c"}, //18k
        {"arifle_SDAR_F"}, //18k
        {"arifle_mas_hk416c",1}, //80к
        //{"arifle_mas_l119"}, //18k
        //{"arifle_mas_m16a2"}, //18k
        //{"arifle_mas_ak12_sf"}, //18k
        //762
        {"srifle_mas_m24"}, //24k
        //{"srifle_mas_vss"} //26k

    };
  };
  class Card_Police
  {
    displayName = "Оружейная полиции";
    conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
    conditionMessage = "";
    groupID = 1;
    pushVIPitems = true;
    items[] = {
        {"Oase_ID_Card_Police", 1}
    };
  };
  class rebel
  {
    displayName = "Оружейная Революционеров";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = true;
    items[] = {
        {"optic_Yorris", 1},
        {"optic_mas_aim_c", 1},
        {"optic_mas_aim", 1},
        {"extItem_ducttape", 1},
        {"extItem_headBag", 1},
        {"RH_mak", 1},
        {"RH_mk2", 1},
        {"RH_m9", 1},
        {"RH_m9c", 1},
        {"RH_tt33", 1},
        {"RH_p226", 1},
        {"RH_p226s", 1},
        {"RH_sw659", 1},
        {"RH_deagle", 1},
        {"RH_Deagleg", 1},
        {"RH_Deaglem", 1},
        {"RH_Deagles", 1},
        {"RH_bull", 1},
        {"RH_bullb", 1},
        {"RH_usp", 1},
        {"RH_ttracker", 1},
        {"RH_ttracker_g", 1},
        {"RH_mateba", 1},
        {"RH_mp412", 1},
        {"RH_python", 1},
        {"RH_fn57", 1},
        {"RH_fn57_t", 1},
        {"RH_fn57_g", 1},
        {"RH_fnp45", 1},
        {"RH_fnp45t", 1},
        {"RH_g17", 1},
        {"RH_g19t", 1},
        {"RH_g19", 1},
        {"RH_vp70", 1},
        {"RH_gsh18", 1},
        {"RH_kimber", 1},
        {"RH_kimber_nw", 1},
        {"RH_m1911", 1},
        {"RH_muzi", 1},
        {"RH_tec9", 1},
        {"Winchester1897_01", 1},
        {"arifle_mas_mp40",1}, //9k
        {"arifle_mas_sten",1}, //9k
        {"hgun_mas_uzi_F",1}, // 12k
        {"hgun_mas_mp7p_F",1}, //14k
        {"SMG_05_F",1}, //14k
        {"Skyline_UMP45_01_F",1}, //14k
        {"hgun_PDW2000_F",1}, //14k
        {"arifle_mas_aks74u",1}, //20k
        {"arifle_mas_ak74",1}, //24k
        {"arifle_mas_aa12",1}, //19k
        {"arifle_mas_saiga",1}, //20k
        {"arifle_mas_lee",1}, //28k
        {"arifle_mas_mk16_l",1},
        {"arifle_Mk20_plain_F",1},
        
        {"arifle_AKM_F",1},
        {"arifle_AKS_F",1},
        {"Skyline_AugA1_01_F",1},
        {"arifle_mas_g3",1},
        {"srifle_mas_hk417",1},
        {"arifle_Katiba_F",1},
        {"arifle_mas_m27",1},
        {"srifle_DMR_01_F",1},
        {"arifle_mas_mk17",1},
        {"srifle_mas_sr25",1},
        
        {"arifle_SDAR_F",1} //28k
    };
  };
  class weapons_prem
  {
    displayName = "Оружейная Революционеров";
    conditions = "";
    conditionMessage = "Вам этот магазин недоступен";
    groupID = 0;
    pushVIPitems = true;
    items[] = {
        {"optic_Yorris", 1},
        {"optic_mas_aim_c", 1},
        {"optic_mas_aim", 1},
        {"extItem_ducttape", 1},
        {"extItem_headBag", 1},
        {"RH_mak", 1},
        {"RH_mk2", 1},
        {"RH_m9", 1},
        {"RH_m9c", 1},
        {"RH_tt33", 1},
        {"RH_p226", 1},
        {"RH_p226s", 1},
        {"RH_sw659", 1},
        {"RH_deagle", 1},
        {"RH_Deagleg", 1},
        {"RH_Deaglem", 1},
        {"RH_Deagles", 1},
        {"RH_bull", 1},
        {"RH_bullb", 1},
        {"RH_usp", 1},
        {"RH_ttracker", 1},
        {"RH_ttracker_g", 1},
        {"RH_mateba", 1},
        {"RH_mp412", 1},
        {"RH_python", 1},
        {"RH_fn57", 1},
        {"RH_fn57_t", 1},
        {"RH_fn57_g", 1},
        {"RH_fnp45", 1},
        {"RH_fnp45t", 1},
        {"RH_g17", 1},
        {"RH_g19t", 1},
        {"RH_g19", 1},
        {"RH_vp70", 1},
        {"RH_gsh18", 1},
        {"RH_kimber", 1},
        {"RH_kimber_nw", 1},
        {"RH_m1911", 1},
        {"RH_muzi", 1},
        {"RH_tec9", 1},
        {"Winchester1897_01", 1},
        {"arifle_mas_mp40",1}, //9k
        {"arifle_mas_sten",1}, //9k
        {"hgun_mas_uzi_F",1}, // 12k
        {"hgun_mas_mp7p_F",1}, //14k
        {"SMG_05_F",1}, //14k
        {"Skyline_UMP45_01_F",1}, //14k
        {"hgun_PDW2000_F",1}, //14k
        {"arifle_mas_aks74u",1}, //20k
        {"arifle_mas_ak74",1}, //24k
        {"arifle_mas_aa12",1}, //19k
        {"arifle_mas_saiga",1}, //20k
        {"arifle_mas_aks_74_sf",1}, //28k
        {"arifle_mas_ak_74m_sf",1},
        {"RRPWeapon_SPAR",1},
        {"arifle_mas_m16a2",1}, //28k
        {"arifle_mas_ak12_sf",1}, //28k
        {"arifle_mas_hk416",1}, //28k
        {"arifle_mas_lee",1}, //28k
        {"arifle_SDAR_F",1}, //28k

        {"arifle_AKM_F",1},
        {"arifle_AKS_F",1},
        {"Skyline_AugA1_01_F",1},
        {"arifle_mas_g3",1},
        {"srifle_mas_hk417",1},
        {"arifle_Katiba_F",1},
        {"arifle_mas_m27",1},
        {"srifle_DMR_01_F",1},
        {"arifle_mas_mk17",1},
        {"srifle_mas_sr25",1},
        
        {"arifle_XMS_Base_RRPw",1}
    };
  };
  class weapons_blacksnow: weapons_prem
  {
    displayName = "Оружейная Black Snow";
    condition = "license_blacksnow";
    groupID = 5;
  };
  class weapons_cigane: weapons_prem
  {
    displayName = "Оружейная Cigane";
    condition = "license_cigane";
    groupID = 6;
  };
  class weapons_inagawa: weapons_prem
  {
    displayName = "Оружейная Inagawa Kai";
    condition = "license_inagawakai";
    groupID = 7;
  };
  class weapons_blackwolves: weapons_prem
  {
    displayName = "Оружейная Black Wolves";
    condition = "license_blackwolves";
    groupID = 8;
  };
  class weapons_lcn: weapons_prem
  {
    displayName = "Оружейная La Cosa Nostra";
    condition = "license_lacosanostra";
    groupID = 9;
  };
  class weapons_Sector: weapons_prem
  {
    displayName = "Оружейная Sector";
    conditions = "license_sector";
    groupID = 11;
  };
  class weapons_escobaro: weapons_prem
  {
      displayName = "Оружейная La Escobaro Family";
      condition = "license_escobaro";
      groupID = 12;
  };
  class RRP_Sumiyoshi_Weapons: weapons_prem
  {
      displayName = "Оружейная Sumiyoshi Kai";
      condition = "license_sumiyoshi";
      groupID = 13;
  };
  class gun
  {
    displayName = "Оружейная гражданских";
    conditions = "license_cop_gun && license_med_gun || license_gun";
    conditionMessage = "Для доступа, вам необходимо получить справку от EMS и лизензию у Полиции";
    groupID = 0;
    pushVIPitems = true;
    items[] = {
        {"optic_Yorris",1}, //5k
        {"optic_MRD",1}, //5k
        {"optic_mas_MRD",1}, //5k
        {"acc_flashlight_pistol",1}, //5k
        {"acc_mas_flash_gun",1}, //5k
        {"acc_mas_pointer_gun_IR",1}, //5k
		
        {"Skyline_B95_01_F", 1},
        {"Skyline_B95_02_F", 1},
        {"Skyline_B95_03_F", 1},

        {"arifle_mas_mp5", 1},
        {"SMG_02_F", 1},
		
        {"RH_mak", 1},
        {"RH_mk2", 1},
        {"RH_m9", 1},
        {"RH_m9c", 1},
        {"RH_tt33", 1},
        {"RH_p226", 1},
        {"RH_p226s", 1},
        {"RH_sw659", 1},
        {"RH_deagle", 1},
        {"RH_Deagleg", 1},
        {"RH_Deaglem", 1},
        {"RH_Deagles", 1},
        {"RH_bull", 1},
        {"RH_bullb", 1},
        {"RH_usp", 1},
        {"RH_ttracker", 1},
        {"RH_ttracker_g", 1},
        {"RH_mateba", 1},
        {"RH_mp412", 1},
        {"RH_python", 1},
        {"RH_fn57", 1},
        {"RH_fn57_t", 1},
        {"RH_fn57_g", 1},
        {"RH_fnp45", 1},
        {"RH_fnp45t", 1},
        {"RH_g17", 1},
        {"RH_g19t", 1},
        {"RH_g19", 1},
        {"RH_vp70", 1},
        {"RH_gsh18", 1},
        {"RH_kimber", 1},
        {"RH_kimber_nw", 1},
        {"RH_m1911", 1},
        {"RH_muzi", 1},
        {"RH_tec9", 1},
        {"Winchester1897_01", 1}

    };
  };
  class med_basic
  {
    displayName = "Оружейная МЧС";
    conditions = "";
    conditionMessage = "";
    groupID = 2;
    pushVIPitems = false;
    items[] = {
        {"DDOPP_X26_b", 1},
        {"pmc_earpiece", 1},
        {"ItemGPS", 1},
        {"tf_fadak", 1},
        {"extItem_Waterpure", 1},
        {"extItem_antibiotic", 1},
        {"extItem_vitaminbottle", 1},
        {"extItem_bandage", 1},
        {"extItem_painkillers", 1},
        {"extItem_ItemMorphine", 1},
        {"extItem_ItemSurgeryKit", 1},
        {"Medikit", 1},
        {"RRPItem_jivchik_1", 1},
        {"RRPItem_perventinSyringe", 1},
        {"RRPItem_perventiPills_1_1", 1},
        {"extItem_defibrillator", 1},
        {"extItem_ItemRepairKit", 1},
        {"extItem_bottleclean_100", 1},
        {"RRPItem_Canteen_Empty_L", 1},
        {"extItem_canopener", 1},
        {"extItem_matches", 1},
        {"extItem_Fuelcan", 1},
        {"Extremo_Tool_Axe", 1},
        {"Extremo_Tool_Shovel", 1},
        {"Extremo_Tool_Hoe", 1},
        {"extItem_metalDetector", 1}};
  };
  class grocery_store
  {
    displayName = "Продуктовый";
    conditions = "";
    conditionMessage = "";
    groupID = 2;
    pushVIPitems = false;
    items[] = {
        {"RRPItem_Pumpkin_F", 1},
        {"RRPItem_jivchik_1", 1},
        {"RRPItem_Orange_F", 1},
        {"RRPItem_Blueberry", 1},
        {"RRPItem_Pear", 1},
        {"RRPItem_Strawberry", 1}
	};
  };
  class taxi
  {
    displayName = "Арсенал";
    conditions = "license_taxi or license_judge";
    conditionMessage = "";
    groupID = 3;
    pushVIPitems = false;
    items[] = {
        {"DDOPP_X26_b", 1}};
  };
  class Elections
  {
    displayName = "Стол с бюллетенями";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = false;
    items[] = {
        {"RRP_bulletin_2", 1},
        {"RRP_bulletin_3", 1},
        {"RRP_bulletin_4", 1},
        {"RRP_bulletin_5", 1},
        {"RRP_bulletin_6", 1},
        {"RRP_bulletin_7", 1}};
  };
  class RRP_JailStore
  {
    displayName = "Тюремный магазин";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = false;
    items[] = {
        {"murshun_cigs_lighter", 1},
        {"murshun_cigs_cigpack", 1},
        {"Extremo_Tool_Axe", 1},
        {"Extremo_Tool_PickAxe", 1},
        {"Extremo_Tool_Shovel", 1},
        {"NVGoggles", 1},
        {"RRP_Sign_Police", 1},
        {"RRP_Sign_Weed", 1},
        {"RRP_Sign_Bikes", 1},
        {"RRP_Sign_Gopnik", 1},
        {"RRP_Sign_NoDrugs", 1},
        {"RRP_Sign_NoWar", 1},
        {"RRP_Sign_Poor", 1},
        {"RRP_Sign_Revol", 1},
        {"RRP_Sign_Uran", 1},
        {"RRP_Sign_DickButt", 1},
        {"RRP_Sign_FuckU", 1},
        {"RRP_banne_12", 1},
        {"RRP_banne_13", 1},
        {"RRP_banne_14", 1},
        {"RRP_banne_15", 1},
        {"RRP_banne_16", 1},
        {"RRP_banne_17", 1},
        {"RRP_banne_18", 1}};
  };
  class genstore
  {
    displayName = "Универмаг";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = false;
    items[] = {
        {"ftmItem_BoltBag", 1},
        {"ItemGPS", 1},
        {"ItemMap", 1},
        {"ItemCompass", 1},
        {"Binocular", 1},
        {"murshun_cigs_lighter", 1},
        {"murshun_cigs_cigpack", 1},
        {"extItem_ItemRepairKit", 1},
        {"tf_microdagr", 1},
        {"tf_anprc148jem", 1},
        {"FTM_Ammo_Bolt", 1},
        {"RRPItem_Container", 1},
        {"RRPItem_Canteen_Empty_L", 1},
        {"extItem_canopener", 1},
        {"extItem_knife", 1},
        {"ASN_FishingRod", 1},
        {"extItem_matches", 1},
        {"extItem_Fuelcan_empty", 1},
        {"Extremo_Tool_Axe", 1},
        {"Extremo_Tool_PickAxe", 1},
        {"Extremo_Tool_Shovel", 1},
        {"extItem_metalDetector", 1},
        {"SAN_Headlamp_v1", 1},
        {"SAN_Headlamp_v2", 1},
        {"NVGoggles", 1},
        {"RRPItem_cola", 1},
        {"RRPItem_pepsi", 1},
        {"RRPItem_flash", 1},
        {"RRP_carnation_1", 1},
        {"RRP_carnation_2", 1},
        {"RRP_carnation_3", 1},
        {"RRP_Sign_Police", 1},
        {"RRP_Sign_Weed", 1},
        {"RRP_Sign_Bikes", 1},
        {"RRP_Sign_Gopnik", 1},
        {"RRP_Sign_NoDrugs", 1},
        {"RRP_Sign_NoWar", 1},
        {"RRP_Sign_Poor", 1},
        {"RRP_Sign_Revol", 1},
        {"RRP_Sign_Uran", 1},
        {"RRP_Sign_DickButt", 1},
        {"RRP_Sign_FuckU", 1},
        {"RRP_banne_12", 1},
        {"RRP_banne_13", 1},
        {"RRP_banne_14", 1},
        {"RRP_banne_15", 1},
        {"RRP_banne_16", 1},
        {"RRP_banne_17", 1},
        {"RRP_banne_18", 1}
	    };
  };
  class pharmacy
  {
    displayName = "Аптека";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = false;
    items[] = {
        {"extItem_Waterpure", 1},
        {"extItem_antibiotic", 1},
        {"extItem_vitaminbottle", 1},
        {"extItem_bandage", 1},
        {"extItem_painkillers", 1},
        {"extItem_ItemMorphine", 1},
        {"extItem_redgull", 1}
	  };
  };
  class pharmacy_anomaly
  {
    displayName = "Аптека";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = false;
    items[] = {
        {"extItem_Waterpure", 3},
        {"extItem_antibiotic", 3},
        {"extItem_vitaminbottle", 3},
        {"extItem_bandage", 3},
        {"extItem_painkillers", 3},
        {"extItem_ItemMorphine", 3},
        {"extItem_redgull", 3}
  	};
  };
  class 7news
  {
    displayName = "7NEWS Channel";
    conditions = "license_press";
    conditionMessage = "";
    groupID = 4;
    pushVIPitems = false;
    items[] = {
        {"RRPItem_Canteen_Empty_L", 1},
        {"camerach_weap_tv", 1},
        {"camerach_weap_tv", 1},
        {"item_C_UavTerminal", 1},
        {"C_UavTerminal", 1},
        {"XZ_CamRecorder_2", 1},
        {"XZ_CamRecorder_1", 1},
        {"Xnooz_AppareilPhoto", 1},
        {"Xnooz_micro2", 1},
        {"Xnooz_micro1", 1},
        {"DDOPP_X26", 1},
        {"microch_weap_tv", 1}
  	};
  };
  class bar
  {
    displayName = "Алкоголь и табак";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = false;
    items[] = {
        {"extItem_CarltonDraught", 1},
        {"extItem_Coopers", 1},
        {"extItem_Corona", 1},
        {"extItem_Jimbeam", 1}
	  };
  };
  class shop24
  {
    displayName = "Altis 24-7";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = false;
    items[] = {
        {"tf_microdagr", 1},
        {"tf_anprc154", 1},
        {"tf_anprc148jem", 1},
        {"extItem_bottle_empty", 1},
        {"RRPItem_Canteen_Empty_L", 1},
        {"Extremo_Tool_Axe", 1},
        {"Extremo_Tool_Shovel", 1},
        {"Extremo_Tool_Hoe", 1},
        {"extItem_metalDetector", 1},
        {"extItem_ItemRepairKit", 1},
        {"extItem_bandage", 1}
	  };
  };

  class salesofjunk
  {
    displayName = "Сбыт хлама";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    sellMode = true;
    pushVIPitems = false;
    items[] = {
        {"tf_microdagr", 1},
        {"tf_anprc154", 1},
        {"tf_anprc148jem", 1},
        {"extItem_bottle_empty", 1},
        {"RRPItem_Canteen_Empty_L", 1},
        {"Extremo_Tool_Axe", 1},
        {"Extremo_Tool_Shovel", 1},
        {"Extremo_Tool_Hoe", 1},
        {"extItem_metalDetector", 1},
        {"extItem_ItemRepairKit", 1},
        {"extItem_bandage", 1}
		};
	};
  class admin_gun_shop
  {
    displayName = "Altis 24-7";
    conditions = "";
    conditionMessage = "";
    groupID = 0;
    pushVIPitems = false;
    items[] = {
        {"arifle_mas_m16a2", 1},
        {"arifle_mas_g36c", 1},
        {"arifle_mas_arx_l", 1},
        {"extItem_bottle_empty", 1},
        {"RRPItem_Canteen_Empty_L", 1},
        {"Extremo_Tool_Axe", 1},
        {"Extremo_Tool_Shovel", 1},
        {"Extremo_Tool_Hoe", 1},
        {"extItem_metalDetector", 1},
        {"extItem_ItemRepairKit", 1},
        {"extItem_bandage", 1}
	  };
  };
};
