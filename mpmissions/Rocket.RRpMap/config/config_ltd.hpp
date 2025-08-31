class CfgLtdSlots 
{
	debug = 0;
	commitTime = 0.05;
	limit[] = {50000,500000};
    lossPrevention = 100; 
    slots[] = {0, 1, 2, 3, 4};
    slot_difficulty[] = {
		{0, 6}, 
		{1, 6}, 
		{2, 5}, 
		{3, 5}, 
		{4, 5},
		{5, 5},
		{6, 4},
		{7, 4}
		// {8, 3},
		// {9, 2},
		// {10, 1}

	};
    betAmounts[]={5,6,7,8,9,10,20,30,40,50,100,200,300,400,500,600,700,800,900,1000,5000,10000,50000,100000};
    winChances[] = {
		{{1,0}, {1,1}, {1,2}, {1,3}, {1,4}},
		{{0,0}, {0,1}, {0,2}, {0,3}, {0,4}},
		{{2,0}, {2,1}, {2,2}, {2,3}, {2,4}},
		{{0,0}, {1,1}, {2,2}, {1,3}, {0,4}},
		{{2,0}, {1,1}, {0,2}, {1,3}, {2,4}},
    	{{1,0}, {2,1}, {2,2}, {2,3}, {1,4}},
        {{1,0}, {0,1}, {0,2}, {0,3}, {1,4}}
        // {{2,0}, {2,1}, {1,2}, {0,3}, {0,4}},
        // {{0,0}, {0,1}, {1,2}, {2,3}, {2,4}},  
        // {{2,0}, {1,1}, {1,2}, {1,3}, {0,4}}
    };
    winCfg[] = {
		{0, 3, 10, 45}, 
		{1, 3, 15, 45}, 
		{2, 3, 20, 45}, 
		{3, 3, 25, 45}, 
		{4, 3, 40, 45}, 
		{5, 3, 50, 45}, 
		{6, 3, 60, 45}, 
		{7, 4, 70, 45}

		// {8, 4, 90, 45}, 
		// {9, 4, 100, 45},
		// {10, 4, 300, 45}

    };
    class slot_names 
    {
        class 0  {displayName = "Лимон";};
        class 1 {displayName = "Вишня";};
        class 2 {displayName = "Слива";};
        class 3 {displayName = "Арбуз";};
        class 4 {displayName = "Семь";};
        class 5 {displayName = "Бар";};
		class 6 {displayName = "Шесть";};
		class 7 {displayName = "Бриллиант";};
		class 8 {displayName = "Корона";};
		class 9 {displayName = "Клубника";};
		class 10 {displayName = "Колокол";};
    };
};

//Писать только Виртуальные предметы и CfgMagazines предметы
class RRP_ltdConfig
{
	class ltd_food
	{
		allowedItems[] = 
		{
			
		};
	};
	class ltd_medic
	{
		allowedItems[] = 
		{
			
		};
	};
};

class LifeCfgPlaceablesStore
{
	class 1 
	{
		displayName = "Продуктовый магазин";
		var = "ltd_food";
		classname = "nlrp_ice_cold_drinks";
		conditions = "";
	};
	/* 
	class 2 
	{
		displayName = "Магазин первой помощи";
		var = "ltd_medic";
		classname = "nlrp_snacks";
		conditions = "";
	};	
	class 3
	{
		displayName = "Оружейный магазин";
		var = "ltd_weapons";
		classname = "nlrp_snacks";
		conditions = "";
	};
	 */
};
