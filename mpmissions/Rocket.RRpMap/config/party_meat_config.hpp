class party_meat {
        minDeposit = 500;
        maxDeposit = 40000;
        comission = 5;
        rewardKill = 500;
        penaltyPenalty = 500;
        rewardUpLVL = 2000;

        //То что спавнится всем рандомно;
        randomWeapon[] = {
                "srifle_DMR_03_F",
                "srifle_DMR_03_multicam_F",
                "srifle_DMR_03_khaki_F",
                "srifle_DMR_03_tan_F",
                "srifle_DMR_03_woodland_F",
                "srifle_DMR_06_hunter_F",
                "srifle_DMR_06_camo_F",
                "srifle_DMR_06_olive_F",

                "arifle_AK12U_F",
                "arifle_AK12U_arid_F",
                "arifle_AK12U_lush_F",
                "arifle_AK12_F",
                "arifle_AK12_arid_F",
                "arifle_AK12_lush_F",
                "arifle_AKM_F",
                "arifle_SLR_D_RRPw",
                "arifle_SLR_RRPw",
                "arifle_Galat_RRPw",
                "arifle_Katiba_F",
                "arifle_Katiba_C_F",
                "arifle_Mk20_F",
                "arifle_Mk20_plain_F",
                "arifle_MX_F",
                "arifle_MX_khk_F",
                "arifle_MX_Black_F",
                "arifle_MSBS65_F",
                "arifle_MSBS65_black_F",
                "arifle_MSBS65_camo_F",
                "arifle_MSBS65_sand_F",
                "arifle_SPAR_01_blk_F",
                "arifle_SPAR_01_khk_F",
                "arifle_SPAR_01_snd_F",
                "arifle_TRG20_F",
                "arifle_TRG21_F",
                "arifle_ARX_blk_F",
                "arifle_ARX_ghex_F",
                "arifle_ARX_hex_F",
                "arifle_XMS_Base_RRPw",
                "arifle_XMS_Base_khk_RRPw",
                "arifle_XMS_Base_Sand_RRPw",
               
                "AKM_ADIDAS",
                "AKM_BODYA",
                "AKM_FACTOR",
                "AKM_FIALKA",
                "AKM_KLACKS",
                "AKM_VDOVEC",
                "AKM_VISHNYA",
                "AKM_VOLNA",

                "Skyline_AugA1_01_F",
                "Skyline_Fal_02_F",
                "Skyline_M4A1_01_F",
                "Skyline_M4A1_02_F",
                
                "M4A1_ANIME",
                "M4A1_BLOOD",
                "M4A1_EMO",
                "M4A1_KLACKS",
                "M4A1_MELLISK",
                "M4A1_URAN",
                "M4A1_VDOVEC",
                "M4A1_VOLTEC"
        };

        //Когда игрок много умирает, даем ему с каки-то шансом с этого списка для отыгрыша
        randomWeaponExlusive[] = {
                "Skyline_DP28_01_F",

                "srifle_GM6_F",
                "srifle_GM6_ghex_F",
                "srifle_GM6_camo_F",
                "srifle_LRR_F",
                "srifle_LRR_camo_F",
                "srifle_LRR_tna_F",
                "srifle_DMR_02_F",
                "srifle_DMR_02_camo_F",
                "srifle_DMR_02_sniper_F",
                "srifle_DMR_04_F",
                "srifle_DMR_04_Tan_F",

                "arifle_MX_SW_Black_F",
                "arifle_MX_SW_khk_F",
                "arifle_RPK12_F",
                "arifle_RPK12_arid_F",
                "arifle_RPK12_lush_F",

                "LMG_03_F",
                "LMG_Mk200_F",
                "LMG_Mk200_black_F",

                "MMG_01_tan_F",
                "MMG_01_hex_F",
                "MMG_02_black_F",
                "MMG_02_camo_F",
                "MMG_02_sand_F",
                
                "RRPWeapon_SVU"
        };

        //Когда дохуя скилловой, начинаем подсыпать хуйню, что бы усмирить
        randomWeaponNerf[] = {
                "sgun_HunterShotgun_01_F",
                "sgun_HunterShotgun_01_sawedoff_F",
                "Skyline_Arbalette_03_F",
                "hgun_PDW2000_F",
                "SMG_05_F",
                "SMG_02_F",
                "SMG_01_F",
                "Skyline_UMP45_01_F",
                "hgun_Pistol_heavy_01_F",
                "hgun_ACPC2_F",
                "hgun_P07_blk_F",
                "hgun_P07_khk_F",
                "hgun_Pistol_01_F",
                "hgun_Rook40_F",
                "hgun_Pistol_heavy_02_F"
        };

        //рандомная форма (Можешь добавлять все что хочешь, фановые вещи в том числе)
        uniforms[] = {
                "A3L_SpookyMummy",
                "A3L_SECRET",
                "A3L_Prisoner_Outfit",
                "vvv_character_alma",
                "rds_uniform_priest",
                "rds_uniform_Policeman",
                "mgsr_robe_muddy",
                "mgsr_robe_dirty",
                "mgsr_robe",
                "mgsr_robe_olive_muddy",
                "mgsr_robe_olive_dirty",
                "mgsr_robe_olive",
                "mgsr_robe_blue_muddy",
                "mgsr_robe_blue_dirty",
                "mgsr_robe_blue",

                "Skyline_Character_U_Pompier_02_F",
                "Skyline_Character_U_Pompier_01_F",
                "Skyline_Character_U_Chasseur_05_F",
                "Skyline_Character_U_Chasseur_02_F",
                "Skyline_Character_U_CivilE_07_F",
                "Skyline_Character_U_CivilE_06_F",
                "Skyline_Character_U_CivilE_05_F",
                "Skyline_Character_U_CivilE_04_F",
                "Skyline_Character_U_CivilE_03_F",
                "Skyline_Character_U_CivilE_02_F",
                "Skyline_Character_U_CivilE_01_F",
                
                "A3LCivPoloGreenOrange",
                "A3LCivPoloGreenGrey",
                "A3LCivPoloGreenGreen",
                "A3LCivPoloGreenBlack",
                
                "U_I_GhillieSuit",
                "U_O_GhillieSuit",
                "U_B_GhillieSuit",

                "U_C_Poloshirt_tricolour",
                "U_C_Poloshirt_stripped",
                "U_C_Poloshirt_salmon",
                "U_C_Poloshirt_redwhite",
                "U_C_Poloshirt_burgundy",
                "U_C_Poloshirt_blue",

                "U_I_C_Soldier_Bandit_1_F",
                "U_I_C_Soldier_Bandit_2_F",
                "U_I_C_Soldier_Bandit_3_F",
                "U_I_C_Soldier_Bandit_4_F",
                "U_I_C_Soldier_Bandit_5_F"
        };
        headgear[] = {
                "Snowman_Hat_Wearable",
                "Snowman_Enemy_Wearable",
                "Snowman_Hat_Wearable_M",
                "Snowman_Bucket_Wearable",
                
                "rds_worker_cap3",
                "rds_worker_cap2",
                "rds_worker_cap1",
                "rds_Villager_cap1",
                "rds_Villager_cap2",
                "rds_Villager_cap3",
                "rds_Woodlander_cap1",
                "rds_Woodlander_cap2",
                "rds_Woodlander_cap3",

                "H_Hat_tan",
                "H_Hat_grey",
                "H_Hat_checker",
                "H_Hat_camo",
                "H_Hat_brown",

                "H_Construction_headset_black_F",
                "H_Construction_headset_orange_F",
                "H_Construction_headset_red_F",
                "H_Construction_headset_vrana_F",
                "H_Construction_headset_yellow_F",
                
                "H_C_Chapka_Noire",
                "H_C_Chapka_Verte",
                "H_C_Chapka_Bleue",

                "Skyline_HeadGear_BonnetLaine_05_F",
                "Skyline_HeadGear_BonnetLaine_04_F",
                "Skyline_HeadGear_BonnetLaine_03_F",
                "Skyline_HeadGear_BonnetLaine_02_F",
                "Skyline_HeadGear_BonnetLaine_01_F"
        };
        goggles[] = {
                "G_Squares",
                "G_Squares_Tinted",
                "G_Sport_Greenblack",
                "G_Sport_Blackred",
                "G_Sport_Checkered",
                "G_Sport_BlackWhite",
                "G_Sport_Blackyellow",
                "G_Sport_Red",
                "G_Spectacles",
                "G_Shades_Red",
                "G_Shades_Green",
                "G_Shades_Blue",
                "G_Shades_Black",
                
                "Skyline_Wolf",
                "Skyline_Hoxton",
                "Skyline_Dallas",
                "Skyline_Corvo",
                "Skyline_Anonymous",
                
                "RRP_Bat_mask"
        };
        vests[] = {
                "V_CarrierRigKBT_01_Olive_F",
                "V_CarrierRigKBT_01_EAF_F",
                
                "V_CarrierRigKBT_01_light_Olive_F",
                "V_CarrierRigKBT_01_light_EAF_F",

                "V_CarrierRigKBT_01_heavy_Olive_F",
                "V_CarrierRigKBT_01_heavy_EAF_F",

                "V_PlateCarrier1_blk",
                "V_PlateCarrier1_rgr",
                "V_PlateCarrier1_rgr_noflag_F",
                "V_PlateCarrier1_tna_F",
                "V_PlateCarrier1_wdl",

                "V_PlateCarrier2_blk",
                "V_PlateCarrier2_rgr",
                "V_PlateCarrier2_rgr_noflag_F",
                "V_PlateCarrier2_tna_F",
                "V_PlateCarrier2_wdl"
        };
        backpacks[] = {
                "B_TacticalPack_blk",
                "B_TacticalPack_rgr",
                "B_TacticalPack_ocamo",
                "B_TacticalPack_mcamo",
                "B_TacticalPack_oli",

                "B_Kitbag_cbr",
                "B_Kitbag_rgr",
                "B_Kitbag_mcamo",
                "B_Kitbag_sgg",
                "B_Kitbag_tan",

                "B_FieldPack_blk",
                "B_FieldPack_cbr",
                "B_FieldPack_ocamo",
                "B_FieldPack_khk",
                "B_FieldPack_oli",
                "B_FieldPack_oucamo",

                "B_AssaultPack_blk",
                "B_AssaultPack_cbr",
                "B_AssaultPack_dgtl",
                "B_AssaultPack_rgr",
                "B_AssaultPack_ocamo",
                "B_AssaultPack_khk"
        };
};
