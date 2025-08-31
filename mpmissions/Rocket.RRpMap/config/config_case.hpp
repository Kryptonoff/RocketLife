/*
	Quality: 
	Common = 
	Rare = 
	Epic = 
	Legendary = 
	Mythic = 
	
*/

#define CASE_MONEY "money"
#define CASE_VIP "vip"
#define CASE_RC "rc"
#define CASE_TRX "trx"
#define CASE_EXP "exp"
#define CASE_WEAPON "weapon"
#define CASE_CLOTHING "clothing"
#define CASE_ITEM "item"
#define CASE_VEHICLE "vehicle"
#define CASE_PERMITEMS "permitems"

#define CASE_RARITY_COMMON "common"
#define CASE_RARITY_RARE "rare"
#define CASE_RARITY_EPIC "epic"
#define CASE_RARITY_LEGENDARY "legendary"
#define CASE_RARITY_MYTHIC "mythic"

// Базовые настройки категорий
#include <cases\base\clothing_items.hpp>
#include <cases\base\exp_items.hpp>
#include <cases\base\item_items.hpp>
#include <cases\base\money_items.hpp>
#include <cases\base\perm_items.hpp>
#include <cases\base\rc_items.hpp>
#include <cases\base\trx_items.hpp>
#include <cases\base\vehicle_items.hpp>
#include <cases\base\vip_items.hpp>
#include <cases\base\weapon_items.hpp>

class CfgCasesItems
{
	#include <cases\ny2023\money.hpp>
	#include <cases\ny2023\vehicles.hpp>
	#include <cases\hallowen_cases\vehicles.hpp>
	#include <cases\hallowen_cases\masks.hpp>
	#include <cases\free_case\case.hpp>
};
class CfgCases
{
	class free_case
	{
		displayName = "Бесплатный кейс";
		image = "config\cases\free_case\free_case.paa";
		items[] = {
			"free_money_10000",
			"free_money_12500",
			"free_money_15000",
			"free_money_17500",
			"free_money_20000",
			"free_money_22500",
			"free_money_25000",
			"free_money_27500",
			"free_money_30000",
			"free_money_32500",
			"free_vip1_3",
			"free_vip2_3",
			"free_vip3_3",
			"free_vip4_3",
			"free_rc_99",
			"free_rc_199",
			"free_rc_299",
			"free_rc_399",
			"free_rc_499"
		};
	};
	class free_case2
	{
		displayName = "Бесплатный кейс";
		image = "config\cases\free_case\free_case.paa";
		items[] = {
			"free_money_10000",
			"free_money_12500",
			"free_money_15000",
			"free_money_17500",
			"free_money_20000",
			"free_money_22500",
			"free_money_25000",
			"free_money_27500",
			"free_money_30000",
			"free_money_32500",
			"free_trx_1",
			"free_trx_2",
			"free_trx_3",
			"free_trx_4",
			"free_trx_5",
			"free_trx_6",
			"free_trx_7",
			"free_trx_9",
			"free_trx_10",
			"Perventin",
			"Jivchik",
			"Flash",
			"JeamBean",
			"PerventinSyringe",
			"SurgeryKit",
			"Bafaut",
			"Jamb",
			"SheepPotato",
			"TunaRoll",
			"Speedball",
			"Backpack100"
		};
	};
	class case_ny2023_cars
	{
		displayName = "Рождественский 2023";
		image = "config\cases\ny2023\cases_ny23.paa";
		items[] = {
			"ny23_money_15000",
			"ny23_money_20000",
			"ny23_money_30000",
			"ny23_money_40000",
			"ny23_money_50000",
			"ny23_money_75000",
			"ny23_money_100000",
			"ny23_money_150000",
			"ny23_money_200000",
			"ny23_money_250000",
			"ny23_rc_399",
			"ny23_rc_599",
			"ny23_rc_699",
			"ny23_rc_799",
			"ny23_nsx",
			"ny23_mustang",
			"ny23_windsor",
			"ny23_g65",
			"ny23_escalade",
			"ny23_transam",
			"ny23_Quattro",
			"ny23_e34",
			"ny23_bmw1M",
			"ny23_lincoln",
			"ny23_r5",
			"ny23_2114",
			"ny23_Buggy",
			"ny23_twingo",
			"ny23_c4"
		};
	};
	class case_ny2023_cars_rc : case_ny2023_cars {};
	class case_hallowen_cars
	{
		displayName = "Авто Хеллоуина";
		image = "config\cases\hallowen_cases\carcase_halloween.paa";
		items[] = {
			"hallowen_nimbus",
			"hallowen_c63",
			"hallowen_cruiser",
			"hallowen_gtr",
			"hallowen_gt63",
			"hallowen_zr1spoiler",
			"hallowen_w124",
			"hallowen_mini",
			"hallowen_clk",
			"hallowen_bmw1M",
			"hallowen_pontiackitt",
			"hallowen_rs4",
			"hallowen_peugeot508",
			"hallowen_audiq7",
			"hallowen_alfaromeobrera",
			"hallowen_smart"
		};
	};
	class case_hallowen_cars_free: case_hallowen_cars
	{
		displayName = "Авто Хеллоуина";
		image = "config\cases\hallowen_cases\carcase_halloween.paa";
		items[] = {
			"hallowen_vedro",
			"hallowen_c63",
			"hallowen_cruiser",
			"hallowen_gtr",
			"hallowen_gt63",
			"hallowen_zr1spoiler",
			"hallowen_w124",
			"hallowen_mini",
			"hallowen_clk",
			"hallowen_bmw1M",
			"hallowen_pontiackitt",
			"hallowen_rs4",
			"hallowen_peugeot508",
			"hallowen_audiq7",
			"hallowen_alfaromeobrera",
			"hallowen_smart"
		};
	};
	class case_hallowen_masks
	{
		displayName = "Маски Хеллоуина";
		image = "config\cases\hallowen_cases\case.paa";
		items[] = {
			"AngryArbuz", 
			"AngryPumpkin_2",
			"OldManZombie",
			"OldManZombie_2",
			"Witched",
			"Witched_2",
			"Troll",
			"Troll_2",
			"Devil",
			"Devil_2",
			"HeatSkin",
			"HeatSkin_2",
			"MeatSkin",
			"MeatSkin_2",
			"HeadInHead",
			"HeadInHead_2",
			"WerWolf",
			"WerWolf_2",
			"BeeAlien",
			"BeeAlien_2",
			"ZombieDread",
			"ZombieDread_2",
			"Demon",
			"Demon_2"
		};
	};
	class case_hallowen_masks_free: case_hallowen_masks {
		items[] = {
			"AngryPumpkin",
			"AngryPumpkin_2",
			"OldManZombie_2",
			"OldManZombie_3",
			"Witched_2",
			"Witched_3",
			"Troll_2",
			"Troll_3",
			"Devil_2",
			"Devil_3",
			"HeatSkin_2",
			"HeatSkin_3",
			"MeatSkin_2",
			"MeatSkin_3",
			"HeadInHead_2",
			"HeadInHead_3",
			"WerWolf_2",
			"WerWolf_3",
			"BeeAlien_2",
			"BeeAlien_3",
			"ZombieDread_2",
			"ZombieDread_3",
			"Demon_2",
			"Demon_3",
			"HeadBag_2",
			"HeadBag_3"
		};
	};
};
