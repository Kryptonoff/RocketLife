
/**
 * Points: RCredits 
 * RRPAtm: в банк
 * VEHICLE: транспорт
 * ITEM: предмет
 * KIT: кит предметов, нужно формировать в Rewards
 * VIP: vip1,vip2,vip3,vip4 - количество это 1 день
 * Правила заполнения:
 * rewardsItems[] = {
 * 		{"Points",3300},
 * 		{"RRPAtm",10000},
 * 		{"Vehicle","automobil"},
 * 		{"Item","kartoshka"},
 * 		{"vip1",3},
 * 		{"KIT","KitName"}
	};
	Предмет выбирает рандомно, никаких шансов нет
*/

class RewardKits
{
	class CurrencyKit
	{
		displayName = "CurrencyKit";
		items[] = 
		{
			{"Points",2000},
			{"RRPAtm",2000}
		};
	};
	class VehicleKit
	{
		displayName = "VehicleKit";
		items[] = 
		{
			{"B_MRAP_01_F",1}
		};
	};
};

class CfgDailyRewards
{
	class images
	{
		Points = "";
		RRPAtm = "";
		Vehicle = "";
		Item = "";
		vip1 = "\rimas_agent\assets\hud\vip1.paa";
		vip2 = "\rimas_agent\assets\hud\vip2.paa";
		vip3 = "\rimas_agent\assets\hud\vip3.paa";
		vip4 = "\rimas_agent\assets\hud\vip4.paa";
		KIT = "";
	};
	class unlimDay
	{
		rewardsItems[] = {

		};
	};
	class day1
	{
		rewardsItems[] = {};
	};
	class day2
	{
		rewardsItems[] = {};
	};
	class day3
	{
		rewardsItems[] = {};
	};
	class day4
	{
		rewardsItems[] = {};
	};
	class day5
	{
		rewardsItems[] = {};
	};
	class day6
	{
		rewardsItems[] = {};
	};
	class day7
	{
		rewardsItems[] = {};
	};
	class day8
	{
		rewardsItems[] = {};
	};
	class day9
	{
		rewardsItems[] = {};
	};
	class day10
	{
		rewardsItems[] = {};
	};
	class day11
	{
		rewardsItems[] = {};
	};
	class day12
	{
		rewardsItems[] = {};
	};
	class day13
	{
		rewardsItems[] = {};
	};
	class day14
	{
		rewardsItems[] = {};
	};
};
