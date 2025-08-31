class RRPConfig_Combine {
	//кол-во предметов за 1 минуту без учета вип.
	ratedproductivity = 12; 
	prof = "combain_prof";
	
	zones[] = {
		/*marker,radius,item*/
		{"RRP_Gather_Wheat_1",120,"RRP_Wheat"}
	};
};


class cfgDiving {
	/*
		Шансы
		Legendary 5
		Mythical 10
		rare, 15
		uncommon, 25
		common 45

		{
			"class" - ClassName предмета
			"virt" - Если virt тогда нужно прописывать ресурс, если хочешь обычный предмет тогда оставь ""
			"Legendary" - название редкости, выше написал шансы
		}

		Всего два массива items и illegalItems
		Почему два? Решил сделать две зоны, одна для кепок в гавани возле Кавалы, там будут предметы только с массива items
		Вторая зона будет далеко от Кавалы и она будет красной, вот там будет комбинированный лут с массива items + illegalItems

		Работать будет так: Если Кавала, насыпаем ему от 1 до 5 предметов с items, но если он будет фармить в красной зоне, до досыпается еще 1-3 предмета с illegalItems
	*/
		//на сколько в баллоне хватает вздуха
		capacityOxygenTime = 15;
		oxygenCost = 5; //цена
		items[]= {
            {"RRP_Treasure_1","virt","common"},
            {"RRP_Treasure_2","virt","uncommon"},
            {"RRP_Treasure_3","virt","uncommon"},
            {"RRP_Treasure_4","virt","common"},
            {"RRP_Treasure_5","virt","rare"},
            {"RRP_Treasure_6","virt","common"},
			{"RRP_Treasure_7","virt","rare"},
			{"RRP_Treasure_8","virt","Mythical"},
			{"RRP_Treasure_9","virt","Mythical"},
			{"RRP_Treasure_10","virt","Legendary"}
		};

		illegalItems[] = {};

		trunks[] = {
			"plp_cts_MultiboxColFuel",
			"plp_cts_MultiboxColFuelSide",
			"plp_cts_MultiboxColOlive",
			"plp_cts_MultiboxColOliveSide",
			"plp_cts_MultiboxColOrange",
			"plp_cts_MultiboxColOrangeSide",
			"plp_cts_MultiboxColTan",
			"plp_cts_MultiboxColTanSide"
		};

		zones[] = {
			{"diving",300},
			{"divingIllegal",300}
		};

		positionsIllegal[] = {};
		positions[] = {
		{3175.82,12716.8,0},
		{3171.38,12723.2,0},
		{3161.04,12735.6,0},
		{3169.36,12736.9,0},
		{3117.3,12725.1,0},
		{3207.77,12704.1,0.44557},
		{3199.85,12693.2,12.1949},
		{3192.69,12684.4,2.63276},
		{3207.27,12688.6,2.21974},
		{3238.93,12722.5,-9.53674e-007},
		{3249.98,12687.7,0},
		{3194.11,12648.3,0},
		{3199.59,12627.4,0},
		{3190.77,12770.8,0},
		{3224.13,12789.9,0},
		{3174.82,12742,0},
		{3246.52,12739.3,0},
		{3232.63,12769.1,0},
		{3127.38,12673.9,0},
		{3144.95,12663.8,0},
		{3141.3,12664.7,0},
		{3139.08,12657.5,0},
		{3158.29,12754.3,0},
		{3138.99,12731.3,0.322147},
		{3118.27,12712.1,3.35647},
		{3195.3,12727.2,0.322147},
		{3248.43,12700.6,0.385771}
	};
};

class LifeCfgHerbs
{
	class resourseCfg
	{
	    /* Кокаин */
        class RRP_Cocaine_Leaf
		{
            zones[] = {{"RRP_Gather_Cocaine_1",45}};
			FinalItem = "RRP_Cocaine_Leaf";
			TypeItem  = "virtual";
			profName = "Drug_Prof";
			description = "";
			condition = "(player getVariable ['RRPSide','error']) in ['civ','reb']";
			errorMessage = "Вашей фракции не доступен данный ресурс!";
			image = "";
			object = "A3L_Beans";
			amount = 5;
			time = 10;
        };
        /* Конопля */
        class RRP_Hemp_Leaf
		{
            zones[] = {{"RRP_Gather_Hemp_1",45}};
			FinalItem = "RRP_Hemp_Leaf";
			TypeItem  = "virtual";
			profName = "Drug_Prof";
			description = "";
			condition = "(player getVariable ['RRPSide','error']) in ['civ','reb']";
			errorMessage = "Вашей фракции не доступен данный ресурс!";
			image = "";
			object = "A3L_Cannabis";
			amount = 5;
			time = 10;
        };
        /* Мак */
        class RRP_Opium
		{
            zones[] = {{"RRP_Gather_Opium_1",45}};
			FinalItem = "RRP_Opium";
			TypeItem  = "virtual";
			profName = "Drug_Prof";
			description = "";
			condition = "(player getVariable ['RRPSide','error']) in ['civ','reb']";
			errorMessage = "Вашей фракции не доступен данный ресурс!";
			image = "";
			object = "A3L_Sunflower";
			amount = 5;
			time = 10;
        };
        /* Табак */
        class RRP_Tobacco_Leaf
		{
            zones[] = {{"RRP_Gather_Tobacco_1",45}};
			FinalItem = "RRP_Tobacco_Leaf";
			TypeItem  = "virtual";
			profName = "Drug_Prof";
			description = "";
			condition = "(player getVariable ['RRPSide','error']) in ['civ','reb']";
			errorMessage = "Вашей фракции не доступен данный ресурс!";
			image = "";
			object = "A3L_Beans";
			amount = 5;
			time = 10;
        };
        /* Хлопок */
        class RRP_Cotton
		{
            zones[] = {{"RRP_Gather_Cotton_1",45}};
			FinalItem = "RRP_Cotton";
			TypeItem  = "virtual";
			profName = "Fruit_Prof";
			description = "";
			condition = "";
			errorMessage = "Вашей фракции не доступен данный ресурс!";
			image = "";
			object = "acd_b_NeriumO2s_white_F";
			amount = 5;
			time = 10;
        };
	};
};



class RRPConfig_Fishing {
	time    = 50;
	amount  = 3;
	prof    = "Fishing_Prof";
	
	zones[] = {
		/*marker,radius*/
		{"RRP_Gather_Fish_1",400}
	};
	
	Items[] = {
		/*class,chance*/
		{"RRPItem_Tuna_F",5},
		{"RRPItem_CatShark_F",10},
		{"RRPItem_Salema_F",15},
		{"RRPItem_Mullet_F",20},
		{"RRPItem_Ornate_F",35},
		{"RRPItem_Mackrel_F",45}
	};
};

class RRPConfig_bomj {
	Items[] = {
		{"RRP_Treasure_1",15,"virtual"},
		{"RRP_Treasure_4",15,"virtual"},
		{"RRP_Treasure_6",15,"virtual"},
		{"RRP_Treasure_3",15,"virtual"}
	};
};

class RRPConfig_oilPumping {
	class RRP_ShaleOil
	{
		//vehicle
		amountEveryTick = 3;
		oneTick = 18;

		//handle
		amount = 2;
		defaultTime = 30;

		item = "RRP_ShaleOil";
		prof = "Oil_Prof";
		zones[] = {{"RRP_Gather_ShaleOil_1",400}};
	};

};

class jail_work {
	timeAction = 15;
	saveTime = 60;	
};
