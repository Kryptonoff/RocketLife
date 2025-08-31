class CfgLootBox
{
	chances[] = 
	{
		{"blue",50},
		{"green",25},
		{"pink",10},
		{"gold",5}
	};
	class blue //самые популярные 
	{
		name = "Синий";
		money[] =
		{
			{6000,"rimas_agent\assets\loot\box_blue.paa"},
			{6500,"rimas_agent\assets\loot\box_blue.paa"},
			{7000,"rimas_agent\assets\loot\box_blue.paa"},
			{7500,"rimas_agent\assets\loot\box_blue.paa"}
		};
		item[] = {};
		vehicles[] = 
		{
			{"RRPVehicle_civ_e34_NY2022","rimas_agent\assets\loot\box_blue.paa"},
			{"RRPVehicle_civ_peugeot508_NY2022","rimas_agent\assets\loot\box_blue.paa"},
			{"RRPVehicle_civ_citroends3_NY2022","rimas_agent\assets\loot\box_blue.paa"},
			{"RRPVehicle_civ_r5_NY2022","rimas_agent\assets\loot\box_blue.paa"}
		};
	};
	class green //не редкие
	{
		name = "Зеленый";
		money[] =
		{
			{9500,"rimas_agent\assets\loot\box_green.paa"},
			{10000,"rimas_agent\assets\loot\box_green.paa"},
			{11500,"rimas_agent\assets\loot\box_green.paa"},
			{12000,"rimas_agent\assets\loot\box_green.paa"}
		};
		item[] = {};
		vehicles[] = 
		{
			{"RRPVehicle_civ_audiq7_NY2022","rimas_agent\assets\loot\box_green.paa"},
			{"RRPVehicle_civ_roversport_NY2022","rimas_agent\assets\loot\box_green.paa"},
			{"RRPVehicle_civ_cayenne_NY2022","rimas_agent\assets\loot\box_green.paa"},
			{"RRPVehicle_civ_touareg_NY2022","rimas_agent\assets\loot\box_green.paa"}
		};
	};
	class pink //редкие
	{
		name = "Розовый";
		money[] =
		{
			{13500,"rimas_agent\assets\loot\box_pink.paa"},
			{14000,"rimas_agent\assets\loot\box_pink.paa"},
			{14500,"rimas_agent\assets\loot\box_pink.paa"},
			{15000,"rimas_agent\assets\loot\box_pink.paa"}
		};
		item[] = {};
		vehicles[] = 
		{
			{"RRPVehicle_civ_bmw6_1_NY2022","rimas_agent\assets\loot\box_pink.paa"},
			{"RRPVehicle_civ_bmw6_2_NY2022","rimas_agent\assets\loot\box_pink.paa"},
			{"RRPVehicle_civ_clk_NY2022","rimas_agent\assets\loot\box_pink.paa"},
			{"RRPVehicle_civ_golfVI_NY2022","rimas_agent\assets\loot\box_pink.paa"}
		};
	};
	class gold // самые редкие 
	{
		name = "Золотой";
		money[] =
		{
			{25000,"rimas_agent\assets\loot\box_gold.paa"},
			{26000,"rimas_agent\assets\loot\box_gold.paa"},
			{27000,"rimas_agent\assets\loot\box_gold.paa"},
			{30000,"rimas_agent\assets\loot\box_gold.paa"}
		};
		item[] = {};
		vehicles[] = 
		{
			{"RRPVehicle_civ_bmw1M_NY2022","rimas_agent\assets\loot\box_gold.paa"},
			{"RRPVehicle_civ_G65_NY2022","rimas_agent\assets\loot\box_gold.paa"},
			{"RRPVehicle_civ_gtr_NY2022","rimas_agent\assets\loot\box_gold.paa"},
			{"RRPVehicle_civ_yamaha_NY2022","rimas_agent\assets\loot\box_gold.paa"}
		};
	};
};