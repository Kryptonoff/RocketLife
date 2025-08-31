class CfgOnTakeItem
{
	class Weapons
	{

		class base 
		{
			condition = "(call life_donator) > 3 || license_outcast || license_rimas || license_kifo || license_constant || license_wolves || license_dl || license_ms || license_bears || license_cwrka || license_dl || license_phoenix || license_imperium || license_kasatky || license_sector || license_bs || license_cigane || license_escobaro || license_alpha || ('cop' call RRPClient_groups_getSideLevel) > 0";
		};

		/*Арендное и приватное оружие*/
		//[Год, месяц, число]
		class RRPWeapon_RPK12
		{
			condition = "([2021,11,20] call RRPClient_util_dateCompare AND license_rimas) OR {[2021,11,20] call RRPClient_util_dateCompare AND license_ms} OR {getPlayerUID player in ['76561198351236835','76561198191474441','76561198159190756','76561198972013042','76561198069078439','76561198157551141','76561198323021698','76561198109707602','76561198001830447','76561197999174375','76561197989379888','76561199028844328','76561198952139832','76561198262977672','76561198255904685','76561198296798181','76561198859526459','76561198108509544']}";
		
		};
		class RRPWeapon_RPK12_VIP {
			condition = "getPlayerUID player in ['76561198386787607','76561198087098430','76561198351236835','76561198191474441','76561198159190756','76561198972013042','76561198069078439','76561198157551141','76561198323021698','76561198109707602','76561198001830447','76561197999174375','76561197989379888','76561199028844328','76561198952139832','76561198262977672','76561198255904685','76561198296798181','76561198859526459','76561198108509544']";
		}
		
		class RRPWeapon_RPK12_76561199028844328 {
			condition = "getPlayerUID player in ['76561199028844328']";
		};

		class RRPWeapon_MXSW 
		{
			condition = "(getPlayerUID player in ['76561198125573410','76561198860385638'])";
		};

		class RRPWeapon_ZBROYAR	
		{
			condition = "(getPlayerUID player in ['76561198348083875','76561198141587109','76561199025637562','76561198207968335']) OR {[2099,01,01] call RRPClient_util_dateCompare AND license_rimas}";
		};

		class RRPWeapon_SPAR
		{
			condition = "([2099,01,01] call RRPClient_util_dateCompare AND license_rimas) OR {getPlayerUID player in ['76561198135691353','76561198020674138','76561198199874517','76561198869945650']}";
		};

		class RRPWeapon_RPG_7
		{
			condition = "([2021,10,29] call RRPClient_util_dateCompare AND license_constant) OR {[2022,03,03] call RRPClient_util_dateCompare AND license_wolves} OR {[2021,11,30] call RRPClient_util_dateCompare AND license_bs} OR {[2021,12,21] call RRPClient_util_dateCompare AND license_kifo} OR {license_rimas} OR {license_outcast} OR {license_phoenix} OR {[2021,12,21] call RRPClient_util_dateCompare AND license_ms} OR {license_sector} OR {license_escobaro} OR {(getPlayerUID player in ['76561198157551141','76561197999174375','76561198860385638','76561198191474441'])}";
		};
		class RRPWeapon_RPG_7_1:RRPWeapon_RPG_7{};
		class RRPWeapon_RPG_7_2:RRPWeapon_RPG_7{};
		class RRPWeapon_RPG_7_3:RRPWeapon_RPG_7{};
		class RRPWeapon_RPG_7_4:RRPWeapon_RPG_7{};	

		class TAC_V_Sheriff_BA_TB7 							{condition = "life_gov || license_admittance_gov";};
		class TAC_MTAP_BK2 									{condition = "life_gov || license_admittance_gov";};

		//Приватные SVU
		class RRPWeapon_SVU_stage_1 							{condition = "getPlayerUID player in ['76561198208668912','76561198150220371','76561198032200653','76561198366046837','76561198131519300','76561198805873784','76561198323021698','76561198860730941','76561199170440897','76561198077550247','76561198062312157','76561198974848738','76561198307108327','76561198339365067']";};
		class RRPWeapon_SVU_multicam_stage_1 					{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPWeapon_SVU_multicam_berezka 					{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPWeapon_SVU_multicam_stratis					{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPWeapon_SVU 									{condition = "getPlayerUID player in ['76561198377104523','76561199010373455','76561198159190756','76561199170440897','76561198131519300','76561198860730941','76561198860385638','76561198859382109','76561198802169420','76561198079435973','76561197999174375','76561198153186417','76561198859526459','76561198161381388','76561199028323202','76561198022595697','76561198068361408','76561199072206957']";};
		class RRPWeapon_SVU_Dragon 								{condition = "getPlayerUID player in ['76561198128078062','76561198068361408']";};
		class RRPWeapon_SVU_USA 								{condition = "getPlayerUID player in ['76523232322232322']";};
		class RRPWeapon_SVU_winter_stage_1 						{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPWeapon_SVU_greenCamo 							{condition = "getPlayerUID player in ['76561198022500941','76561198068361408','76561197987891570','76561197989379888']";};
		class RRPWeapon_SVU_redLine 							{condition = "getPlayerUID player in ['76561198069078439']";};
		class RRPWeapon_SVU_dl 									{condition = "getPlayerUID player in ['76561198141730344']";};
		class RRPWeapon_SVU_Multicam 							{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPWeapon_SVU_hunter 								{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPWeapon_SVU_stage_1_76561198984360169 			{condition = "getPlayerUID player in ['76561198938983683']";};
		class RRPWeapon_SVU_berezka 							{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRPWeapon_SVU_stage_1_76561198340144771			{condition = "getPlayerUID player in ['76561198442196391','76561198329559158']";};
		class RRPWeapon_SVU_76561198128078062 {condition = "getPlayerUID player in ['76561198128078062']";};
		class RRPWeapon_SVU_76561198805873784 {condition = "getPlayerUID player in ['76561198127126802','76561199146164370']";};

		class srifle_DMR_02_snipeX_zerg_hunter					{condition = "getPlayerUID player in ['76561198323021698','76561198255904685','76561198069078439','76561198281889630','76561198442196391','76561198220756480','76561198366046837','76561199028844328','76561198022500941','76561198199874517','76561198965376624','76561198805873784','76561198142906677','76561198067372219','76561198977600804','76561198039839945','76561198958641108','76561198859526459','76561199189042038','76561199003868334','76561199028323202','76561197989379888','76561198984360169','76561199072206957','76561198869945650']";};
		class muzzle_snds_338_black:srifle_DMR_02_snipeX_zerg_hunter{};

		//Police items
		class RRPWeapon_RPK12_PD	    {condition = "('cop' call RRPClient_groups_getSideLevel) > 9";};
		class RRPWeapon_SPAR_PD	        {condition = "('cop' call RRPClient_groups_getSideLevel) > 0";};
		class RRPWeapon_MXSW_PD	        {condition = "('cop' call RRPClient_groups_getSideLevel) > 8";};
		class RRPWeapon_RPG_7_PD	    {condition = "('cop' call RRPClient_groups_getSideLevel) > 0";};
		class DDOPP_15Rnd_X26 			{condition = "('cop' call RRPClient_groups_getSideLevel) > 0";};
		class RRP_women3_6	 		   	{condition = "('cop' call RRPClient_groups_getSideLevel) > 0";};
		class arifle_ARX_blk_F			{condition = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26, 32]";};
		class B_UAV_01_backpack_F		{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_press";};
		class RRP_belt_COP				{condition = "getPlayerUID player in ['76561198350158532','76561198432454931']  && ('cop' call RRPClient_groups_getSideLevel) > 0";};
		class RRP_belt_COP_winter		{condition = "getPlayerUID player in ['76561198350158532','76561198432454931']  && ('cop' call RRPClient_groups_getSideLevel) > 0";};
		class Cop_base_uniform			{condition = "(call compile (getText(getMissionConfig 'CfgOnTakeItem' >> 'Weapons' >> 'RRPClothing_bossform_black' >> 'condition'))) && {('cop' call RRPClient_groups_getSideLevel) > 0}";};
		class Cop_SWAT_uniform			{condition = "(call compile (getText(getMissionConfig 'CfgOnTakeItem' >> 'Weapons' >> 'RRPClothing_bossform_black' >> 'condition'))) && {('cop' call RRPClient_groups_getSideLevel) > 22}";};
		class Cop_base_vest				{condition = "(call compile (getText(getMissionConfig 'CfgOnTakeItem' >> 'Weapons' >> 'RRPClothing_vest_black' >> 'condition'))) && {('cop' call RRPClient_groups_getSideLevel) > 0}";};
		class Cop_SWAT_vest				{condition = "(call compile (getText(getMissionConfig 'CfgOnTakeItem' >> 'Weapons' >> 'RRPClothing_vest_black' >> 'condition'))) && {('cop' call RRPClient_groups_getSideLevel) > 22}";};
		class RM_SWAT_Helmet_01			{condition = "(call compile (getText(getMissionConfig 'CfgOnTakeItem' >> 'Weapons' >> 'RRPClothing_bossform_black' >> 'condition'))) && {('cop' call RRPClient_groups_getSideLevel) > 11}";};
		class Rimas_V_PlateCarrierL_CTRG_FBI_Y		{condition = "('cop' call RRPClient_groups_getSideLevel) > 0";};
		class RM_SWAT_Vest_01			{condition = "('cop' call RRPClient_groups_getSideLevel) > 15";};
		class swat_vest_camo_mk1        {condition = "('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26]";};
		class swat_vest_camo_mk2        {condition = "('cop' call RRPClient_groups_getSideLevel) in [25, 26]";};
		class B_UavTerminal				{condition = "('cop' call RRPClient_groups_getSideLevel) > 27";};
		class Skyline_Bouclier_01_F 	{condition = "('cop' call RRPClient_groups_getSideLevel) > 0";};
		class TAC_V_tacv1LC_FBI			{condition = "('cop' call RRPClient_groups_getSideLevel) > 17";};

		class hlc_rifle_awcovert_BL		{condition = "getPlayerUID player in ['76561198095797478','76561199076333332','76561198188202166','76561198116644964','76561198351236835','76561198307108327','76561198122788982','76561198039839945','76561198323021698','76561198128078062','76561198075443139','76561198068361408','76561198108509544','76561198237666076']";};
		class hlc_rifle_awcovert_FDE    :hlc_rifle_awcovert_BL{};
		class hlc_rifle_awcovert    	:hlc_rifle_awcovert_BL{};


		//Персональные и ГРПшные маски
		class GM_boneface_thirst 					{condition = "license_cigane";};
		class max_facehugger_mask					{condition = "getPlayerUID player in ['76561198108509544']";};
		class RRPClothing_mask_76561198841074225 	{condition = "getPlayerUID player in ['76561199170440897']";};
		class GM_boneface_desert					{condition = "license_ms";};
		class aot_mask_bfs							{condition = "license_alpha";};
		class aot_mask_rio							{condition = "license_phoenix";};
		class aot_mask_t_wood 	     				{condition = "license_dl";};


		//7news
		class camerach_weap_tv			{condition = "license_press";};
		class XZ_CamRecorder_2 			{condition = "license_press";};
		class XZ_CamRecorder_1			{condition = "license_press";};
		class Xnooz_AppareilPhoto		{condition = "license_press";};
		class Xnooz_micro2 				{condition = "license_press";};
		class Xnooz_micro1 				{condition = "license_press";};
		class microch_weap_tv 			{condition = "license_press";};
		class C_UAV_06_backpack_F 		{condition = "license_press";};
		class RRPVest_7news_01			{condition = "license_press";};
		class V_G_Ceinturon 			{condition = "('med' call RRPClient_groups_getSideLevel) >= 1";};


		class TAXI_backpack {condition = "license_taxi";};

		//Оружие которая привязанно только к ГРП
		class MXM_kasatli_1				{condition = "license_kasatky";};
		class AK_12_p1         			{condition = "license_kasatky";};
		class AKA_12_esk 				{condition = "license_escobaro";};
		class SPAR_16_Kasatki			{condition = "license_kasatky";};
		class AKA_12_BW					{condition = "license_sector";};


		class RRPw_H_turban_03_gray		{condition = "getPlayerUID player in ['76561198051671319']";};
		class U_RRPw_C_Djella_05		{condition = "getPlayerUID player in ['76561198051671319']";};
		class G_Combat_RRPw		{condition = "getPlayerUID player in ['76561198051671319']";};

		class H_RacingHelmet_4_F		{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_Helmet_76561198984360169_1		{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_Helmet_76561198984360169_2		{condition = "call compile getText(getMissionConfig 'CfgOnTakeItem' >> 'Weapons' >> 'RRPClothing_Helmet_76561198984360169_1' >> 'condition')";};
		class RRPClothing_Helmet_76561198984360169_3		{condition = "call compile getText(getMissionConfig 'CfgOnTakeItem' >> 'Weapons' >> 'RRPClothing_Helmet_76561198984360169_1' >> 'condition')";};
		class Skyline_HeadGear_Cowboy_03_F		{condition = "getPlayerUID player in ['76561198347030763']";};
		class RRPClothing_glasses_umbrella_2	{condition = "license_bears";};

		class Rangefinder        	    {condition = "getPlayerUID player in ['76561198040706481','76561198805873784','76561198432150645','76561198039839945','76561198069078439','76561198001830447','76561198432454931','76561198432454931','76561198021215307','76561198307108327','76561197984276591','76561198860385638','76561198141730344','76561199003868334','76561199170440897','76561198262977672','76561198237666076','76561198213135992','76561198067372219','76561198052440866','76561198022595697','76561199028844328','76561199072206957','76561198199874517','76561198068361408','76561198984360169','76561198357268475','76561198161381388','76561198128078062','76561198039610087','76561198323021698','76561197989379888','76561198869945650','76561198366046837']";};
		class DW_ZAHAR					{condition = "getPlayerUID player in ['76561198199874517']";};
		class Boss_Pheonix				{condition = "getPlayerUID player in ['76561198432454931']";};
		class Boss2_Pheonix				{condition = "getPlayerUID player in ['76561198432454931']";};
		class IMPERIUM_Boss_hat			{condition = "getPlayerUID player in ['76561198869945650']";};

		class SK_Enno_Uniform_1			{condition = "getPlayerUID player in ['76561198974848735']";};
		class SK_Enno_Uniform_R			{condition = "getPlayerUID player in ['76561198974848735']";};
		class SK_Enno_Vest_1			{condition = "getPlayerUID player in ['76561198974848735']";};
		class SK_Enno_Vest_R			{condition = "getPlayerUID player in ['76561198974848735']";};
		class Enno_belt_R				{condition = "getPlayerUID player in ['76561198974848735']";};
		class Enno_belt_P				{condition = "getPlayerUID player in ['76561198974848735']";};
	
		class RRPClothing_bossform_001	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_vest_001		{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_bossform_002	{condition = "getPlayerUID player in ['76561198432454931']";};
		class RRPClothing_vest_002		{condition = "getPlayerUID player in ['76561198432454931']";};
		class RRPClothing_bossform_003	{condition = "getPlayerUID player in ['76561198296798181']";};
		class RRPClothing_vest_003		{condition = "getPlayerUID player in ['76561198296798181']";};

		class SK_Boss_Uniform_1			{condition = "getPlayerUID player in ['76561198869945650']";};
		class SK_Boss_Uniform_2			{condition = "getPlayerUID player in ['76561198869945650']";};
		class SK_Boss_Uniform_3			{condition = "getPlayerUID player in ['76561198869945650']";};
		class SK_Boss_Vest_1			{condition = "getPlayerUID player in ['76561198869945650']";};
		class SK_Boss_Vest_2			{condition = "getPlayerUID player in ['76561198869945650']";};
		class SK_Boss_Vest_3			{condition = "getPlayerUID player in ['76561198869945650']";};

		class KS_Boss_Vest_1			{condition = "getPlayerUID player in ['76561198432454931']";};
		class KS_booss_belt_B			{condition = "getPlayerUID player in ['76561198432454931']";};


		class G_Balaclava_blk					{condition = "getPlayerUID player in ['76561197989379888','76561198039839945','76561198965376624','76561198335816608','76561198216298929','76561199028844328','76561197987891570','76561198131519300','76561198977600804','76561198872768491','76561198432454931','76561198155739510','76561198032200653','76561198807233015','76561198068361408'] && ('cop' call RRPClient_groups_getSideLevel) > 0";};
		class RRPClothing_bossform_black		{condition = "getPlayerUID player in ['76561198257233941','76561198208668912','76561199076333332','76561198110313619','76561198117876487','76561198087098430','76561198296798181','76561198040706481','76561198258556220','76561199028323202','76561198377104523','76561198083697949','76561198067372219','76561198148968668','76561198853962174','76561199111683738','76561198191474441','76561198136715560','76561198974081965','76561198972013042','76561198357231237','76561198863564880','76561198108509544','76561198127805660','76561198157551141','76561198077550247','76561198314820360','76561198967112367','76561198393593751','76561198329559158','76561198302369767','76561198965376624','76561198039839945','76561197989379888','76561198159190756','76561198335816608','76561198216298929','76561199028844328','76561198350158532','76561198131519300','76561198306196687','76561198977600804','76561198432454931','76561198807233015','76561198872768491','76561199170440897','76561198128078062','76561198144261492','76561198174890719','76561198155739510','76561198032200653','76561198068361408','76561198845783102','76561198097657133','76561199189042038','76561199072206957']";};

		class RRPClothing_bossform_PD_default_1:Cop_base_uniform{};
		class RRPClothing_bossform_PD_default_2:Cop_base_uniform{};
		class RRPClothing_bossform_PD_gra:Cop_base_uniform{};
		class RRPClothing_bossform_PD_green:Cop_base_uniform{};
		class RRPClothing_bossform_PD_winter:Cop_base_uniform{};
		class RRPClothing_vest_PD_default_1:Cop_base_vest{};
		class RRPClothing_vest_PD_default_2:Cop_base_vest{};
		class RRPClothing_vest_PD_gray:Cop_base_vest{};
		class RRPClothing_vest_PD_green:Cop_base_vest{};
		class RRPClothing_vest_PD_winter:Cop_base_vest{};

		class bossuniform_swat_camo:Cop_SWAT_vest{};
		class bossuniform_fbi_black:Cop_SWAT_vest{};
		class bossvest_swat_camo:Cop_SWAT_vest{};
		class bossvest_fbi_black:Cop_SWAT_vest{};


		// Outcast
		class RRP_V_Pocketed_2 {condition = "license_outcast";};
		class RRP_V_Pocketed_3: RRP_V_Pocketed_2 {};
		class RRP_V_Pocketed_4: RRP_V_Pocketed_2 {};
		class RRP_V_Pocketed_5: RRP_V_Pocketed_2 {};
		class RRP_V_Pocketed_6: RRP_V_Pocketed_2 {};
		class RRP_V_Pocketed_7: RRP_V_Pocketed_2 {};
		class RRP_V_Pocketed_8: RRP_V_Pocketed_2 {};


		//БОСФОРМА//
		class H_HelmetO_ViperSP_hex_F_aucV 			 {condition = "getPlayerUID player in ['76561198087098430','76561198441495005','76561197999174375','76561198859526459','76561198984360169','76561198965376624']";};
		class H_HelmetO_ViperSP_ghex_F				 {condition = "getPlayerUID player in ['76561198805873784','76561199189042038','76561199072206957','76561198984360169']";};
		class RRPClothing_helmet_76561198841074225_1 {condition = "getPlayerUID player in ['76561199028323202']";};
		class RRPClothing_helmet_76561198087098430_1 {condition = "getPlayerUID player in ['76561198087098430']";};
		class RRPClothing_helmet_76561198841074225_2 {condition = "getPlayerUID player in ['76561199028323202']";};
		class RRPClothing_helmet_76561198841074225_3 {condition = "getPlayerUID player in ['76561199028323202']";};
		class Headgear_H_HelmetSpecO_ghex_F: H_HelmetO_ViperSP_hex_F_aucV {};
		class RRPClothing_Helmet_76561198871196391 {condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_Helmet_1_76561198859526459 {condition = "getPlayerUID player in ['76561198871196391']";};
		class RRPClothing_Helmet_2_76561198859526459 {condition = "getPlayerUID player in ['76561198871196391']";};
		class RRPClothing_HelmetMoto_76561198442196391 {condition = "getPlayerUID player in ['76561198442196391']";};
		class RRPClothing_HelmetMoto_76561198442196391_2 {condition = "getPlayerUID player in ['76561198442196391']";};
		class RRPClothing_Helmet_76561198150220371 {condition = "getPlayerUID player in ['76561198150220371']";};
		class RRPClothing_Helmet_76561198366046837 {condition = "getPlayerUID player in ['76561198366046837']";};
		class RRPClothing_Helmet_76561198366046837_2 {condition = "getPlayerUID player in ['76561198366046837']";};

		class GM_boneface_ms13 {condition = "getPlayerUID player in ['76561198062312157']";};

		class RRPClothing_shemag_76561199072206957_1 {condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_shemag_76561199072206957_2 {condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_shemag_76561199072206957_3 {condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_shemag_76561199072206957_4 {condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_shemag_76561198860385638 {condition = "getPlayerUID player in ['76561198860385638']";};

		class rrp_wrench								{condition = "getPlayerUID player in ['76561198150220371']";};
		class TRYK_H_ghillie_over_green					{condition = "getPlayerUID player in ['76561199189042038','76561198805873784','76561198366046837','76561199170440897','76561198859526459','76561198255904685','76561199028323202','76561199003868334','76561197989379888']";};

		class RRPClothing_bossform_ms13					{condition = "getPlayerUID player in ['76561198432150645','76561198079435973','76561198283449875','76561198957651238','76561198192152205','76561198021215307','76561198307108327','76561198451950334','76561199189042038','76561198038717563','76561198153186417','76561198220756480','76561198974848738','76561199072206957','76561198339365067','76561198127126802','76561198142906677','76561198805873784','76561198984360169','76561198062312157'] && license_ms";};
		class RRPClothing_bossform_Bears				{condition = "getPlayerUID player in ['76561198136715560','76561198191474441','76561199111683738','76561198853962174']";};
		class RRPClothing_bossform_76561199076333332_1	{condition = "getPlayerUID player in ['76561199076333332']";};
		class RRPClothing_bossform_76561198208668912_1	{condition = "getPlayerUID player in ['76561198208668912']";};
		class RRPClothing_bossform_76561198841074225	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPClothing_bossform_76561199003868334	{condition = "getPlayerUID player in ['76561198872768491']";};
		class RRPClothing_bossform_76561198805873784	{condition = "getPlayerUID player in ['76561198805873784']";};
		class RRPClothing_bossform2_76561198805873784	{condition = "getPlayerUID player in ['76561198805873784']";};
		class RRPClothing_bossform_76561198957651238	{condition = "getPlayerUID player in ['76561198957651238']";};
		class RRPClothing_bossform_76561198859526459	{condition = "getPlayerUID player in ['76561198859526459']";};
		class RRPClothing_bossform_2_76561198859526459	{condition = "getPlayerUID player in ['76561198859526459']";};
		class RRPClothing_bossform_76561198327404632	{condition = "getPlayerUID player in ['76561198327404632']";};
		class RRPClothing_bossform_76561198053228015	{condition = "getPlayerUID player in ['76561198131519300']";};
		class RRPClothing_bossform_76561198974081965	{condition = "getPlayerUID player in ['76561198062312157']";};
		class RRPClothing_bossform_76561918296798181	{condition = "getPlayerUID player in ['76561198296798181']";};
		class RRPClothing_bossform_76561198064845403	{condition = "getPlayerUID player in ['76561198064845403']";};
		class RRPClothing_bossform_76561198823258450	{condition = "getPlayerUID player in ['76561198823258450']";};
		class RRPClothing_bossform_76561198871196391	{condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_bossform_76561199028844328	{condition = "getPlayerUID player in ['76561199028844328']";};
		class RRPClothing_bossform_76561199028844328_1	{condition = "getPlayerUID player in ['76561199028844328']";};
		class RRPClothing_bossform_76561198006239186	{condition = "getPlayerUID player in ['76561198220756480']";};
		class RRPClothing_bossform_76561198199874517	{condition = "getPlayerUID player in ['76561198199874517']";};
		class RRPClothing_bossform_1_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_bossform_2_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_bossform_3_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_bossform_4_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_bossform_76561198974848738	{condition = "getPlayerUID player in ['76561198974848738']";};
		class RRPClothing_bossform_76561197989379888	{condition = "getPlayerUID player in ['76561197989379888']";};
		class RRPClothing_bossform_76561198442242729	{condition = "getPlayerUID player in ['76561198442242729']";};
		class RRPClothing_bossform_76561198141465562	{condition = "getPlayerUID player in ['76561198141465562']";};
		class RRPClothing_bossform_76561197987891570	{condition = "getPlayerUID player in ['76561198306196687']";};
		class RRPClothing_bossform_76561198038717563	{condition = "getPlayerUID player in ['76561198038717563']";};
		class RRPClothing_bossform_76561198437378792	{condition = "getPlayerUID player in ['76561198879751513']";};
		class RRPClothing_bossform_76561198871196391_2	{condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_bossform_76561198067372219	{condition = "getPlayerUID player in ['76561198164414200']";};
		class RRPClothing_bossform_76561198964046553	{condition = "getPlayerUID player in ['76561198451950334']";};
		class RRPClothing_bossform2_76561198964046553	{condition = "getPlayerUID player in ['76561198451950334']";};
		class RRPClothing_bossform3_76561198964046553	{condition = "getPlayerUID player in ['76561198451950334']";};
		class RRPClothing_bossform_76561198872768491	{condition = "getPlayerUID player in ['76561198872768491']";};
		class RRPClothing_bossform_Cat					{condition = "getPlayerUID player in ['76561198977600804']";};
		class RRPClothing_bossform_76561198173827573	{condition = "getPlayerUID player in ['76561198173827573']";};
		class RRPClothing_bossform_76561198346300305	{condition = "getPlayerUID player in ['76561198972013042']";};
		class RRPClothing_bossform_76561198142906677	{condition = "getPlayerUID player in ['76561198142906677']";};
		class RRPClothing_bossform_76561198158866775	{condition = "getPlayerUID player in ['76561198158866775']";};
		class RRPClothing_bossform_76561198974468599	{condition = "getPlayerUID player in ['76561198974468599']";};
		class RRPClothing_bossform_76561198039839945	{condition = "getPlayerUID player in ['76561198039839945']";};
		class RRPClothing_bossform_76561198237666076	{condition = "getPlayerUID player in ['76561198237666076']";};
		class RRPClothing_bossform_76561198301968766	{condition = "getPlayerUID player in ['76561198302369767']";};
		class RRPClothing_bossform_76561198201177746	{condition = "getPlayerUID player in ['76561198339365067']";};
		class RRPClothing_bossform_76561198218960275	{condition = "getPlayerUID player in ['76561198218960275']";};
		class RRPClothing_bossform_76561198022500941	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRPClothing_bossform_76561198022500941_2	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRPClothing_bossform_76561198130365000	{condition = "getPlayerUID player in ['76561198393593751']";};
		class RRPClothing_bossform2_76561198022500941	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRPClothing_bossform_76561199057436365	{condition = "getPlayerUID player in ['76561198192152205']";};
		class RRPClothing_bossform_76561199071721547	{condition = "getPlayerUID player in ['76561199071721547']";};
		class RRPClothing_bossform_76561198020674138	{condition = "getPlayerUID player in ['76561198020674138']";};
		class RRPClothing_bossform_76561198150220371	{condition = "getPlayerUID player in ['76561198150220371']";};
		class RRPClothing_bossform_76561198860385638	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRPClothing_bossform_76561198860385638_1	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRPClothing_bossform_76561198860385638_3	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRPClothing_bossform_76561198127126802	{condition = "getPlayerUID player in ['76561198127126802']";};
		class RRPClothing_bossform_76561198127180830	{condition = "getPlayerUID player in ['76561198127180830']";};
		class RRPClothing_bossform_76561198307108327	{condition = "getPlayerUID player in ['76561198307108327']";};
		class RRPClothing_bossform_76561198021215307	{condition = "getPlayerUID player in ['76561198021215307']";};
		class RRPClothing_bossform_76561197999174375	{condition = "getPlayerUID player in ['76561197999174375']";};
		class RRPClothing_bossform_76561198105732558	{condition = "getPlayerUID player in ['76561198105732558']";};
		class RRPClothing_bossform_76561198141730344	{condition = "getPlayerUID player in ['76561198141730344']";};
		class RRPClothing_bossform_76561198022595697	{condition = "getPlayerUID player in ['76561198022595697']";};
		class RRPClothing_bossform_76561198257233941	{condition = "getPlayerUID player in ['76561198257233941']";};
		class RRPClothing_bossform_76561198296798181	{condition = "getPlayerUID player in ['76561198296798181']";};
		class RRPClothing_bossform_76561198350158532	{condition = "getPlayerUID player in ['76561198350158532']";};
		class RRPClothing_bossform_76561198150220371_1	{condition = "getPlayerUID player in ['76561198150220371']";};
		class RRPClothing_bossform_76561198258556220	{condition = "getPlayerUID player in ['76561198258556220']";};
		class RRPClothing_bossform_76561198258556220_1	{condition = "getPlayerUID player in ['76561198258556220']";};
		class RRPClothing_bossform_76561198441495005	{condition = "getPlayerUID player in ['76561198330135328']";};
		class RRPClothing_bossform_5_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_bossform_76561198377104523	{condition = "getPlayerUID player in ['76561198377104523']";};
		class RRPClothing_bossform_76561198965376624	{condition = "getPlayerUID player in ['76561198965376624']";};
		class RRPClothing_bossform_76561198802169420	{condition = "getPlayerUID player in ['76561198802169420']";};
		class RRPClothing_bossform_76561198802169420_2	{condition = "getPlayerUID player in ['76561198802169420']";};
		class RRPClothing_bossform_76561198802169420_1	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPClothing_bossform_76561198141465562_1	{condition = "getPlayerUID player in ['76561198141465562']";};
		class RRPClothing_bossform_76561198377104523_1	{condition = "getPlayerUID player in ['76561198377104523']";};
		class RRPClothing_bossform_76561198218960275_1	{condition = "getPlayerUID player in ['76561198218960275']";};
		class RRPClothing_bossform_76561198150220371_2	{condition = "getPlayerUID player in ['76561198150220371']";};
		class RRPClothing_bossform_76561198032374832	{condition = "getPlayerUID player in ['76561198153186417']";};
		class RRPClothing_bossform_76561198858275213_1	{condition = "getPlayerUID player in ['76561198858275213']";};
		class RRPClothing_bossform_76561198157551141	{condition = "getPlayerUID player in ['76561198157551141']";};
		class RRPClothing_bossform_76561198099037940	{condition = "getPlayerUID player in ['76561198430124432']";};
		class RRPClothing_bossform_76561198432150645	{condition = "getPlayerUID player in ['76561198432150645']";};
		class RRPClothing_bossform_76561198432150645_2	{condition = "getPlayerUID player in ['76561198432150645']";};
		class RRPClothing_bossform_76561199003868334_2	{condition = "getPlayerUID player in ['76561199003868334']";};
		class RRPClothing_bossform_76561198188797329	{condition = "getPlayerUID player in ['76561198188797329']";};
		class RRPClothing_bossform_76561198964046553_2	{condition = "getPlayerUID player in ['76561198302369767']";};
		class RRPClothing_bossform_76561198176273826	{condition = "getPlayerUID player in ['76561198176273826']";};
		class RRPClothing_bossform_76561198091711858	{condition = "getPlayerUID player in ['76561198091711858']";};
		class RRPClothing_bossform_76561198965376624_2	{condition = "getPlayerUID player in ['76561198965376624']";};
		class RRPClothing_bossform_76561198188797329_2	{condition = "getPlayerUID player in ['76561198188797329']";};
		class RRPClothing_bossform_76561199028323202	{condition = "getPlayerUID player in ['76561199028323202']";};
		class RRPClothing_bossform_76561199025637562	{condition = "getPlayerUID player in ['76561198077550247']";};
		class RRPClothing_bossform_76561198130879772_2	{condition = "getPlayerUID player in ['76561198192152205']";};
		class RRPClothing_bossform_76561198204496453	{condition = "getPlayerUID player in ['76561198204496453']";};
		class RRPClothing_bossform_alpha_berezka		{condition = "getPlayerUID player in ['76561198974081965','76561198335816608','76561198860385638','76561199170440897','76561198176273826','76561198039839945','76561198218960275','76561198872768491','76561198141465562','76561198141465562','76561198965376624','76561199028323202','76561198377104523']";};
		class RRPClothing_bossform_76561198841074225_1	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPClothing_bossform_76561198841074225_2	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPClothing_bossform_76561198841074225_3	{condition = "getPlayerUID player in ['76561199028323202','76561199170440897']";};
		class RRPClothing_bossform_76561198067372219_1	{condition = "getPlayerUID player in ['76561198329559158']";};
		class RRPClothing_bossform_76561198130879772_3	{condition = "getPlayerUID player in ['76561198192152205']";};
		class RRPClothing_bossform_76561199003868334_3	{condition = "getPlayerUID player in ['76561199003868334']";};
		class RRPClothing_bossform_76561198069078439	{condition = "getPlayerUID player in ['76561198069078439']";};
		class RRPClothing_bossform_76561198255904685	{condition = "getPlayerUID player in ['76561198255904685']";};
		class RRPClothing_bossform_76561199072206957_3	{condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_bossform_76561198327404632_1	{condition = "getPlayerUID player in ['76561198327404632']";};
		class RRPClothing_bossform_76561198283449875	{condition = "getPlayerUID player in ['76561198283449875']";};
		class RRPClothing_bossform_76561199113587031	{condition = "getPlayerUID player in ['76561199189042038']";};
		class RRPClothing_bossform_76561198845783102_1	{condition = "getPlayerUID player in ['76561198845783102']";};
		class RRPClothing_bossform_76561198958641108_1	{condition = "getPlayerUID player in ['76561198958641108']";};
		class RRPClothing_bossform_76561198958641108_2	{condition = "getPlayerUID player in ['76561198958641108']";};
		class RRPClothing_bossform_76561199131209280_1	{condition = "getPlayerUID player in ['76561198851983856']";};
		class RRPClothing_bossform_76561198097657133_1	{condition = "getPlayerUID player in ['76561198097657133']";};
		class RRPClothing_bossform_76561199189042038_1	{condition = "getPlayerUID player in ['76561199189042038']";};
		class RRPClothing_bossform_76561199189042038_2	{condition = "getPlayerUID player in ['76561199189042038']";};
		class RRPClothing_bossform_76561198357231237_1	{condition = "getPlayerUID player in ['76561198357231237']";};
		class RRPClothing_bossform_76561198366046837_1	{condition = "getPlayerUID player in ['76561198366046837']";};
		class RRPClothing_bossform_76561198366046837_2	{condition = "getPlayerUID player in ['76561198366046837']";};
		class RRPClothing_bossform_76561198323021698_1	{condition = "getPlayerUID player in ['76561198323021698']";};
		class RRPClothing_bossform_76561198442196391_1	{condition = "getPlayerUID player in ['76561198442196391']";};
		class RRPClothing_bossform_76561198442196391_2	{condition = "getPlayerUID player in ['76561198442196391']";};
		class RRPClothing_bossform_76561198320611154_1	{condition = "getPlayerUID player in ['76561198879751513']";};
		class RRPClothing_bossform_76561198263454004_1	{condition = "getPlayerUID player in ['76561198095797478']";};
		class RRPClothing_bossform_76561198095797478_1	{condition = "getPlayerUID player in ['76561198095797478']";};
		class RRPClothing_bossform_76561199028323202_imperium_1	{condition = "getPlayerUID player in ['76561198335816608','76561199028323202']";};
		class RRPClothing_bossform_76561198377104523_imperium_1	{condition = "getPlayerUID player in ['76561198377104523']";};
		class RRPClothing_bossform_76561199010373455_imperium_1	{condition = "getPlayerUID player in ['76561198974081965']";};
		class RRPClothing_bossform_76561198351236835_1	{condition = "getPlayerUID player in ['76561198879751513']";};
		class RRPClothing_bossform_76561198351236835_2	{condition = "getPlayerUID player in ['76561198879751513']";};
		class RRPClothing_bossform_76561198167204546_1	{condition = "getPlayerUID player in ['76561198167204546']";};
		class RRPClothing_bossform_76561198167204546_2	{condition = "getPlayerUID player in ['76561198167204546']";};
		class RRPClothing_bossform_76561198167204546_3	{condition = "getPlayerUID player in ['76561198167204546']";};
		class RRPClothing_bossform_76561198048514367_1	{condition = "getPlayerUID player in ['76561198048514367']";};
		class RRPClothing_bossform_76561198441495005_1	{condition = "getPlayerUID player in ['76561198441495005']";};
		class RRPClothing_bossform_76561198281889630_1	{condition = "getPlayerUID player in ['76561198281889630']";};
		class RRPClothing_bossform_76561199100722385_1	{condition = "getPlayerUID player in ['76561199146164370']";};
		class RRPClothing_bossform_76561198040706481_1	{condition = "getPlayerUID player in ['76561198040706481']";};
		class RRPClothing_bossform_76561198820338106_1	{condition = "getPlayerUID player in ['76561198820338106']";};
		class RRPClothing_bossform_76561198820338106_2	{condition = "getPlayerUID player in ['76561198820338106']";};
		class RRPClothing_bossform_76561198040706481_2	{condition = "getPlayerUID player in ['76561198040706481']";};
		class RRPClothing_bossform_76561198087098430_1	{condition = "getPlayerUID player in ['76561198087098430']";};
		class RRPClothing_bossform_76561198863564880_1	{condition = "getPlayerUID player in ['76561198863564880']";};

		
		//Boss vest
		class RRPClothing_vest_black				{condition = "getPlayerUID player in ['76561198257233941','76561199141246399','76561198208668912','76561199076333332','76561198296798181','76561198040706481','76561198037838704','76561198258556220','76561199028323202','76561198377104523','76561198083697949','76561198067372219','76561198148968668','76561198853962174','76561199111683738','76561198191474441','76561198136715560','76561198974081965','76561198972013042','76561198357231237','76561198863564880','76561198108509544','76561198127805660','76561198157551141','76561198077550247','76561198314820360','76561198967112367','76561198393593751','76561198329559158','76561198302369767','76561198965376624','76561198039839945','76561197989379888','76561198159190756','76561198335816608','76561198216298929','76561199028844328','76561198350158532','76561198131519300','76561198306196687','76561198977600804','76561198432454931','76561198087098430','76561198872768491','76561199170440897','76561198128078062','76561198144261492','76561198174890719','76561198155739510','76561198032200653','76561198068361408','76561198845783102','76561198097657133','76561199189042038','76561199072206957']";};
		class RRPClothing_vest_ms13					{condition = "call compile getText(getMissionConfig 'CfgOnTakeItem' >> 'Weapons' >> 'RRPClothing_bossform_ms13' >> 'condition')";};
		class RRPClothing_vest_Bears				{condition = "getPlayerUID player in ['76561198136715560','76561198191474441','76561199111683738','76561198853962174']";};
		class RRPClothing_vest_76561198208668912_1	{condition = "getPlayerUID player in ['76561198208668912']";};
		class RRPClothing_vest_76561199141246399_1	{condition = "getPlayerUID player in ['76561199141246399']";};
		class RRPClothing_vest_76561198841074225	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPClothing_vest_76561199003868334	{condition = "getPlayerUID player in ['76561198872768491']";};
		class RRPClothing_vest_76561198805873784	{condition = "getPlayerUID player in ['76561198805873784']";};
		class RRPClothing_vest2_76561198805873784	{condition = "getPlayerUID player in ['76561198805873784']";};
		class RRPClothing_vest_76561198416388047	{condition = "getPlayerUID player in ['76561198972013042']";};
		class RRPClothing_vest_76561198957651238	{condition = "getPlayerUID player in ['76561198957651238']";};
		class RRPClothing_vest_76561198859526459	{condition = "getPlayerUID player in ['76561198879751513','76561198859526459']";};
		class RRPClothing_vest_2_76561198859526459	{condition = "getPlayerUID player in ['76561198859526459']";};
		class RRPClothing_vest_76561198442242729	{condition = "getPlayerUID player in ['76561198442242729']";};
		class RRPClothing_vest_76561198327404632	{condition = "getPlayerUID player in ['76561198327404632']";};
		class RRPClothing_vest_76561198125719300	{condition = "getPlayerUID player in ['76561198125719300']";};
		class RRPClothing_vest_76561198053228015	{condition = "getPlayerUID player in ['76561198131519300']";};
		class RRPClothing_vest_76561918296798181	{condition = "getPlayerUID player in ['76561198296798181']";};
		class RRPClothing_vest_76561198974081965	{condition = "getPlayerUID player in ['76561198062312157']";};
		class RRPClothing_vest_76561198064845403	{condition = "getPlayerUID player in ['76561198064845403']";};
		class RRPClothing_vest_76561198823258450	{condition = "getPlayerUID player in ['76561198823258450']";};
		class RRPClothing_vest_76561198871196391	{condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_vest_76561198128078062	{condition = "getPlayerUID player in ['76561198128078062']";};
		class RRPClothing_vest_76561199028844328	{condition = "getPlayerUID player in ['76561199028844328']";};
		class RRPClothing_vest_76561199028844328_1	{condition = "getPlayerUID player in ['76561199028844328']";};
		class RRPClothing_vest_76561198006239186	{condition = "getPlayerUID player in ['76561198220756480']";};
		class RRPClothing_vest_76561198346300305	{condition = "getPlayerUID player in ['76561198972013042']";};
		class RRPClothing_vest_1_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_vest_2_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_vest_3_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_vest_4_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_vest_76561198974848738	{condition = "getPlayerUID player in ['76561198974848738']";};
		class RRPClothing_vest_76561198964046553	{condition = "getPlayerUID player in ['76561198451950334']";};
		class RRPClothing_vest2_76561198964046553	{condition = "getPlayerUID player in ['76561198451950334']";};
		class RRPClothing_vest3_76561198964046553	{condition = "getPlayerUID player in ['76561198451950334']";};
		class RRPClothing_vest_76561198141465562	{condition = "getPlayerUID player in ['76561198141465562']";};
		class RRPClothing_vest_76561197987891570	{condition = "getPlayerUID player in ['76561198306196687']";};
		class RRPClothing_vest_76561198038717563	{condition = "getPlayerUID player in ['76561198038717563']";};
		class RRPClothing_vest_76561198437378792	{condition = "getPlayerUID player in ['76561198879751513']";};
		class RRPClothing_vest_76561198871196391_2	{condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_vest_76561198067372219	{condition = "getPlayerUID player in ['76561198164414200']";};
		class RRPClothing_vest_76561198022500941	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRPClothing_vest_76561198022500941_2	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRPClothing_vest_76561198872768491	{condition = "getPlayerUID player in ['76561198872768491']";};
		class RRPClothing_vest_Cat					{condition = "getPlayerUID player in ['76561198977600804']";};
		class RRPClothing_vest_76561198173827573	{condition = "getPlayerUID player in ['76561198173827573']";};
		class RRPClothing_vest_76561197996638839	{condition = "getPlayerUID player in ['76561197996638839']";};
		class RRPClothing_vest_76561198974468599	{condition = "getPlayerUID player in ['76561198974468599']";};
		class RRPClothing_vest_76561198237666076	{condition = "getPlayerUID player in ['76561198237666076']";};
		class RRPClothing_vest_76561198142906677	{condition = "getPlayerUID player in ['76561198142906677']";};
		class RRPClothing_vest_76561198158866775	{condition = "getPlayerUID player in ['76561198158866775']";};
		class RRPClothing_vest_76561198039839945	{condition = "getPlayerUID player in ['76561198039839945']";};
		class RRPClothing_vest_76561198301968766	{condition = "getPlayerUID player in ['76561198302369767']";};
		class RRPClothing_vest_76561198201177746	{condition = "getPlayerUID player in ['76561198339365067']";};
		class RRPClothing_vest_76561198218960275	{condition = "getPlayerUID player in ['76561198218960275']";};
		class RRPClothing_vest_76561198130365000	{condition = "getPlayerUID player in ['76561198393593751']";};
		class RRPClothing_vest2_76561198022500941	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRPClothing_vest_76561199071721547	{condition = "getPlayerUID player in ['76561199189042038']";};
		class RRPClothing_vest_76561199057436365	{condition = "getPlayerUID player in ['76561198192152205']";};
		class RRPClothing_vest_76561198020674138	{condition = "getPlayerUID player in ['76561198020674138']";};
		class RRPClothing_vest_76561198150220371	{condition = "getPlayerUID player in ['76561198150220371']";};
		class RRPClothing_vest_76561198127180830	{condition = "getPlayerUID player in ['76561198127180830']";};
		class RRPClothing_vest_76561198860385638	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRPClothing_vest_76561198860385638_1	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRPClothing_vest_76561198860385638_3	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRPClothing_vest_76561198127126802	{condition = "getPlayerUID player in ['76561198127126802']";};
		class RRPClothing_vest_76561198055389053	{condition = "getPlayerUID player in ['76561198055389053']";};
		class RRPClothing_vest_76561198307108327	{condition = "getPlayerUID player in ['76561198307108327']";};
		class RRPClothing_vest_76561198021215307	{condition = "getPlayerUID player in ['76561198021215307']";};
		class RRPClothing_vest_76561197999174375	{condition = "getPlayerUID player in ['76561197999174375']";};
		class RRPClothing_vest_76561197989379888	{condition = "getPlayerUID player in ['76561197989379888']";};
		class RRPClothing_vest_76561198332910973	{condition = "getPlayerUID player in ['765611980673722192']";};
		class RRPClothing_vest_76561198105732558	{condition = "getPlayerUID player in ['76561198105732558']";};
		class RRPClothing_vest_76561198141730344	{condition = "getPlayerUID player in ['76561198141730344']";};
		class RRPClothing_vest_76561198022595697	{condition = "getPlayerUID player in ['76561198022595697']";};
		class RRPClothing_vest_76561198257233941	{condition = "getPlayerUID player in ['76561198257233941']";};
		class RRPClothing_vest_76561198296798181	{condition = "getPlayerUID player in ['76561198296798181']";};
		class RRPClothing_vest_76561198350158532	{condition = "getPlayerUID player in ['76561198350158532']";};
		class RRPClothing_vest_76561198258556220	{condition = "getPlayerUID player in ['76561198258556220']";};
		class RRPClothing_vest_76561198258556220_1	{condition = "getPlayerUID player in ['76561198258556220']";};
		class RRPClothing_vest_76561198441495005	{condition = "getPlayerUID player in ['76561198330135328']";};
		class RRPClothing_vest_5_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRPClothing_vest_76561198377104523	{condition = "getPlayerUID player in ['76561198377104523']";};
		class RRPClothing_vest_76561198965376624	{condition = "getPlayerUID player in ['76561198965376624']";};
		class RRPClothing_vest_76561198802169420	{condition = "getPlayerUID player in ['76561198802169420']";};
		class RRPClothing_vest_76561198802169420_1	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPClothing_vest_76561198858275213	{condition = "getPlayerUID player in ['76561198858275213']";};
		class RRPClothing_vest_76561198141465562_1	{condition = "getPlayerUID player in ['76561198141465562']";};
		class RRPClothing_vest_76561198377104523_1	{condition = "getPlayerUID player in ['76561198377104523']";};
		class RRPClothing_vest_76561198218960275_1	{condition = "getPlayerUID player in ['76561198218960275']";};
		class RRPClothing_vest_76561198150220371_2	{condition = "getPlayerUID player in ['76561198150220371']";};
		class RRPClothing_vest_76561198031876685	{condition = "getPlayerUID player in ['76561198031876685']";};
		class RRPClothing_vest_76561198032374832	{condition = "getPlayerUID player in ['76561198153186417']";};
		class RRPClothing_vest_76561198858275213_1	{condition = "getPlayerUID player in ['76561198858275213']";};
		class RRPClothing_vest_76561198157551141	{condition = "getPlayerUID player in ['76561198157551141']";};
		class RRPClothing_vest_76561198099037940	{condition = "getPlayerUID player in ['76561198430124432']";};
		class RRPClothing_vest_76561198432150645	{condition = "getPlayerUID player in ['76561198432150645']";};
		class RRPClothing_vest_76561198432150645_2	{condition = "getPlayerUID player in ['76561198432150645']";};
		class RRPClothing_vest_76561199003868334_2	{condition = "getPlayerUID player in ['76561199003868334']";};
		class RRPClothing_vest_76561198188797329	{condition = "getPlayerUID player in ['76561198188797329']";};
		class RRPClothing_vest_76561198964046553_2	{condition = "getPlayerUID player in ['76561198188797329']";};
		class RRPClothing_vest_76561198176273826	{condition = "getPlayerUID player in ['76561198176273826']";};
		class RRPClothing_vest_76561198091711858	{condition = "getPlayerUID player in ['76561198091711858']";};
		class RRPClothing_vest_76561198965376624_2	{condition = "getPlayerUID player in ['76561198965376624']";};
		class RRPClothing_vest_76561198188797329_2	{condition = "getPlayerUID player in ['76561198188797329']";};
		class RRPClothing_vest_76561199028323202	{condition = "getPlayerUID player in ['76561199028323202']";};
		class RRPClothing_vest_76561199025637562	{condition = "getPlayerUID player in ['76561198077550247']";};
		class RRPClothing_vest_76561198130879772_2	{condition = "getPlayerUID player in ['76561198192152205']";};
		class RRPClothing_vest_76561198204496453	{condition = "getPlayerUID player in ['76561198204496453']";};
		class RRPClothing_vest_alpha_berezka:RRPClothing_bossform_alpha_berezka{};
		class RRPClothing_vest_76561198067372219_1	{condition = "getPlayerUID player in ['76561198329559158']";};
		class RRPClothing_vest_76561198841074225_1	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRPClothing_vest_76561198841074225_2	{condition = "getPlayerUID player in ['76561199028323202','76561199170440897']";};
		class RRPClothing_vest_76561198130879772_3	{condition = "getPlayerUID player in ['76561198192152205']";};
		class RRPClothing_vest_76561199003868334_3	{condition = "getPlayerUID player in ['76561199003868334']";};
		class RRPClothing_vest_76561198069078439	{condition = "getPlayerUID player in ['76561198069078439']";};
		class RRPClothing_vest_76561198255904685	{condition = "getPlayerUID player in ['76561198255904685']";};
		class RRPClothing_vest_76561199072206957_3	{condition = "getPlayerUID player in ['76561199072206957']";};
		class RRPClothing_vest_76561198327404632_1	{condition = "getPlayerUID player in ['76561198327404632']";};
		class RRPClothing_vest_76561198283449875	{condition = "getPlayerUID player in ['76561198283449875']";};
		class RRPClothing_vest_76561199113587031	{condition = "getPlayerUID player in ['76561199189042038']";};
		class RRPClothing_vest_76561198845783102_1	{condition = "getPlayerUID player in ['76561198845783102']";};
		class RRPClothing_vest_76561198958641108_1	{condition = "getPlayerUID player in ['76561198958641108']";};
		class RRPClothing_vest_76561198958641108_2	{condition = "getPlayerUID player in ['76561198958641108']";};
		class RRPClothing_vest_76561199131209280_1	{condition = "getPlayerUID player in ['76561198851983856']";};
		class RRPClothing_vest_76561198097657133_1	{condition = "getPlayerUID player in ['76561198097657133']";};
		class RRPClothing_vest_76561198802169420_2	{condition = "getPlayerUID player in ['76561198802169420']";};
		class RRPClothing_vest_76561199189042038_1	{condition = "getPlayerUID player in ['76561198802169420']";};
		class RRPClothing_vest_76561199189042038_2	{condition = "getPlayerUID player in ['76561199189042038']";};
		class RRPClothing_vest_76561198357231237_1	{condition = "getPlayerUID player in ['76561198357231237']";};
		class RRPClothing_vest_76561198366046837_1	{condition = "getPlayerUID player in ['76561198366046837']";};
		class RRPClothing_vest_76561198366046837_2	{condition = "getPlayerUID player in ['76561198366046837']";};
		class RRPClothing_vest_76561198323021698_1	{condition = "getPlayerUID player in ['76561198323021698']";};
		class RRPClothing_vest_76561198442196391_1	{condition = "getPlayerUID player in ['76561198442196391']";};
		class RRPClothing_vest_76561198442196391_2	{condition = "getPlayerUID player in ['76561198442196391']";};
		class RRPClothing_vest_76561198320611154_1	{condition = "getPlayerUID player in ['76561198879751513']";};
		class RRPClothing_vest_76561198263454004_1	{condition = "getPlayerUID player in ['76561198095797478']";};
		class RRPClothing_vest_76561198095797478_1	{condition = "getPlayerUID player in ['76561198095797478']";};
		class RRPClothing_vest_76561199028323202_imperium_1	{condition = "getPlayerUID player in ['76561198335816608','76561199028323202']";};
		class RRPClothing_vest_76561198377104523_imperium_1	{condition = "getPlayerUID player in ['76561198377104523']";};
		class RRPClothing_vest_76561199010373455_imperium_1	{condition = "getPlayerUID player in ['76561198974081965']";};
		class RRPClothing_vest_76561198351236835_1	{condition = "getPlayerUID player in ['76561198879751513']";};
		class RRPClothing_vest_76561198351236835_2	{condition = "getPlayerUID player in ['76561198879751513']";};
		class RRPClothing_vest_76561198441495005_1	{condition = "getPlayerUID player in ['76561198441495005']";};
		class RRPClothing_vest_76561198281889630_1	{condition = "getPlayerUID player in ['76561198281889630']";};
		class RRPClothing_vest_76561199100722385_1	{condition = "getPlayerUID player in ['76561199146164370']";};
		class RRPClothing_vest_76561198040706481_1	{condition = "getPlayerUID player in ['76561198040706481']";};
		class RRPClothing_vest_76561198040706481_2	{condition = "getPlayerUID player in ['76561198040706481']";};
		class RRPClothing_vest_76561198820338106_1	{condition = "getPlayerUID player in ['76561198820338106']";};
		class RRPClothing_vest_76561198820338106_2	{condition = "getPlayerUID player in ['76561198820338106']";};
		class RRPClothing_vest_76561199076333332_1	{condition = "getPlayerUID player in ['76561199076333332']";};
		class RRPClothing_vest_76561198087098430_1	{condition = "getPlayerUID player in ['76561198087098430']";};
		class RRPClothing_vest_76561198863564880_1	{condition = "getPlayerUID player in ['76561198863564880']";};

		//Малюски
		class RRP_belt_stage_1	{condition = "getPlayerUID player in ['76561199122383480','76561198037838704','76561198377104523','76561199076333332','76561198117876487','76561198357231237','76561198162478436','76561198148968668','76561198831751318','76561198077550247','76561198148968668','76561198062312157','76561198346514816','76561198301968766','76561198798557347','76561198349178041','76561198079435973','76561198039839945','76561198204496453','76561199041212203','76561198192152205'] || 'backpack_mollusk_stage_1' in secretShop";};
		class RRP_belt_stage_2	{condition = "getPlayerUID player in ['76561197981880315','76561198844249041','76561198056234394','76561198159190756'] || 'backpack_mollusk_stage_2' in secretShop";};
		class RRP_belt_stage_3	{condition = "getPlayerUID player in ['76561198965376624','76561198040706481','76561199189042038','76561198339365067','76561199072206957','76561198109707602','76561198032200653','76561198835639054','76561198136715560','76561199170440897'] || 'backpack_mollusk_stage_3' in secretShop";};


		class RRP_belt_ms13_1	{condition = "getPlayerUID player in ['76561198079435973','76561198283449875','76561198957651238','76561198192152205','76561198038717563','76561198220756480','76561199036672639','76561198974848738','76561198062312157','76561198127126802','76561198142906677']  && license_ms";};
		class RRP_belt_ms13_2	{condition = "getPlayerUID player in ['548454']";};
		class RRP_belt_ms13_3	{condition = "getPlayerUID player in ['76561198021215307','76561198307108327','76561199072206957','76561198339365067','76561198805873784','76561198984360169'] && license_ms";};

		class RRP_belt_76561199076333332_1	{condition = "getPlayerUID player in ['76561199076333332']";};
		class RRP_belt_76561198831751318	{condition = "getPlayerUID player in ['76561198831751318']";};
		class RRP_belt_76561198296798181	{condition = "getPlayerUID player in ['76561198296798181']";};
		class RRP_belt_76561198109707602	{condition = "getPlayerUID player in ['76561198109707602']";};
		class RRP_belt_76561198039610087	{condition = "getPlayerUID player in ['76561198039610087']";};
		class RRP_belt_76561198258502342	{condition = "getPlayerUID player in ['76561198974848735']";};
		class RRP_belt_76561198859526459	{condition = "getPlayerUID player in ['76561198859526459']";};
		class RRP_belt_76561198261617058	{condition = "getPlayerUID player in ['76561198261617058']";};
		class RRP_belt_76561198130365000	{condition = "getPlayerUID player in ['76561198302369767']";};
		class RRP_belt_76561198130365000_1	{condition = "getPlayerUID player in ['76561198302369767']";};
		class RRP_belt_76561198141236290	{condition = "getPlayerUID player in ['76561198141236290']";};
		class RRP_belt_76561199003868334	{condition = "getPlayerUID player in ['76561198131519300']";};
		class RRP_belt_76561198133245221	{condition = "getPlayerUID player in ['76561198133245221']";};
		class RRP_belt_76561198805873784	{condition = "getPlayerUID player in ['76561198805873784']";};
		class RRP_belt_76561198022595697	{condition = "getPlayerUID player in ['76561198022595697']";};
		class RRP_belt_76561198974081965	{condition = "getPlayerUID player in ['76561199031665810']";};
		class RRP_belt_76561198984360169	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRP_belt_76561197989379888	{condition = "getPlayerUID player in ['76561197989379888']";};
		class RRP_belt_76561198125719300	{condition = "getPlayerUID player in ['76561198125719300']";};
		class RRP_belt_76561197978580741	{condition = "getPlayerUID player in ['76561197978580741']";};
		class RRP_belt_76561198128078062	{condition = "getPlayerUID player in ['76561198128078062']";};
		class RRP_belt_76561198006239186	{condition = "getPlayerUID player in ['76561198977600804']";};
		class RRP_belt_76561198169377027	{condition = "getPlayerUID player in ['76561198169377027']";};
		class RRP_belt_76561198022500941	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRP_belt_76561198957651238	{condition = "getPlayerUID player in ['76561198957651238']";};
		class RRP_belt_76561198871196391	{condition = "getPlayerUID player in ['76561199072206957']";};
		class RRP_belt_76561198858275213	{condition = "getPlayerUID player in ['76561198858275213']";};
		class RRP_belt_76561198054449670	{condition = "getPlayerUID player in ['76561198191474441']";};
		class RRP_belt_76561198872768491	{condition = "getPlayerUID player in ['76561198872768491']";};
		class RRP_belt_76561198872768491_1	{condition = "getPlayerUID player in ['76561198872768491']";};
		class RRP_belt_76561198339151113	{condition = "getPlayerUID player in ['76561199028323202']";};
		class RRP_belt_76561198199874517	{condition = "getPlayerUID player in ['76561198199874517']";};
		class RRP_belt_76561199028844328	{condition = "getPlayerUID player in ['76561199028844328']";};
		class RRP_belt_76561199028844328_1	{condition = "getPlayerUID player in ['76561199028844328']";};
		class RRP_belt_76561198974848738	{condition = "getPlayerUID player in ['76561198974848738']";};
		class RRP_belt_76561197983419452	{condition = "getPlayerUID player in ['76561197983419452']";};
		class RRP_belt_76561198141465562	{condition = "getPlayerUID player in ['76561198141465562']";};
		class RRP_belt_76561198141465562_1	{condition = "getPlayerUID player in ['76561198141465562']";};
		class RRP_belt_76561198038717563	{condition = "getPlayerUID player in ['76561198038717563']";};
		class RRP_belt_76561197987891570	{condition = "getPlayerUID player in ['76561198306196687']";};
		class RRP_belt_76561198008665518	{condition = "getPlayerUID player in ['76561198008665518']";};
		class RRP_belt_76561198053037949	{condition = "getPlayerUID player in ['76561198441495005']";};
		class RRP_belt_76561198871196391_2	{condition = "getPlayerUID player in ['76561199072206957']";};
		class RRP_belt_76561198067372219	{condition = "getPlayerUID player in ['76561198164414200']";};
		class RRP_belt_76561198964046553	{condition = "getPlayerUID player in ['76561198161381388']";};
		class RRP_belt_2_76561198964046553	{condition = "getPlayerUID player in ['76561198161381388']";};
		class RRP_belt_76561198193396709	{condition = "getPlayerUID player in ['76561198193396709']";};
		class RRP_belt_76561198216298929	{condition = "getPlayerUID player in ['76561198216298929']";};
		class RRP_belt_76561198322725899	{condition = "getPlayerUID player in ['76561198322725899']";};
		class RRP_belt_76561198158866775	{condition = "getPlayerUID player in ['76561198158866775']";};
		class RRP_belt_76561198074062847	{condition = "getPlayerUID player in ['76561198074062847']";};
		class RRP_belt_76561198430124432	{condition = "getPlayerUID player in ['76561198430124432']";};
		class RRP_belt_76561198346300305	{condition = "getPlayerUID player in ['76561198863564880']";};
		class RRP_belt_76561198974468599	{condition = "getPlayerUID player in ['76561198974468599']";};
		class RRP_belt_76561198001830447	{condition = "getPlayerUID player in ['76561198001830447']";};
		class RRP_belt_76561198823258450	{condition = "getPlayerUID player in ['76561198823258450']";};
		class RRP_belt_76561198972013042	{condition = "getPlayerUID player in ['76561198972013042']";};
		class RRP_belt_76561198262977672	{condition = "getPlayerUID player in ['76561198262977672']";};
		class RRP_belt_76561198952139832	{condition = "getPlayerUID player in ['76561198952139832']";};
		class RRP_belt_76561198142906677	{condition = "getPlayerUID player in ['76561198142906677']";};
		class RRP_belt_76561198255904685	{condition = "getPlayerUID player in ['76561198255904685']";};
		class RRP_belt_76561198213135992	{condition = "getPlayerUID player in ['76561198039839945']";};
		class RRP_belt_76561198237666076	{condition = "getPlayerUID player in ['76561198237666076']";};
		class RRP_belt_76561199071721547	{condition = "getPlayerUID player in ['76561199189042038']";};
		class RRP_belt_76561199057436365	{condition = "getPlayerUID player in ['76561198192152205']";};
		class RRP_belt2_76561198022500941	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRP_belt_76561198859382109	{condition = "getPlayerUID player in ['76561198859382109']";};
		class RRP_belt_76561198841074225	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRP_belt_76561198869945650	{condition = "getPlayerUID player in ['76561198869945650']";};
		class RRP_belt_76561198327404632	{condition = "getPlayerUID player in ['76561198327404632']";};
		class RRP_belt_76561198150220371	{condition = "getPlayerUID player in ['76561198150220371']";};
		class RRP_belt_76561198860385638	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRP_belt_76561198860385638_1	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRP_belt_76561198860385638_2	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRP_belt_76561198860385638_3	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRP_belt_76561198127126802	{condition = "getPlayerUID player in ['76561198127126802']";};
		class RRP_belt_76561198833832441	{condition = "getPlayerUID player in ['76561198833832441']";};
		class RRP_belt_76561198307108327	{condition = "getPlayerUID player in ['76561198307108327']";};
		class RRP_belt_76561198021215307	{condition = "getPlayerUID player in ['76561198021215307']";};
		class RRP_belt_76561198165328601	{condition = "getPlayerUID player in ['76561198165328601']";};
		class RRP_belt_76561197999174375	{condition = "getPlayerUID player in ['76561197999174375']";};
		class RRP_belt_76561198105732558	{condition = "getPlayerUID player in ['76561198105732558']";};
		class RRP_belt_76561198141730344	{condition = "getPlayerUID player in ['76561198141730344']";};
		class RRP_belt_76561198117691775	{condition = "getPlayerUID player in ['76561198117691775']";};
		class RRP_belt_76561199037097458	{condition = "getPlayerUID player in ['76561199037097458']";};
		class RRP_belt_76561198991265867	{condition = "getPlayerUID player in ['76561198127805660']";};
		class RRP_belt_76561198158023300	{condition = "getPlayerUID player in ['76561198158023300']";};
		class RRP_belt_76561198020674138	{condition = "getPlayerUID player in ['76561198020674138']";};
		class RRP_belt_76561198053389939	{condition = "getPlayerUID player in ['76561198053389939']";};
		class RRP_belt_76561199017081362	{condition = "getPlayerUID player in ['76561199017081362']";};
		class RRP_belt_76561198441495005	{condition = "getPlayerUID player in ['76561198442196391']";};
		class RRP_belt_76561198171032663	{condition = "getPlayerUID player in ['76561198958641108']";};
		class RRP_belt_76561197987658357	{condition = "getPlayerUID player in ['76561197987658357']";};
		class RRP_belt_76561198194726454	{condition = "getPlayerUID player in ['76561198194726454']";};
		class RRP_belt_76561198028985837	{condition = "getPlayerUID player in ['76561198028985837']";};
		class RRP_belt_med	{condition = "getPlayerUID player in ['76561198109707602','76561198028985837','76561198194726454','76561197987658357'] && (call ('med' call RRPClient_groups_getSideLevel)) > 0";};
		class RRP_belt_76561198350158532	{condition = "getPlayerUID player in ['76561198350158532']";};
		class RRP_belt_76561197997748408	{condition = "getPlayerUID player in ['76561197997748408']";};
		class RRP_belt_76561198442732927	{condition = "getPlayerUID player in ['76561198442732927']";};
		class RRP_belt_76561198335271616	{condition = "getPlayerUID player in ['76561198335271616']";};
		class RRP_belt_76561198220756480	{condition = "getPlayerUID player in ['76561198220756480']";};
		class RRP_belt_76561198313293500	{condition = "getPlayerUID player in ['76561198313293500']";};
		class RRP_belt_76561198067372219_1	{condition = "getPlayerUID player in ['76561198820434082']";};
		class RRP_belt_76561198245864374	{condition = "getPlayerUID player in ['76561198967112367']";};
		class RRP_belt_76561198122285079	{condition = "getPlayerUID player in ['76561198122285079']";};
		class RRP_belt_76561198040706481	{condition = "getPlayerUID player in ['76561198849501696']";};
		class RRP_belt_76561198890595775	{condition = "getPlayerUID player in ['76561198890595775']";};
		class RRP_belt_76561198258556220	{condition = "getPlayerUID player in ['76561198258556220']";};
		class RRP_belt_76561198258556220_1	{condition = "getPlayerUID player in ['76561198258556220']";};
		class RRP_belt_76561198022500941_2	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRP_belt_76561198984360169_1	{condition = "getPlayerUID player in ['76561198984360169']";};
		class RRP_belt_76561198091711858	{condition = "getPlayerUID player in ['76561198091711858']";};
		class RRP_belt_76561199045679601	{condition = "getPlayerUID player in ['76561199045679601']";};
		class RRP_belt_76561198039915550	{condition = "getPlayerUID player in ['76561198039915550']";};
		class RRP_belt_76561198802169420	{condition = "getPlayerUID player in ['76561198802169420']";};
		class RRP_belt_76561198841074225_1	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRP_belt_76561198871695837	{condition = "getPlayerUID player in ['76561198871695837']";};
		class RRP_belt_76561198031876685	{condition = "getPlayerUID player in ['76561198031876685']";};
		class RRP_belt_76561198130879772	{condition = "getPlayerUID player in ['76561198283449875']";};
		class RRP_belt_76561198323021698	{condition = "getPlayerUID player in ['76561198323021698']";};
		class RRP_belt_76561198157551141	{condition = "getPlayerUID player in ['76561198157551141']";};
		class RRP_belt_76561198347030763	{condition = "getPlayerUID player in ['76561198347030763']";};
		class RRP_belt_76561198368641807	{condition = "getPlayerUID player in ['76561198368641807']";};
		class RRP_belt_76561198441495005_1	{condition = "getPlayerUID player in ['76561198441495005']";};
		class RRP_belt_76561198432150645	{condition = "getPlayerUID player in ['76561198432150645']";};
		class RRP_belt_76561199003868334_2	{condition = "getPlayerUID player in ['76561199003868334']";};
		class RRP_belt_76561199003868334_3	{condition = "getPlayerUID player in ['76561199003868334']";};
		class RRP_belt_76561198188797329	{condition = "getPlayerUID player in ['76561198188797329']";};
		class RRP_belt_76561199122383480	{condition = "getPlayerUID player in ['76561199122383480']";};
		class RRP_belt_76561199122383480_2	{condition = "getPlayerUID player in ['76561199122383480']";};
		class RRP_belt_76561198188797329_2	{condition = "getPlayerUID player in ['76561198188797329']";};
		class RRP_belt_76561198841074225_2	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRP_belt_76561198841074225_3	{condition = "getPlayerUID player in ['76561199170440897']";};
		class RRP_belt_76561198965376624	{condition = "getPlayerUID player in ['76561198965376624']";};
		class RRP_belt_76561198039839945	{condition = "getPlayerUID player in ['76561198039839945','76561199170440897']";};
		class RRP_belt_76561198067372219_2	{condition = "getPlayerUID player in ['76561198067372219']";};
		class RRP_belt_76561198136715560	{condition = "getPlayerUID player in ['76561198136715560']";};
		class RRP_belt_76561198087098430	{condition = "getPlayerUID player in ['76561198087098430']";};
		class RRP_belt_76561198958641108_1	{condition = "getPlayerUID player in ['76561198958641108']";};
		class RRP_belt_76561198366046837_1	{condition = "getPlayerUID player in ['76561198366046837']";};
		class RRP_belt_76561198366046837_2	{condition = "getPlayerUID player in ['76561198366046837']";};
		class RRP_belt_76561198442196391_1	{condition = "getPlayerUID player in ['76561198442196391']";};
		class RRP_belt_76561198442196391_2	{condition = "getPlayerUID player in ['76561198442196391']";};
		class RRP_belt_76561198820338106_1	{condition = "getPlayerUID player in ['76561198820338106']";};
		class RRP_belt_76561198820338106_2	{condition = "getPlayerUID player in ['76561198820338106']";};
		class RRP_belt_76561198263454004_1	{condition = "getPlayerUID player in ['76561198095797478']";};
		class RRP_belt_76561198095797478_1	{condition = "getPlayerUID player in ['76561198095797478']";};
		class RRP_belt_76561198167204546_1	{condition = "getPlayerUID player in ['76561198167204546']";};
		class RRP_belt_76561198167204546_2	{condition = "getPlayerUID player in ['76561198167204546']";};
		class RRP_belt_76561198167204546_3	{condition = "getPlayerUID player in ['76561198167204546']";};
		class RRP_belt_76561198048514367_1	{condition = "getPlayerUID player in ['76561198048514367']";};
		class RRP_belt_76561199100722385	{condition = "getPlayerUID player in ['76561198051367160']";};
		class RRP_belt_76561198040706481_1	{condition = "getPlayerUID player in ['76561198040706481']";};
		class RRP_belt_76561198040706481_2	{condition = "getPlayerUID player in ['76561198040706481']";};
		class RRP_belt_76561198087098430_1	{condition = "getPlayerUID player in ['76561198087098430']";};
		class RRP_belt_76561198863564880_1	{condition = "getPlayerUID player in ['76561198863564880']";};
		class RRP_belt_76561198069078439_1	{condition = "getPlayerUID player in ['76561198069078439']";};
		class RRP_belt_76561198351236835	{condition = "getPlayerUID player in ['76561198879751513']";};
		//Вайперы//
		class RRP_viper_76561198405172720	{condition = "getPlayerUID player in ['76561198354522037']";};
		class RRP_viper_76561198356306295	{condition = "getPlayerUID player in ['76561198356306295']";};
		class RRP_viper_76561198860730941	{condition = "getPlayerUID player in ['76561198125573410','76561198860730941']";};
		class RRP_viper_76561198301968766	{condition = "getPlayerUID player in ['76561198060983312','76561199162645423','76561198207968335']";};
		class RRP_viper_76561198201177746	{condition = "getPlayerUID player in ['76561198201177746']";};
		class RRP_viper_76561198332910973	{condition = "getPlayerUID player in ['76561198332910973']";};
		class RRP_viper_76561198042670190	{condition = "getPlayerUID player in ['76561198042670190']";};
		class RRP_viper_76561198830898217	{condition = "getPlayerUID player in ['76561198830898217']";};
		class RRP_viper_76561198980845366	{condition = "getPlayerUID player in ['76561198980845366']";};
		class RRP_viper_76561198860385638	{condition = "getPlayerUID player in ['76561198860385638']";};
		class RRP_viper_76561198912484846	{condition = "getPlayerUID player in ['76561198084460550']";};
		class RRP_viper_76561197981880315	{condition = "getPlayerUID player in ['76561197981880315']";};
		class RRP_viper_76561199141246399_1	{condition = "getPlayerUID player in ['76561199141246399']";};
		class RRP_viper_76561198208668912_1	{condition = "getPlayerUID player in ['76561198208668912']";};
		class RRP_viper_76561198320611154	{condition = "getPlayerUID player in ['76561198357231237']";};
		class RRP_viper_76561198125573410	{condition = "getPlayerUID player in ['76561198125573410']";};
		class RRP_viper_76561199010373455	{condition = "getPlayerUID player in ['76561199010373455']";};
		class RRP_viper_76561199010373455_imperium_1	{condition = "getPlayerUID player in ['76561199010373455']";};
		class RRPClothing_balaklava_76561199025637562	{condition = "getPlayerUID player in ['76561199025637562']";};
		class RRPClothing_balaklava_76561198130879772	{condition = "getPlayerUID player in ['76561198130879772']";};
		class RRPClothing_balaklava_76561198841074225	{condition = "getPlayerUID player in ['76561199170440897']";};

		//Очки//
		class G_Blindfold_01_black_F	{condition = "getPlayerUID player in ['76561198128078062']";};
		class RRPClothing_bandana_76561198296798181	{condition = "getPlayerUID player in ['76561198296798181']";};
		class RRPClothing_balaklava_76561198957651238	{condition = "getPlayerUID player in ['76561198307108327','76561198021215307','76561198957651238']";};
		class RRPClothing_balaklava_76561198022500941	{condition = "getPlayerUID player in ['76561198022500941']";};
		class RRPClothing_balaklava_76561198022500941_1	{condition = "getPlayerUID player in ['76561198022500941']";};

		class B_Mortar_01_support_F	{condition = "getPlayerUID player in ['76561198108509544']";};
		class B_Mortar_01_weapon_F	{condition = "getPlayerUID player in ['76561198108509544']";};
		class B_HMG_01_support_high_F	{condition = "getPlayerUID player in ['76561198108509544']";};
		class I_HMG_02_support_high_F	{condition = "getPlayerUID player in ['76561198108509544']";};
		class B_HMG_01_high_weapon_F	{condition = "getPlayerUID player in ['76561198108509544']";};
		class I_HMG_02_high_weapon_F	{condition = "getPlayerUID player in ['76561198108509544']";};

		class BS_boss_belt				{condition = "(call life_adminlevel) > 2";};
		class BS_Boss_Uniform_1			{condition = "getPlayerUID player in ['76561198077550247','76561198262977672','76561198216298929','76561198001830447','76561198069078439','76561198255904685']";};
		class BS_boss_belt2			    {condition = "getPlayerUID player in ['76561198260456305','76561198069078439','76561198827406083']";};
		class BS_Boss_Vest_1			{condition = "getPlayerUID player in ['76561198077550247','76561198262977672','76561198216298929','76561198001830447','76561198069078439','76561198255904685']";};
		class Boss_Sopranos_Vest_1		{condition = "getPlayerUID player in ['76561197989379888','76561198984360169']";};
		class Boss_CN_Vest_1			{condition = "getPlayerUID player in ['76561198808964643']";};
		
		class RRPClothing_beret_76561198296798181	{condition = "getPlayerUID player in ['76561198296798181']";};
		class rds_uniform_priest		{condition = "getPlayerUID player in ['76561198072296470']";};

		class RRP_badge_Kasatki_C		{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_kasatky";};
		class RRP_badge_Kasatki_B		{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_kasatky";};
		class RRP_badge_Kasatki_A		{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_kasatky";};
		class RRP_badge_TAXI_C			{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_taxi";};
		class RRP_badge_TAXI_B			{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_taxi";};
		class RRP_badge_TAXI_A			{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_taxi";};
		class RRP_badge_7News_C			{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_press";};
		class RRP_badge_7News_B			{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_press";};
		class RRP_badge_7News_A			{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_press";};
		class RRP_badge_JURIST_C		{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_judge";};
		class RRP_badge_JURIST_B		{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_judge";};
		class RRP_badge_JURIST_A		{condition = "('cop' call RRPClient_groups_getSideLevel) > 0 || license_judge";};

		class Zafir_76561198255904685 	{condition = "(call life_adminlevel) > 2";};
		class Zafir_76561198069078439 	{condition = "(call life_adminlevel) > 2";};
		class Zafir_76561198823258450 	{condition = "(call life_adminlevel) > 2";};
		class Zafir_76561198827406083	{condition = "(call life_adminlevel) > 2";};
		class Zafir_76561198260456305 	{condition = "(call life_adminlevel) > 2";};
		class Zafir_76561198191474441	{condition = "(call life_adminlevel) > 2";};
		class Zafir_76561197999174375 	{condition = "(call life_adminlevel) > 2";};
		class arifle_RPK12_arid_F 		{condition = "getPlayerUID player in ['76561198108509544']";};
		class RPK12_76561198859526459	{condition = "getPlayerUID player in ['76561198859526459']";};
		class Skyline_SVD_01_F			{condition = "getPlayerUID player in ['76561198393593751','76561198133347506','76561199105116562','76561199045679601','76561198067484442','76561197987891570','76561198425376108']";};
		class SMG_03_TR_black			{condition = "getPlayerUID player in ['76561198858275213','76561198357268475']";};
		
		///медики
		class B_union_medic_BackPack	{condition = "('med' call RRPClient_groups_getSideLevel) > 0";};
		class EMS_backpack				{condition = "('med' call RRPClient_groups_getSideLevel) > 0";};
		class Rimas_EMS_Belt_Red		{condition = "('med' call RRPClient_groups_getSideLevel) > 0";};
		class Rimas_EMS_Belt_Black		{condition = "('med' call RRPClient_groups_getSideLevel) > 0";};
		class Rimas_EMS_Belt_White		{condition = "('med' call RRPClient_groups_getSideLevel) > 0";};
		class Rimas_EMS_Backpack_W_B	{condition = "('med' call RRPClient_groups_getSideLevel) > 0";};
		class Rimas_EMS_Stretcher		{condition = "('med' call RRPClient_groups_getSideLevel) > 0";};
		class tf_anprc155_coyote		{condition = "('med' call RRPClient_groups_getSideLevel) > 0";};
		
		class 3_Headset_NV 		 			{condition = "getPlayerUID player in ['76561198097657133','76561197999174375']";};
		class 150Rnd_556x45_Drum_Mag_F	 	{condition = "getPlayerUID player in ['76561198416388047']";};
		class B_UGV_02_Demining_backpack_F 	{condition = "getPlayerUID player in ['76561198984360169']";};
		class I_UGV_02_Demining_backpack_F 	{condition = "getPlayerUID player in ['76561199189042038','76561198984360169']";};
		class I_UavTerminal 				{condition = "getPlayerUID player in ['76561199189042038','76561198984360169']";};

		//Обвесы
		class Skyline_optic_PSO1		{condition = "getPlayerUID player in ['76561199045679601','76561198067484442','76561197987891570','76561198425376108']";};
		class optic_NVS					{condition = "getPlayerUID player in ['76561198255904685','76561198199874517','76561199072206957','76561198068361408','76561197989379888','76561198323021698','76561198071089467','76561198859526459','76561198188202166','76561199170440897']";};

		//5.56
		class muzzle_snds_M				{condition = "getPlayerUID player in ['76561198067372219','76561198159190756','76561198032200653','76561197989379888','76561199170440897','76561197984276591','76561198020674138','76561198199874517','76561198022500941','76561198869945650','76561198068361408']";}; //5.56
		class muzzle_snds_m_snd_F:muzzle_snds_M{};
		class muzzle_snds_m_khk_F:muzzle_snds_M{};
		class hlc_muzzle_556NATO_KAC:muzzle_snds_M{};
		//6.5
		class muzzle_snds_H				{condition = "getPlayerUID player in ['76561198125573410','76561198860385638','76561197989379888','76561199170440897','76561198022500941','76561197984276591','76561198067372219','76561198068361408','76561198155739510','76561198416388047','76561198869945650'] || ('cop' call RRPClient_groups_getSideLevel) in [23, 24, 25, 26]";}; //6.5
		class muzzle_snds_H_snd_F:muzzle_snds_H{};
		class muzzle_snds_H_khk_F:muzzle_snds_H{};
		class muzzle_snds_65_TI_hex_F:muzzle_snds_H{};
		class muzzle_snds_65_TI_ghex_F:muzzle_snds_H{};
		class muzzle_snds_65_TI_blk_F:muzzle_snds_H{};

		//7.62
		class muzzle_snds_B				{condition = "getPlayerUID player in ['76561198441495005','76561198188797329','76561198957651238','76561198965376624','76561198329559158','76561198079435973','76561198351236835','76561198038717563','76561197987891570','76561198074062847','76561198131519300','76561198323021698','76561198339365067','76561198974081965','76561198159190756','76561198032200653','76561198258556220','76561198150220371','76561198077550247','76561198069078439','76561198109707602','76561199010373455','76561198442196391','76561198153186417','76561198432150645','76561198091711858','76561198039915550','76561198216298929','76561197984276591','76561198021215307','76561198307108327','76561198432454931','76561198141730344','76561197999174375','76561198860385638','76561198974848738','76561199170440897','76561198237666076','76561198022500941','76561198173827573','76561198255904685','76561198127126802','76561198366046837','76561198057578062','76561198357231237','76561198001830447','76561198022595697','76561198199874517','76561197989379888','76561198062312157','76561198128078062','76561198416388047','76561198155739510','76561198859526459','76561198068361408','76561198377104523']";}; //7.62
		class muzzle_snds_B_lush_F:muzzle_snds_B{};
		class muzzle_snds_B_snd_F:muzzle_snds_B{};
		class muzzle_snds_B_arid_F:muzzle_snds_B{};
		class muzzle_snds_B_khk_F:muzzle_snds_B{};

	
		class optic_AMS	        	    {condition = "getPlayerUID player in ['76561198167204546','76561198432150645','76561198335816608','76561198040706481','76561198965376624','76561198083697949','76561198032200653','76561198938983683','76561198974848738','76561198062312157','76561198820338106','76561198366046837','76561198067372219','76561198039839945','76561198958641108','76561198131519300','76561198237666076','76561198022500941','76561198074062847','76561198159190756','76561198323021698','76561199003868334','76561198442196391','76561198255904685','76561198039915550','76561198432454931','76561197984276591','76561198021215307','76561198307108327','76561199028323202','76561197999174375','76561198039839945','76561199189042038','76561198127126802','76561198432454931','76561198974081965','76561199028844328','76561198860730941','76561198859382109','76561198022595697','76561199072206957','76561199170440897','76561198141730344','76561198069078439','76561198199874517','76561198068361408','76561197989379888','76561198805873784','76561198357268475','76561198984360169','76561198024235310','76561198116644964','76561198169377027','76561197987891570','76561198188202166','76561198869945650','76561198128078062','76561198859526459','76561198075443139','76561198068361408']";};
		class optic_AMS_khk:optic_AMS{};
		class optic_AMS_snd:optic_AMS{};

		class optic_DMS		      	    {condition = "getPlayerUID player in ['76561198148968668','76561198103273867','76561198255572585','76561199141246399','76561198095797478','76561199126925603','76561198117876487','76561198386787607','76561198306196687','76561198974468599','76561199162645423','76561199143890038','76561199189302747','76561198110313619','76561198209372877','76561198381539390','76561198075212286','76561198255381344','76561198830959338','76561198162478436','76561198125573410','76561198208668912','76561198049056822','76561198879751513','76561198283954724','76561198329559158','76561198281889630','76561198863564880','76561198079435973','76561198204496453','76561198121104045','76561198871196391','76561198395521344','76561198216298929','76561198159190756','76561198032200653','76561198389812812','76561199189042038','76561198136715560','76561198069078439','76561198188797329','76561198967112367','76561198983423627','76561198122788982','76561198972013042','76561198339365067','76561198195293782','76561198357231237','76561198157551141','76561198977600804','76561197989379888','76561199170440897','76561198150220371','76561198158023300','76561198257327825','76561198302369767','76561198258556220','76561198091711858','76561198077550247','76561198972013042','76561198327404632','76561198430124432','76561198001830447','76561198322725899','76561197984276591','76561198957651238','76561198142906677','76561198441495005','76561198192152205','76561198283449875','76561198367503467','76561199028844328','76561198835639054','76561198304139960','76561198055389053','76561198164610413','76561198432454931','76561198860385638','76561198368641807','76561198220756480','76561198127805660','76561198872768491','76561198377104523','76561198173827573','76561199076333332','76561198020674138','76561198057578062','76561198068361408','76561198039610087','76561198808964643','76561198144261492','76561198294625836','76561198262113842','76561198023277710','76561198128078062','76561198067484442','76561198840661090','76561198073513782','76561198068361408']";}; //Flaor
		class optic_DMS_ghex_F:optic_DMS{};
		
		class optic_Arco_blk_F			{condition = "getPlayerUID player in ['76561198323021698'] || (call life_donator) > 3 || license_escobaro || license_kasatky || license_cwrka || ('cop' call RRPClient_groups_getSideLevel) > 0";};
		class optic_ERCO_blk_F			{condition = "(call life_donator) > 3 || license_outcast || license_bs || license_ms || license_alpha || license_escobaro || license_imperium || ('cop' call RRPClient_groups_getSideLevel) > 0";};
		class optic_Hamr:base{};
		class optic_Hamr_khk_F:base{};

		class optic_ERCO_khk_F			{condition = "getPlayerUID player in ['76561199170440897']";};
	};

	class Accessories //сюда прописуюй все обвесы
	{

	};

};