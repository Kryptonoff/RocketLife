#define true 1
#define false 0

class LifeCfgFarming {
	class ftmItem_CornSeed {       //className семени который будет вырашиваться
		model = "A3L_Corn";      //className модели растения или путь к модели
		ground = 1.15;           //на сколько надо утопить растение под землю (в метрах)
		size = 2;              //радиус занятой площади
		time = 3600;              //Время выращивания (в сек.)
		extraTime = 600;         //Дополнительное время выращивания (рандом в сек.)
		wateringTime = 600;         //Время через которое нужно полить еще раз
		tool = "Extremo_Tool_Shovel";  //Инуструмент нужный для вырашивания
		conditions = "";
		conditionsMessage = "Вы не можете посадить это семя";
		fertilizer = false;
		items[] = {
			{{"RRP_Treasure_10", {5, 10}}, 5},
			{{"RRP_Scandium", {5, 10}}, 10},
			{{"A3L_Corn", {5, 10}}, 100}
		};
	};
	
	class ftmItem_CottonSeed {
		model = "A3L_Cotton";
		ground = 1.11;
		size = 2;
		time = 3600;
		extraTime = 600;
		wateringTime = 600;
		tool = "Extremo_Tool_Shovel";
		conditions = "";
		conditionsMessage = "Вы не можете посадить это семя";
		fertilizer = false;
		items[] = {
			{{"RRP_Treasure_10", {5, 10}}, 5},
			{{"RRP_Scandium", {5, 10}}, 10},
			{{"RRP_Cotton", {5, 10}}, 100}
		};
	};
	class ftmItem_CannabisSeed {
		model = "A3L_Cannabis";
		ground = 1.22;
		size = 2;
		time = 1800;
		extraTime = 300;
		wateringTime = 300;
		tool = "Extremo_Tool_Shovel";
		//conditions = "playerSide == independent OR (playerSide == civilian && server_mar_legal)";
		conditions = "";
		conditionsMessage = "Правительство запретило медицинскую марихуану и перевело ее в статус нелегала";
		fertilizer = true;
		items[] = {
			{{"RRP_Treasure_10", {5, 10}}, 5},
			{{"RRP_Scandium", {5, 10}}, 10},
			{{"RRP_Cannabis", {5, 10}}, 100}
		};
	};
	class ftmItem_BeansSeed {
		model = "A3L_Beans";
		ground = 1.27;
		size = 2;
		time = 3600;
		extraTime = 600;
		wateringTime = 600;
		tool = "Extremo_Tool_Shovel";
		conditions = "";
		conditionsMessage = "Вы не можете посадить это семя";
		fertilizer = false;
		items[] = {
			{{"RRP_Treasure_10", {5, 10}}, 5},
			{{"RRP_Scandium", {5, 10}}, 10},
			{{"RRP_beans", {5, 10}}, 100}
		};
	};
	class ftmItem_WheatSeed {
		model = "A3L_Wheat";
		ground = 1.1;
		size = 2;
		time = 3600;
		extraTime = 600;
		wateringTime = 600;
		tool = "Extremo_Tool_Shovel";
		conditions = "";
		conditionsMessage = "Вы не можете посадить это семя";
		fertilizer = false;
		items[] = {
			{{"RRP_Treasure_10", {5, 10}}, 5},
			{{"RRP_Scandium", {5, 10}}, 10},
			{{"RRP_Wheat", {5, 10}}, 100}
		};
	};
	class ftmItem_SunflowerSeed {
		model = "A3L_Sunflower";
		ground = 1.2;
		size = 2;
		time = 3600;
		extraTime = 600;
		wateringTime = 600;
		tool = "Extremo_Tool_Shovel";
		conditions = "";
		conditionsMessage = "Вы не можете посадить это семя";
		fertilizer = false;
		items[] = {
			{{"RRP_Treasure_10", {5, 10}}, 5},
			{{"RRP_Scandium", {5, 10}}, 10},
			{{"RRP_sunflower", {5, 10}}, 100}
		};
	};
};

class LifeCfgPugalo {
	class RRPItem_Ornate_F {
		model = "Flag_NATO_F";
		days = 5;
		radius = 15;
	};
	class pugaloDesyatDney {
		model = "Flag_NATO_F";
		days = 10;
		radius = 25;
	};
	class pugaloDvatsatDney {
		model = "Flag_NATO_F";
		days = 20;
		radius = 35;
	};
};