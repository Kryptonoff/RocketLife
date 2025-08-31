class clothing_settings
{

    //reb uniforms
    class RRP_Clothing_Cocaine {
        condition_sell = "license_reb";
        condition_sell_message = "Нужна метка бандита!";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class d3s_uniform_jbib_000: RRP_Clothing_Cocaine {price = 200;};
    class G3_CombatUniform_Coyot: RRP_Clothing_Cocaine {price = 200;};
    class Kosuha_S: RRP_Clothing_Cocaine {price = 200;};
    class KSK_Assault_FlecktarnDesertTSHIRT: RRP_Clothing_Cocaine {
        condition_sell = "(call life_donator) > 2 AND license_reb";
        condition_sell_message = "Нужна метка бандита и VIP-3";
        price = 5500;
    };
    class KSK_Assault_FlecktarnWoodlandTSHIRT: RRP_Clothing_Cocaine {
        condition_sell = "(call life_donator) > 2 AND license_reb";
        condition_sell_message = "Нужна метка бандита и VIP-3";
        price = 5200;
    };
    class Skyline_Character_U_Chasseur_05_F: RRP_Clothing_Cocaine {price = 4900;};
    class mgsr_poncho_dry: RRP_Clothing_Cocaine {price = 4600;};
    class Gsg9_Uniform_TrainingBlack_Gloves: RRP_Clothing_Cocaine {price = 5500;};
    class Gsg9_Uniform_TrainingBrown_Gloves: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingGrey_Gloves: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingWetEarth_Gloves: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingBlack: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingBrown: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingBrownWhiteTs: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingBrownWhiteTS_Gloves: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingGrey: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingWetEarth: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingWetEarthWhiteTs: Gsg9_Uniform_TrainingBlack_Gloves {};
    class Gsg9_Uniform_TrainingWetEarthWhiteTS_Gloves: Gsg9_Uniform_TrainingBlack_Gloves {};
    class TRYK_U_B_PCUHsW8: RRP_Clothing_Cocaine {
        condition_sell = "(call life_donator) > 2 AND license_reb";
        condition_sell_message = "Нужна метка бандита и VIP-3";
        price = 9000;
    };
    class TRYK_U_B_PCUHsW7: RRP_Clothing_Cocaine {price = 5150;};
    class TRYK_U_B_PCUGs_BLK_R: RRP_Clothing_Cocaine {price = 5250;};
    class TRYK_U_B_PCUGs_gry_R: RRP_Clothing_Cocaine {price = 5320;};
    class TRYK_U_B_PCUGs_OD_R: RRP_Clothing_Cocaine {price = 4620;};
    class TRYK_U_denim_jersey_blk: RRP_Clothing_Cocaine {price = 4680;};
    class TRYK_U_pad_j_blk: RRP_Clothing_Cocaine {price = 4950;};
    class rds_uniform_Woodlander3: RRP_Clothing_Cocaine {price = 4770;};
    class RRP_Clothing_Yellowline: TRYK_U_B_PCUHsW8 {price = 5000;};
    class Gsg9_Uniform_Black: RRP_Clothing_Cocaine {price = 7000;};
    class Gsg9_Uniform_Brown: RRP_Clothing_Cocaine {price = 7100;};
    class CryeGen3_Uniform_FlecktarnDesert: TRYK_U_B_PCUHsW8 {};
    class CryeGen3_Uniform_FlecktarnWoodland: TRYK_U_B_PCUHsW8 {};
    class Gsg9_Uniform_Grey: RRP_Clothing_Cocaine {price = 6700;};
    class CryeGen3_Uniform_FlecktarnDesert_Gloft: TRYK_U_B_PCUHsW8 {};
    class Gsg9_Uniform_WetEarth_RS: RRP_Clothing_Cocaine {price = 6900;};

    //reb goggles
    class G_mas_wpn_shemag: RRP_Clothing_Cocaine {price = 3400;};
    class G_RM_SWAT_Balaclava: TRYK_U_B_PCUHsW8 {
        condition_sell = "(call life_donator) > 2 AND license_reb";
        condition_sell_message = "Нужна метка бандита и VIP-3";
        price = 6000;
    };
    class G_RM_SWAT_Bandana: RRP_Clothing_Cocaine {price = 3600;};
    class G_mas_wpn_wrap_b: RRP_Clothing_Cocaine {price = 3500;};
    class G_mas_wpn_wrap_f: RRP_Clothing_Cocaine {price = 3700;};
    class G_mas_wpn_wrap_gog_b: RRP_Clothing_Cocaine {price = 3500;};
    class G_mas_wpn_wrap_gog_g: RRP_Clothing_Cocaine {price = 3250;};
    class G_mas_wpn_wrap_gog_c: G_RM_SWAT_Balaclava {};
    class G_mas_wpn_wrap_c: G_RM_SWAT_Balaclava {};
    class G_Bandanna_beast: G_RM_SWAT_Balaclava {};
    class G_mas_wpn_bala_b: G_RM_SWAT_Balaclava {};

    //vests
    class AG_Jacket_Base: RRP_Clothing_Cocaine {price = 6000;};
    class AG_Jacket_NoBelt_Base: AG_Jacket_Base {};
    class AG_Jacket_NoRadioBelt_Base: AG_Jacket_Base {};
    class TAC_LBT_H_OD: RRP_Clothing_Cocaine {price = 15000;};
    class TAC_LBT_H3_B: RRP_Clothing_Cocaine {price = 15000;};
    class TAC_LBT_H3_Khaki: RRP_Clothing_Cocaine {price = 15000;};
    class V_BandollierB_rgr: RRP_Clothing_Cocaine {price = 15500;};
    class TAC_LBT_H3_OD: RRP_Clothing_Cocaine {price = 16500;};
    class TAC_V_tacSVD_BK: RRP_Clothing_Cocaine {price = 17400;};
    class TAC_V_tacSVD_OD: RRP_Clothing_Cocaine {price = 17700;};
    class TAC_CR1_OD: RRP_Clothing_Cocaine {price = 20000;};
    class TAC_EI_RRV1_B: RRP_Clothing_Cocaine {price = 24000;};
    class TAC_EI_RRV1_Coyote: RRP_Clothing_Cocaine {price = 24000;};
    class TAC_EI_RRV1_OD: RRP_Clothing_Cocaine {price = 24000;};
    class TRYK_V_Bulletproof: RRP_Clothing_Cocaine {price = 35000;};
    class RRP_Clueless_Vest: RRP_Clothing_Cocaine {
        condition_sell = "(call life_donator) > 2 AND license_reb AND license_blackwolves";
        condition_sell_message = "Нужна метка бандита и VIP-3";
        price = 40000;
    };

    //Форма полиции
    class jf_police_uniform2_03
    {
        custom_name = "Кадет";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 1";
        condition_sell_message = "С звания Кадет";
        condition_use = "";
        condition_use_message = "";
        price = 200;
    };
    class jf_police_uniform2_01
    {
        custom_name = "Полицейский";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 2";
        condition_sell_message = "С звания Рядовой";
        condition_use = "";
        condition_use_message = "";
        price = 200;
    };
    class jf_sheriff_uniform_02
    {
        custom_name = "Полицейский";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 6";
        condition_sell_message = "С звания Офицер";
        condition_use = "";
        condition_use_message = "";
        price = 200;
    };
    class jf_police_uniform_01
    {
        custom_name = "Полицейский";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 10";
        condition_sell_message = "С звания Майор";
        condition_use = "";
        condition_use_message = "";
        price = 200;
    };
    class jf_sheriff_uniform_01
    {
        custom_name = "Начальник";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [16,17,19,20,21,22,23]";
        condition_sell_message = "С звания Начальник ПА";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [16,17,19,20,21,22,23]";
        condition_use_message = "";
        price = 200;
    };
    
    class RRPClothing_Uniform_Police_K9_01
    {
        custom_name = "";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]";
        condition_sell_message = "K9";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]";
        condition_use_message = "";
        price = 200;
    };
    class RRPClothing_Uniform_Police_K9_02: RRPClothing_Uniform_Police_K9_01 {};
    class RRPClothing_Vest_Police_K9_01: RRPClothing_Uniform_Police_K9_01 {};
    class RRPClothing_Vest_Police_K9_02: RRPClothing_Uniform_Police_K9_01 {};
    class RRPClothing_Headgear_Police_K9_01: RRPClothing_Uniform_Police_K9_01 {};
    class G_mas_wpn_bala: RRPClothing_Uniform_Police_K9_01 {};
    
    class RRPClothing_Uniform_Police_PD_01: RRPClothing_Uniform_Police_K9_01
    {
        custom_name = "";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [16,17,19,22,23]";
        condition_sell_message = "PD";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [16,17,19,22,23]";
        condition_use_message = "";
        price = 200;
    };
    class RRPClothing_Uniform_Police_PD_02: RRPClothing_Uniform_Police_PD_01 {};
    class RRPClothing_Vest_Police_PD_01: RRPClothing_Uniform_Police_PD_01 {};
    class RRPClothing_Vest_Police_PD_02: RRPClothing_Uniform_Police_PD_01 {};
    class RRPClothing_Headgear_Police_PD_01: RRPClothing_Uniform_Police_PD_01 {};
    
    class RM_SWAT_Uniform_01
    {
        custom_name = "К9";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]";
        condition_sell_message = "Доступно Оперативнику К9";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]";
        condition_use_message = "Доступно Оперативнику К9";
        price = 200;
    };
    class RM_SWAT_Uniform_02
    {
        custom_name = "К9";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]";
        condition_sell_message = "Доступно Оперативнику К9";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]";
        condition_use_message = "Доступно Оперативнику К9";
        price = 200;
    };
    class RP_bigcop_bob_v1
    {
        custom_name = "Зам.Министр МВД";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [22,23]";
        condition_sell_message = "Доступно Заместителю Министра";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [22,23]";
        condition_use_message = "Доступно Заместителю Министра";
        price = 200;
    };
    class RP_bigcop_bob_v2
    {
        custom_name = "Министр МВД";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [23]";
        condition_sell_message = "Доступно Министру МВД";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [23]";
        condition_use_message = "Доступно Министру МВД";
        price = 200;
    };
    class RRP_uniform_fbi
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "Доступно FBI";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "Доступно FBI";
        price = 4000;
    };
    class RRP_uniform_fbi_1
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "Доступно FBI";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "Доступно FBI";
        price = 4000;
    };
	//Броники полиции
    class jf_dea_vest_01
    {
        custom_name = "Кадет";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 1";
        condition_sell_message = "С звания Кадет";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class jf_police_vest_01
    {
        custom_name = "Полицейский";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 2";
        condition_sell_message = "С звания Рядовой";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class jf_sheriff_vest_01
    {
        custom_name = "Начальник";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [16,17,19,20,21,22,23]";
        condition_sell_message = "С звания Начальник ПА";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [16,17,19,20,21,22,23]";
        condition_use_message = "С звания Начальник ПА";
        price = 10000;
    };
    class jf_fbi_vest_01
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "Доступно FBI";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "Доступно FBI";
        price = 10000;
    };
    class EF_v1_K9P2
    {
        custom_name = "К9";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]";
        condition_sell_message = "Доступно Оперативнику К9";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [15,18,21,22,23]";
        condition_use_message = "Доступно Оперативнику К9";
        price = 10000;
    };
    class RP_bob_vest_v1
    {
        custom_name = "Министр МВД";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [22,23]";
        condition_sell_message = "Доступно Заместителю Министра";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [22,23]";
        condition_use_message = "Доступно Заместителю Министра";
        price = 10000;
    };
    class RRP_vest_fbi
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "Доступно FBI";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "Доступно FBI";
        price = 10000;
    };
    class RRP_vest_fbi_1
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "Доступно FBI";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "Доступно FBI";
        price = 10000;
    };
	//Кепки полиции
    class RRPhead_Cap_CadetOFF_PD
    {
        custom_name = "Кадет";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 1";
        condition_sell_message = "С звания Кадет";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class RRPhead_Cap_POLICEOFF2_PD
    {
        custom_name = "Полицейский";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 2";
        condition_sell_message = "С звания Рядовой";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class jf_police_hat_02
    {
        custom_name = "Полицейский";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 6";
        condition_sell_message = "С звания Офицер";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class jf_police_hat_01
    {
        custom_name = "Полицейский";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) >= 10";
        condition_sell_message = "С звания Майор";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class jf_campaign_sheriff_hat_01
    {
        custom_name = "Начальник";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [16,17,19,20,21,22,23]";
        condition_sell_message = "С звания Начальник ПА";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [16,17,19,20,21,22,23]";
        condition_use_message = "С звания Начальник ПА";
        price = 2000;
    };
    class RRPhead_Cap_POLICEOFF_PD
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "Доступно FBI";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "Доступно FBI";
        price = 2000;
    };
    class RP_bob_cap
    {
        custom_name = "Министр МВД";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [22,23]";
        condition_sell_message = "С звания Заместитель Министра";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [22,23]";
        condition_use_message = "";
        price = 2000;
    };
    class RRP_helmet_fbi
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "Доступно FBI";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "Доступно FBI";
        price = 5000;
    };
	//очки
    class G_Bandanna_aviator
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23]";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class G_Bandanna_sport
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23]";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class G_Bandanna_shades
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23]";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class G_Balaclava_blk
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23]";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class G_mas_wpn_gog_d
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23]";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23]";
        condition_use_message = "";
        price = 2000;
    };
    class G_Aviator
    {
        custom_name = "Авиаторы";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23]";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [1,2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,20,21,22,23]";
        condition_use_message = "";
        price = 2000;
    };
    class G_mas_wpn_bala_gog
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "";
        price = 2000;
    };
	//сумки полиции
    class TRYK_B_BAF_BAG_BLK
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class RP_bob_bag
    {
        custom_name = "Министр МВД";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [22,23]";
        condition_sell_message = "Доступно Министру МВД";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [22,23]";
        condition_use_message = "Доступно Министру МВД";
        price = 3000;
    };
    class SD_backpack:TRYK_B_BAF_BAG_BLK{};
    class d3s_backpack_COP:TRYK_B_BAF_BAG_BLK{};
    class d3s_backpack_COP2:TRYK_B_BAF_BAG_BLK{};
    class pd_form_unif_bag_2:TRYK_B_BAF_BAG_BLK{};
    class TAC_BP_Butt_B2
    {
        custom_name = "FBI";
        condition_sell = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_sell_message = "Доступно FBI";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) in [20,21,22,23]";
        condition_use_message = "Доступно FBI";
        price = 3000;
    };
	////////////////////////////////
	//грп
    class BS_form_cadet
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 200;
    };
    class BS_form_fighter:BS_form_cadet{};
    class BS_form_officer:BS_form_cadet{};

    class BS_Vest2
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 20000;
    };
    class BS_vest:BS_Vest2{};

    class BS_Beret
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class BS_Cap:BS_Beret{};
    class RRPClothing_balaclava_1_BS:BS_Beret{};

    class BS_Backpack
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
	///
    class Snowman_Bucket_Wearable_M
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class Snowman_Enemy_Wearable_M
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class Snowman_Hat_Wearable
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class Snowman_Enemy_Wearable
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class Snowman_Bucket_Wearable
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class Snowman_Hat_Wearable_M
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class Christmas_Hat_Side_Wearable
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Christmas_Hat_Reindeer_Wearable
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Christmas_Hat_Plain_Wearable
    {
        custom_name = "";
        condition_sell = "true";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    // RRP_Anvil_Uniform
    // RRP_flightschool_Uniform
    // RRP_Gov_Clothing
    // RRP_Outcast_Clothing
    // bruce
    class NONE
    {
        custom_name = "снять форму";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 0;
    };
    // denchik_cloch
    // jail_shop
    class mgsr_robe_blue
    {
        custom_name = "Обычный";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 1000;
    };
    class mgsr_eyepatch
    {
        custom_name = "Повязка На Глаз";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2500;
    };
    // med
	class Rimas_EMS_Diver
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
	class Rimas_EMS_Intern:Rimas_EMS_Diver{};
	class Ems_woman_2:Rimas_EMS_Diver{};
	class Ems_woman_3:Rimas_EMS_Diver{};
	class Ems_woman_1:Rimas_EMS_Diver{};
	class Ems_woman_5:Rimas_EMS_Diver{};
	class Ems_Woman_6:Rimas_EMS_Diver{};
	class Medic_major:Rimas_EMS_Diver{};
	class U_union_medic:Rimas_EMS_Diver{};
	class Union_medic:Rimas_EMS_Diver{};
	class EMS_Paramedic:Rimas_EMS_Diver{};
	class Rimas_EMS_Vest_Red:Rimas_EMS_Diver{};
	class EMS_Woman_4:Rimas_EMS_Diver{};
	class Rimas_EMS_Spec:Rimas_EMS_Diver{};
	class Rimas_EMS_St_Spec:Rimas_EMS_Diver{};
	class Rimas_EMS_Paramedic:Rimas_EMS_Diver{};
	class Rimas_EMS_Doctor:Rimas_EMS_Diver{};
	class Rimas_EMS_Doctor2:Rimas_EMS_Diver{};
	class Rimas_EMS_Doctor3:Rimas_EMS_Diver{};
	class Rimas_EMS_Officer:Rimas_EMS_Diver{};
	class Rimas_EMS_Officer_2:Rimas_EMS_Diver{};
	class Rimas_EMS_Minister_W:Rimas_EMS_Diver{};
	class Rimas_EMS_Minister_B:Rimas_EMS_Diver{};
	class U_B_Wetsuit:Rimas_EMS_Diver{};
	class Skyline_Character_U_CivilD_01_F:Rimas_EMS_Diver{};
	class medic_wetsuit:Rimas_EMS_Diver{};
    class EMS_girl_intern:Rimas_EMS_Diver{};  class EMS_girl_doc:Rimas_EMS_Diver{};  class EMS_girl_paramedic:Rimas_EMS_Diver{};  class EMS_girl2_intern:Rimas_EMS_Diver{};  class EMS_girl2_doc:Rimas_EMS_Diver{};  class EMS_girl2_paramedic:Rimas_EMS_Diver{};
	class RRP_Doctor_Hirurg1:Rimas_EMS_Diver{}; class RRP_Doctor_Narcolog1:Rimas_EMS_Diver{}; class RRP_Doctor_Psycholog1:Rimas_EMS_Diver{}; class RRP_Doctor_Terapevt1:Rimas_EMS_Diver{};
    class Rimas_EMS_Beret:Rimas_EMS_Diver{};
    class medic_Cap:Rimas_EMS_Diver{};
    class medic_Beret:Rimas_EMS_Diver{};
    class Rimas_EMS_Cap_W:Rimas_EMS_Diver{};
    class RRPClothing_ems_red:Rimas_EMS_Diver{};
    class RRPClothing_ems_black:Rimas_EMS_Diver{};
    class RRPClothing_ems_white:Rimas_EMS_Diver{};
    class EMS_RebreatherB_White:Rimas_EMS_Diver{};
    class EMS_RebreatherB_Red:Rimas_EMS_Diver{};
    class EMS_RebreatherB_Blue:Rimas_EMS_Diver{};
	
    class RRPClothing_76561198068309224_uniform_1:Rimas_EMS_Diver
	{
        condition_sell = "getPlayerUID player in ['76561198068309224']";
        condition_use = "getPlayerUID player in ['76561198068309224']";
	};

	class RRPClothing_backpack_1_EMS
    {
        custom_name = "Сумка для крафта. Если носить ее и не крафтить, можно случайно надорвать спину и умереть";
        condition_sell = "";
        condition_sell_message = "Сумка для крафта. Если носить ее и не крафтить, можно случайно надорвать спину и умереть";
        condition_use = "";
        condition_use_message = "Сумка для крафта. Если носить ее и не крафтить, можно случайно надорвать спину и умереть";
        back_pack_weight = 10000;
        price = 7000;
    };
	
	class RRP_belt_med
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
	class EMS_backpack:RRP_belt_med{};
	class Rimas_EMS_Belt_Red:RRP_belt_med{};
	class Rimas_EMS_Belt_Black:RRP_belt_med{};
	class Rimas_EMS_Belt_White:RRP_belt_med{};
	class Rimas_EMS_Backpack_W_B:RRP_belt_med{};
	class Rimas_EMS_Stretcher:RRP_belt_med{};
	class tf_anprc155_coyote:RRP_belt_med{};
    class EMS_backpack_brat:RRP_belt_med{};
    class EMS_backpack_intern:RRP_belt_med{};
	
	
    class RRPClothing_76561198068309224_Bag_1:RRP_belt_med
	{
        condition_sell = "getPlayerUID player in ['76561198068309224']";
        condition_use = "getPlayerUID player in ['76561198068309224']";
	};
    class RRPClothing_76561198068309224_vest_1:RRP_belt_med
	{
        condition_sell = "getPlayerUID player in ['76561198068309224']";
        condition_use = "getPlayerUID player in ['76561198068309224']";
        price = 15000;
	};
    class RRPClothing_76561198068309224_beret_1:RRP_belt_med
	{
        condition_sell = "getPlayerUID player in ['76561198068309224']";
        condition_use = "getPlayerUID player in ['76561198068309224']";
        price = 2000;
	};
    // woomenMed_cloth
    class EF_FEM_3A_EMS
    {
        custom_name = "";
        condition_sell = "license_isGirl";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class EF_FEM_3_6_EMS
    {
        custom_name = "";
        condition_sell = "license_isGirl";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class EF_FEM_4A_EMS
    {
        custom_name = "";
        condition_sell = "license_isGirl";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class EF_FEM_4A_EMS2
    {
        custom_name = "";
        condition_sell = "license_isGirl";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class EF_FEM_4_5_EMS
    {
        custom_name = "";
        condition_sell = "license_isGirl";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class EF_F_DR
    {
        custom_name = "";
        condition_sell = "license_isGirl";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    // reb_bruce
    // cop_bruce
    // cop
    class RRP_UWW_100
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        back_pack_weight = 100;
        price = 30000;
    };
    class RRP_UWW_95 : RRP_UWW_100 {};
    class RRP_UWW_90 : RRP_UWW_100 {};
    class RRP_UWW_85 : RRP_UWW_100 {};
    class RRP_UWW_80 : RRP_UWW_100 {};
    class RRP_UWW_75 : RRP_UWW_100 {};
    class RRP_UWW_70 : RRP_UWW_100 {};
    class RRP_UWW_65 : RRP_UWW_100 {};
    class RRP_UWW_60 : RRP_UWW_100 {};
    class RRP_UWW_55 : RRP_UWW_100 {};
    class RRP_UWW_50 : RRP_UWW_100 {};
    class RRP_UWW_45 : RRP_UWW_100 {};
    class RRP_UWW_40 : RRP_UWW_100 {};
    class RRP_UWW_35 : RRP_UWW_100 {};
    class RRP_UWW_30 : RRP_UWW_100 {};
    class RRP_UWW_25 : RRP_UWW_100 {};
    class RRP_UWW_20 : RRP_UWW_100 {};
    class RRP_UWW_15 : RRP_UWW_100 {};
    class RRP_UWW_10 : RRP_UWW_100 {};
    class RRP_UWW_5 : RRP_UWW_100 {};
    class RRP_UWW_0 : RRP_UWW_100 {};
    // civdiver
    // dhl
    class rimas_dhl_Employee
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class rimas_dhl_Cap
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 1000;
    };
    class rimas_dhl_Belt
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    // rebdiver
    class U_I_Wetsuit
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class G_I_Diving
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    // kart
    class U_C_Driver_1_black
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class U_C_Driver_1_blue
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class U_C_Driver_1_red
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class U_C_Driver_1_orange
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class U_C_Driver_1_green
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class U_C_Driver_1_white
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class U_C_Driver_2
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class U_C_Driver_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class U_C_Driver_3
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class H_RacingHelmet_1_black_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
    class H_RacingHelmet_1_red_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
    class H_RacingHelmet_1_white_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
    class H_RacingHelmet_1_blue_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
    class H_RacingHelmet_1_green_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
    class H_RacingHelmet_1_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
    class H_RacingHelmet_2_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
    class H_RacingHelmet_3_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 7000;
    };
    // press
    class EF_FEM_3_3LPBW2
    {
        custom_name = "";
        condition_sell = "('civ' call RRPClient_groups_getSideLevel) >= 3";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class RRPVest_7news_01
    {
        custom_name = "";
        condition_sell = "('civ' call RRPClient_groups_getSideLevel) >= 3";
        condition_sell_message = "";
        condition_use = "license_press";
        condition_use_message = "";
        price = 5000;
    };
    class Headgear_H_Cap_press
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class H_Cap_press
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class V_Press_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class H_PASGT_basic_blue_press_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class RRPHelmet_7news_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "license_anvil";
        condition_use_message = "";
        price = 5000;
    };
    class RRPHelmet_7news_02
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "license_anvil";
        condition_use_message = "";
        price = 5000;
    };
    class RRP_badge_7News_C
    {
        custom_name = "";
        condition_sell = "('civ' call RRPClient_groups_getSideLevel) >= 1";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_press";
        condition_use_message = "";
        price = 5000;
    };
    class RRP_badge_7News_B
    {
        custom_name = "";
        condition_sell = "('civ' call RRPClient_groups_getSideLevel) >= 2";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_press";
        condition_use_message = "";
        price = 5000;
    };
    class RRP_badge_7News_A
    {
        custom_name = "";
        condition_sell = "('civ' call RRPClient_groups_getSideLevel) >= 3";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_press";
        condition_use_message = "";
        price = 5000;
    };
    // taxi_clothing
    class U_union_taxi
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Rimas_taxi
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class U_D_TAXI_Man_cargo_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class TAXI_suit_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class EF_suit_2
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Taxi_FEM5_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Taxi_FEM4_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Taxi_FEM3_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Taxi_FEM2_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Taxi_FEM1_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Girl_Taxi_1_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Girl_TAXI_2_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class TAXI_EarProtectors_black_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class TAXI_EarProtectors_orange_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 50;
    };
    class TAXI_Mcap_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class Taxi_Mcap_2
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class Taxi_021_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class Taxi_011_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class TAXI_Chapka_Yellow
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 4000;
    };
    class TAXI_Chapka_Black
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 4000;
    };
    class TAXI_Fcap_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class Taxi_Fcap_2
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class RRP_badge_TAXI_C
    {
        custom_name = "";
        condition_sell = "('civ' call RRPClient_groups_getSideLevel) > 0";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_taxi";
        condition_use_message = "";
        price = 1500;
    };
    class RRP_badge_TAXI_B
    {
        custom_name = "";
        condition_sell = "('civ' call RRPClient_groups_getSideLevel) > 1";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_taxi";
        condition_use_message = "";
        price = 1500;
    };
    class RRP_badge_TAXI_A
    {
        custom_name = "";
        condition_sell = "('civ' call RRPClient_groups_getSideLevel) > 2";
        condition_sell_message = "";
        condition_use = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_taxi";
        condition_use_message = "";
        price = 1500;
    };
    class V_Taxi_yellow_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class TAXI_SH
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5500;
    };
    class TAXI_backpack
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "license_taxi";
        condition_use_message = "";
        price = 7000;
    };
    class B_Messenger_TAXI_A
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class B_Messenger_Taxi_B
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class B_Messenger_Taxi_C
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class B_Messenger_Taxi_D
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class B_Messenger_Taxi_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    // admin
    class A3L_Zombie
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 1;
    };
    class A3L_SECRET
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 1;
    };
    class A3L_SpookyMummy
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 1;
    };
    // clothing_defolt2

	//очки

	//головные уборы гражданские
    class Skyline_HeadGear_Bandana_01_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class Skyline_HeadGear_Bandana_03_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Bandana_04_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BandanaHead_01_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BandanaHead_02_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BandanaHead_03_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BandanaHead_04_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BandanaHead_05_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BandanaHead_06_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Bandana_05_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Hat_Safari_sand_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Hat_Safari_olive_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Hat_blue:Skyline_HeadGear_Bandana_01_F{};
    class H_Hat_grey:Skyline_HeadGear_Bandana_01_F{};
    class H_Hat_brown:Skyline_HeadGear_Bandana_01_F{};
    class H_Hat_checker:Skyline_HeadGear_Bandana_01_F{};
    class H_Hat_camo:Skyline_HeadGear_Bandana_01_F{};
    class H_Hat_tan:Skyline_HeadGear_Bandana_01_F{};
    class H_Shemag_olive_hs:Skyline_HeadGear_Bandana_01_F{};
    class H_Shemag_olive:Skyline_HeadGear_Bandana_01_F{};
    class H_ShemagOpen_tan:Skyline_HeadGear_Bandana_01_F{};
    class H_ShemagOpen_khk:Skyline_HeadGear_Bandana_01_F{};
    class H_Watchcap_khk:Skyline_HeadGear_Bandana_01_F{};
    class H_Watchcap_cbr:Skyline_HeadGear_Bandana_01_F{};
    class H_Watchcap_camo:Skyline_HeadGear_Bandana_01_F{};
    class H_Watchcap_blk:Skyline_HeadGear_Bandana_01_F{};
    class H_StrawHat_dark:Skyline_HeadGear_Bandana_01_F{};
    class H_StrawHat:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_eaf:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_dgtl:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_khk:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_tna_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_taiga:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_tan:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_oli:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_wdl:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_mgrn:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_khk_hs:Skyline_HeadGear_Bandana_01_F{};
    class H_Booniehat_mcamo:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_marshal:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_headphones:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_blk_Raven:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_brn_SPECOPS:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_Black_IDAP_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_blk:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_usblack:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_tan_specops_US:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_blu:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_surfer:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_Orange_IDAP_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_oli:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_red:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_tan:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_grn:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_khaki_specops_UK:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_White_IDAP_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_blk_ION:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_blk_CMMG:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_grn_BI:Skyline_HeadGear_Bandana_01_F{};
    class H_Cap_oli_hs:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_earprot_black_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_headset_black_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_basic_black_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_earprot_orange_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_headset_orange_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_basic_orange_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_earprot_red_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_headset_red_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_basic_red_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_earprot_yellow_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_headset_yellow_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_basic_yellow_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_earprot_white_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_headset_white_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_basic_white_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_earprot_vrana_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_headset_vrana_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Construction_basic_vrana_F:Skyline_HeadGear_Bandana_01_F{};
    class H_EarProtectors_black_F:Skyline_HeadGear_Bandana_01_F{};
    class H_EarProtectors_orange_F:Skyline_HeadGear_Bandana_01_F{};
    class H_EarProtectors_red_F:Skyline_HeadGear_Bandana_01_F{};
    class H_EarProtectors_yellow_F:Skyline_HeadGear_Bandana_01_F{};
    class H_EarProtectors_white_F:Skyline_HeadGear_Bandana_01_F{};
    class H_HeadSet_black_F:Skyline_HeadGear_Bandana_01_F{};
    class H_HeadSet_orange_F:Skyline_HeadGear_Bandana_01_F{};
    class H_HeadSet_red_F:Skyline_HeadGear_Bandana_01_F{};
    class H_HeadSet_yellow_F:Skyline_HeadGear_Bandana_01_F{};
    class H_HeadSet_white_F:Skyline_HeadGear_Bandana_01_F{};
    class H_WirelessEarpiece_F:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_gry:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_khk:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_blu:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_surfer_blk:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_surfer_grn:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_surfer:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_sgg:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_sand:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_camo:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_cbr:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_khk_hs:Skyline_HeadGear_Bandana_01_F{};
    class H_Bandanna_mcamo:Skyline_HeadGear_Bandana_01_F{};
    class rds_worker_cap4:Skyline_HeadGear_Bandana_01_F{};
    class rds_worker_cap2:Skyline_HeadGear_Bandana_01_F{};
    class rds_worker_cap1:Skyline_HeadGear_Bandana_01_F{};
    class rds_worker_cap3:Skyline_HeadGear_Bandana_01_F{};
    class rds_Villager_cap3:Skyline_HeadGear_Bandana_01_F{};
    class rds_Villager_cap1:Skyline_HeadGear_Bandana_01_F{};
    class rds_Woodlander_cap4:Skyline_HeadGear_Bandana_01_F{};
    class rds_Woodlander_cap1:Skyline_HeadGear_Bandana_01_F{};
    class rds_Woodlander_cap2:Skyline_HeadGear_Bandana_01_F{};
    class rds_Woodlander_cap3:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_r_cap_tan_Glasses:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_r_cap_od_Glasses:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_r_cap_blk_Glasses:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_R_CAP_OD_US:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_R_CAP_TAN:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_R_CAP_BLK:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_H_pakol2:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_H_headsetcap_od_Glasses:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_H_headsetcap_blk_Glasses:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_H_headsetcap_Glasses:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_H_EARMUFF:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_H_Bandana_wig_g:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_H_Bandana_wig:Skyline_HeadGear_Bandana_01_F{};
    class TRYK_H_Bandana_H:Skyline_HeadGear_Bandana_01_F{};
    class rds_Profiteer_cap2:Skyline_HeadGear_Bandana_01_F{};
    class rds_Profiteer_cap4:Skyline_HeadGear_Bandana_01_F{};
    class rds_Profiteer_cap3:Skyline_HeadGear_Bandana_01_F{};
    class rds_Profiteer_cap1:Skyline_HeadGear_Bandana_01_F{};
    class EF_HAT_SG:Skyline_HeadGear_Bandana_01_F{};
    class EF_HAT_PI:Skyline_HeadGear_Bandana_01_F{};
    class EF_HAT_CL:Skyline_HeadGear_Bandana_01_F{};
    class EF_HAT_BW:Skyline_HeadGear_Bandana_01_F{};
    class EF_HAT_BK:Skyline_HeadGear_Bandana_01_F{};
    class EF_BNE_W:Skyline_HeadGear_Bandana_01_F{};
    class EF_BNE_V:Skyline_HeadGear_Bandana_01_F{};
    class EF_BNE_R:Skyline_HeadGear_Bandana_01_F{};
    class EF_BNE_BR:Skyline_HeadGear_Bandana_01_F{};
    class EF_BNE_BL:Skyline_HeadGear_Bandana_01_F{};
    class EF_BNE_BK:Skyline_HeadGear_Bandana_01_F{};
    class EF_FPKL_W:Skyline_HeadGear_Bandana_01_F{};
    class EF_FPKL_RD:Skyline_HeadGear_Bandana_01_F{};
    class EF_FPKL_CY:Skyline_HeadGear_Bandana_01_F{};
    class EF_FPKL_BL:Skyline_HeadGear_Bandana_01_F{};
    class EF_FPKL_BK:Skyline_HeadGear_Bandana_01_F{};
    class EF_FHAT_SG:Skyline_HeadGear_Bandana_01_F{};
    class EF_FHAT_PI:Skyline_HeadGear_Bandana_01_F{};
    class EF_FHAT_CL:Skyline_HeadGear_Bandana_01_F{};
    class EF_FHAT_BW:Skyline_HeadGear_Bandana_01_F{};
    class EF_FHAT_BK:Skyline_HeadGear_Bandana_01_F{};
    class H_C_Chapka_Verte:Skyline_HeadGear_Bandana_01_F{};
    class H_C_Chapka_Noire:Skyline_HeadGear_Bandana_01_F{};
    class H_C_Chapka_Bleue:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Chapka_03_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Chapka_05_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Chapka_04_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Chapka_01_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Chapka_02_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Cowboy_06_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Cowboy_05_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Cowboy_04_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Cowboy_03_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Cowboy_02_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_Cowboy_01_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BonnetLaine_05_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BonnetLaine_04_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BonnetLaine_03_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BonnetLaine_01_F:Skyline_HeadGear_Bandana_01_F{};
    class Skyline_HeadGear_BonnetLaine_02_F:Skyline_HeadGear_Bandana_01_F{};
	//броники гражданские
    class V_Plain_medical_F
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class V_Safety_blue_F:V_Plain_medical_F{};
    class V_Safety_yellow_F:V_Plain_medical_F{};
    class V_Safety_orange_F:V_Plain_medical_F{};
    class V_Plain_crystal_F:V_Plain_medical_F{};


    class V_HarnessO_gry:V_Plain_medical_F{
        price = 4000;
	};
    class V_HarnessO_ghex_F:V_Plain_medical_F{};
    class V_HarnessO_brn:V_Plain_medical_F{};
    class V_BandollierB_blk:V_Plain_medical_F{};
    class V_BandollierB_khk:V_Plain_medical_F{};
    class V_BandollierB_oli:V_Plain_medical_F{};
    class V_BandollierB_cbr:V_Plain_medical_F{};
    class V_BandollierB_ghex_F:V_Plain_medical_F{};

    class V_Pocketed_black_F:V_Plain_medical_F{
        price = 4500;};
    class V_Pocketed_olive_F:V_Plain_medical_F{};
    class V_Pocketed_coyote_F:V_Plain_medical_F{};
	//Сумки
    class B_TacticalPack_blk
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
    };
    class B_TacticalPack_oli:B_TacticalPack_blk{};
    class B_TacticalPack_rgr:B_TacticalPack_blk{};
    class B_TacticalPack_ocamo:B_TacticalPack_blk{};
    class B_TacticalPack_mcamo:B_TacticalPack_blk{};

    class B_CivilianBackpack_01_Sport_Blue_F:B_TacticalPack_blk
	{
        price = 5000;
	};
    class B_CivilianBackpack_01_Sport_Red_F:B_CivilianBackpack_01_Sport_Blue_F{};
    class B_CivilianBackpack_01_Sport_Green_F:B_CivilianBackpack_01_Sport_Blue_F{};

    class B_Bergen_dgtl_F:B_TacticalPack_blk
	{
        price = 10000;
	};
    class B_Bergen_tna_F:B_Bergen_dgtl_F{};
    class B_Bergen_hex_F:B_Bergen_dgtl_F{};
    class B_Bergen_mcamo_F:B_Bergen_dgtl_F{};

    class B_mas_m_Bergen_acr_w:B_Bergen_dgtl_F
	{
        price = 15000;
	};
    class B_mas_m_Bergen_acr_g:B_mas_m_Bergen_acr_w{};
    class B_mas_m_Bergen_acr:B_mas_m_Bergen_acr_w{};
    class B_mas_m_Bergen_acr_c:B_mas_m_Bergen_acr_w{};

    class B_Carryall_khk:B_TacticalPack_blk
	{
        price = 12000;
	};
    class B_Carryall_taiga_F:B_Carryall_khk{};
    class B_Carryall_oli:B_Carryall_khk{};
    class B_Carryall_wdl_F:B_Carryall_khk{};
    class B_Carryall_cbr:B_Carryall_khk{};
    class B_Carryall_green_F:B_Carryall_khk{};
    class B_Carryall_ghex_F:B_Carryall_khk{};
    class B_Carryall_oucamo:B_Carryall_khk{};
    class B_Carryall_eaf_F:B_Carryall_khk{};
    class B_Carryall_ocamo:B_Carryall_khk{};
    class B_Carryall_mcamo:B_Carryall_khk{};

    class koilbp_2:B_Carryall_mcamo{}; class koilbender_2:B_Carryall_mcamo{}; class koilbp_11:B_Carryall_mcamo{}; class koilbp_12:B_Carryall_mcamo{}; class koilbp_3:B_Carryall_mcamo{}; class koilbp_8:B_Carryall_mcamo{}; class koilgraf_2:B_Carryall_mcamo{}; class koilgraf_3:B_Carryall_mcamo{}; class koilgucci:B_Carryall_mcamo{}; class koilbp_9:B_Carryall_mcamo{}; class kaelmario:B_Carryall_mcamo{}; class kaelmonty:B_Carryall_mcamo{}; class kaelmonty2:B_Carryall_mcamo{}; class koilbp_13:B_Carryall_mcamo{}; class koilpanda:B_Carryall_mcamo{}; class koilbp_15:B_Carryall_mcamo{}; class koilbp_16:B_Carryall_mcamo{}; class koilsponge_1:B_Carryall_mcamo{}; class koilbp_18:B_Carryall_mcamo{};
    class B_FieldPack_khk:B_TacticalPack_blk{}; class B_FieldPack_taiga_F:B_TacticalPack_blk{}; class B_FieldPack_oli:B_TacticalPack_blk{}; class B_FieldPack_green_F:B_TacticalPack_blk{}; class B_FieldPack_blk:B_TacticalPack_blk{}; class B_FieldPack_cbr:B_TacticalPack_blk{}; class B_FieldPack_ghex_F:B_TacticalPack_blk{}; class B_FieldPack_oucamo:B_TacticalPack_blk{}; class B_FieldPack_ocamo:B_TacticalPack_blk{};

    class B_Messenger_IDAP_F:B_TacticalPack_blk
	{
        price = 8000;
	};
    class B_Messenger_Black_F:B_Messenger_IDAP_F{}; class B_Messenger_Gray_F:B_Messenger_IDAP_F{}; class B_Messenger_Olive_F:B_Messenger_IDAP_F{}; class B_Messenger_Coyote_F:B_Messenger_IDAP_F{};

    class B_CivilianBackpack_01_Everyday_IDAP_F:B_Carryall_khk
	{
        price = 7000;
	};;
    class B_CivilianBackpack_01_Everyday_Black_F:B_TacticalPack_blk{}; class B_CivilianBackpack_01_Everyday_Vrana_F:B_TacticalPack_blk{}; class B_CivilianBackpack_01_Everyday_Astra_F:B_TacticalPack_blk{};
    class B_Kitbag_sgg:B_TacticalPack_blk{}; class B_Kitbag_tan:B_TacticalPack_blk{}; class B_Kitbag_cbr:B_TacticalPack_blk{}; class B_Kitbag_rgr:B_TacticalPack_blk{}; class B_Kitbag_mcamo:B_TacticalPack_blk{};
    class B_AssaultPack_Kerry:B_TacticalPack_blk{}; class B_AssaultPack_blk:B_TacticalPack_blk{}; class B_AssaultPack_dgtl:B_TacticalPack_blk{}; class B_AssaultPack_khk:B_TacticalPack_blk{}; class B_AssaultPack_tna_F:B_TacticalPack_blk{}; class B_AssaultPack_sgg:B_TacticalPack_blk{}; class B_AssaultPack_wdl_F:B_TacticalPack_blk{}; class B_AssaultPack_cbr:B_TacticalPack_blk{}; class B_AssaultPack_rgr:B_TacticalPack_blk{}; class B_AssaultPack_eaf_F:B_TacticalPack_blk{}; class B_AssaultPack_ocamo:B_TacticalPack_blk{};
    class B_mas_AssaultPack_wint:B_TacticalPack_blk{}; class B_mas_AssaultPack_black:B_TacticalPack_blk{}; class B_mas_AssaultPack_mul:B_TacticalPack_blk{}; class B_mas_AssaultPack_rng:B_TacticalPack_blk{}; class B_mas_AssaultPack_des:B_TacticalPack_blk{};
    class Skyline_Backpack_Chasse_Radio_01_F:B_TacticalPack_blk{}; class Skyline_Backpack_Chasse_01_F:B_TacticalPack_blk{}; class Skyline_Backpack_Sac_a_dos_04_F:B_TacticalPack_blk{}; class Skyline_Backpack_Sac_a_dos_03_F:B_TacticalPack_blk{}; class Skyline_Backpack_Sac_a_dos_02_F:B_TacticalPack_blk{}; class Skyline_Backpack_Sac_a_dos_01_F:B_TacticalPack_blk{};
    class Skyline_Backpack_Montagne_04_F:B_TacticalPack_blk{}; class Skyline_Backpack_Montagne_03_F:B_TacticalPack_blk{}; class Skyline_Backpack_Montagne_02_F:B_TacticalPack_blk{}; class Skyline_Backpack_Montagne_01_F:B_TacticalPack_blk{};

    class tf_rt1523g_bwmod:B_TacticalPack_blk
	{
        price = 9000;
	};
    class B_Respawn_Sleeping_bag_blue_F:tf_rt1523g_bwmod{}; class B_Patrol_Respawn_bag_F:tf_rt1523g_bwmod{}; class B_Respawn_TentDome_F:tf_rt1523g_bwmod{}; class B_Respawn_Sleeping_bag_brown_F:tf_rt1523g_bwmod{}; class B_Respawn_Sleeping_bag_F:tf_rt1523g_bwmod{}; class B_Respawn_TentA_F:tf_rt1523g_bwmod{};
    class Skyline_Backpack_Improvise_01_F:tf_rt1523g_bwmod{};

    //Наушники(ПНВ) ГРП
    class Headset_NV_GRP
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 25000;
    };
    class YG_Headset_NV:Headset_NV_GRP{};

    //Наушник(ПНВ) ГОС
    class Headset_NV_GOS
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class TRYK_Headset_NV:Headset_NV_GOS{};

	//Женские шмотки
    class Youmeiu
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class Youmeiu_s1:Youmeiu{}; class Youmeiu_s3:Youmeiu{}; class Youmeiu_s5:Youmeiu{}; class Youmeiu_s6:Youmeiu{};
    class Youmeiu_2:Youmeiu{}; class Youmeiu_2_s1:Youmeiu{}; class Youmeiu_2_s2:Youmeiu{}; class Youmeiu_2_s3:Youmeiu{}; class Youmeiu_2_s4:Youmeiu{}; class Youmeiu_2_s5:Youmeiu{}; class Youmeiu_2_s6:Youmeiu{};
    class Youmeiu_s2:Youmeiu{};
    class RRP_Uni3_rgb:Youmeiu{}; class RRP_Uni2:Youmeiu{}; class RRP_Uni:Youmeiu{};
    class TCGM_Survival_MTP_Bra:Youmeiu{}; class TCGM_CombatUniform_Sage_Bra:Youmeiu{}; class TCGM_Survival_TNA_Bra:Youmeiu{}; class TCGM_CombatUniform_M81_Bra:Youmeiu{};
    class TCGM_F_SoldierParamilitary:Youmeiu{}; class TCGM_F_SoldierParamilitary2:Youmeiu{}; class TCGM_F_SoldierParamilitary_RollUp:Youmeiu{}; class TCGM_F_SoldierParamilitary2_RollUp:Youmeiu{};
    class TCGM_f_Thong_Blk:Youmeiu{}; class TCGM_f_Thong_Flowers:Youmeiu{}; class TCGM_f_Thong_WGreen:Youmeiu{}; class TCGM_f_Thong_Blue:Youmeiu{}; class TCGM_f_Thong_Hearts:Youmeiu{}; class TCGM_f_Thong_Brown:Youmeiu{}; class TCGM_f_Thong_LGreen:Youmeiu{}; class TCGM_f_Thong_Poker:Youmeiu{}; class TCGM_f_Thong_Maya:Youmeiu{}; class TCGM_f_Thong_Leafs:Youmeiu{}; class TCGM_f_Thong_DGreen:Youmeiu{}; class TCGM_f_Thong_Wht:Youmeiu{};
    class TCGM_f_Swimsuit_Flowers:Youmeiu{}; class TCGM_f_Swimsuit_Hearts:Youmeiu{}; class TCGM_f_Swimsuit_Poker:Youmeiu{}; class TCGM_f_Swimsuit_Maya:Youmeiu{}; class TCGM_f_Swimsuit_Leafs:Youmeiu{};
    class EF_SHF_BK:Youmeiu{};
    class EF_SHF_BW:Youmeiu{};
    class EF_SHF_PK:Youmeiu{};

    // Женские волосы
    class Girlshair
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class d3s_CatEars_1:Girlshair{}; class d3s_CatEars_2:Girlshair{};
    class d3s_Hair_2a:Girlshair{}; class d3s_Hair_2b:Girlshair{}; class d3s_Hair_2c:Girlshair{}; class d3s_Hair_2d:Girlshair{}; class d3s_Hair_2e:Girlshair{}; class d3s_Hair_2f:Girlshair{}; class d3s_Hair_2g:Girlshair{}; class d3s_Hair_2h:Girlshair{}; class d3s_Hair_2i:Girlshair{}; class d3s_Hair_1a:Girlshair{}; class d3s_Hair_11a:Girlshair{}; class d3s_Hair_11b:Girlshair{}; class d3s_Hair_11c:Girlshair{}; class d3s_Hair_11d:Girlshair{}; class d3s_Hair_11e:Girlshair{}; class d3s_Hair_11f:Girlshair{}; class d3s_Hair_11g:Girlshair{}; class d3s_Hair_11j:Girlshair{}; class d3s_Hair_11i:Girlshair{}; class d3s_Hair_10a:Girlshair{}; class d3s_Hair_10b:Girlshair{}; class d3s_Hair_10c:Girlshair{}; class d3s_Hair_10d:Girlshair{}; class d3s_Hair_10e:Girlshair{}; class d3s_Hair_10f:Girlshair{}; class d3s_Hair_10g:Girlshair{}; class d3s_Hair_10h:Girlshair{}; class d3s_Hair_10i:Girlshair{}; class d3s_Hair_8a:Girlshair{}; class d3s_Hair_8b:Girlshair{}; class d3s_Hair_8c:Girlshair{}; class d3s_Hair_8d:Girlshair{}; class d3s_Hair_8e:Girlshair{}; class d3s_Hair_8f:Girlshair{}; class d3s_Hair_8g:Girlshair{}; class d3s_Hair_8h:Girlshair{};
    class d3s_Hair_8i:Girlshair{}; class d3s_Hair_12a:Girlshair{}; class d3s_Hair_12b:Girlshair{}; class d3s_Hair_12c:Girlshair{}; class d3s_Hair_12d:Girlshair{}; class d3s_Hair_12e:Girlshair{}; class d3s_Hair_12f:Girlshair{}; class d3s_Hair_12g:Girlshair{}; class d3s_Hair_12h:Girlshair{}; class d3s_Hair_12i:Girlshair{}; class d3s_Hair_3a:Girlshair{}; class d3s_Hair_3b:Girlshair{}; class d3s_Hair_3c:Girlshair{}; class d3s_Hair_3d:Girlshair{}; class d3s_Hair_3e:Girlshair{}; class d3s_Hair_3f:Girlshair{}; class d3s_Hair_3g:Girlshair{}; class d3s_Hair_3h:Girlshair{}; class d3s_Hair_3i:Girlshair{}; class d3s_Hair_7a:Girlshair{}; class d3s_Hair_7b:Girlshair{}; class d3s_Hair_7c:Girlshair{}; class d3s_Hair_7d:Girlshair{}; class d3s_Hair_7e:Girlshair{}; class d3s_Hair_7f:Girlshair{}; class d3s_Hair_7g:Girlshair{}; class d3s_Hair_7h:Girlshair{}; class d3s_Hair_7i:Girlshair{}; class d3s_Hair_13a:Girlshair{}; class d3s_Hair_13b:Girlshair{}; class d3s_Hair_13c:Girlshair{}; class d3s_Hair_13d:Girlshair{}; class d3s_Hair_13e:Girlshair{}; class d3s_Hair_13f:Girlshair{}; class d3s_Hair_13g:Girlshair{}; class d3s_Hair_13h:Girlshair{};
    class d3s_Hair_13i:Girlshair{}; class d3s_Hair_16a:Girlshair{}; class d3s_Hair_16b:Girlshair{}; class d3s_Hair_16c:Girlshair{}; class d3s_Hair_16d:Girlshair{}; class d3s_Hair_16e:Girlshair{}; class d3s_Hair_16f:Girlshair{};class d3s_Hair_16g:Girlshair{}; class d3s_Hair_16i:Girlshair{}; class d3s_Hair_6a:Girlshair{}; class d3s_Hair_6b:Girlshair{}; class d3s_Hair_6c:Girlshair{}; class d3s_Hair_6d:Girlshair{}; class d3s_Hair_6e:Girlshair{}; class d3s_Hair_6f:Girlshair{}; class d3s_Hair_6g:Girlshair{}; class d3s_Hair_6h:Girlshair{}; class d3s_Hair_6i:Girlshair{}; class d3s_Hair_4a:Girlshair{}; class d3s_Hair_4b:Girlshair{}; class d3s_Hair_4c:Girlshair{}; class d3s_Hair_4d:Girlshair{}; class d3s_Hair_4e:Girlshair{}; class d3s_Hair_4f:Girlshair{}; class d3s_Hair_4g:Girlshair{}; class d3s_Hair_4h:Girlshair{}; class d3s_Hair_4i:Girlshair{}; class d3s_Hair_5a:Girlshair{}; class d3s_Hair_5b:Girlshair{}; class d3s_Hair_5c:Girlshair{}; class d3s_Hair_5d:Girlshair{}; class d3s_Hair_5e:Girlshair{}; class d3s_Hair_5f:Girlshair{}; class d3s_Hair_5g:Girlshair{}; class d3s_Hair_5h:Girlshair{};
    class d3s_Hair_5i:Girlshair{}; class d3s_Hair_9a:Girlshair{}; class d3s_Hair_9b:Girlshair{}; class d3s_Hair_9c:Girlshair{}; class d3s_Hair_9d:Girlshair{}; class d3s_Hair_9e:Girlshair{}; class d3s_Hair_9f:Girlshair{}; class d3s_Hair_9g:Girlshair{}; class d3s_Hair_9h:Girlshair{}; class d3s_Hair_9i:Girlshair{}; class d3s_Hair_15a:Girlshair{}; class d3s_Hair_15b:Girlshair{}; class d3s_Hair_15c:Girlshair{}; class d3s_Hair_15d:Girlshair{}; class d3s_Hair_15e:Girlshair{}; class d3s_Hair_15f:Girlshair{}; class d3s_Hair_15g:Girlshair{}; class d3s_Hair_15h:Girlshair{}; class d3s_Hair_15i:Girlshair{}; class d3s_Hair_14a:Girlshair{}; class d3s_Hair_14b:Girlshair{}; class d3s_Hair_14c:Girlshair{}; class d3s_Hair_14d:Girlshair{}; class d3s_Hair_14e:Girlshair{}; class d3s_Hair_14f:Girlshair{}; class d3s_Hair_14g:Girlshair{}; class d3s_Hair_14h:Girlshair{}; class d3s_Hair_14i:Girlshair{};

	//Бороды
	class drrpg_english_mustache_black
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 3000;
	};
	class drrpg_english_mustache_grey:drrpg_english_mustache_black{};
	class drrpg_handlebar_n_puff_black:drrpg_english_mustache_black{};
	class drrpg_handlebar_n_puff:drrpg_english_mustache_black{};
	class drrpg_handlebar_n_puff_grey:drrpg_english_mustache_black{};
	class drrpg_yeard1:drrpg_english_mustache_black{};
	class drrpg_yeard:drrpg_english_mustache_black{};
	class drrpg_yeard3:drrpg_english_mustache_black{};
	class drrpg_muttonchops_black:drrpg_english_mustache_black{};
	class drrpg_muttonchops:drrpg_english_mustache_black{};
	class drrpg_muttonchops_grey:drrpg_english_mustache_black{};
	class drrpg_verdi:drrpg_english_mustache_black{};
	class TRYK_Beard_BK:drrpg_english_mustache_black{};
	class TRYK_Beard_BL:drrpg_english_mustache_black{};
	class TRYK_Beard:drrpg_english_mustache_black{};
	class TRYK_Beard_BW:drrpg_english_mustache_black{};
	class TRYK_Beard_Gr:drrpg_english_mustache_black{};
	class TRYK_Beard_BK2:drrpg_english_mustache_black{};
	class TRYK_Beard_BL2:drrpg_english_mustache_black{};
	class TRYK_Beard2:drrpg_english_mustache_black{};
	class TRYK_Beard_BW2:drrpg_english_mustache_black{};
	class TRYK_Beard_Gr2:drrpg_english_mustache_black{};
	class TRYK_Beard_BK3:drrpg_english_mustache_black{};
	class TRYK_Beard_BL3:drrpg_english_mustache_black{};
	class TRYK_Beard3:drrpg_english_mustache_black{};
	class TRYK_Beard_BW3:drrpg_english_mustache_black{};
	class TRYK_Beard_Gr3:drrpg_english_mustache_black{};
	class TRYK_Beard_BK4:drrpg_english_mustache_black{};
	class TRYK_Beard_BL4:drrpg_english_mustache_black{};
	class TRYK_Beard4:drrpg_english_mustache_black{};
	class TRYK_Beard_BW4:drrpg_english_mustache_black{};
	class TRYK_Beard_Gr4:drrpg_english_mustache_black{};
	class TRYK_SBeard_BK:drrpg_english_mustache_black{};
	class TRYK_SBeard_BL:drrpg_english_mustache_black{};
	class TRYK_SBeard:drrpg_english_mustache_black{};
	class TRYK_SBeard_BW:drrpg_english_mustache_black{};
	class TRYK_SBeard_Gr:drrpg_english_mustache_black{};
	class TRYK_SBeard_BK2:drrpg_english_mustache_black{};
	class TRYK_SBeard_BL2:drrpg_english_mustache_black{};
	class TRYK_SBeard2:drrpg_english_mustache_black{};
	class TRYK_SBeard_BW2:drrpg_english_mustache_black{};
	class TRYK_SBeard_Gr2:drrpg_english_mustache_black{};
	class TRYK_SBeard_BK3:drrpg_english_mustache_black{};
	class TRYK_SBeard_BL3:drrpg_english_mustache_black{};
	class TRYK_SBeard3:drrpg_english_mustache_black{};
	class TRYK_SBeard_BW3:drrpg_english_mustache_black{};
	class TRYK_SBeard_Gr3:drrpg_english_mustache_black{};
	class TRYK_SBeard_BK4:drrpg_english_mustache_black{};
	class TRYK_SBeard_BL4:drrpg_english_mustache_black{};
	class TRYK_SBeard4:drrpg_english_mustache_black{};
	class TRYK_SBeard_BW4:drrpg_english_mustache_black{};
	class TRYK_SBeard_Gr4:drrpg_english_mustache_black{};
	class TRYK_SBeard_BK5:drrpg_english_mustache_black{};
	class TRYK_SBeard_BL5:drrpg_english_mustache_black{};
	class TRYK_SBeard5:drrpg_english_mustache_black{};
	class TRYK_SBeard_BW5:drrpg_english_mustache_black{};
	class TRYK_SBeard_Gr5:drrpg_english_mustache_black{};
	class TRYK_SBeard_BK6:drrpg_english_mustache_black{};
	class TRYK_SBeard_BL6:drrpg_english_mustache_black{};
	class TRYK_SBeard6:drrpg_english_mustache_black{};
	class TRYK_SBeard_BW6:drrpg_english_mustache_black{};
	class TRYK_SBeard_Gr6:drrpg_english_mustache_black{};
    //Бронежилеты гражданские от 5к
    class civ_shopVest_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class accs_vest_001_a:civ_shopVest_1{};
    class accs_vest_002_a:civ_shopVest_1{};
    class accs_vest_003_a:civ_shopVest_1{};
    class EXT_Tac_Vest_1:civ_shopVest_1{};
    class EXT_Tac_Vest_2:civ_shopVest_1{};
    class EXT_Tac_Vest_3:civ_shopVest_1{};
    class EXT_Tac_Vest_4:civ_shopVest_1{};
    class EXT_Tac_Vest_5:civ_shopVest_1{};
    class EXT_Tac_Vest_6:civ_shopVest_1{};

    //Бронежилеты гражданские от 10к
    class civ_shopVest_2
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class d3s_vest_1:civ_shopVest_2{};
    class d3s_vest_1_a:civ_shopVest_2{};
    class d3s_vest_1_b:civ_shopVest_2{};
    class d3s_vest_1_c:civ_shopVest_2{};
    class d3s_vest_1_d:civ_shopVest_2{};
    class d3s_vest_1_e:civ_shopVest_2{};
    class d3s_vest_1_f:civ_shopVest_2{};
    class d3s_vest_1_g:civ_shopVest_2{};
    class d3s_vest_1_h:civ_shopVest_2{};
    class d3s_vest_1_i:civ_shopVest_2{};
    class d3s_vest_1_j:civ_shopVest_2{};
    class d3s_vest_1_k:civ_shopVest_2{};
    class d3s_vest_1_l:civ_shopVest_2{};
    class d3s_vest_1_m:civ_shopVest_2{};
    class d3s_vest_1_n:civ_shopVest_2{};
    class d3s_vest_1_o:civ_shopVest_2{};
    class d3s_vest_1_p:civ_shopVest_2{};
    class d3s_vest_1_q:civ_shopVest_2{};
    class d3s_vest_1_r:civ_shopVest_2{};
    class d3s_vest_1_s:civ_shopVest_2{};
    class d3s_vest_1_t:civ_shopVest_2{};
    class d3s_vest_1_u:civ_shopVest_2{};
    class d3s_vest_1_v:civ_shopVest_2{};
    class d3s_vest_1_w:civ_shopVest_2{};
    class d3s_vest_1_x:civ_shopVest_2{};
    class d3s_vest_1_y:civ_shopVest_2{};
    class d3s_vest_1_z:civ_shopVest_2{};

    //Бронежилеты гражданские от 15к
    class civ_shopVest_3
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 15000;
    };

    // Очки
    class G_Spectacles_Tinted
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 8000;
    };
    class G_Shades_Black:G_Spectacles_Tinted{};
    class G_Shades_Blue:G_Spectacles_Tinted{};
    class G_Tactical_Clear:G_Spectacles_Tinted{};
    class G_Tactical_Black:G_Spectacles_Tinted{};
    class G_Sport_Blackyellow:G_Spectacles_Tinted{};
    class G_Sport_BlackWhite:G_Spectacles_Tinted{};
    class G_Sport_Checkered:G_Spectacles_Tinted{};
    class G_Sport_Red:G_Spectacles_Tinted{};
    class G_Sport_Greenblack:G_Spectacles_Tinted{};
    class G_Sport_Blackred:G_Spectacles_Tinted{};
    class G_Shades_Red:G_Spectacles_Tinted{};
    class G_Shades_Green:G_Spectacles_Tinted{};
    class G_Goggles_VR:G_Spectacles_Tinted{};
    class G_Spectacles:G_Spectacles_Tinted{};
    class G_Squares:G_Spectacles_Tinted{};
    class G_Squares_Tinted:G_Spectacles_Tinted{};
    class G_EyeProtectors_Earpiece_F:G_Spectacles_Tinted{};
    class G_EyeProtectors_F:G_Spectacles_Tinted{};
    class G_Lady_Blue:G_Spectacles_Tinted{};
    class G_WirelessEarpiece_F:G_Spectacles_Tinted{};
	//
    class TRYK_H_ghillie_over_green:G_Spectacles_Tinted
	{
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "['Ghillie'] call inSS";
        condition_use_message = "";
        price = 8000;
	};
    class TRYK_H_ghillie_over:TRYK_H_ghillie_over_green{};
    // Маски очки шарфы
    class civ_Scarf
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 8000;
    };
    class d3s_p_eyes_000_a:civ_Scarf{}; class d3s_p_eyes_000_b:civ_Scarf{}; class d3s_p_eyes_000_c:civ_Scarf{}; class d3s_p_eyes_000_d:civ_Scarf{}; class d3s_p_eyes_000_e:civ_Scarf{}; class d3s_p_eyes_000_f:civ_Scarf{}; class d3s_p_eyes_000_g:civ_Scarf{}; class d3s_p_eyes_000_h:civ_Scarf{}; class d3s_p_eyes_000_i:civ_Scarf{}; class d3s_p_eyes_000_j:civ_Scarf{}; class d3s_p_eyes_000_k:civ_Scarf{}; class d3s_p_eyes_000_l:civ_Scarf{}; class d3s_p_eyes_000_m:civ_Scarf{}; class d3s_p_eyes_000_n:civ_Scarf{}; class d3s_p_eyes_000_o:civ_Scarf{}; class d3s_p_eyes_001:civ_Scarf{};
    class d3s_Glasses_scarf_a:civ_Scarf{}; class d3s_Glasses_scarf_b:civ_Scarf{}; class d3s_Glasses_scarf_c:civ_Scarf{};
    class d3s_Glasses_scarf1_a:civ_Scarf{}; class d3s_Glasses_scarf1_b:civ_Scarf{}; class d3s_Glasses_scarf1_c:civ_Scarf{}; class d3s_Glasses_scarf1_d:civ_Scarf{};
    class d3s_Glasses_scarf2_a:civ_Scarf{}; class d3s_Glasses_scarf2_b:civ_Scarf{}; class d3s_Glasses_scarf2_c:civ_Scarf{}; class d3s_Glasses_scarf2_d:civ_Scarf{}; class d3s_Glasses_scarf2_e:civ_Scarf{}; class d3s_Glasses_scarf2_f:civ_Scarf{};
	class d3s_CAP_p_head_000_a:civ_Scarf{};
    class d3s_CAP_p_head_000_b:civ_Scarf{};
    class d3s_CAP_p_head_000_c:civ_Scarf{};
    class d3s_CAP_p_head_000_d:civ_Scarf{};
    class d3s_CAP_p_head_000_e:civ_Scarf{};
    class d3s_CAP_p_head_000_f:civ_Scarf{};
    class d3s_CAP_p_head_000_g:civ_Scarf{};
    class d3s_CAP_p_head_000_h:civ_Scarf{};
    class d3s_CAP_p_head_000_i:civ_Scarf{};
    class d3s_CAP_p_head_000_j:civ_Scarf{};
    class d3s_CAP_p_head_000_k:civ_Scarf{};
    class d3s_CAP_p_head_000_l:civ_Scarf{};
    class d3s_CAP_p_head_000_m:civ_Scarf{};
    class d3s_CAP_p_head_000_n:civ_Scarf{};
    class d3s_CAP_p_head_000_o:civ_Scarf{};
    class d3s_CAP_p_head_000_p:civ_Scarf{};
    class d3s_CAP_p_head_000_q:civ_Scarf{};
    class d3s_CAP_p_head_000_r:civ_Scarf{};
    class d3s_CAP_p_head_000_s:civ_Scarf{};
    class d3s_CAP_p_head_000_t:civ_Scarf{};

    //Одежда Эллиты до 20к
    class vvv_traje_ejecutivo_1
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 20000;
    };
    class vvv_character_agente_47:vvv_traje_ejecutivo_1{}; class vvv_character_agente_473:vvv_traje_ejecutivo_1{}; class vvv_character_agente_474:vvv_traje_ejecutivo_1{}; class vvv_character_agente_475:vvv_traje_ejecutivo_1{};
    class vvv_character_funcionario_1:vvv_traje_ejecutivo_1{};
    class KAEL_SUITS_BR_F24:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F25:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F16:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F17:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F18:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F19:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F20:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F21:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F22:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F23:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F15:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F29:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F30:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F31:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F32:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F33:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F34:vvv_traje_ejecutivo_1{}; class KAEL_SUITS_BR_F35:vvv_traje_ejecutivo_1{};
    class EF_suit_1:vvv_traje_ejecutivo_1{}; class EF_suit_3:vvv_traje_ejecutivo_1{}; class EF_suit_4:vvv_traje_ejecutivo_1{}; class EF_suit_5:vvv_traje_ejecutivo_1{}; class EF_suit_6:vvv_traje_ejecutivo_1{};
    class U_C_FormalSuit_01_black_F:vvv_traje_ejecutivo_1{}; class U_C_FormalSuit_01_khaki_F:vvv_traje_ejecutivo_1{}; class U_C_FormalSuit_01_tshirt_black_F:vvv_traje_ejecutivo_1{}; class U_C_FormalSuit_01_tshirt_gray_F:vvv_traje_ejecutivo_1{}; class U_C_FormalSuit_01_blue_F:vvv_traje_ejecutivo_1{}; class U_C_FormalSuit_01_gray_F:vvv_traje_ejecutivo_1{};
    class TRYK_SUITS_BR_F:vvv_traje_ejecutivo_1{}; class CONST_SUITS_BLK_F:vvv_traje_ejecutivo_1{}; class TRYK_SUITS_BLK_F:vvv_traje_ejecutivo_1{};
    class OfficialSuit_Black_R:vvv_traje_ejecutivo_1{}; class OfficialSuit_Black:vvv_traje_ejecutivo_1{}; class Business_Suit_S:vvv_traje_ejecutivo_1{}; class Portfolio_black_S:vvv_traje_ejecutivo_1{}; class Portfolio_golden_S:vvv_traje_ejecutivo_1{}; class Portfolio_green_S:vvv_traje_ejecutivo_1{}; class Portfolio_marine_S:vvv_traje_ejecutivo_1{}; class Portfolio_rad_S:vvv_traje_ejecutivo_1{}; class lacoste_abstraction_S:vvv_traje_ejecutivo_1{}; class lacoste_white_skin_S:vvv_traje_ejecutivo_1{}; class lacoste_green_S:vvv_traje_ejecutivo_1{}; class lacoste_nato_white_S:vvv_traje_ejecutivo_1{}; class lacoste_nato_S:vvv_traje_ejecutivo_1{}; class lacoste_brown_S:vvv_traje_ejecutivo_1{}; class lacoste_brown_skin_S:vvv_traje_ejecutivo_1{}; class lacoste_red_S:vvv_traje_ejecutivo_1{}; class lacoste_blue_S:vvv_traje_ejecutivo_1{}; class lacoste_violet_S:vvv_traje_ejecutivo_1{}; class lacoste_black_S:vvv_traje_ejecutivo_1{}; class lacoste_black_skin_S:vvv_traje_ejecutivo_1{}; class d3s_backpack:vvv_traje_ejecutivo_1{}; class d3s_backpack_a:vvv_traje_ejecutivo_1{}; class d3s_backpack_b:vvv_traje_ejecutivo_1{}; class d3s_backpack_c:vvv_traje_ejecutivo_1{};  class d3s_backpack_d:vvv_traje_ejecutivo_1{}; class d3s_backpack_e:vvv_traje_ejecutivo_1{}; class d3s_backpack_f:vvv_traje_ejecutivo_1{}; class d3s_backpack_g:vvv_traje_ejecutivo_1{}; class d3s_backpack_h:vvv_traje_ejecutivo_1{}; class d3s_backpack_i:vvv_traje_ejecutivo_1{}; class d3s_backpack_j:vvv_traje_ejecutivo_1{}; class d3s_backpack_k:vvv_traje_ejecutivo_1{}; class d3s_backpack_l:vvv_traje_ejecutivo_1{};
    class RRP_Clothing_kurtka1:vvv_traje_ejecutivo_1{}; class RRP_Ridus_Jacket_ANIM:vvv_traje_ejecutivo_1{}; class RRP_Ridus_Jacket_BLK:vvv_traje_ejecutivo_1{}; class RRP_Ridus_Jacket_BLUE:vvv_traje_ejecutivo_1{}; class RRP_Ridus_Jacket_BROWN:vvv_traje_ejecutivo_1{}; class RRP_Ridus_Jacket_GREEN:vvv_traje_ejecutivo_1{}; class RRP_Ridus_Jacket_KUB:vvv_traje_ejecutivo_1{};; class RRP_Ridus_Jacket_RED:vvv_traje_ejecutivo_1{}; class RRP_Clothing_Style1:vvv_traje_ejecutivo_1{}; class RRP_Clothing_Style2:vvv_traje_ejecutivo_1{}; class RRP_Clothing_Style3:vvv_traje_ejecutivo_1{}; class RRP_Clothing_Style4:vvv_traje_ejecutivo_1{}; class RRP_Clothing_Style5:vvv_traje_ejecutivo_1{}; class RRP_Clothing_Style6:vvv_traje_ejecutivo_1{}; class RRP_Clothing_Style7:vvv_traje_ejecutivo_1{}; class RRP_Bomber_Jacket1:vvv_traje_ejecutivo_1{};


    //Одежда Средняя до 10к
    class civ_everage
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 10000;
    };
    class RRP_Franklin1:civ_everage{}; class dr_cowboy_whiteOutfit:civ_everage{}; class dr_cowboy_beigeOutfit:civ_everage{}; class dr_cowboy_blackOutfit:civ_everage{}; class dr_cowboy_blueOutfit:civ_everage{}; class dr_cowboy_brownOutfit:civ_everage{}; class dr_cowboy_greenOutfit:civ_everage{}; class dr_cowboy_pinkOutfit:civ_everage{}; class dr_cowboy_redOutfit:civ_everage{}; class RRP_Clothing_fatsuit2:civ_everage{}; class Shoulder_2_S:civ_everage{}; class Shoulder_1_S:civ_everage{}; class Shoulder_3_S:civ_everage{}; class d3s_Claire:civ_everage{}; class Biker_Bag_S:civ_everage{}; class d3s_CAP_beanie:civ_everage{}; class d3s_CAP_beanie_1:civ_everage{}; class d3s_CAP_beanie_1_a:civ_everage{}; class d3s_CAP_beanie_1_b:civ_everage{}; class d3s_CAP_beanie_1_c:civ_everage{}; class d3s_CAP_beanie_1_d:civ_everage{}; class d3s_CAP_beanie_1_e:civ_everage{}; class d3s_CAP_beanie_1_f:civ_everage{}; class d3s_CAP_beanie_1_g:civ_everage{}; class d3s_CAP_beanie_1_h:civ_everage{}; class d3s_CAP_beanie_1_i:civ_everage{}; class d3s_CAP_beanie_1_j:civ_everage{}; class d3s_CAP_beanie_1_k:civ_everage{}; class d3s_CAP_beanie_1_l:civ_everage{}; class d3s_CAP_beanie_1_m:civ_everage{};
    class d3s_CAP_beanie_2_a:civ_everage{}; class d3s_CAP_beanie_2_b:civ_everage{}; class d3s_CAP_beanie_2_c:civ_everage{}; class d3s_CAP_beanie_2_d:civ_everage{}; class d3s_CAP_beanie_2_e:civ_everage{}; class d3s_CAP_beanie_2_f:civ_everage{}; class d3s_CAP_beanie_2_g:civ_everage{}; class d3s_CAP_beanie_2_h:civ_everage{}; class d3s_CAP_beanie_2_i:civ_everage{}; class d3s_CAP_beanie_2_j:civ_everage{}; class d3s_CAP_beanie_2_k:civ_everage{}; class d3s_CAP_beanie_2_l:civ_everage{}; class d3s_CAP_beanie_2_m:civ_everage{}; class d3s_CAP_beanie_2_n:civ_everage{}; class d3s_CAP_beanie_2_o:civ_everage{};
    class RRP_Clothing_tolstovka_1:civ_everage{}; class RRP_Clothing_tolstovka_2:civ_everage{}; class RRP_Clothing_tolstovka_3:civ_everage{}; class RRP_Clothing_tolstovka_4:civ_everage{}; class RRP_Clothing_tolstovka_5:civ_everage{}; class RRP_Clothing_tolstovka_6:civ_everage{};

	//Одежда Обычная до 5к
    class U_C_Poloshirt_tricolour
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class U_C_Poloshirt_blue:U_C_Poloshirt_tricolour{}; class U_C_Poloshirt_stripped:U_C_Poloshirt_tricolour{}; class U_C_Poloshirt_salmon:U_C_Poloshirt_tricolour{}; class U_C_Poloshirt_burgundy:U_C_Poloshirt_tricolour{}; class U_C_Poloshirt_redwhite:U_C_Poloshirt_tricolour{};
    class A3L_Dude_Outfit:U_C_Poloshirt_tricolour{}; class A3L_Farmer_Outfit:U_C_Poloshirt_tricolour{};
    class U_C_man_sport_3_F:U_C_Poloshirt_tricolour{}; class U_C_man_sport_1_F:U_C_Poloshirt_tricolour{}; class U_C_man_sport_2_F:U_C_Poloshirt_tricolour{};
    class A3L_Worker_Outfit:U_C_Poloshirt_tricolour{};
    class U_C_IDAP_Man_Tee_F:U_C_Poloshirt_tricolour{}; class U_C_IDAP_Man_TeeShorts_F:U_C_Poloshirt_tricolour{}; class U_C_IDAP_Man_shorts_F:U_C_Poloshirt_tricolour{}; class U_C_IDAP_Man_casual_F:U_C_Poloshirt_tricolour{}; class U_C_IDAP_Man_Jeans_F:U_C_Poloshirt_tricolour{}; class U_C_IDAP_Man_cargo_F:U_C_Poloshirt_tricolour{};
    class U_C_Poor_1:U_C_Poloshirt_tricolour{};
    class U_I_G_Story_Protagonist_F:U_C_Poloshirt_tricolour{};
    class U_C_Man_casual_1_F:U_C_Poloshirt_tricolour{}; class U_C_Man_casual_2_F:U_C_Poloshirt_tricolour{};
    class U_C_ArtTShirt_01_v5_F:U_C_Poloshirt_tricolour{};
    class U_C_Man_casual_3_F:U_C_Poloshirt_tricolour{};
    class U_C_ArtTShirt_01_v2_F:U_C_Poloshirt_tricolour{}; class U_C_ArtTShirt_01_v4_F:U_C_Poloshirt_tricolour{}; class U_C_ArtTShirt_01_v6_F:U_C_Poloshirt_tricolour{}; class U_C_ArtTShirt_01_v3_F:U_C_Poloshirt_tricolour{}; class U_C_ArtTShirt_01_v1_F:U_C_Poloshirt_tricolour{};
    class U_BG_Guerilla3_1:U_C_Poloshirt_tricolour{}; class U_BG_Guerilla2_2:U_C_Poloshirt_tricolour{}; class U_BG_Guerilla2_1:U_C_Poloshirt_tricolour{}; class U_BG_Guerilla2_3:U_C_Poloshirt_tricolour{};
    class U_C_HunterBody_grn:U_C_Poloshirt_tricolour{};
    class U_C_Uniform_Scientist_02_formal_F:U_C_Poloshirt_tricolour{};
    class U_C_Mechanic_01_F:U_C_Poloshirt_tricolour{};
    class U_Marshal:U_C_Poloshirt_tricolour{};
    class U_I_L_Uniform_01_tshirt_black_F:U_C_Poloshirt_tricolour{}; class U_I_L_Uniform_01_tshirt_sport_F:U_C_Poloshirt_tricolour{}; class U_I_L_Uniform_01_tshirt_skull_F:U_C_Poloshirt_tricolour{}; class U_I_L_Uniform_01_tshirt_olive_F:U_C_Poloshirt_tricolour{};
    class U_C_E_LooterJacket_01_F:U_C_Poloshirt_tricolour{};
    class U_C_Uniform_Farmer_01_F:U_C_Poloshirt_tricolour{};
    class U_C_Journalist:U_C_Poloshirt_tricolour{};
    class U_B_survival_uniform:U_C_Poloshirt_tricolour{};
    class U_I_L_Uniform_01_deserter_F:U_C_Poloshirt_tricolour{};
    class U_I_C_Soldier_Bandit_2_F:U_C_Poloshirt_tricolour{}; class U_I_C_Soldier_Bandit_3_F:U_C_Poloshirt_tricolour{}; class U_I_C_Soldier_Bandit_1_F:U_C_Poloshirt_tricolour{}; class U_I_C_Soldier_Bandit_4_F:U_C_Poloshirt_tricolour{}; class U_I_C_Soldier_Bandit_5_F:U_C_Poloshirt_tricolour{};
    class U_C_Man_casual_6_F:U_C_Poloshirt_tricolour{}; class U_C_Man_casual_5_F:U_C_Poloshirt_tricolour{}; class U_C_Man_casual_4_F:U_C_Poloshirt_tricolour{};
    class U_OrestesBody:U_C_Poloshirt_tricolour{}; class U_Competitor:U_C_Poloshirt_tricolour{};
    class U_Tank_green_F:U_C_Poloshirt_tricolour{};
    class U_C_ConstructionCoverall_Black_F:U_C_Poloshirt_tricolour{}; class U_C_ConstructionCoverall_Blue_F:U_C_Poloshirt_tricolour{}; class U_C_ConstructionCoverall_Red_F:U_C_Poloshirt_tricolour{}; class U_C_ConstructionCoverall_Vrana_F:U_C_Poloshirt_tricolour{};
    class U_B_CTRG_Soldier_2_Arid_F:U_C_Poloshirt_tricolour{}; class U_B_CTRG_Soldier_2_F:U_C_Poloshirt_tricolour{}; class U_B_CTRG_Soldier_Arid_F:U_C_Poloshirt_tricolour{}; class U_B_CTRG_Soldier_3_Arid_F:U_C_Poloshirt_tricolour{}; class U_B_CTRG_Soldier_3_F:U_C_Poloshirt_tricolour{}; class U_B_CTRG_Soldier_F:U_C_Poloshirt_tricolour{};
    class U_B_CTRG_2:U_C_Poloshirt_tricolour{};
    class rds_uniform_Woodlander4:U_C_Poloshirt_tricolour{}; class rds_uniform_Woodlander2:U_C_Poloshirt_tricolour{}; class rds_uniform_Woodlander1:U_C_Poloshirt_tricolour{};
    class A3LWolfShirt:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtVolcom:U_C_Poloshirt_tricolour{}; class A3L_CivShirtVolcomMonster:U_C_Poloshirt_tricolour{}; class A3L_CivShirtVolcomLogo:U_C_Poloshirt_tricolour{};
    class rds_uniform_Villager4:U_C_Poloshirt_tricolour{}; class rds_uniform_Villager3:U_C_Poloshirt_tricolour{}; class rds_uniform_Villager2:U_C_Poloshirt_tricolour{}; class rds_uniform_Villager1:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtVans:U_C_Poloshirt_tricolour{}; class A3L_CivShirtVans2:U_C_Poloshirt_tricolour{};
    class Skyline_Character_U_SecouristeB_01_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_SecouristeB_02_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_SecouristeA_01_F:U_C_Poloshirt_tricolour{};
    class TRYK_U_B_Denim_T_WH:U_C_Poloshirt_tricolour{}; class TRYK_U_B_Denim_T_BK:U_C_Poloshirt_tricolour{}; class TRYK_U_B_Denim_T_BG_WH:U_C_Poloshirt_tricolour{}; class TRYK_U_B_Denim_T_BG_BK:U_C_Poloshirt_tricolour{};
    class TRYK_U_B_BLK_T_WH:U_C_Poloshirt_tricolour{}; class TRYK_U_B_RED_T_BR:U_C_Poloshirt_tricolour{}; class TRYK_U_B_BLK_T_BK:U_C_Poloshirt_tricolour{};
    class TRYK_U_denim_jersey_blu:U_C_Poloshirt_tricolour{};
    class TRYK_U_denim_hood_nc:U_C_Poloshirt_tricolour{}; class TRYK_U_denim_hood_blk:U_C_Poloshirt_tricolour{}; class TRYK_U_denim_hood_mc:U_C_Poloshirt_tricolour{}; class TRYK_U_denim_hood_3c:U_C_Poloshirt_tricolour{};
    class A3LTigerShirt:U_C_Poloshirt_tricolour{};
    class Skyline_Character_U_Chasseur_04_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_Chasseur_03_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_Chasseur_02_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_Chasseur_01_F:U_C_Poloshirt_tricolour{};
    class U_G_Academie:U_C_Poloshirt_tricolour{};
    class cg_upyours1:U_C_Poloshirt_tricolour{}; class cg_turtles1:U_C_Poloshirt_tricolour{}; class cg_stoned1:U_C_Poloshirt_tricolour{}; class cg_shark1:U_C_Poloshirt_tricolour{}; class cg_rageface1:U_C_Poloshirt_tricolour{}; class cg_rastaciv:U_C_Poloshirt_tricolour{}; class cg_pika1:U_C_Poloshirt_tricolour{};
    class cg_peanut1:U_C_Poloshirt_tricolour{}; class cg_leppy1:U_C_Poloshirt_tricolour{}; class cg_joker1:U_C_Poloshirt_tricolour{}; class cg_jason1:U_C_Poloshirt_tricolour{}; class cg_illuminati1:U_C_Poloshirt_tricolour{}; class cg_iamstupid1:U_C_Poloshirt_tricolour{}; class cg_homer1:U_C_Poloshirt_tricolour{}; class cg_herpderp1:U_C_Poloshirt_tricolour{}; class cg_gameover1:U_C_Poloshirt_tricolour{}; class cg_fightclub1:U_C_Poloshirt_tricolour{}; class cg_ferrari1:U_C_Poloshirt_tricolour{}; class cg_evolution1:U_C_Poloshirt_tricolour{}; class cg_et1:U_C_Poloshirt_tricolour{}; class cg_deeznuts1:U_C_Poloshirt_tricolour{}; class cg_csgo1:U_C_Poloshirt_tricolour{}; class cg_condoms1:U_C_Poloshirt_tricolour{}; class cg_chickens1:U_C_Poloshirt_tricolour{}; class cg_bipolar1:U_C_Poloshirt_tricolour{}; class cg_bendozlia3:U_C_Poloshirt_tricolour{}; class cg_bb1:U_C_Poloshirt_tricolour{}; class cg_awesome1:U_C_Poloshirt_tricolour{};
    class Skyline_Character_U_CivilE_07_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilE_06_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilE_05_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilE_04_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilE_03_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilE_02_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilE_01_F:U_C_Poloshirt_tricolour{};
    class rds_uniform_schoolteacher:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtRelationships:U_C_Poloshirt_tricolour{}; class A3L_Badoodlenoodleshirt:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtProbe:U_C_Poloshirt_tricolour{};
    class YlGnGy_uni:U_C_Poloshirt_tricolour{}; class YlBlBr_uni:U_C_Poloshirt_tricolour{}; class WhBlBr_uni:U_C_Poloshirt_tricolour{};
    class A3LCivPoloUS:U_C_Poloshirt_tricolour{}; class A3LCivPoloUK:U_C_Poloshirt_tricolour{};
    class sohoku_uni:U_C_Poloshirt_tricolour{}; class RdGyBr_uni:U_C_Poloshirt_tricolour{}; class RdGnGy_uni:U_C_Poloshirt_tricolour{}; class RdBlBr_uni:U_C_Poloshirt_tricolour{}; class PkGyBr_uni:U_C_Poloshirt_tricolour{}; class PkGnGy_uni:U_C_Poloshirt_tricolour{}; class OrGyBr_uni:U_C_Poloshirt_tricolour{};
    class MotherTrucker_uni:U_C_Poloshirt_tricolour{};
    class GyBlBr_uni:U_C_Poloshirt_tricolour{};
    class poloranger_uni:U_C_Poloshirt_tricolour{};
    class A3LCivPoloGreenOrange:U_C_Poloshirt_tricolour{}; class A3LCivPoloGreenGrey:U_C_Poloshirt_tricolour{}; class A3LCivPoloGreenGreen:U_C_Poloshirt_tricolour{}; class A3LCivPoloGreenBlack:U_C_Poloshirt_tricolour{};
    class GnGyBr_uni:U_C_Poloshirt_tricolour{};
    class checkered_uni:U_C_Poloshirt_tricolour{};
    class U_C_Polar_Kaki:U_C_Poloshirt_tricolour{}; class U_C_Polar_Brun:U_C_Poloshirt_tricolour{};
    class A3LPikaShirt:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtOhBoy:U_C_Poloshirt_tricolour{}; class A3L_CivShirtThanksObama:U_C_Poloshirt_tricolour{}; class A3L_CivShirtNikeFeet:U_C_Poloshirt_tricolour{}; class A3L_CivShirtNikeDoIt:U_C_Poloshirt_tricolour{}; class A3L_CivShirtNikeDoIt2:U_C_Poloshirt_tricolour{}; class A3L_CivShirtNikeCamo:U_C_Poloshirt_tricolour{};
    class A3L_Lacoste_T:U_C_Poloshirt_tricolour{}; class A3L_Lacoste_S:U_C_Poloshirt_tricolour{}; class A3L_Lacoste_G:U_C_Poloshirt_tricolour{}; class A3L_Lacoste_C:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtKeepCalm:U_C_Poloshirt_tricolour{};
    class U_C_Hoodie_Rouge:U_C_Poloshirt_tricolour{}; class U_C_Hoodie_Jaune:U_C_Poloshirt_tricolour{}; class U_C_Hoodie_Brun:U_C_Poloshirt_tricolour{}; class U_C_Hoodie_Bleu:U_C_Poloshirt_tricolour{}; class U_C_Hoodie_Beige:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtHollister:U_C_Poloshirt_tricolour{}; class A3L_CivShirtGrumpyCat:U_C_Poloshirt_tricolour{}; class A3L_CivShirtGetHigh:U_C_Poloshirt_tricolour{};
    class EF_HM_LPBL2:U_C_Poloshirt_tricolour{}; class EF_HM_LPB2:U_C_Poloshirt_tricolour{}; class EF_HM_LPBW2:U_C_Poloshirt_tricolour{}; class EF_HM_LPBR2:U_C_Poloshirt_tricolour{}; class EF_HM_LPBP2:U_C_Poloshirt_tricolour{}; class EF_HM_LPBPS2:U_C_Poloshirt_tricolour{}; class EF_HM_LPBL:U_C_Poloshirt_tricolour{}; class EF_HM_LPB:U_C_Poloshirt_tricolour{}; class EF_HM_LPBW:U_C_Poloshirt_tricolour{}; class EF_HM_LPBR:U_C_Poloshirt_tricolour{}; class EF_HM_LPBP:U_C_Poloshirt_tricolour{}; class EF_HM_LPBPS:U_C_Poloshirt_tricolour{};
    class EF_M_jkt32:U_C_Poloshirt_tricolour{}; class EF_M_jkt42:U_C_Poloshirt_tricolour{}; class EF_M_jkt3:U_C_Poloshirt_tricolour{}; class EF_M_jkt4:U_C_Poloshirt_tricolour{}; class EF_M_jkt2_4:U_C_Poloshirt_tricolour{}; class EF_M_jkt32_2:U_C_Poloshirt_tricolour{}; class EF_M_jkt1_3:U_C_Poloshirt_tricolour{}; class EF_M_jkt2_32:U_C_Poloshirt_tricolour{}; class EF_M_jkt2_3:U_C_Poloshirt_tricolour{}; class EF_M_jkt1_2:U_C_Poloshirt_tricolour{}; class EF_M_jkt2_22:U_C_Poloshirt_tricolour{}; class EF_M_jkt2_2:U_C_Poloshirt_tricolour{}; class EF_M_jkt1:U_C_Poloshirt_tricolour{}; class EF_M_jkt22:U_C_Poloshirt_tricolour{}; class EF_M_jkt2:U_C_Poloshirt_tricolour{};
    class EF_MKJKT2:U_C_Poloshirt_tricolour{}; class EF_MKJKT:U_C_Poloshirt_tricolour{};
    class EF_HMARMY_2:U_C_Poloshirt_tricolour{}; class EF_HMARMY_1:U_C_Poloshirt_tricolour{};
    class EF_HM_PP2:U_C_Poloshirt_tricolour{}; class EF_HM_SG2:U_C_Poloshirt_tricolour{}; class EF_HM_OD2:U_C_Poloshirt_tricolour{}; class EF_HM_BL2:U_C_Poloshirt_tricolour{}; class EF_HM_B2:U_C_Poloshirt_tricolour{}; class EF_HM_PP1:U_C_Poloshirt_tricolour{}; class EF_HM_SG1:U_C_Poloshirt_tricolour{}; class EF_HM_OD1:U_C_Poloshirt_tricolour{}; class EF_HM_BL1:U_C_Poloshirt_tricolour{}; class EF_HM_B1:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtDJ:U_C_Poloshirt_tricolour{}; class A3L_CivShirtDiamond:U_C_Poloshirt_tricolour{}; class A3LCloudShirt:U_C_Poloshirt_tricolour{};
    class rds_uniform_citizen4:U_C_Poloshirt_tricolour{}; class rds_uniform_citizen3:U_C_Poloshirt_tricolour{}; class rds_uniform_citizen2:U_C_Poloshirt_tricolour{}; class rds_uniform_citizen1:U_C_Poloshirt_tricolour{};
    class A3LCatShirt:U_C_Poloshirt_tricolour{}; class A3LCokeShirt:U_C_Poloshirt_tricolour{};
    class Skyline_Character_U_CivilC_07_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilC_06_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilC_05_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilC_04_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilC_03_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilC_01_F:U_C_Poloshirt_tricolour{}; class Skyline_Character_U_CivilC_02_F:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtBillabong2:U_C_Poloshirt_tricolour{}; class A3L_CivShirtBillabong:U_C_Poloshirt_tricolour{}; class A3L_CivShirtAnotherCat:U_C_Poloshirt_tricolour{}; class A3L_CivShirtAdidas:U_C_Poloshirt_tricolour{};
    class vvv_character_rock1:U_C_Poloshirt_tricolour{}; class vvv_character_rock2:U_C_Poloshirt_tricolour{}; class vvv_character_rock3:U_C_Poloshirt_tricolour{}; class vvv_character_rock4:U_C_Poloshirt_tricolour{};
    class vvv_traje_jackoy:U_C_Poloshirt_tricolour{}; class vvv_traje_jackoy2:U_C_Poloshirt_tricolour{}; class vvv_traje_jackoy3:U_C_Poloshirt_tricolour{}; class vvv_traje_jackoy4:U_C_Poloshirt_tricolour{}; class vvv_traje_jackoy5:U_C_Poloshirt_tricolour{}; class vvv_traje_jackoy6:U_C_Poloshirt_tricolour{}; class vvv_traje_jackoy7:U_C_Poloshirt_tricolour{}; class vvv_traje_jackoy8:U_C_Poloshirt_tricolour{};
    class vvv_character_funcionario_2:U_C_Poloshirt_tricolour{};
    class U_O_R_Gorka_01_black_F:U_C_Poloshirt_tricolour{};
    class U_C_Uniform_Scientist_01_formal_F:U_C_Poloshirt_tricolour{}; class U_C_Uniform_Scientist_01_F:U_C_Poloshirt_tricolour{}; class U_C_Uniform_Scientist_02_F:U_C_Poloshirt_tricolour{};
    class U_IG_Guerilla2_2:U_C_Poloshirt_tricolour{}; class U_IG_Guerilla3_1:U_C_Poloshirt_tricolour{}; class U_IG_Guerilla2_3:U_C_Poloshirt_tricolour{};
    class U_C_Poor_2:U_C_Poloshirt_tricolour{};
    class rds_uniform_assistant:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtAdidasMake:U_C_Poloshirt_tricolour{}; class A3LHandShirt:U_C_Poloshirt_tricolour{};
    class A3L_CivShirtAdidas_r:U_C_Poloshirt_tricolour{};
    class RRP_Clothing_Edate:U_C_Poloshirt_tricolour{}; class RRP_Clothing_HMT:U_C_Poloshirt_tricolour{}; class RRP_Clothing_Chimps:U_C_Poloshirt_tricolour{};
    class AG_CapHair:U_C_Poloshirt_tricolour{}; class AG_DreadLocks:U_C_Poloshirt_tricolour{}; class BeanieHat_red_S:U_C_Poloshirt_tricolour{}; class BeanieHat_pink_S:U_C_Poloshirt_tricolour{}; class BeanieHat_grey_S:U_C_Poloshirt_tricolour{}; class BeanieHat_green_S:U_C_Poloshirt_tricolour{}; class BeanieHat_brown_S:U_C_Poloshirt_tricolour{}; class BeanieHat_blue_S:U_C_Poloshirt_tricolour{}; class BeanieHat_black_S:U_C_Poloshirt_tricolour{}; class BeanieHat_beige_S:U_C_Poloshirt_tricolour{}; class Dreadlocks_S:U_C_Poloshirt_tricolour{}; class Dreadlocks_2_S:U_C_Poloshirt_tricolour{}; class Dreadlocks_3_S:U_C_Poloshirt_tricolour{}; class Dreadlocks_4_S:U_C_Poloshirt_tricolour{}; class Dreadlocks_5_S:U_C_Poloshirt_tricolour{};


    class d3s_CAP_berd_006_u_n
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
	class d3s_CAP_berd_006_u_l: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_j: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_i: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_h: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_g: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_f: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_e: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_d: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_c: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_b: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_a: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_s: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_n: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_k: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_j: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_i: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_g: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_f: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_e: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_d: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_c: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_b: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_004_u_a: d3s_CAP_berd_006_u_n{};
	class d3s_CAP_berd_006_u_k: d3s_CAP_berd_006_u_n{};

	//Cigane
    class RRPClothing_Uniform_Cigane_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class RRPClothing_Uniform_Cigane_02:RRPClothing_Uniform_Cigane_01{};
    class RRPClothing_Uniform_Cigane_03:RRPClothing_Uniform_Cigane_01{};
    class RRPClothing_Uniform_Cigane_04:RRPClothing_Uniform_Cigane_01{};
    class RRPClothing_Uniform_Cigane_05:RRPClothing_Uniform_Cigane_01{};

	class RRPClothing_Vest_Cigane_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class RRPClothing_Vest_Cigane_02:RRPClothing_Vest_Cigane_01{};
    class RRPClothing_Vest_Cigane_03:RRPClothing_Vest_Cigane_01{};

	class RRPClothing_Headgear_Cigane_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class RRPClothing_Headgear_Cigane_02:RRPClothing_Headgear_Cigane_01{};
    class RRPClothing_Headgear_Cigane_03:RRPClothing_Headgear_Cigane_01{};

	class RRPClothing_Backpack_Cigane_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class RRPClothing_Backpack_Cigane_02:RRPClothing_Backpack_Cigane_01{};
	//Sector
    class RRPClothing_uniform_1_Sector
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class RRPClothing_uniform_2_Sector:RRPClothing_uniform_1_Sector{};
    class RRPClothing_uniform_3_Sector:RRPClothing_uniform_1_Sector{};

	class RRPClothing_vest_1_Sector
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class RRPClothing_vest_2_Sector:RRPClothing_vest_1_Sector{};
    class RRPClothing_vest_3_Sector:RRPClothing_vest_1_Sector{};

	class RRPClothing_cap_1_Sector
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class RRPClothing_cap_2_Sector:RRPClothing_cap_1_Sector{};
    class RRPClothing_cap_3_Sector:RRPClothing_cap_1_Sector{};//Работает

	class RRPClothing_backpack_1_Sector
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class RRPClothing_backpack_2_Sector:RRPClothing_backpack_1_Sector{};
    class RRPClothing_backpack_3_Sector:RRPClothing_backpack_1_Sector{};
	
	class RRPClothing_Glasses_1_Sector
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 8000;
    };
    class RRPClothing_Glasses_2_Sector:RRPClothing_Glasses_1_Sector{};
    class RRPClothing_Glasses_3_Sector:RRPClothing_Glasses_1_Sector{};
	//
    // Sumiyoshi
    class RRP_Uniform_Sumiyoshi_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class RRP_Uniform_Sumiyoshi_02:RRP_Uniform_Sumiyoshi_01{};
    class RRP_Uniform_Sumiyoshi_03:RRP_Uniform_Sumiyoshi_01{};

    class RRP_Vest_Sumiyoshi_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };

    class RRP_Backpack_Sumiyoshi_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };

    class RRP_Headgear_Sumiyoshi_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class RRP_Headgear_Sumiyoshi_02:RRP_Headgear_Sumiyoshi_01{};
    class RRP_Headgear_Sumiyoshi_03:RRP_Headgear_Sumiyoshi_01{};

    class RRP_Glasses_Sumiyoshi_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 1000;
    };

    // Escobaro
    class RRPClothing_Uniform_Escobaro_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class R_Clothing_Escobaro_02:RRPClothing_Uniform_Escobaro_01{};
    class R_Clothing_Escobaro_03:RRPClothing_Uniform_Escobaro_01{};
    class RRPClothing_Uniform_Escobaro_04:RRPClothing_Uniform_Escobaro_01{};

	class R_Vest_Escobaro_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class R_Vest_Escobaro_02:R_Vest_Escobaro_01{};

	class R_Backpack_Escobaro_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class RRPClothing_Backpack_Escobaro_02:R_Backpack_Escobaro_01{};

    class RRPClothing_Headgear_Escobaro_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class RRPClothing_Headgear_Escobaro_02:RRPClothing_Headgear_Escobaro_01{};

    class RRPClothing_Glasses_Escobaro_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 1000;
    };
    class RRPClothing_Glasses_Escobaro_02:RRPClothing_Glasses_Escobaro_01{};
    class RRPClothing_Glasses_Escobaro_03:RRPClothing_Glasses_Escobaro_01{};
    class RRPClothing_Glasses_Escobaro_04:RRPClothing_Glasses_Escobaro_01{};
	//Black Wolves
    class my_biker
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class my_biker1:my_biker{};
    class blackWolves_ia_soldier_01_viridian:my_biker{};
    class blackWolves_ia_soldier_01_gray:my_biker{};
    class RRPClothing_vest_1_BlackWolves
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class blackWolves_Clueless_Vest_viridian: RRPClothing_vest_1_BlackWolves {};
    class blackWolves_Clueless_Vest_gray: RRPClothing_vest_1_BlackWolves {};
	class RRPClothing_backpack_1_BlackWolves
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class blackWolves_d3s_Claire_viridian: RRPClothing_backpack_1_BlackWolves {};
    class blackWolves_d3s_Claire_gray: RRPClothing_backpack_1_BlackWolves {};
    class blackWolves_drrpg_cowboyHat
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 500;
    };
    class blackWolves_TRYK_ESS_CAP: blackWolves_drrpg_cowboyHat {};
    class blackWolves_Bandanna_viridian
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 250;
    };
    class blackWolves_Bandanna_gray: blackWolves_Bandanna_viridian {};
	//lacosanostra
    class Azar_Suit_ANZUS
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class vvv_character_agente_472:Azar_Suit_ANZUS{};
	
	
    class RRPClothing_vest_1_lacosanostra
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
	class RRPClothing_backpack_1_LaCosaNostra
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
	// Inagawa Kai
    class RRPClothing_Uniform_IK_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 5000;
    };
    class RRPClothing_Uniform_IK_02:RRPClothing_Uniform_IK_01{};
    class RRPClothing_Uniform_IK_03:RRPClothing_Uniform_IK_01{};
    class RRPClothing_Uniform_IK_04:RRPClothing_Uniform_IK_01{};

	class RRPClothing_Vest_IK_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class RRPClothing_Vest_IK_02: RRPClothing_Vest_IK_01 {};

	class RRPClothing_Backpack_IK_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 30000;
    };
    class RRPClothing_Backpack_IK_02: RRPClothing_Backpack_IK_01 {};

    class RRPClothing_Headgear_IK_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 2000;
    };
    class RRPClothing_Headgear_IK_02:RRPClothing_Headgear_IK_01{};
    class RRPClothing_Headgear_IK_03:RRPClothing_Headgear_IK_01{};
    class RRPClothing_Headgear_IK_04:RRPClothing_Headgear_IK_01{};

    class RRPClothing_Glasses_IK_01
    {
        custom_name = "";
        condition_sell = "";
        condition_sell_message = "";
        condition_use = "";
        condition_use_message = "";
        price = 1000;
    };
	///
};


class LifeCfgClothShops
{
    class RRP_flightschool_Uniform
    {
        displayName = "Одежда летной школы";
        conditions = "license_flightschool_grp_2 || license_flightschool_grp_3 || (getPlayerUID player) in ['76561198322725899']";
        conditionsMessage = "Вы должны быть учеником летной школы";
        side = "civ";
        groupID = 28;
        uniforms[] = {{"RRPUniform_Flight_01"}, {"RRPUniform_Flight_02"}, {"U_C_Man_casual_6_F"}, {"U_C_Man_casual_5_F"}, {"U_C_Man_casual_4_F"}, {"U_I_pilotCoveralls"}, {"U_I_HeliPilotCoveralls"}};
        headgear[] = {{"RRPHeadgear_Flight_01"}, {"RRPHeadgear_Flight_02"}, {"RRPHeadgear_Flight_03"}, {"RRPHeadgear_Flight_04"}, {"H_CrewHelmetHeli_B"}, {"H_CrewHelmetHeli_I"}, {"H_CrewHelmetHeli_I_E"}, {"H_PilotHelmetHeli_B"}, {"H_PilotHelmetHeli_I_E"}, {"H_PilotHelmetHeli_I"}, {"H_PilotHelmetFighter_B"}, {"H_PilotHelmetFighter_I_E"}, {"H_PilotHelmetFighter_I"}, {"H_CrewHelmetHeli_I_E"}};
    };
    class RRP_Gov_Clothing
    {
        displayName = "Одежда губернатора";
        conditions = "life_gov || license_admittance_goverment";
        conditionsMessage = "Вы должны состоять в правительстве или иметь специальный допуск";
        side = "civ";
        groupID = 29;
        uniforms[] = {};
        goggles[] = {{"G_Aviator"}, {"G_Spectacles"}, {"G_Spectacles_Tinted"}, {"G_Squares_Tinted"}, {"G_Squares"}};
        vests[] = {{"TAC_V_Sheriff_BA_TB7"}};
        backpacks[] = {{"TAC_MTAP_BK2"}};
    };
    class bruce
    {
        displayName = "CROPP";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        uniforms[] =
		{
			{"NONE"},
            {"U_C_Poloshirt_tricolour"}, {"U_C_Poloshirt_blue"}, {"U_C_Poloshirt_stripped"}, {"U_C_Poloshirt_salmon"}, {"U_C_Poloshirt_burgundy"}, {"U_C_Poloshirt_redwhite"},
			{"A3L_Dude_Outfit"}, {"A3L_Farmer_Outfit"}, {"A3L_Worker_Outfit"},
			{"U_O_R_Gorka_01_black_F"},
			{"U_C_man_sport_3_F"}, {"U_C_man_sport_1_F"}, {"U_C_man_sport_2_F"},
			{"U_C_IDAP_Man_Tee_F"}, {"U_C_IDAP_Man_TeeShorts_F"}, {"U_C_IDAP_Man_shorts_F"}, {"U_C_IDAP_Man_casual_F"}, {"U_C_IDAP_Man_Jeans_F"}, {"U_C_IDAP_Man_cargo_F"},
			{"U_C_Poor_1"},
			{"U_I_G_Story_Protagonist_F"},
			{"U_C_Man_casual_1_F"}, {"U_C_Man_casual_2_F"},
			{"U_C_ArtTShirt_01_v5_F"},
			{"U_C_Man_casual_3_F"},
			{"U_C_ArtTShirt_01_v2_F"}, {"U_C_ArtTShirt_01_v4_F"}, {"U_C_ArtTShirt_01_v6_F"}, {"U_C_ArtTShirt_01_v3_F"}, {"U_C_ArtTShirt_01_v1_F"},
			{"U_BG_Guerilla3_1"}, {"U_BG_Guerilla2_2"}, {"U_BG_Guerilla2_1"}, {"U_BG_Guerilla2_3"},
			{"U_C_HunterBody_grn"},
			{"U_C_Uniform_Scientist_02_formal_F"},
			{"U_C_Mechanic_01_F"},
			{"U_Marshal"},
			{"U_I_L_Uniform_01_tshirt_black_F"}, {"U_I_L_Uniform_01_tshirt_sport_F"}, {"U_I_L_Uniform_01_tshirt_skull_F"}, {"U_I_L_Uniform_01_tshirt_olive_F"},
			{"U_C_E_LooterJacket_01_F"},
			{"U_C_Uniform_Farmer_01_F"},
			{"U_C_Journalist"},
			{"U_B_survival_uniform"},
			{"U_I_L_Uniform_01_deserter_F"},
			{"U_I_C_Soldier_Bandit_2_F"}, {"U_I_C_Soldier_Bandit_3_F"}, {"U_I_C_Soldier_Bandit_1_F"}, {"U_I_C_Soldier_Bandit_4_F"}, {"U_I_C_Soldier_Bandit_5_F"},
			{"U_C_Man_casual_6_F"}, {"U_C_Man_casual_5_F"}, {"U_C_Man_casual_4_F"},
			{"U_OrestesBody"},
			{"U_Competitor"},
			{"U_Tank_green_F"},
			{"U_C_ConstructionCoverall_Black_F"}, {"U_C_ConstructionCoverall_Blue_F"}, {"U_C_ConstructionCoverall_Red_F"}, {"U_C_ConstructionCoverall_Vrana_F"},
			{"rds_uniform_Woodlander4"}, {"rds_uniform_Woodlander2"}, {"rds_uniform_Woodlander1"},
			{"A3LWolfShirt"},
			{"A3L_CivShirtVolcom"}, {"A3L_CivShirtVolcomMonster"}, {"A3L_CivShirtVolcomLogo"},
			{"rds_uniform_Villager4"}, {"rds_uniform_Villager3"}, {"rds_uniform_Villager2"}, {"rds_uniform_Villager1"},
			{"A3L_CivShirtVans"}, {"A3L_CivShirtVans2"},
			{"Skyline_Character_U_SecouristeB_01_F"}, {"Skyline_Character_U_SecouristeB_02_F"}, {"Skyline_Character_U_SecouristeA_01_F"},
			{"TRYK_U_B_Denim_T_WH"}, {"TRYK_U_B_Denim_T_BK"}, {"TRYK_U_B_Denim_T_BG_WH"}, {"TRYK_U_B_Denim_T_BG_BK"},
			{"TRYK_U_B_BLK_T_WH"}, {"TRYK_U_B_RED_T_BR"}, {"TRYK_U_B_BLK_T_BK"},
			{"TRYK_U_denim_jersey_blu"},
			{"TRYK_U_denim_hood_nc"}, {"TRYK_U_denim_hood_blk"}, {"TRYK_U_denim_hood_mc"}, {"TRYK_U_denim_hood_3c"},
			{"A3LTigerShirt"}, {"Skyline_Character_U_Chasseur_04_F"}, {"Skyline_Character_U_Chasseur_03_F"}, {"Skyline_Character_U_Chasseur_02_F"}, {"Skyline_Character_U_Chasseur_01_F"},
			{"U_G_Academie"},
			{"cg_upyours1"}, {"cg_turtles1"}, {"cg_stoned1"}, {"cg_shark1"}, {"cg_rageface1"}, {"cg_rastaciv"}, {"cg_pika1"}, {"cg_peanut1"}, {"cg_leppy1"}, {"cg_joker1"}, {"cg_jason1"}, {"cg_illuminati1"}, {"cg_iamstupid1"}, {"cg_homer1"}, {"cg_herpderp1"}, {"cg_gameover1"}, {"cg_fightclub1"}, {"cg_ferrari1"}, {"cg_evolution1"}, {"cg_et1"}, {"cg_deeznuts1"}, {"cg_csgo1"}, {"cg_condoms1"}, {"cg_chickens1"}, {"cg_bipolar1"}, {"cg_bendozlia3"}, {"cg_bb1"}, {"cg_awesome1"},
			{"Skyline_Character_U_CivilE_07_F"}, {"Skyline_Character_U_CivilE_06_F"}, {"Skyline_Character_U_CivilE_05_F"}, {"Skyline_Character_U_CivilE_04_F"}, {"Skyline_Character_U_CivilE_03_F"}, {"Skyline_Character_U_CivilE_02_F"}, {"Skyline_Character_U_CivilE_01_F"},
			{"A3L_CivShirtRelationships"},
			{"A3L_Badoodlenoodleshirt"},
			{"A3L_CivShirtProbe"},
			{"YlGnGy_uni"}, {"YlBlBr_uni"}, {"WhBlBr_uni"},
			{"A3LCivPoloUS"}, {"A3LCivPoloUK"},
			{"sohoku_uni"}, {"RdGyBr_uni"}, {"RdGnGy_uni"}, {"RdBlBr_uni"}, {"PkGyBr_uni"}, {"PkGnGy_uni"}, {"OrGyBr_uni"}, {"MotherTrucker_uni"}, {"GyBlBr_uni"}, {"poloranger_uni"},
			{"A3LCivPoloGreenOrange"}, {"A3LCivPoloGreenGrey"}, {"A3LCivPoloGreenGreen"}, {"A3LCivPoloGreenBlack"},
			{"GnGyBr_uni"},
			{"checkered_uni"},
			{"U_C_Polar_Kaki"}, {"U_C_Polar_Brun"},
			{"A3LPikaShirt"},
			{"A3L_CivShirtOhBoy"}, {"A3L_CivShirtThanksObama"}, {"A3L_CivShirtNikeFeet"}, {"A3L_CivShirtNikeDoIt"}, {"A3L_CivShirtNikeDoIt2"}, {"A3L_CivShirtNikeCamo"},
			{"A3L_Lacoste_T"}, {"A3L_Lacoste_S"}, {"A3L_Lacoste_G"}, {"A3L_Lacoste_C"},
			{"A3L_CivShirtKeepCalm"},
			{"U_C_Hoodie_Rouge"}, {"U_C_Hoodie_Jaune"}, {"U_C_Hoodie_Brun"}, {"U_C_Hoodie_Bleu"}, {"U_C_Hoodie_Beige"},
			{"A3L_CivShirtHollister"}, {"A3L_CivShirtGrumpyCat"}, {"A3L_CivShirtGetHigh"},
			{"EF_HM_LPBL2"}, {"EF_HM_LPB2"}, {"EF_HM_LPBW2"}, {"EF_HM_LPBR2"}, {"EF_HM_LPBP2"}, {"EF_HM_LPBPS2"}, {"EF_HM_LPBL"}, {"EF_HM_LPB"}, {"EF_HM_LPBW"}, {"EF_HM_LPBR"}, {"EF_HM_LPBP"}, {"EF_HM_LPBPS"}, {"EF_M_jkt32"}, {"EF_M_jkt42"}, {"EF_M_jkt3"}, {"EF_M_jkt4"}, {"EF_M_jkt2_4"}, {"EF_M_jkt32_2"}, {"EF_M_jkt1_3"}, {"EF_M_jkt2_32"}, {"EF_M_jkt2_3"}, {"EF_M_jkt1_2"}, {"EF_M_jkt2_22"}, {"EF_M_jkt2_2"}, {"EF_MKJKT2"}, {"EF_M_jkt1"}, {"EF_M_jkt22"}, {"EF_M_jkt2"}, {"EF_MKJKT"}, {"EF_HMARMY_2"}, {"EF_HMARMY_1"}, {"EF_HM_PP2"}, {"EF_HM_SG2"}, {"EF_HM_OD2"}, {"EF_HM_BL2"}, {"EF_HM_B2"}, {"EF_HM_PP1"}, {"EF_HM_SG1"}, {"EF_HM_OD1"}, {"EF_HM_BL1"}, {"EF_HM_B1"},
			{"A3L_CivShirtDJ"}, {"A3L_CivShirtDiamond"},
			{"A3LCloudShirt"},
			{"rds_uniform_citizen4"}, {"rds_uniform_citizen3"}, {"rds_uniform_citizen2"}, {"rds_uniform_citizen1"},
			{"A3LCatShirt"}, {"A3LCokeShirt"},
			{"Skyline_Character_U_CivilC_07_F"}, {"Skyline_Character_U_CivilC_06_F"}, {"Skyline_Character_U_CivilC_05_F"}, {"Skyline_Character_U_CivilC_04_F"}, {"Skyline_Character_U_CivilC_03_F"}, {"Skyline_Character_U_CivilC_01_F"}, {"Skyline_Character_U_CivilC_02_F"},
			{"A3L_CivShirtBillabong2"}, {"A3L_CivShirtBillabong"}, {"A3L_CivShirtAnotherCat"},
			{"A3L_CivShirtAdidas"},
            {"rds_uniform_priest"},
            {"vvv_character_rock1"}, {"vvv_character_rock2"}, {"vvv_character_rock3"}, {"vvv_character_rock4"},
            {"vvv_traje_jackoy"}, {"vvv_traje_jackoy2"}, {"vvv_traje_jackoy3"}, {"vvv_traje_jackoy4"}, {"vvv_traje_jackoy5"}, {"vvv_traje_jackoy6"}, {"vvv_traje_jackoy7"}, {"vvv_traje_jackoy8"},
            {"vvv_character_funcionario_2"},
            {"U_O_R_Gorka_01_black_F"},
            {"U_C_Uniform_Scientist_01_formal_F"}, {"U_C_Uniform_Scientist_01_F"}, {"U_C_Uniform_Scientist_02_F"}, {"U_C_Uniform_Scientist_02_formal_F"},
            {"U_C_Uniform_Farmer_01_F"},
            {"U_C_E_LooterJacket_01_F"}, {"U_I_L_Uniform_01_tshirt_olive_F"}, {"U_I_L_Uniform_01_tshirt_skull_F"}, {"U_I_L_Uniform_01_tshirt_sport_F"},
            {"U_Marshal"},
            {"U_C_Mechanic_01_F"},
            {"U_C_Poloshirt_blue"}, {"U_C_Poloshirt_burgundy"}, {"U_C_Poloshirt_redwhite"}, {"U_C_Poloshirt_salmon"}, {"U_C_Poloshirt_stripped"}, {"U_C_Poloshirt_tricolour"},
            {"U_C_Poor_2"},
            {"U_IG_Guerilla2_2"}, {"U_IG_Guerilla3_1"}, {"U_IG_Guerilla2_3"},
            {"U_C_HunterBody_grn"},
            {"rds_uniform_assistant"}, {"rds_uniform_citizen1"}, {"rds_uniform_citizen2"}, {"rds_uniform_citizen3"}, {"rds_uniform_citizen4"}, {"rds_uniform_Villager1"}, {"rds_uniform_Villager2"}, {"rds_uniform_Villager3"}, {"rds_uniform_Villager4"}, {"rds_uniform_Woodlander1"}, {"rds_uniform_Woodlander2"},
            {"A3L_CivShirtAdidasMake"}, {"A3L_CivShirtAdidas"}, {"A3L_CivShirtAnotherCat"}, {"A3L_CivShirtBillabong"}, {"A3L_CivShirtBillabong2"}, {"A3LCatShirt"}, {"A3LCloudShirt"}, {"A3LCokeShirt"}, {"A3L_CivShirtDiamond"}, {"A3L_CivShirtDJ"}, {"A3L_CivShirtGetHigh"}, {"A3LHandShirt"}, {"A3L_CivShirtHollister"}, {"A3L_CivShirtKeepCalm"}, {"A3L_CivShirtNikeCamo"}, {"A3L_CivShirtNikeDoIt2"}, {"A3L_CivShirtNikeDoIt"}, {"A3L_CivShirtNikeFeet"}, {"A3L_CivShirtOhBoy"}, {"A3LPikaShirt"}, {"A3L_CivShirtProbe"}, {"A3L_CivShirtRelationships"}, {"A3L_CivShirtThanksObama"}, {"A3LTigerShirt"}, {"A3L_CivShirtVans2"}, {"A3L_CivShirtVans"}, {"A3L_CivShirtVolcomLogo"}, {"A3L_CivShirtVolcomMonster"}, {"A3L_CivShirtVolcom"}, {"A3LWolfShirt"},
            {"U_C_Hoodie_Beige"}, {"U_C_Hoodie_Bleu"}, {"U_C_Hoodie_Jaune"}, {"U_C_Hoodie_Rouge"},
            {"A3L_CivShirtAdidas_r"}, {"A3L_Lacoste_C"}, {"A3L_Lacoste_G"}, {"A3L_Lacoste_S"}, {"A3L_Lacoste_T"}, {"A3L_Badoodlenoodleshirt"}, {"A3L_CivShirtGrumpyCat"},
            {"U_C_Man_casual_1_F"}, {"U_C_Man_casual_2_F"}, {"U_C_Man_casual_3_F"}, {"U_C_Man_casual_4_F"}, {"U_C_Man_casual_5_F"}, {"U_C_Man_casual_6_F"}, {"U_C_man_sport_1_F"}, {"U_C_man_sport_2_F"}, {"U_C_man_sport_3_F"},
            {"U_OrestesBody"},
            {"RRP_Franklin1"}, {"OfficialSuit_Black"}, {"OfficialSuit_Black_R"}, {"RRP_Ridus_Jacket_ANIM"}, {"RRP_Ridus_Jacket_BLK"}, {"RRP_Ridus_Jacket_BLUE"}, {"RRP_Ridus_Jacket_BROWN"}, {"RRP_Ridus_Jacket_GREEN"}, {"RRP_Ridus_Jacket_KUB"}, {"RRP_Ridus_Jacket_RED"}, {"dr_cowboy_whiteOutfit"}, {"dr_cowboy_redOutfit"}, {"dr_cowboy_pinkOutfit"}, {"dr_cowboy_greenOutfit"}, {"dr_cowboy_brownOutfit"}, {"dr_cowboy_blueOutfit"}, {"dr_cowboy_blackOutfit"}, {"dr_cowboy_beigeOutfit"}, {"Business_Suit_S"}, {"my_biker1"}, {"Business_Suit_2"}, {"RRP_Clothing_fatsuit2"}, {"RRP_Clothing_HMT"}, {"RRP_Clothing_Edate"}, {"RRP_Clothing_Chimps"}, {"RRP_Clothing_tolstovka_1"}, {"RRP_Clothing_tolstovka_2"}, {"RRP_Clothing_tolstovka_3"}, {"RRP_Clothing_tolstovka_4"}, {"RRP_Clothing_tolstovka_5"}, {"RRP_Clothing_tolstovka_6"}, {"RRP_Clothing_kurtka1"}, {"RRP_Clothing_Style1"}, {"RRP_Clothing_Style2"}, {"RRP_Clothing_Style3"}, {"RRP_Clothing_Style4"}, {"RRP_Clothing_Style5"}, {"RRP_Clothing_Style6"}, {"RRP_Clothing_Style7"}, {"RRP_Bomber_Jacket1"}
		};
        headgear[] =
        {
            {"NONE"}, {"EF_wig_DHB"}, {"EF_Long_wig_B"}, {"EF_Punk_wig_B"}, {"EF_wig_SB"}, {"EF_Punk_wig_SB3"}, {"EF_Punk_wig_SB"}, {"EF_Long_wig_BLE"}, {"EF_Punk_wig_BLE"}, {"EF_wig_SBLE"}, {"EF_wig_VSBLE"}, {"EF_Punk_wig_SBLE3"}, {"EF_Long_wig_GL"}, {"EF_Punk_wig_GL"}, {"EF_wig_SGL"}, {"EF_Punk_wig_SGL3"}, {"EF_Long_wig_SV"}, {"EF_Punk_wig_SV"}, {"H_Bandanna_gry"}, {"H_Bandanna_cbr"}, {"H_Bandanna_surfer"}, {"H_Bandanna_khk"}, {"H_Bandanna_sgg"}, {"H_StrawHat"}, {"H_BandMask_blk"}, {"H_Booniehat_tan"}, {"H_Hat_blue"}, {"H_Hat_brown"}, {"H_Hat_checker"}, {"H_Hat_grey"}, {"H_Hat_tan"}, {"H_Cap_blu"},
            {"H_Cap_grn"}, {"H_Cap_grn_BI"}, {"H_Cap_oli"}, {"H_Cap_red"}, {"H_Cap_tan"}, {"rds_Profiteer_cap1"}, {"rds_Profiteer_cap2"}, {"rds_Profiteer_cap3"}, {"rds_Profiteer_cap4"}, {"rds_Woodlander_cap1"}, {"rds_Woodlander_cap2"}, {"rds_Woodlander_cap3"}, {"rds_Woodlander_cap4"}, {"rds_Villager_cap1"}, {"rds_Villager_cap2"}, {"rds_Villager_cap3"}, {"rds_Villager_cap4"}, {"AG_CapHair"}, {"AG_DreadLocks"}, {"BeanieHat_red_S"}, {"BeanieHat_pink_S"}, {"BeanieHat_grey_S"}, {"BeanieHat_brown_S"}, {"BeanieHat_blue_S"},
            {"BeanieHat_black_S"}, {"BeanieHat_beige_S"}, {"Dreadlocks_S"}, {"Dreadlocks_2_S"}, {"Dreadlocks_3_S"}, {"Dreadlocks_4_S"}, {"Dreadlocks_5_S"}, {"d3s_CAP_beanie"}, {"d3s_CAP_beanie_1"}, {"d3s_CAP_beanie_1_a"}, {"d3s_CAP_beanie_1_b"}, {"d3s_CAP_beanie_1_c"}, {"d3s_CAP_beanie_1_d"}, {"d3s_CAP_beanie_1_e"}, {"d3s_CAP_beanie_1_f"}, {"d3s_CAP_beanie_1_g"}, {"d3s_CAP_beanie_1_h"}, {"d3s_CAP_beanie_1_i"}, {"d3s_CAP_beanie_1_j"}, {"d3s_CAP_beanie_1_k"}, {"d3s_CAP_beanie_1_l"}, {"d3s_CAP_beanie_1_m"},
            {"Skyline_HeadGear_Cowboy_01_F"}, {"Skyline_HeadGear_Cowboy_02_F"}, {"Skyline_HeadGear_Cowboy_03_F"}, {"Skyline_HeadGear_Cowboy_04_F"}, {"Skyline_HeadGear_Cowboy_05_F"}, {"Skyline_HeadGear_Cowboy_06_F"}, {"Skyline_HeadGear_Chapka_01_F"}, {"Skyline_HeadGear_Chapka_02_F"}, {"Skyline_HeadGear_Chapka_03_F"}, {"Skyline_HeadGear_Chapka_04_F"}, {"Skyline_HeadGear_Chapka_01_F"}, {"TRYK_H_headsetcap_Glasses"}, {"TRYK_H_headsetcap_blk_Glasses"}, {"TRYK_H_headsetcap_od_Glasses"}, {"TRYK_R_CAP_BLK"}, {"TRYK_R_CAP_TAN"}, {"TRYK_R_CAP_OD_US"}, {"d3s_CAP_Rodeo_head"}
        };
        goggles[] =
        {
            {"NONE"}, {"Skyline_Hoxton"}, {"Skyline_Wolf"}, {"Skyline_Corvo"}, {"rrp_pay"}, {"GM_boneface_plain"}, {"GM_boneface_diazDeLosMuertos"}, {"G_Shades_Black"}, {"G_Shades_Blue"}, {"G_Sport_Blackred"}, {"G_Sport_Checkered"}, {"G_Sport_Blackyellow"}, {"G_Sport_BlackWhite"}, {"G_Squares"}, {"G_Aviator"}, {"G_Lady_Mirror"}, {"G_Lady_Dark"}, {"G_Lady_Blue"}, {"G_Lowprofile"}, {"G_Combat"}, {"Skyline_Anonymous"}, {"immersion_cigs_cigar0"},
            {"d3s_p_eyes_000_a"}, {"d3s_p_eyes_000_b"}, {"d3s_p_eyes_000_c"}, {"d3s_p_eyes_000_d"}, {"d3s_p_eyes_000_e"}, {"d3s_p_eyes_000_f"}, {"d3s_p_eyes_000_g"}, {"d3s_p_eyes_000_h"}, {"d3s_p_eyes_000_i"}, {"d3s_p_eyes_000_j"}, {"d3s_p_eyes_000_k"}, {"d3s_p_eyes_000_l"}, {"d3s_p_eyes_000_m"}, {"d3s_p_eyes_000_n"}, {"d3s_p_eyes_000_o"}, {"d3s_p_eyes_001"},
            {"d3s_Glasses_scarf_a"}, {"d3s_Glasses_scarf_d"}, {"d3s_Glasses_scarf_c"},
            {"d3s_Glasses_scarf1_a"}, {"d3s_Glasses_scarf1_b"}, {"d3s_Glasses_scarf1_c"}, {"d3s_Glasses_scarf1_d"},
            {"d3s_Glasses_scarf2_a"}, {"d3s_Glasses_scarf2_b"}, {"d3s_Glasses_scarf2_c"}, {"d3s_Glasses_scarf2_d"}, {"d3s_Glasses_scarf2_e"}, {"d3s_Glasses_scarf2_f"},{"drrpg_english_mustache_black"}, {"drrpg_english_mustache_grey"}, {"drrpg_handlebar_n_puff_black"}, {"drrpg_handlebar_n_puff"}, {"drrpg_handlebar_n_puff_grey"}, {"drrpg_yeard1"}, {"drrpg_yeard"}, {"drrpg_yeard3"}, {"drrpg_muttonchops_black"}, {"drrpg_muttonchops"}, {"drrpg_muttonchops_grey"}, {"drrpg_verdi"}, {"TRYK_Beard_BK"}, {"TRYK_Beard_BL"}, {"TRYK_Beard"}, {"TRYK_Beard_BW"}, {"TRYK_Beard_Gr"}, {"TRYK_Beard_BK2"}, {"TRYK_Beard_BL2"}, {"TRYK_Beard2"}, {"TRYK_Beard_BW2"}, {"TRYK_Beard_Gr2"}, {"TRYK_Beard_BK3"}, {"TRYK_Beard_BL3"}, {"TRYK_Beard3"}, {"TRYK_Beard_BW3"}, {"TRYK_Beard_Gr3"}, {"TRYK_Beard_BK4"}, {"TRYK_Beard_BL4"}, {"TRYK_Beard4"}, {"TRYK_Beard_BW4"}, {"TRYK_Beard_Gr4"}, {"TRYK_SBeard_BK"}, {"TRYK_SBeard_BL"}, {"TRYK_SBeard"}, {"TRYK_SBeard_BW"}, {"TRYK_SBeard_Gr"}, {"TRYK_SBeard_BK2"}, {"TRYK_SBeard_BL2"}, {"TRYK_SBeard2"}, {"TRYK_SBeard_BW2"}, {"TRYK_SBeard_Gr2"}, {"TRYK_SBeard_BK3"}, {"TRYK_SBeard_BL3"}, {"TRYK_SBeard3"}, {"TRYK_SBeard_BW3"}, {"TRYK_SBeard_Gr3"}, {"TRYK_SBeard_BK4"}, {"TRYK_SBeard_BL4"}, {"TRYK_SBeard4"}, {"TRYK_SBeard_BW4"}, {"TRYK_SBeard_Gr4"}, {"TRYK_SBeard_BK5"}, {"TRYK_SBeard_BL5"}, {"TRYK_SBeard5"}, {"TRYK_SBeard_BW5"}, {"TRYK_SBeard_Gr5"}, {"TRYK_SBeard_BK6"}, {"TRYK_SBeard_BL6"}, {"TRYK_SBeard6"}, {"TRYK_SBeard_BW6"}, {"TRYK_SBeard_Gr6"}
        };
        vests[] =
        {
            {"NONE"}, {"V_Safety_yellow_F"}, {"V_Safety_orange_F"}, {"V_Safety_blue_F"}, {"V_TacChestrig_grn_F"}, {"V_TacChestrig_cbr_F"}, {"V_TacChestrig_oli_F"}, {"mgsr_poncho_wet_vest"}, {"TAC_Jvest_B"}, {"EXT_Tac_Vest_1"}, {"EXT_Tac_Vest_2"}, {"EXT_Tac_Vest_3"}, {"EXT_Tac_Vest_4"}, {"EXT_Tac_Vest_5"}, {"EXT_Tac_Vest_6"}, {"EXT_Tac_Vest_7"}, {"EXT_Tac_Vest_8"}, {"EXT_Tac_Vest_9"}, {"EXT_Tac_Vest_10"}, {"V_Rangemaster_belt"}, {"V_BandollierB_khk"}, {"V_TacVest_khk"}, {"V_TacVest_brn"},
            {"d3s_vest_1"}, {"d3s_vest_1_a"}, {"d3s_vest_1_b"}, {"d3s_vest_1_c"}, {"d3s_vest_1_d"}, {"d3s_vest_1_e"}, {"d3s_vest_1_f"}, {"d3s_vest_1_g"}, {"d3s_vest_1_h"}, {"d3s_vest_1_i"}, {"d3s_vest_1_j"}, {"d3s_vest_1_k"}, {"d3s_vest_1_l"}, {"d3s_vest_1_m"}, {"d3s_vest_1_n"}, {"d3s_vest_1_o"}, {"d3s_vest_1_p"}, {"d3s_vest_1_q"}, {"d3s_vest_1_r"}, {"d3s_vest_1_s"}, {"d3s_vest_1_t"}, {"d3s_vest_1_u"}, {"d3s_vest_1_v"}, {"d3s_vest_1_w"}, {"d3s_vest_1_x"}, {"d3s_vest_1_y"}, {"d3s_vest_1_z"},
            {"accs_vest_001_a"}, {"accs_vest_002_a"}, {"accs_vest_003_a"}
        };
        backpacks[] =
        {
            {"NONE"},
			{"B_TacticalPack_blk"}, {"B_TacticalPack_oli"}, {"B_TacticalPack_rgr"}, {"B_TacticalPack_ocamo"}, {"B_TacticalPack_mcamo"},
			{"B_CivilianBackpack_01_Sport_Blue_F"}, {"B_CivilianBackpack_01_Sport_Red_F"}, {"B_CivilianBackpack_01_Sport_Green_F"},
			{"B_Bergen_dgtl_F"}, {"B_Bergen_tna_F"}, {"B_Bergen_hex_F"}, {"B_Bergen_mcamo_F"},
			{"B_mas_m_Bergen_acr_w"}, {"B_mas_m_Bergen_acr_g"}, {"B_mas_m_Bergen_acr"}, {"B_mas_m_Bergen_acr_c"},
			{"B_Carryall_khk"}, {"B_Carryall_taiga_F"}, {"B_Carryall_oli"}, {"B_Carryall_wdl_F"}, {"B_Carryall_cbr"}, {"B_Carryall_green_F"}, {"B_Carryall_ghex_F"}, {"B_Carryall_oucamo"}, {"B_Carryall_eaf_F"}, {"B_Carryall_ocamo"}, {"B_Carryall_mcamo"},
			{"koilbp_2"}, {"koilbender_2"}, {"koilbp_11"}, {"koilbp_12"}, {"koilbp_3"}, {"koilbp_8"}, {"koilgraf_2"}, {"koilgraf_3"}, {"koilgucci"}, {"koilbp_9"}, {"kaelmario"}, {"kaelmonty"}, {"kaelmonty2"}, {"koilbp_13"}, {"koilpanda"}, {"koilbp_15"}, {"koilbp_16"}, {"koilsponge_1"}, {"koilbp_18"},
			{"B_FieldPack_khk"}, {"B_FieldPack_taiga_F"}, {"B_FieldPack_oli"}, {"B_FieldPack_green_F"}, {"B_FieldPack_blk"}, {"B_FieldPack_cbr"}, {"B_FieldPack_ghex_F"}, {"B_FieldPack_oucamo"}, {"B_FieldPack_ocamo"},
			{"B_Messenger_IDAP_F"}, {"B_Messenger_Black_F"}, {"B_Messenger_Gray_F"}, {"B_Messenger_Olive_F"}, {"B_Messenger_Coyote_F"},
			{"B_CivilianBackpack_01_Everyday_IDAP_F"}, {"B_CivilianBackpack_01_Everyday_Black_F"}, {"B_CivilianBackpack_01_Everyday_Vrana_F"}, {"B_CivilianBackpack_01_Everyday_Astra_F"},
			{"B_Kitbag_sgg"}, {"B_Kitbag_tan"}, {"B_Kitbag_cbr"}, {"B_Kitbag_rgr"}, {"B_Kitbag_mcamo"},
			{"B_AssaultPack_Kerry"}, {"B_AssaultPack_dgtl"}, {"B_AssaultPack_khk"}, {"B_AssaultPack_tna_F"}, {"B_AssaultPack_sgg"}, {"B_AssaultPack_wdl_F"}, {"B_AssaultPack_cbr"}, {"B_AssaultPack_rgr"}, {"B_AssaultPack_eaf_F"}, {"B_AssaultPack_ocamo"},
			{"B_mas_AssaultPack_wint"}, {"B_mas_AssaultPack_wint"}, {"B_mas_AssaultPack_black"}, {"B_mas_AssaultPack_mul"}, {"B_mas_AssaultPack_rng"}, {"B_mas_AssaultPack_des"},
			{"Skyline_Backpack_Chasse_Radio_01_F"}, {"Skyline_Backpack_Chasse_01_F"}, {"Skyline_Backpack_Sac_a_dos_04_F"}, {"Skyline_Backpack_Sac_a_dos_03_F"}, {"Skyline_Backpack_Sac_a_dos_02_F"}, {"Skyline_Backpack_Sac_a_dos_01_F"}, {"Skyline_Backpack_Montagne_04_F"}, {"Skyline_Backpack_Montagne_03_F"}, {"Skyline_Backpack_Montagne_02_F"}, {"Skyline_Backpack_Montagne_01_F"},
			{"tf_rt1523g_bwmod"},
			{"B_Respawn_Sleeping_bag_blue_F"}, {"B_Patrol_Respawn_bag_F"}, {"B_Respawn_TentDome_F"}, {"B_Respawn_Sleeping_bag_brown_F"}, {"B_Respawn_Sleeping_bag_F"}, {"B_Respawn_TentA_F"},
			{"Skyline_Backpack_Improvise_01_F"}, {"Shoulder_2_S"}, {"Shoulder_1_S"}, {"Shoulder_3_S"}, {"d3s_Claire"}, {"Portfolio_black_S"}, {"Portfolio_golden_S"}, {"Portfolio_green_S"}, {"Portfolio_marine_S"}, {"Portfolio_rad_S"}, {"Biker_Bag_S"}, {"lacoste_abstraction_S"}, {"lacoste_white_skin_S"}, {"lacoste_green_S"}, {"lacoste_nato_white_S"}, {"lacoste_nato_S"}, {"lacoste_brown_S"}, {"lacoste_brown_skin_S"}, {"lacoste_red_S"}, {"lacoste_blue_S"}, {"lacoste_violet_S"}, {"lacoste_black_S"}, {"lacoste_black_skin_S"}, {"d3s_backpack"}, {"d3s_backpack_a"}, {"d3s_backpack_b"}, {"d3s_backpack_c"}, {"d3s_backpack_d"}, {"d3s_backpack_e"}, {"d3s_backpack_f"}, {"d3s_backpack_g"}, {"d3s_backpack_h"}, {"d3s_backpack_i"}, {"d3s_backpack_j"}, {"d3s_backpack_k"}, {"d3s_backpack_l"}
        };
    };

    class denchik_cloch
    {
        displayName = "Одежда Минюста";
        conditions = "license_judge";
        conditionsMessage = "";
        side = "civ";
        groupID = 6;
        uniforms[] = {{"rds_uniform_Functionary1"}, {"rds_uniform_Functionary2"}};
        headgear[] = {{"Skyline_HeadGear_Cowboy_01_F"}, {"Skyline_HeadGear_Cowboy_02_F"}, {"Skyline_HeadGear_Cowboy_05_F"}};
        goggles[] = {{"12_Headset_NV"}, {"EF_FRG2"}};
        vests[] = {{"NC_PBDFG2_B_1"}, {"TAC_PBDFG2_CY_1"}};
        backpacks[] = {{"TAC_BP_HSG_AB_B"}, {"LEgioN_Officer_Belt"}};
    };
    class jail_shop
    {
        displayName = "Одежда Заключенных";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"mgsr_robe_blue"}, {"mgsr_robe_blue"}, {"mgsr_robe_blue"}, {"mgsr_robe_blue"}};
        headgear[] = {{"mgsr_eyepatch"}};
    };
    class jail_shop_reb
    {
        displayName = "Одежда Заключенных";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"mgsr_robe_blue"}, {"mgsr_robe_blue"}, {"mgsr_robe_blue"}, {"mgsr_robe_blue"}};
        headgear[] = {{"mgsr_eyepatch"}};
    };
    class cop_bruce
    {
        displayName = "CROPP";
        conditions = "('cop' call RRPClient_groups_getSideLevel) > 26";
        conditionsMessage = "";
        side = "cop";
        groupID = 1;
        uniforms[] = {{"NONE"}, {"Rimas_U_B_CTRG_1_FBI"}, {"KAEL_SUITS_BR_F17"}, {"KAEL_SUITS_BR_F19"}, {"KAEL_SUITS_BR_F33"}, {"EF_M_jkt2_4"}, {"EF_M_jkt4"}, {"EF_suit_6"}, {"A3L_Lacoste_C"}, {"A3L_Lacoste_T"}, {"U_C_Polar_Burn"}, {"U_C_Polar_Kaki"}, {"GyBlBr_uni"}, {"WhBlBr_uni"}, {"Skyline_Character_U_CHasseur_02_F"}, {"A3L_Dude_Outfit"}, {"Skyline_Character_U_CivilB_04_F"}, {"Skyline_Character_U_CivilB_05_F"}, {"Skyline_Character_U_CivilB_06_F"}, {"U_C_Poloshirt_blue"}, {"U_C_Poloshirt_burgundy"}, {"U_C_Poloshirt_redwhite"}, {"U_C_Poloshirt_salmon"}, {"U_C_Poloshirt_stripped"}, {"U_C_Poloshirt_tricolour"}, {"U_C_Poor_2"}, {"U_IG_Guerilla2_2"}, {"U_IG_Guerilla3_1"}, {"U_OrestesBody"}, {"U_IG_Guerilla2_3"}, {"U_C_HunterBody_grn"}, {"rds_uniform_assistant"}, {"rds_uniform_schoolteacher"}, {"rds_uniform_citizen1"}, {"rds_uniform_citizen2"}, {"rds_uniform_citizen3"}, {"rds_uniform_citizen4"}, {"rds_uniform_Profiteer1"}, {"rds_uniform_Profiteer2"}, {"rds_uniform_Profiteer3"}, {"rds_uniform_Profiteer4"}, {"rds_uniform_Villager1"}, {"rds_uniform_Villager2"}, {"rds_uniform_Villager3"}, {"rds_uniform_Villager4"}, {"rds_uniform_Woodlander1"}, {"rds_uniform_Woodlander2"}, {"A3L_CivShirtAdidasMake"}, {"A3L_CivShirtAdidas"}, {"A3L_CivShirtAnotherCat"}, {"A3L_CivShirtBillabong"}, {"A3L_CivShirtBillabong2"}, {"A3LCatShirt"}, {"A3LCloudShirt"}, {"A3LCokeShirt"}, {"A3L_CivShirtDiamond"}, {"A3L_CivShirtDJ"}, {"A3L_CivShirtGetHigh"}, {"A3LHandShirt"}, {"A3L_CivShirtHollister"}, {"A3L_CivShirtKeepCalm"}, {"A3L_CivShirtNikeCamo"}, {"A3L_CivShirtNikeDoIt2"}, {"A3L_CivShirtNikeDoIt"}, {"A3L_CivShirtNikeFeet"}, {"A3L_CivShirtOhBoy"}, {"A3LPikaShirt"}, {"A3L_CivShirtProbe"}, {"A3L_CivShirtRelationships"}, {"A3L_CivShirtThanksObama"}, {"A3LTigerShirt"}, {"A3L_CivShirtVans2"}, {"A3L_CivShirtVans"}, {"A3L_CivShirtVolcomLogo"}, {"A3L_CivShirtVolcomMonster"}, {"A3L_CivShirtVolcom"}, {"A3LWolfShirt"}, {"U_C_Hoodie_Beige"}, {"U_C_Hoodie_Bleu"}, {"U_C_Hoodie_Jaune"}, {"U_C_Hoodie_Rouge"}, {"U_C_Polar_Brun"}, {"U_C_Polar_Kaki"}, {"A3L_CivShirtAdidas_r"}, {"A3L_Lacoste_C"}, {"A3L_Lacoste_G"}, {"A3L_Lacoste_S"}, {"A3L_Lacoste_T"}, {"A3L_Badoodlenoodleshirt"}, {"A3L_CivShirtGrumpyCat"}, {"U_C_Man_casual_1_F"}, {"U_C_Man_casual_2_F"}, {"U_C_Man_casual_3_F"}, {"U_C_Man_casual_4_F"}, {"U_C_Man_casual_5_F"}, {"U_C_Man_casual_6_F"}, {"U_C_man_sport_1_F"}, {"U_C_man_sport_2_F"}, {"U_C_man_sport_3_F"}};
        headgear[] = {{"NONE"}, {"Rimas_H_Cap_khaki_specops_UK_FBI"}, {"Rimas_H_HelmetB_light_FBI"}, {"H_Bandanna_gry"}, {"H_Bandanna_cbr"}, {"H_Bandanna_surfer"}, {"H_Bandanna_khk"}, {"H_Bandanna_sgg"}, {"H_StrawHat"}, {"H_BandMask_blk"}, {"H_Booniehat_tan"}, {"H_Hat_blue"}, {"H_Hat_brown"}, {"H_Hat_checker"}, {"H_Hat_grey"}, {"H_Hat_tan"}, {"H_Cap_blu"}, {"H_Cap_grn"}, {"H_Cap_grn_BI"}, {"H_Cap_oli"}, {"H_Cap_red"}, {"H_Cap_tan"}, {"rds_Profiteer_cap1"}, {"rds_Profiteer_cap2"}, {"rds_Profiteer_cap3"}, {"rds_Profiteer_cap4"}, {"rds_Woodlander_cap1"}, {"rds_Woodlander_cap2"}, {"rds_Woodlander_cap3"}, {"rds_Woodlander_cap4"}, {"rds_Villager_cap1"}, {"rds_Villager_cap2"}, {"rds_Villager_cap3"}, {"rds_Villager_cap4"}};
        goggles[] =
        {
            {"NONE"}, {"G_Spectacles_Tinted"}, {"G_Shades_Black"}, {"G_Shades_Blue"}, {"G_Tactical_Clear"}, {"G_Tactical_Black"}, {"G_Sport_Blackyellow"}, {"G_Sport_BlackWhite"}, {"G_Sport_Checkered"}, {"G_Sport_Red"}, {"G_Sport_Greenblack"}, {"G_Sport_Blackred"}, {"G_Shades_Red"}, {"G_Shades_Green"}, {"G_Goggles_VR"}, {"G_Spectacles"}, {"G_Squares"}, {"G_Squares_Tinted"}, {"G_EyeProtectors_Earpiece_F"}, {"G_EyeProtectors_F"}, {"G_Lady_Blue"}, {"G_WirelessEarpiece_F"}, {"G_Aviator"}
        };
        vests[] = {{"NONE"}, {"TAC_EI_RRVS_SPR_RG"}, {"Rimas_V_PlateCarriel_CTRG_FBI_W"}, {"TAC_V_tacv1_FBI"}, {"EF_MTK_Belt1"}, {"EF_SHF_BK"}, {"EF_SH_BK"}, {"EF_BLT_F1"}, {"EF_BLT_M1BSF"}, {"V_Rangemaster_belt"}, {"V_BandollierB_khk"}, {"V_TacVest_khk"}, {"V_TacVest_brn"}};
        backpacks[] = {{"NONE"}, {"TAC_LBT_LEGAB2_OD"}, {"B_G_Invisible"}, {"B_AssaultPack_cbr"}, {"B_Kitbag_mcamo"}, {"B_TacticalPack_oli"}, {"B_FieldPack_ocamo"}, {"B_Bergen_sgg"}, {"B_Kitbag_cbr"}, {"B_Carryall_oli"}, {"B_Carryall_khk"}, {"A3L_BergenMurica"}, {"koilbender_2"}, {"koilbp_11"}, {"koilbp_12"}, {"koilbp_3"}, {"koilbp_8"}, {"koilgraf_2"}, {"koilgraf_3"}, {"koilgucci"}, {"koilbp_9"}, {"kaelmario"}, {"kaelmonty"}, {"kaelmonty2"}, {"koilbp_13"}, {"koilpanda"}, {"koilbp_15"}, {"koilbp_16"}, {"koilsponge_1"}, {"koilbp_18"}, {"Skyline_Backpack_Ecole_01_F"}, {"Skyline_Backpack_Sac_a_dos_01_F"}, {"Skyline_Backpack_Sac_a_dos_02_F"}, {"Skyline_Backpack_Sac_a_dos_03_F"}, {"Skyline_Backpack_Sac_a_dos_04_F"}, {"Skyline_Backpack_Chasse_01_F"}, {"Skyline_Backpack_Improvise_01_F"}, {"Skyline_Backpack_Montagne_01_F"}, {"Skyline_Backpack_Montagne_02_F"}, {"Skyline_Backpack_Montagne_03_F"}, {"Skyline_Backpack_Montagne_04_F"}, {"ARMST_SUMKA5_science"}, {"tf_anprc155"}, {"Extremo_santa_backpack"}};
    };
    class reb
    {
        displayName = "Одежда Революционеров";
        conditions = "true";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
		uniforms[] = {
            {"RRP_Clothing_Cocaine"},
            {"d3s_uniform_jbib_000"},
            {"G3_CombatUniform_Coyot"},
            {"Kosuha_S"},
            {"KSK_Assault_FlecktarnDesertTSHIRT"}, //вип
            {"KSK_Assault_FlecktarnWoodlandTSHIRT"}, //вип
            {"Skyline_Character_U_Chasseur_05_F"},
            {"mgsr_poncho_dry"},
            {"Gsg9_Uniform_TrainingBlack_Gloves"},
            {"Gsg9_Uniform_TrainingBrown_Gloves"},
            {"Gsg9_Uniform_TrainingGrey_Gloves"},
            {"Gsg9_Uniform_TrainingWetEarth_Gloves"},
            {"Gsg9_Uniform_TrainingBlack"},
            {"Gsg9_Uniform_TrainingBrown"},
            {"Gsg9_Uniform_TrainingBrownWhiteTs"},
            {"Gsg9_Uniform_TrainingBrownWhiteTS_Gloves"},
            {"Gsg9_Uniform_TrainingGrey"},
            {"Gsg9_Uniform_TrainingWetEarth"},
            {"Gsg9_Uniform_TrainingWetEarthWhiteTs"},
            {"Gsg9_Uniform_TrainingWetEarthWhiteTS_Gloves"},
            {"TRYK_U_B_PCUHsW8"}, //вип
            {"TRYK_U_B_PCUHsW7"},
            {"TRYK_U_B_PCUGs_BLK_R"},
            {"TRYK_U_B_PCUGs_gry_R"},
            {"TRYK_U_B_PCUGs_OD_R"},
            {"TRYK_U_denim_jersey_blk"},
            {"TRYK_U_pad_j_blk"},
            {"rds_uniform_Woodlander3"},
            {"RRP_Clothing_Yellowline"}, //вип
            //top
            {"Gsg9_Uniform_Black"},//дорого
            {"Gsg9_Uniform_Brown"},//дорого
            {"CryeGen3_Uniform_FlecktarnDesert"}, //дорого и вип
            {"CryeGen3_Uniform_FlecktarnWoodland"}, //дорого и вип
            {"Gsg9_Uniform_Grey"}, //дорого
            {"CryeGen3_Uniform_FlecktarnDesert_Gloft"},  //дорого и вип
            {"Gsg9_Uniform_WetEarth_RS"} //дорого
		};
        headgear[] = {};
        goggles[] = {
            {"G_mas_wpn_shemag"},
            {"G_RM_SWAT_Balaclava"}, //vip
            {"G_RM_SWAT_Bandana"},
            {"G_mas_wpn_wrap_b"},
            {"G_mas_wpn_wrap_f"},
            {"G_mas_wpn_wrap_gog_b"},
            {"G_mas_wpn_wrap_gog_g"},
            {"G_mas_wpn_wrap_gog_c"}, //vip
            {"G_mas_wpn_wrap_c"}, //vip
            {"G_Bandanna_beast"}, //vip
            {"G_mas_wpn_bala_b"}, //vip
			{"drrpg_english_mustache_black"}, {"drrpg_english_mustache_grey"}, {"drrpg_handlebar_n_puff_black"}, {"drrpg_handlebar_n_puff"}, {"drrpg_handlebar_n_puff_grey"}, {"drrpg_yeard1"}, {"drrpg_yeard"}, {"drrpg_yeard3"}, {"drrpg_muttonchops_black"}, {"drrpg_muttonchops"}, {"drrpg_muttonchops_grey"}, {"drrpg_verdi"}, {"TRYK_Beard_BK"}, {"TRYK_Beard_BL"}, {"TRYK_Beard"}, {"TRYK_Beard_BW"}, {"TRYK_Beard_Gr"}, {"TRYK_Beard_BK2"}, {"TRYK_Beard_BL2"}, {"TRYK_Beard2"}, {"TRYK_Beard_BW2"}, {"TRYK_Beard_Gr2"}, {"TRYK_Beard_BK3"}, {"TRYK_Beard_BL3"}, {"TRYK_Beard3"}, {"TRYK_Beard_BW3"}, {"TRYK_Beard_Gr3"}, {"TRYK_Beard_BK4"}, {"TRYK_Beard_BL4"}, {"TRYK_Beard4"}, {"TRYK_Beard_BW4"}, {"TRYK_Beard_Gr4"}, {"TRYK_SBeard_BK"}, {"TRYK_SBeard_BL"}, {"TRYK_SBeard"}, {"TRYK_SBeard_BW"}, {"TRYK_SBeard_Gr"}, {"TRYK_SBeard_BK2"}, {"TRYK_SBeard_BL2"}, {"TRYK_SBeard2"}, {"TRYK_SBeard_BW2"}, {"TRYK_SBeard_Gr2"}, {"TRYK_SBeard_BK3"}, {"TRYK_SBeard_BL3"}, {"TRYK_SBeard3"}, {"TRYK_SBeard_BW3"}, {"TRYK_SBeard_Gr3"}, {"TRYK_SBeard_BK4"}, {"TRYK_SBeard_BL4"}, {"TRYK_SBeard4"}, {"TRYK_SBeard_BW4"}, {"TRYK_SBeard_Gr4"}, {"TRYK_SBeard_BK5"}, {"TRYK_SBeard_BL5"}, {"TRYK_SBeard5"}, {"TRYK_SBeard_BW5"}, {"TRYK_SBeard_Gr5"}, {"TRYK_SBeard_BK6"}, {"TRYK_SBeard_BL6"}, {"TRYK_SBeard6"}, {"TRYK_SBeard_BW6"}, {"TRYK_SBeard_Gr6"}
        };
		vests[] = {
    		{"AG_Jacket_Base"}, //30k
    		{"AG_Jacket_NoBelt_Base"}, //30k
    		{"AG_Jacket_NoRadioBelt_Base"},
            {"TAC_CR1_OD"},
            {"TAC_V_tacSVD_BK"},
            {"TAC_V_tacSVD_OD"},
            {"TAC_LBT_H_OD"},
            {"TAC_LBT_H3_B"},
            {"TAC_LBT_H3_Khaki"},
            {"TAC_LBT_H3_OD"},
            {"TAC_EI_RRV1_B"},
            {"TAC_EI_RRV1_Coyote"},
            {"TAC_EI_RRV1_OD"},
            {"TRYK_V_Bulletproof"},
            {"V_BandollierB_rgr"},
            {"RRP_Clueless_Vest"} //top
		};
		backpacks[] =
        {
			/*{"B_AssaultPack_Kerry"}, {"B_AssaultPack_blk"}, {"B_AssaultPack_dgtl"}, {"B_AssaultPack_khk"}, {"B_AssaultPack_tna_F"}, {"B_AssaultPack_sgg"}, {"B_AssaultPack_wdl_F"}, {"B_AssaultPack_cbr"}, {"B_AssaultPack_rgr"}, {"B_AssaultPack_eaf_F"}, {"B_AssaultPack_ocamo"},*/
			{"B_mas_AssaultPack_wint"}, {"B_mas_AssaultPack_wint"}, {"B_mas_AssaultPack_black"}, {"B_mas_AssaultPack_mul"}, {"B_mas_AssaultPack_rng"}, {"B_mas_AssaultPack_des"},
            {"NONE"},
			{"B_TacticalPack_blk"}, {"B_TacticalPack_oli"}, {"B_TacticalPack_rgr"}, {"B_TacticalPack_ocamo"}, {"B_TacticalPack_mcamo"},
			{"B_CivilianBackpack_01_Sport_Blue_F"}, {"B_CivilianBackpack_01_Sport_Red_F"}, {"B_CivilianBackpack_01_Sport_Green_F"},
			{"B_Bergen_dgtl_F"}, {"B_Bergen_tna_F"}, {"B_Bergen_hex_F"}, {"B_Bergen_mcamo_F"},
			{"B_mas_m_Bergen_acr_w"}, {"B_mas_m_Bergen_acr_g"}, {"B_mas_m_Bergen_acr"}, {"B_mas_m_Bergen_acr_c"},
			{"B_Carryall_khk"}, {"B_Carryall_taiga_F"}, {"B_Carryall_oli"}, {"B_Carryall_wdl_F"}, {"B_Carryall_cbr"}, {"B_Carryall_green_F"}, {"B_Carryall_ghex_F"}, {"B_Carryall_oucamo"}, {"B_Carryall_eaf_F"}, {"B_Carryall_ocamo"}, {"B_Carryall_mcamo"},
			{"koilbp_2"}, {"koilbender_2"}, {"koilbp_11"}, {"koilbp_12"}, {"koilbp_3"}, {"koilbp_8"}, {"koilgraf_2"}, {"koilgraf_3"}, {"koilgucci"}, {"koilbp_9"}, {"kaelmario"}, {"kaelmonty"}, {"kaelmonty2"}, {"koilbp_13"}, {"koilpanda"}, {"koilbp_15"}, {"koilbp_16"}, {"koilsponge_1"}, {"koilbp_18"},
			{"B_FieldPack_khk"}, {"B_FieldPack_taiga_F"}, {"B_FieldPack_oli"}, {"B_FieldPack_green_F"}, {"B_FieldPack_blk"}, {"B_FieldPack_cbr"}, {"B_FieldPack_ghex_F"}, {"B_FieldPack_oucamo"}, {"B_FieldPack_ocamo"},
			{"B_Messenger_IDAP_F"}, {"B_Messenger_Black_F"}, {"B_Messenger_Gray_F"}, {"B_Messenger_Olive_F"}, {"B_Messenger_Coyote_F"},
			{"B_CivilianBackpack_01_Everyday_IDAP_F"}, {"B_CivilianBackpack_01_Everyday_Black_F"}, {"B_CivilianBackpack_01_Everyday_Vrana_F"}, {"B_CivilianBackpack_01_Everyday_Astra_F"},
			{"B_Kitbag_sgg"}, {"B_Kitbag_tan"}, {"B_Kitbag_cbr"}, {"B_Kitbag_rgr"}, {"B_Kitbag_mcamo"},
			{"Skyline_Backpack_Chasse_Radio_01_F"}, {"Skyline_Backpack_Chasse_01_F"}, {"Skyline_Backpack_Sac_a_dos_04_F"}, {"Skyline_Backpack_Sac_a_dos_03_F"}, {"Skyline_Backpack_Sac_a_dos_02_F"}, {"Skyline_Backpack_Sac_a_dos_01_F"}, {"Skyline_Backpack_Montagne_04_F"}, {"Skyline_Backpack_Montagne_03_F"}, {"Skyline_Backpack_Montagne_02_F"}, {"Skyline_Backpack_Montagne_01_F"},
			{"tf_rt1523g_bwmod"},
			{"B_Respawn_Sleeping_bag_blue_F"}, {"B_Patrol_Respawn_bag_F"}, {"B_Respawn_TentDome_F"}, {"B_Respawn_Sleeping_bag_brown_F"}, {"B_Respawn_Sleeping_bag_F"}, {"B_Respawn_TentA_F"},
			{"Skyline_Backpack_Improvise_01_F"}, {"Shoulder_2_S"}, {"Shoulder_1_S"}, {"Shoulder_3_S"}, {"d3s_Claire"}, {"Portfolio_black_S"}, {"Portfolio_golden_S"}, {"Portfolio_green_S"}, {"Portfolio_marine_S"}, {"Portfolio_rad_S"}, {"Biker_Bag_S"}, {"lacoste_abstraction_S"}, {"lacoste_white_skin_S"}, {"lacoste_green_S"}, {"lacoste_nato_white_S"}, {"lacoste_nato_S"}, {"lacoste_brown_S"}, {"lacoste_brown_skin_S"}, {"lacoste_red_S"}, {"lacoste_blue_S"}, {"lacoste_violet_S"}, {"lacoste_black_S"}, {"lacoste_black_skin_S"}, {"d3s_backpack"}, {"d3s_backpack_a"}, {"d3s_backpack_b"}, {"d3s_backpack_c"}, {"d3s_backpack_d"}, {"d3s_backpack_e"}, {"d3s_backpack_f"}, {"d3s_backpack_g"}, {"d3s_backpack_h"}, {"d3s_backpack_i"}, {"d3s_backpack_j"}, {"d3s_backpack_k"}, {"d3s_backpack_l"}
        };
    };
    class cop
    {
        displayName = "Altis Police Department Shop";
        conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
        conditionsMessage = "";
        side = "cop";
        groupID = 1;
        uniforms[] = {{"RRPClothing_Uniform_Police_K9_01"},{"RRPClothing_Uniform_Police_K9_02"},{"RRPClothing_Uniform_Police_PD_01"},{"RRPClothing_Uniform_Police_PD_02"},{"RM_SWAT_Uniform_02"},{"RM_SWAT_Uniform_01"},{"RP_bigcop_bob_v2"},{"RP_bigcop_bob_v1"},{"jf_police_uniform2_03"},{"jf_police_uniform2_01"},{"jf_sheriff_uniform_02"},{"jf_police_uniform_01"},{"jf_sheriff_uniform_01"},{"RRP_uniform_fbi"},{"RRP_vest_fbi_1"}};
        headgear[] = {{"RRPClothing_Headgear_Police_K9_01"},{"RRPClothing_Headgear_Police_PD_01"},{"RP_bob_cap"},{"RRPhead_Cap_CadetOFF_PD"},{"RRPhead_Cap_POLICEOFF2_PD"},{"jf_police_hat_02"},{"jf_police_hat_01"},{"jf_campaign_sheriff_hat_01"},{"RRPhead_Cap_POLICEOFF_PD"},{"RRP_helmet_fbi"}};
        goggles[] = {{"NONE"},{"G_mas_wpn_bala"}, {"G_mas_wpn_gog_d"}, {"G_Aviator"}, {"G_Spectacles_Tinted"}, {"G_Shades_Black"}, {"G_Shades_Blue"}, {"G_Tactical_Clear"}, {"G_Tactical_Black"}, {"G_Sport_Blackyellow"}, {"G_Sport_BlackWhite"}, {"G_Sport_Checkered"}, {"G_Sport_Red"}, {"G_Sport_Greenblack"}, {"G_Sport_Blackred"}, {"G_Shades_Red"}, {"G_Shades_Green"}, {"G_Goggles_VR"}, {"G_Spectacles"}, {"G_Squares"}, {"G_Squares_Tinted"}, {"G_EyeProtectors_Earpiece_F"}, {"G_EyeProtectors_F"}, {"G_Lady_Blue"}, {"G_WirelessEarpiece_F"}, {"G_Diving"}, {"G_Bandanna_aviator"}, {"G_Bandanna_sport"}, {"G_Bandanna_shades"}, {"G_Balaclava_blk"}, {"TRYK_Headset_NV"}, {"G_mas_wpn_bala_gog"}};
        vests[] = {{"RRPClothing_Vest_Police_K9_01"},{"RRPClothing_Vest_Police_K9_02"},{"RRPClothing_Vest_Police_PD_01"},{"RRPClothing_Vest_Police_PD_02"},{"RRP_UWW_100"},{"EF_v1_K9P2"},{"RP_bob_vest_v1"},{"jf_dea_vest_01"},{"jf_police_vest_01"},{"jf_sheriff_vest_01"},{"jf_fbi_vest_01"},{"RRP_vest_fbi"},{"RRP_vest_fbi_1"}};
        backpacks[] = {{"pd_form_unif_bag_2"},{"RP_bob_bag"},{"TRYK_B_BAF_BAG_BLK"}, {"SD_backpack"}, {"d3s_backpack_COP"}, {"d3s_backpack_COP2"},{"TAC_BP_Butt_B2"}};
    };
    class civdiver
    {
        displayName = "Дайвинг PRO";
        conditions = "license_diver";
        conditionsMessage = "Необходима лицензия дайвера";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"U_B_Wetsuit"}};
        goggles[] = {{"G_Diving"}};
        backpacks[] = {{"RRP_UWW_100"}};
    };
    class dhl
    {
        displayName = "DHL Униформа";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"rimas_dhl_Employee"}};
        headgear[] = {{"rimas_dhl_Cap"}};
        backpacks[] = {{"rimas_dhl_Belt"}};
    };
    class rebdiver
    {
        displayName = "Дайвинг PRO";
        conditions = "";
        conditionsMessage = "Необходима лицензия дайвера";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"U_I_Wetsuit"}};
        goggles[] = {{"G_I_Diving"}};
        backpacks[] = {{"RRP_UWW_100"}};
    };
    class kart
    {
        displayName = "Bobby's Kart-Racing Outfits";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"U_C_Driver_1_black"}, {"U_C_Driver_1_blue"}, {"U_C_Driver_1_red"}, {"U_C_Driver_1_orange"}, {"U_C_Driver_1_green"}, {"U_C_Driver_1_white"}, {"U_C_Driver_2"}, {"U_C_Driver_1"}, {"U_C_Driver_3"}, {"U_C_Driver_4"}};
        headgear[] = {{"H_RacingHelmet_1_black_F"}, {"H_RacingHelmet_1_red_F"}, {"H_RacingHelmet_1_white_F"}, {"H_RacingHelmet_1_blue_F"}, {"H_RacingHelmet_1_green_F"}, {"H_RacingHelmet_1_F"}, {"H_RacingHelmet_2_F"}, {"H_RacingHelmet_3_F"}, {"H_RacingHelmet_4_F"}};
    };
    class led
    {
        displayName = "Одежда прокурора";
        conditions = "license_led";
        conditionsMessage = "Необходима лицензия прокурора";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"ext_prok_ws"}, {"ext_prok_uniform_1"}, {"ext_prok_uniform_2"}};
        headgear[] = {{"ext_prok_cap"}, {"ext_prok_hat"}};
        vests[] = {{"ext_prok_vest"}};
        backpacks[] = {{"ext_prok_rm_belt"}};
    };
    class mask
    {
        displayName = "Магазин диверсанта";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"U_C_Poloshirt_blue"}};
        headgear[] = {{"H_Bandanna_surfer"}};
        goggles[] = {{"G_Shades_Black"}, {"G_Shades_Blue"}};
        vests[] = {{"V_Rangemaster_belt"}, {"V_BandollierB_khk"}};
        backpacks[] = {{"A3L_BergenMurica"}};
    };
    class copmask
    {
        displayName = "Магазин шпиона";
        conditions = "('cop' call RRPClient_groups_getSideLevel) == 19";
        conditionsMessage = "Только для сотрудников OPR";
        side = "cop";
        groupID = 0;
        uniforms[] = {{"U_C_Poloshirt_blue"}};
        headgear[] = {{"H_Bandanna_surfer"}};
        goggles[] = {{"G_Shades_Black"}, {"G_Shades_Blue"}};
        vests[] = {{"V_Rangemaster_belt"}, {"V_BandollierB_khk"}};
        backpacks[] = {{"A3L_BergenMurica"}};
    };
    class med
    {
        displayName = "Med Shop";
        conditions = "";
        conditionsMessage = "";
        side = "med";
        groupID = 2;
        uniforms[] = {{"RRPClothing_76561198068309224_uniform_1"},{"Rimas_EMS_Diver"}, {"Rimas_EMS_Intern"}, {"Ems_woman_2"}, {"Ems_woman_3"}, {"Ems_woman_1"}, {"Ems_woman_5"}, {"Ems_Woman_6"}, {"Medic_major"}, {"Rimas_Ems_doctor3"}, {"Rimas_Ems_doctor"}, {"U_union_medic"}, {"Union_medic"}, {"EMS_Paramedic"}, {"Rimas_EMS_Vest_Red"}, {"EMS_Woman_4"}, {"Rimas_EMS_Spec"}, {"Rimas_EMS_St_Spec"}, {"Rimas_EMS_Paramedic"}, {"Rimas_EMS_Doctor"}, {"Rimas_EMS_Doctor2"}, {"Rimas_EMS_Doctor3"}, {"Rimas_EMS_Officer"}, {"Rimas_EMS_Officer_2"}, {"Rimas_EMS_Minister_W"}, {"Rimas_EMS_Minister_B"}, {"medic_major"}, {"U_B_Wetsuit"}, {"Skyline_Character_U_CivilD_01_F"}, {"medic_wetsuit"}, {"EMS_girl_intern"}, {"EMS_girl_doc"}, {"EMS_girl_parabedic"}, {"EMS_girl2_intern"}, {"EMS_girl2_doc"}, {"EMS_girl2_paramedic"}, {"RRP_Doctor_Hirurg1"}, {"RRP_Doctor_Narcolog1"}, {"RRP_Doctor_Psycholog1"}, {"RRP_Doctor_Terapevt1"}, {"RRPClothing_ems_red"}, {"RRPClothing_ems_white"}, {"RRPClothing_ems_black"}};
        headgear[] = {{"RRPClothing_76561198068309224_beret_1"}, {"Skyline_HeadGear_NBC_Hazmat_01_F"}, {"Rimas_EMS_Cap_B"}, {"Rimas_EMS_Cap_W"}, {"Rimas_EMS_Bandana_B"}, {"Rimas_EMS_Bandana_W"}, {"Rimas_EMS_Beret"}, {"medic_Cap"}, {"medic_Beret"}, {"Rimas_EMS_Cap_W"}, {"Rimas_EMS_Cap_B"}};
        goggles[] = {{"G_Aviator"}, {"Rimas_EMS_Mask_B"}, {"Rimas_EMS_Mask_W"}, {"G_Spectacles"}, {"TRYK_Headset_NV"}};
        vests[] = {{"RRPClothing_76561198068309224_vest_1"},{"EMS_RebreatherB_Red"}, {"EMS_RebreatherB_White"}, {"EMS_RebreatherB_Blue"}, {"V_RebreatherB"}, {"V_G_Ceinturon"}, {"Rimas_EMS_Vest_Black"}, {"Rimas_EMS_Vest_White"}};
        backpacks[] = {{"RRPClothing_backpack_1_EMS"},{"RRPClothing_76561198068309224_Bag_1"},{"RRP_UWW_100"}, {"RRP_belt_med"}, {"EMS_backpack"}, {"Rimas_EMS_Belt_Red"}, {"Rimas_EMS_Belt_Black"}, {"Rimas_EMS_Belt_White"}, {"Rimas_EMS_Backpack_W_B"}, {"Rimas_EMS_Stretcher"}, {"tf_anprc155_coyote"}, {"RRP_belt_med"}, {"EMS_backpack_brat"}, {"EMS_backpack_imtern"}};
    };
    class press
    {
        displayName = "Форма Журналистов";
        conditions = "license_press";
        conditionsMessage = "Необходима лицензия 7NEWS";
        side = "civ";
        groupID = 4;
        uniforms[] = {{"EF_suit_5"}, {"vvv_character_agente_474"}, {"vvv_character_agente_475"}, {"EF_FEM_2BK"}, {"EF_FEM_3_2"}, {"EF_FEM_3_9K"}, {"EF_FEM_3_3LPBW2"}, {"EF_FEM_4"}, {"RRP_women3_1"}, {"RRP_women3_5"}, {"RRPVest_7news_01"}};
        headgear[] = {{"Headgear_H_Cap_press"}, {"H_Cap_press"}, {"V_Press_F"}, {"H_PASGT_basic_blue_press_F"}, {"RRPHelmet_7news_01"}, {"RRPHelmet_7news_02"}};
        goggles[] = {{"12_Headset_NV"}, {"G_Aviator"}, {"RRP_badge_7News_C"}, {"RRP_badge_7News_B"}, {"EF_FRG1"}, {"G_Goggles_VR"}, {"RRP_badge_7News_A"}};
        vests[] = {{"V_Press_F"}};
        backpacks[] = {{"TAC_BP_HSG_AB_B"}, {"CN_FBAG_BELT"}, {"Kasatky_BP_Butt_B"}, {"Rimas_EMS_Backpack_W_B"}};
    };
    class taxi_clothing
    {
        displayName = "Форма таксиста";
        conditions = "license_taxi";
        conditionsMessage = "Необходима лицензия таксиста";
        side = "civ";
        groupID = 3;
        uniforms[] = {{"U_union_taxi"}, {"Rimas_taxi"}, {"U_D_TAXI_Man_cargo_F"}, {"TAXI_suit_1"}, {"EF_suit_2"}, {"Taxi_FEM5_1"}, {"Taxi_FEM4_1"}, {"Taxi_FEM3_1"}, {"Taxi_FEM2_1"}, {"Taxi_FEM1_1"}, {"Girl_Taxi_1_1"}, {"Girl_TAXI_2_1"}};
        headgear[] = {{"TAXI_EarProtectors_black_F"}, {"TAXI_EarProtectors_orange_F"}, {"TAXI_Mcap_1"}, {"Taxi_Mcap_2"}, {"Taxi_021_F"}, {"Taxi_011_F"}, {"TAXI_Chapka_Yellow"}, {"TAXI_Chapka_Black"}, {"TAXI_Fcap_1"}, {"Taxi_Fcap_2"}};
        goggles[] = {{"RRP_badge_TAXI_C"}, {"RRP_badge_TAXI_B"}, {"RRP_badge_TAXI_A"}};
        vests[] = {{"V_Taxi_yellow_F"}, {"TAXI_SH"}};
        backpacks[] = {{"TAXI_backpack"}, {"B_Messenger_TAXI_A"}, {"B_Messenger_Taxi_B"}, {"B_Messenger_Taxi_C"}, {"B_Messenger_Taxi_D"}, {"B_Messenger_Taxi_F"}};
    };
    class admin
    {
        displayName = "Одежда Админов";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"vvv_traje_robot_1"}, {"vvv_character_alma"}, {"A3L_Zombie"}, {"A3L_SECRET"}, {"A3L_SpookyMummy"}};
    };
    class woomen_cloth
    {
        displayName = "Woomen Shop";
        conditions = "license_isGirl";
        conditionsMessage = "У вас нет статуса Девушки. Что бы его получить его, обратитесь к сотрудникам Полиции или МЧС!";
        side = "civ";
        groupID = 0;
        uniforms[] =
		{
			{"Youmeiu_s1"}, {"Youmeiu_s3"}, {"Youmeiu_s5"}, {"Youmeiu_s6"}, {"Youmeiu_2"},
			{"Youmeiu_2_s1"}, {"Youmeiu_2_s2"}, {"Youmeiu_2_s3"}, {"Youmeiu_2_s4"}, {"Youmeiu_2_s5"}, {"Youmeiu_2_s6"}, {"Youmeiu_s2"},
			{"RRP_Uni"},
			{"TCGM_Survival_MTP_Bra"}, {"TCGM_CombatUniform_Sage_Bra"}, {"TCGM_Survival_TNA_Bra"},
			{"TCGM_CombatUniform_M81_Bra"},
			{"TCGM_F_SoldierParamilitary"}, {"TCGM_F_SoldierParamilitary2"}, {"TCGM_F_SoldierParamilitary_RollUp"}, {"TCGM_F_SoldierParamilitary2_RollUp"},
			{"TCGM_f_Thong_Blk"}, {"TCGM_f_Thong_Flowers"}, {"TCGM_f_Thong_WGreen"}, {"TCGM_f_Thong_Blue"}, {"TCGM_f_Thong_Hearts"}, {"TCGM_f_Thong_Brown"}, {"TCGM_f_Thong_LGreen"}, {"TCGM_f_Thong_Poker"}, {"TCGM_f_Thong_Maya"}, {"TCGM_f_Thong_Leafs"}, {"TCGM_f_Thong_DGreen"}, {"TCGM_f_Thong_Wht"},
			{"TCGM_f_Swimsuit_Flowers"}, {"TCGM_f_Swimsuit_Hearts"}, {"TCGM_f_Swimsuit_Poker"}, {"TCGM_f_Swimsuit_Maya"}, {"TCGM_f_Swimsuit_Leafs"},
			{"RRP_women1_1"}, {"RRP_women1_2"}, {"RRP_women1_3"}, {"RRP_women1_4"}, {"RRP_women1_5"}, {"RRP_women1_6"}, {"RRP_women1_7"}, {"RRP_women1_8"}, {"RRP_women1_9"}, {"RRP_women1_10"}, {"RRP_women1_11"}, {"RRP_women1_12"}, {"RRP_women1_13"}, {"RRP_women1_14"}, {"RRP_women1_15"}, {"RRP_women2_1"}, {"RRP_women2_2"}, {"RRP_women2_3"}, {"RRP_women2_4"}, {"RRP_women2_5"}, {"RRP_women3_1"}, {"RRP_women3_2"}, {"RRP_women3_3"}, {"RRP_women3_4"}, {"RRP_women3_5"}, {"RRP_women4_1"}, {"RRP_women4_2"}, {"RRP_women4_3"}, {"RRP_women4_4"}, {"RRP_women4_5"},
            {"EF_FEM_2U"}, {"EF_FEM_2BK"}, {"EF_FEM_3_2"}, {"EF_FEM_3_9B"}, {"EF_FEM_3_9B2"}, {"EF_FEM_3_9B3"}, {"EF_FEM_3_9BL"}, {"EF_FEM_3_9BL2"}, {"EF_FEM_3_9BL3"}, {"EF_FEM_3_9K"}, {"EF_FEM_3_9K2"}, {"EF_FEM_3_9K3"}, {"EF_FEM_3_9R"}, {"EF_FEM_3_9R2"}, {"EF_FEM_3_9R3"}, {"EF_FEM_3_9V"}, {"EF_FEM_3_9V2"}, {"EF_FEM_3_9V3"}, {"EF_FEM_3_9W"}, {"EF_FEM_3_9W2"}, {"EF_FEM_3_9W3"}, {"EF_FEM_3_3B"}, {"EF_FEM_3_3BL"}, {"EF_FEM_3_3OD"}, {"EF_FEM_3_3SG"}, {"EF_FEM_3_3PP"}, {"EF_FEM_3_3B2"}, {"EF_FEM_3_3BL2"}, {"EF_FEM_3_3OD2"}, {"EF_FEM_3_3SG2"}, {"EF_FEM_3_3PP2"}, {"EF_FEM_3_3B3"}, {"EF_FEM_3_3BL3"}, {"EF_FEM_3_3OD3"}, {"EF_FEM_3_3SG3"}, {"EF_FEM_3_3PP3"}, {"EF_FEM_3A"}, {"EF_FEM_3A_2"}, {"EF_FEM_3A2"}, {"EF_FEM_3A2_2"}, {"EF_FEM_3_3_PUNK"}, {"EF_FEM_3_42"}, {"EF_FEM_3_3LPBPS"}, {"EF_FEM_3_3LPBP"}, {"EF_FEM_3_3LPBR"}, {"EF_FEM_3_3LPBW"},
            {"EF_FEM_3_3LPB"}, {"EF_FEM_3_3LPBL3"}, {"EF_FEM_3_77"}, {"EF_FEM_3_77R"}, {"EF_FEM_3_77R2"}, {"EF_FEM_3_75"}, {"EF_FEM_3_75R"}, {"EF_FEM_3_75R2"}, {"EF_FEM_3_76"}, {"EF_FEM_3_76R"}, {"EF_FEM_3_76R2"}, {"EF_FEM_3_73"}, {"EF_FEM_3_73R"}, {"EF_FEM_3_73R2"}, {"EF_FEM_3_74"}, {"EF_FEM_3_74R"}, {"EF_FEM_3_74R2"}, {"EF_FEM_3_7"}, {"EF_FEM_3_7R"}, {"EF_FEM_3_7R2"}, {"EF_FEM_3_72"}, {"EF_FEM_3_72R"}, {"EF_FEM_3_72R2"}, {"EF_FEM_3_5B"}, {"EF_FEM_3_5BP"}, {"EF_FEM_3_5VP"}, {"EF_FEM_3_5RC"}, {"EF_FEM_3_5W"}, {"EF_FEM_3_52"}, {"EF_FEM_3_52BP"}, {"EF_FEM_3_52VP"}, {"EF_FEM_3_52RC"}, {"EF_FEM_3_52W"}, {"EF_FEM_3"}, {"EF_FEM_4"}, {"EF_FEM_3_9_2B"}, {"EF_FEM_3_9_2B2"}, {"EF_FEM_3_9_2BL"}, {"EF_FEM_3_9_2BL2"}, {"EF_FEM_3_9_2K"}, {"EF_FEM_3_9_2K2"}, {"EF_FEM_3_9_2R"}, {"EF_FEM_3_9_2R2"}, {"EF_FEM_3_9_2V"}, {"EF_FEM_3_9_2V2"}, {"EF_FEM_3_9_2W"}, {"EF_FEM_3_9_2W2"}, {"EF_FEM_4_2B"}, {"EF_FEM_4_2BL"}, {"EF_FEM_4_2OD"}, {"EF_FEM_4_2SG"}, {"EF_FEM_4_2PP"}, {"EF_FEM_4_2B2"}, {"EF_FEM_4_2BL2"}, {"EF_FEM_4_2OD2"}, {"EF_FEM_4_2SG2"}, {"EF_FEM_4_2PP2"}, {"EF_FEM_4A"}, {"EF_FEM_4A_2"}, {"EF_FEM_4A2"}, {"EF_FEM_4A2_2"}, {"EF_FEM_4_2LPBPS"}, {"EF_FEM_4_2LPBP"}, {"EF_FEM_4_2LPBR"}, {"EF_FEM_4_2LPBW"}, {"EF_FEM_4_2LPB"}, {"EF_FEM_4_2LPBL"}, {"EF_FEM_4_2LPBPS2"}, {"EF_FEM_4_2LPBP2"}, {"EF_FEM_4_2LPBR2"}, {"EF_FEM_4_2LPB2"}, {"EF_FEM_4_2LPBL2"}, {"EF_FEM_4_72ADR"}, {"EF_FEM_4_77"}, {"EF_FEM_4_77R"}, {"EF_FEM_4_75"}, {"EF_FEM_4_75R"}, {"EF_FEM_4_76"}, {"EF_FEM_4_76R"}, {"EF_FEM_4_73"}, {"EF_FEM_4_73R"}, {"EF_FEM_4_74"}, {"EF_FEM_4_74R"}, {"EF_FEM_4_7"}, {"EF_FEM_4_7R"}, {"EF_FEM_4_72"}, {"EF_FEM_4_72R"}, {"EF_FEM_4_4B"}, {"EF_FEM_4_4BP"}, {"EF_FEM_4_4VP"}, {"EF_FEM_4_4"}, {"EF_FEM_4_4RC"}, {"EF_FEM_4_4W"}, {"EF_FEM_4_42"}, {"EF_FEM_4_42BP"}, {"EF_FEM_4_42VP"}, {"EF_FEM_4_42RC"}, {"EF_FEM_4_42W"}, {"EF_FEM_5"}, {"EF_FEM_6"}, {"EF_FEM_62"}, {"EF_FEM_72"}, {"EF_FEM_73"}, {"EF_FEM_7"}, {"EF_FEM_74"}, {"EF_FEM_8"}, {"EF_FEM_8_2"}, {"EF_FEM_8_3"}, {"EF_FEM_8_4"}, {"EF_FEM_10A_BK"}, {"EF_FEM_10A_BK_BL"}, {"EF_FEM_10A_BK_K"}, {"EF_FEM_10A_BK_W"}, {"EF_FEM_10A_BWK"}, {"EF_FEM_10A_R_BK"}, {"EF_FEM_10A_SG_W"}
		};
        vests[] =
        {
            {"EF_SHF_BK"}, {"EF_SHF_BW"}, {"EF_SHF_PK"}
        };
        headgear[] =
        {
            {"d3s_Hair_2a"}, {"d3s_Hair_2b"}, {"d3s_Hair_2c"}, {"d3s_Hair_2d"}, {"d3s_Hair_2e"}, {"d3s_Hair_2f"}, {"d3s_Hair_2g"}, {"d3s_Hair_2h"}, {"d3s_Hair_2i"}, {"d3s_Hair_1a"}, {"d3s_Hair_11a"}, {"d3s_Hair_11b"}, {"d3s_Hair_11c"}, {"d3s_Hair_11d"}, {"d3s_Hair_11e"}, {"d3s_Hair_11f"}, {"d3s_Hair_11g"}, {"d3s_Hair_11j"}, {"d3s_Hair_11i"}, {"d3s_Hair_10a"}, {"d3s_Hair_10b"}, {"d3s_Hair_10c"}, {"d3s_Hair_10d"}, {"d3s_Hair_10e"}, {"d3s_Hair_10f"}, {"d3s_Hair_10g"}, {"d3s_Hair_10h"}, {"d3s_Hair_10i"}, {"d3s_Hair_8a"}, {"d3s_Hair_8b"}, {"d3s_Hair_8c"}, {"d3s_Hair_8d"}, {"d3s_Hair_8e"}, {"d3s_Hair_8f"}, {"d3s_Hair_8g"}, {"d3s_Hair_8h"}, {"d3s_Hair_8i"}, {"d3s_Hair_12a"}, {"d3s_Hair_12b"}, {"d3s_Hair_12c"}, {"d3s_Hair_12d"}, {"d3s_Hair_12e"}, {"d3s_Hair_12f"}, {"d3s_Hair_12g"}, {"d3s_Hair_12h"}, {"d3s_Hair_12i"},
            {"d3s_Hair_3a"}, {"d3s_Hair_3b"}, {"d3s_Hair_3c"}, {"d3s_Hair_3d"}, {"d3s_Hair_3e"}, {"d3s_Hair_3f"}, {"d3s_Hair_3g"}, {"d3s_Hair_3h"}, {"d3s_Hair_3i"}, {"d3s_Hair_7a"}, {"d3s_Hair_7b"}, {"d3s_Hair_7c"}, {"d3s_Hair_7d"}, {"d3s_Hair_7e"}, {"d3s_Hair_7f"}, {"d3s_Hair_7g"}, {"d3s_Hair_7h"}, {"d3s_Hair_7i"}, {"d3s_Hair_13a"}, {"d3s_Hair_13b"}, {"d3s_Hair_13c"}, {"d3s_Hair_13d"}, {"d3s_Hair_13e"}, {"d3s_Hair_13f"}, {"d3s_Hair_13g"}, {"d3s_Hair_13h"}, {"d3s_Hair_13i"}, {"d3s_Hair_16a"}, {"d3s_Hair_16b"}, {"d3s_Hair_16c"}, {"d3s_Hair_16d"}, {"d3s_Hair_16e"}, {"d3s_Hair_16f"}, {"d3s_Hair_16g"}, {"d3s_Hair_16h"}, {"d3s_Hair_16i"}, {"d3s_Hair_6a"}, {"d3s_Hair_6b"}, {"d3s_Hair_6c"}, {"d3s_Hair_6d"}, {"d3s_Hair_6e"}, {"d3s_Hair_6f"}, {"d3s_Hair_6g"}, {"d3s_Hair_6h"}, {"d3s_Hair_6i"},
            {"d3s_Hair_4a"}, {"d3s_Hair_4b"}, {"d3s_Hair_4c"}, {"d3s_Hair_4d"}, {"d3s_Hair_4e"}, {"d3s_Hair_4f"}, {"d3s_Hair_4g"}, {"d3s_Hair_4h"}, {"d3s_Hair_4i"}, {"d3s_Hair_5a"}, {"d3s_Hair_5b"}, {"d3s_Hair_5c"}, {"d3s_Hair_5d"}, {"d3s_Hair_5e"}, {"d3s_Hair_5f"}, {"d3s_Hair_5g"}, {"d3s_Hair_5h"}, {"d3s_Hair_5i"}, {"d3s_Hair_9a"}, {"d3s_Hair_9b"}, {"d3s_Hair_9c"}, {"d3s_Hair_9d"}, {"d3s_Hair_9e"}, {"d3s_Hair_9f"}, {"d3s_Hair_9g"}, {"d3s_Hair_9h"}, {"d3s_Hair_9i"}, {"d3s_Hair_15a"}, {"d3s_Hair_15b"}, {"d3s_Hair_15c"}, {"d3s_Hair_15d"}, {"d3s_Hair_15e"}, {"d3s_Hair_15f"}, {"d3s_Hair_15g"}, {"d3s_Hair_15h"}, {"d3s_Hair_15i"}, {"d3s_Hair_14a"}, {"d3s_Hair_14b"}, {"d3s_Hair_14c"}, {"d3s_Hair_14d"}, {"d3s_Hair_14e"}, {"d3s_Hair_14f"}, {"d3s_Hair_14g"}, {"d3s_Hair_14h"}, {"d3s_Hair_14i"},
            {"TAC_BP_Butt2RGM"}, {"EF_FBNE_BK"}, {"EF_FBNE_BL"}, {"EF_FBNE_BR"}, {"EF_FBNE_R"}, {"EF_FBNE_V"}, {"EF_FBNE_W"}, {"EF_FHcap_BK"}, {"EF_FHcap_BL"}, {"EF_FHcap_C"}, {"EF_FHcap_CY"}, {"EF_FHcap_MG"}, {"EF_FHcap_P"}, {"EF_FHcap_R"}, {"EF_FHcap_SG"}, {"EF_FHcap_PP"}, {"EF_FHcap_W"}, {"EF_FHAT_BK"}, {"EF_FHAT_BW"}, {"EF_FHAT_CL"}, {"EF_FHAT_PI"}, {"EF_FHAT_SG"}, {"EF_FPKL_BK"}, {"EF_FPKL_BL"}, {"EF_FPKL_CY"}, {"EF_FPKL_RD"}, {"EF_FPKL_W"}
        };
        goggles[] =
        {
            {"d3s_CatEars_1"}, {"d3s_CatEars_2"},
            {"d3s_p_eyes_000_a"}, {"d3s_p_eyes_000_b"}, {"d3s_p_eyes_000_c"}, {"d3s_p_eyes_000_d"}, {"d3s_p_eyes_000_e"}, {"d3s_p_eyes_000_f"}, {"d3s_p_eyes_000_g"}, {"d3s_p_eyes_000_h"}, {"d3s_p_eyes_000_i"}, {"d3s_p_eyes_000_j"}, {"d3s_p_eyes_000_k"}, {"d3s_p_eyes_000_l"}, {"d3s_p_eyes_000_m"}, {"d3s_p_eyes_000_n"}, {"d3s_p_eyes_000_o"}, {"d3s_p_eyes_001"},
            {"d3s_Glasses_scarf_a"}, {"d3s_Glasses_scarf_d"}, {"d3s_Glasses_scarf_c"},
            {"d3s_Glasses_scarf1_a"}, {"d3s_Glasses_scarf1_b"}, {"d3s_Glasses_scarf1_c"}, {"d3s_Glasses_scarf1_d"},
            {"d3s_Glasses_scarf2_a"}, {"d3s_Glasses_scarf2_b"}, {"d3s_Glasses_scarf2_c"}, {"d3s_Glasses_scarf2_d"}, {"d3s_Glasses_scarf2_e"}, {"d3s_Glasses_scarf2_f"},
            {"EF_FG1"}, {"EF_FG2"}, {"EF_FSG_T"}, {"EF_FSG_BK"}, {"EF_FSG_BL"}, {"EF_FSG_BW"}, {"EF_FSG_C"}, {"EF_FSG_G"}, {"EF_FSG_O"}, {"EF_FSG_P"}, {"EF_FSG_R"}, {"EF_FSG_V"}, {"EF_FSG_W"}, {"EF_FSG_Y"}, {"EF_ACC4"}, {"EF_FRG1"}, {"EF_FRG2"}, {"EF_SC_CF1"}, {"EF_SC_CYF1"}, {"EF_SC_MGF1"}, {"EF_SC_PF1"}, {"EF_SC_TTBF1"}, {"EF_SC_TTBRF1"}, {"EF_SC_TTBRKF1"}, {"EF_SC_PPF1"}, {"EF_SC_WF1"}, {"EF_SC_CF2"}, {"EF_SC_CYF2"}, {"EF_SC_MGF2"}, {"EF_SC_PF2"}
        };
        backpacks[] = {{"EF_BLT_BAG"}, {"EF_FBAG_BK"}, {"EF_FBAG_BL"}, {"EF_FBAG_BW"}, {"EF_FBAG_RD"}, {"EF_FBAG_SG"}, {"EF_FBAG_VL"}, {"EF_FBAG_SL_BK"}, {"EF_FBAG_SL_BL"}, {"EF_FBAG_SL_BW"}, {"EF_FBAG_SL_RD"}, {"EF_FBAG_SL_SG"}, {"EF_FBAG_SL_VL"}, {"EF_SQBAG_BK"}, {"EF_SQBAG_BL"}, {"EF_SQBAG_GRAY"}, {"EF_SQBAG_NV"}, {"EF_SQBAG_RED"}, {"EF_SQBAG_SG"}, {"EF_SQBAG_VL"}, {"EF_SQBAG_WH"}};
    };
	class woomen_clothP:woomen_cloth{};
    class cloch_Biven
    {
        displayName = "Церковь Святого Бивня";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        uniforms[] = {{"rds_uniform_priest"}};
    };
    class clothing_defolt1
    {
        displayName = "Магазин Дефолт гражданский";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        headgear[] = {{"H_Bandanna_surfer"}, {"EF_HAT_BK"}, {"EF_HOOD_KA_B2"}, {"EF_HOOD_KA_B"}, {"Skyline_HeadGear_Bandana_01_F"}, {"Skyline_HeadGear_Bandana_02_F"}, {"Skyline_HeadGear_Bandana_03_F"}, {"Skyline_HeadGear_Bandana_04_F"}, {"Skyline_HeadGear_BandanaHead_01_F"}, {"Skyline_HeadGear_BandanaHead_02_F"}, {"Skyline_HeadGear_BandanaHead_03_F"}, {"Skyline_HeadGear_BandanaHead_04_F"}, {"Skyline_HeadGear_BandanaHead_05_F"}, {"Skyline_HeadGear_BandanaHead_06_F"}, {"Skyline_HeadGear_Bandana_05_F"}, {"Skyline_HeadGear_NBC_Hazmat_01_F"}, {"Skyline_HeadGear_BonnetLaine_01_F"}, {"Skyline_HeadGear_BonnetLaine_02_F"}, {"Skyline_HeadGear_BonnetLaine_03_F"}, {"Skyline_HeadGear_BonnetLaine_04_F"}, {"Skyline_HeadGear_BonnetLaine_05_F"}, {"Skyline_HeadGear_Cowboy_01_F"}, {"Skyline_HeadGear_Cowboy_03_F"}, {"Skyline_HeadGear_Cowboy_02_F"}, {"Skyline_HeadGear_Cowboy_04_F"}, {"Skyline_HeadGear_Cowboy_05_F"}, {"Skyline_HeadGear_Cowboy_06_F"}, {"Skyline_HeadGear_Chapka_02_F"}, {"Skyline_HeadGear_Chapka_01_F"}, {"Skyline_HeadGear_Chapka_04_F"}, {"Skyline_HeadGear_Chapka_05_F"}, {"Skyline_HeadGear_Chapka_03_F"}, {"H_C_Chapka_Bleue"}, {"H_C_Chapka_Noire"}, {"H_C_Chapka_Verte"}};
        goggles[] =
        {
            {"G_Spectacles_Tinted"}, {"G_Shades_Black"}, {"G_Shades_Blue"}, {"G_Tactical_Clear"}, {"G_Tactical_Black"}, {"G_Sport_Blackyellow"}, {"G_Sport_BlackWhite"}, {"G_Sport_Checkered"}, {"G_Sport_Red"}, {"G_Sport_Greenblack"}, {"G_Sport_Blackred"}, {"G_Shades_Red"}, {"G_Shades_Green"}, {"G_Goggles_VR"}, {"G_Spectacles"}, {"G_Squares"}, {"G_Squares_Tinted"}, {"G_EyeProtectors_Earpiece_F"}, {"G_EyeProtectors_F"}, {"G_Lady_Blue"}, {"G_WirelessEarpiece_F"}, {"G_Aviator"}
        };
    };
    class clothing_defolt2
    {
        displayName = "Магазин Дефолт бандитский";
        conditions = "";
        conditionsMessage = "";
        side = "civ";
        groupID = 0;
        headgear[] = {{"H_Bandanna_surfer"}, {"EF_HAT_BK"}, {"EF_HOOD_KA_B2"}, {"EF_HOOD_KA_B"}, {"Skyline_HeadGear_Bandana_01_F"}, {"Skyline_HeadGear_Bandana_02_F"}, {"Skyline_HeadGear_Bandana_03_F"}, {"Skyline_HeadGear_Bandana_04_F"}, {"Skyline_HeadGear_BandanaHead_01_F"}, {"Skyline_HeadGear_BandanaHead_02_F"}, {"Skyline_HeadGear_BandanaHead_03_F"}, {"Skyline_HeadGear_BandanaHead_04_F"}, {"Skyline_HeadGear_BandanaHead_05_F"}, {"Skyline_HeadGear_BandanaHead_06_F"}, {"Skyline_HeadGear_Bandana_05_F"}, {"Skyline_HeadGear_NBC_Hazmat_01_F"}, {"Skyline_HeadGear_BonnetLaine_01_F"}, {"Skyline_HeadGear_BonnetLaine_02_F"}, {"Skyline_HeadGear_BonnetLaine_03_F"}, {"Skyline_HeadGear_BonnetLaine_04_F"}, {"Skyline_HeadGear_BonnetLaine_05_F"}, {"Skyline_HeadGear_Cowboy_01_F"}, {"Skyline_HeadGear_Cowboy_03_F"}, {"Skyline_HeadGear_Cowboy_02_F"}, {"Skyline_HeadGear_Cowboy_04_F"}, {"Skyline_HeadGear_Cowboy_05_F"}, {"Skyline_HeadGear_Cowboy_06_F"}, {"Skyline_HeadGear_Chapka_02_F"}, {"Skyline_HeadGear_Chapka_01_F"}, {"Skyline_HeadGear_Chapka_04_F"}, {"Skyline_HeadGear_Chapka_05_F"}, {"Skyline_HeadGear_Chapka_03_F"}, {"H_C_Chapka_Bleue"}, {"H_C_Chapka_Noire"}, {"H_C_Chapka_Verte"}};
        goggles[] =
        {
            {"G_Spectacles_Tinted"}, {"G_Shades_Black"}, {"G_Shades_Blue"}, {"G_Tactical_Clear"}, {"G_Tactical_Black"}, {"G_Sport_Blackyellow"}, {"G_Sport_BlackWhite"}, {"G_Sport_Checkered"}, {"G_Sport_Red"}, {"G_Sport_Greenblack"}, {"G_Sport_Blackred"}, {"G_Shades_Red"}, {"G_Shades_Green"}, {"G_Goggles_VR"}, {"G_Spectacles"}, {"G_Squares"}, {"G_Squares_Tinted"}, {"G_EyeProtectors_Earpiece_F"}, {"G_EyeProtectors_F"}, {"G_Lady_Blue"}, {"G_WirelessEarpiece_F"}, {"G_Aviator"}
        };
    };
    class magaz_nechego
    {
        displayName = "magaz_nechego";
        conditions = "";
        conditionsMessage = "";
        side = "";
        groupID = 0;
        uniforms[] = {{"U_I_GhillieSuit"}, {"ENC_BP_HSG_GLP_OD"}, {"U_B_CTRG_Soldier_F"}, {"A3L_SuicideVest"}, {"mgsr_headbag"}, {"Skyline_Anonymous"}, {"GroupENC_h_ber_br"}, {"Skyline_Dallas"}, {"Skyline_Hoxton"}, {"Skyline_Corvo"}, {"EF_PBDF_M1"}, {"ENC_T_OD_PAD"}, {"GM_boneface_plain"}, {"G_Balaclava_TI_G_blk_F"}};
    };
    class exclusive_clothing
    {
        displayName = "";
        conditions = "";
        conditionsMessage = "";
        side = "";
        groupID = 0;
        uniforms[] = {};
        headgear[] = {};
        goggles[] = {};
        vests[] = {};
        backpacks[] = {};
    };
    class clothing_goggles
    {
        displayName = "Магазин Масок";
        conditions = "";
        conditionsMessage = "";
        side = "";
        groupID = 0;
        goggles[] =
        {
            {"G_Spectacles_Tinted"}, {"G_Shades_Black"}, {"G_Shades_Blue"}, {"G_Tactical_Clear"}, {"G_Tactical_Black"}, {"G_Sport_Blackyellow"}, {"G_Sport_BlackWhite"}, {"G_Sport_Checkered"}, {"G_Sport_Red"}, {"G_Sport_Greenblack"}, {"G_Sport_Blackred"}, {"G_Shades_Red"}, {"G_Shades_Green"}, {"G_Goggles_VR"}, {"G_Spectacles"}, {"G_Squares"}, {"G_Squares_Tinted"}, {"G_EyeProtectors_Earpiece_F"}, {"G_EyeProtectors_F"}, {"G_Lady_Blue"}, {"G_WirelessEarpiece_F"}, {"G_Aviator"}
        };
    };
    class clothing_BlackSnow
    {
        displayName = "Одежда Black Snow";
        conditions = "license_blacksnow";
        conditionsMessage = "";
        side = "civ";
        groupID = 6;
        uniforms[] = {{"BS_form_cadet"}, {"BS_form_fighter"}, {"BS_form_officer"}};
        headgear[] = {{"BS_Beret"}, {"BS_Cap"}};
        goggles[] = {{"RRPClothing_balaclava_1_BS"}, {"YG_Headset_NV"}};
        vests[] = {{"BS_Vest2"}, {"BS_vest"}};
        backpacks[] = {{"BS_Backpack"}};
    };
    class clothing_Cigane
    {
        displayName = "Одежда Cigane";
        conditions = "license_cigane";
        conditionsMessage = "";
        side = "civ";
        groupID = 6;
        uniforms[] = {{"RRPClothing_Uniform_Cigane_01"},{"RRPClothing_Uniform_Cigane_02"},{"RRPClothing_Uniform_Cigane_03"},{"RRPClothing_Uniform_Cigane_04"},{"RRPClothing_Uniform_Cigane_05"}};
        headgear[] = {{"RRPClothing_Headgear_Cigane_01"},{"RRPClothing_Headgear_Cigane_02"},{"RRPClothing_Headgear_Cigane_03"}};
        goggles[] = {};
        vests[] = {{"RRPClothing_Vest_Cigane_01"},{"RRPClothing_Vest_Cigane_02"},{"RRPClothing_Vest_Cigane_03"}};
        backpacks[] = {{"RRPClothing_Backpack_Cigane_01"},{"RRPClothing_Backpack_Cigane_02"}};
    };
    class clothing_InagawaKai
    {
        displayName = "Одежда Inagawa Kai";
        conditions = "license_inagawakai";
        conditionsMessage = "";
        side = "civ";
        groupID = 6;
        uniforms[] = {{"RRPClothing_Uniform_IK_01"},{"RRPClothing_Uniform_IK_02"},{"RRPClothing_Uniform_IK_03"},{"RRPClothing_Uniform_IK_04"}};
        headgear[] = {{"RRPClothing_Headgear_IK_01"},{"RRPClothing_Headgear_IK_02"},{"RRPClothing_Headgear_IK_03"},{"RRPClothing_Headgear_IK_04"}};
        goggles[] = {{"RRPClothing_Glasses_IK_01"}};
        vests[] = {{"RRPClothing_Vest_IK_01"},{"RRPClothing_Vest_IK_02"}};
        backpacks[] = {{"RRPClothing_Backpack_IK_01"},{"RRPClothing_Backpack_IK_02"}};
    };
    class clothing_blackwolves
    {
        displayName = "Одежда Black Wolves";
        conditions = "license_blackwolves";
        conditionsMessage = "";
        side = "civ";
        groupID = 6;
        uniforms[] = {{"my_biker"},{"my_biker1"},{"blackWolves_ia_soldier_01_viridian"},{"blackWolves_ia_soldier_01_gray"}};
        headgear[] = {{"blackWolves_drrpg_cowboyHat"}, {"blackWolves_TRYK_ESS_CAP"}};
        goggles[] = {{"blackWolves_Bandanna_viridian"}, {"blackWolves_Bandanna_gray"}};
        vests[] = {{"RRPClothing_vest_1_BlackWolves"}, {"blackWolves_Clueless_Vest_viridian"}, {"blackWolves_Clueless_Vest_gray"}};
        backpacks[] = {{"RRPClothing_backpack_1_BlackWolves"}, {"blackWolves_d3s_Claire_viridian"}, {"blackWolves_d3s_Claire_gray"}};
    };
    class clothing_lacosanostra
    {
        displayName = "Одежда la cosa nostra";
        conditions = "license_lacosanostra";
        conditionsMessage = "";
        side = "civ";
        groupID = 6;
        uniforms[] = {{"vvv_traje_ejecutivo_1"},{"Azar_Suit_ANZUS"},{"vvv_character_agente_472"}};
        headgear[] = {};
        goggles[] = {};
        vests[] = {{"RRPClothing_vest_1_lacosanostra"}};
        backpacks[] = {{"RRPClothing_backpack_1_LaCosaNostra"}};
    };
    class clothing_Sector
    {
        displayName = "Одежда Sector";
        conditions = "license_sector";
        conditionsMessage = "";
        side = "civ";
        groupID = 11;
        uniforms[] = {{"RRPClothing_uniform_1_Sector"},{"RRPClothing_uniform_2_Sector"},{"RRPClothing_uniform_3_Sector"}};
        headgear[] = {{"RRPClothing_cap_1_Sector"}, {"RRPClothing_cap_2_Sector"}, {"RRPClothing_cap_3_Sector"}};
        goggles[] = {{"RRPClothing_Glasses_1_Sector"},{"RRPClothing_Glasses_2_Sector"},{"RRPClothing_Glasses_3_Sector"}};
        vests[] = {{"RRPClothing_vest_1_Sector"},{"RRPClothing_vest_2_Sector"},{"RRPClothing_vest_3_Sector"}};
        backpacks[] = {{"RRPClothing_backpack_1_Sector"},{"RRPClothing_backpack_2_Sector"},{"RRPClothing_backpack_3_Sector"}};
    };

    class R_Escobaro_Clothing_Shop
    {
        displayName = "Одежда Escobaro";
        conditions = "license_escobaro";
        conditionsMessage = "";
        side = "civ";
        groupID = 12;
        uniforms[] = {{"RRPClothing_Uniform_Escobaro_01"},{"R_Clothing_Escobaro_02"},{"R_Clothing_Escobaro_03"},{"RRPClothing_Uniform_Escobaro_04"}};
        headgear[] = {{"RRPClothing_Headgear_Escobaro_01"},{"RRPClothing_Headgear_Escobaro_02"}};
        goggles[] = {{"RRPClothing_Glasses_Escobaro_01"},{"RRPClothing_Glasses_Escobaro_02"},{"RRPClothing_Glasses_Escobaro_03"},{"RRPClothing_Glasses_Escobaro_04"}};
        vests[] = {{"R_Vest_Escobaro_01"},{"R_Vest_Escobaro_02"}};
        backpacks[] = {{"R_Backpack_Escobaro_01"},{"RRPClothing_Backpack_Escobaro_02"}};
    };

    class RRP_Sumiyoshi_Clothing_Shop
    {
        displayName = "Одежда Sumiyoshi Kai";
        conditions = "license_sumiyoshi";
        conditionsMessage = "";
        side = "civ";
        groupID = 13;
        uniforms[] = {{"RRP_Uniform_Sumiyoshi_01"}, {"RRP_Uniform_Sumiyoshi_02"}, {"RRP_Uniform_Sumiyoshi_03"}};
        headgear[] = {{"RRP_Headgear_Sumiyoshi_01"}, {"RRP_Headgear_Sumiyoshi_02"}, {"RRP_Headgear_Sumiyoshi_03"}};
        goggles[] = {{"RRP_Glasses_Sumiyoshi_01"}};
        vests[] = {{"RRP_Vest_Sumiyoshi_01"}};
        backpacks[] = {{"RRP_Backpack_Sumiyoshi_01"}};
    };
};
