class RRPConfigProcSetting
{
	time = 1;
	vip1 = 15;
	vip2 = 30;
	vip3 = 45;
	vip4 = 60;
};

class CFGProcessing
{

	class RRP_Clay_Proc {
		proccessingInVehicle = "('Clay_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		processingName = "Изготовление кирпичей";
		processingProf = "";
		condition      = "license_proc_clay";
		conditionMess 	= "Необходимо приобрести разрешение на переработку глины";
		license = "license_proc_clay";
		Recipes[] = {
			{{"RRP_Brick","VirtualItem"},"","",{ {"RRP_Clay",1} },{"Clay_Prof",0}}
		};
	};

    class RRP_Sand_Proc {
		proccessingInVehicle = "('Sand_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Изготовление стекла";
		 processingProf = "";
		 condition      = "license_proc_sand";
		 conditionMess 	= "Необходимо приобрести разрешение на переработку песка";
		 license = "license_proc_sand";
		 Recipes[] = {
			{{"RRP_Glass","VirtualItem"},"","",{ {"RRP_Sand",1} },{"Sand_Prof",0}}
		};
	};

    class RRP_Sulfur_Proc {
		proccessingInVehicle = "('Salt_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Изготовление спичек";
		 processingProf = "";
		 condition      = "license_proc_sulfur";
		 conditionMess 	= "Необходимо приобрести разрешение на переработку серы";
		 license = "license_proc_sulfur";
		 Recipes[] = {
			{{"RRP_Matches","VirtualItem"},"","",{ {"RRP_Sulfur",1} },{"Salt_Prof",0}}
		};
	};

    class RRP_Palladium_Proc {
		proccessingInVehicle = "('Uran_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Обработка палладия";
		 processingProf = "";
		 condition      = "";
		 conditionMess 	= "";
		 Recipes[] = {
			{{"RRP_Palladium_Ref","VirtualItem"},"","",{ {"RRP_Palladium",1} },{"Uran_Prof",0}}
		};
	};

    class RRP_CoalJail_Proc {
		proccessingInVehicle = "('Mining_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Изготовление чернил";
		 processingProf = "";
		 condition      = "";
		 conditionMess 	= "";
		 Recipes[] = {
			{{"RRP_InkJail","VirtualItem"},"","",{ {"RRP_CoalJail",1} },{"Mining_Prof",0}}
		};
	};

    class RRP_Wheat_Proc {
		proccessingInVehicle = "('combain_prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Изготовление хлеба";
		 processingProf = "";
		 condition      = "license_proc_wheat";
		 conditionMess 	= "Необходимо приобрести разрешение на переработку пшеницы";
		 license = "license_proc_wheat";
		 Recipes[] = {
			{{"RRP_Bread","VirtualItem"},"","",{ {"RRP_Wheat",1} },{"combain_prof",0}}
		};
	};

	class RRP_Gasolin_Proc {
		proccessingInVehicle = "('Oil_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Очистка бензина";
		 processingProf = "";
		 condition      = "license_proc_gasolin";
		 conditionMess 	= "Необходимо приобрести разрешение на переработку нефти";
		 license = "license_proc_gasolin";
		 Recipes[] = {
			{{"RRP_ClearGasolin","VirtualItem"},"","",{ {"RRP_Gasolin",1} },{"Oil_Prof",0}}
		};
	};

	class RRP_Mining_Proc {
		proccessingInVehicle = "('Mining_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Обработка руды";
		 processingProf = "";
		 condition      = "license_proc_mining";
		 conditionMess 	= "Необходимо приобрести разрешение на переработку руды";
		 license = "license_proc_mining";
		 Recipes[] = {
			{{"RRP_Coal","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",0}},
			{{"RRP_Copper","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",3}},
			{{"RRP_Iron","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",7}},
			{{"RRP_Tin","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",10}},
			{{"RRP_Lead","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",13}},
			{{"RRP_Nickel","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",16}},
			{{"RRP_Silver","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",20}},
			{{"RRP_Gold","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",23}},
			{{"RRP_Titan","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",27}},
			{{"RRP_Mithril","VirtualItem"},"","",{ {"RRP_Ore",1} },{"Mining_Prof",30}}
		};
	};

	class RRP_Mineral_Proc {
		proccessingInVehicle = "('Minerals_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Обработка минералов";
		 processingProf = "";
		 condition      = "license_proc_minerals";
		 conditionMess 	= "Необходимо приобрести разрешение на переработку минералов";
		 license = "license_proc_minerals";
		 Recipes[] = {
			{{"RRP_Yashma","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",0}},
			{{"RRP_Nephritis","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",3}},
			{{"RRP_Obsidian","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",7}},
			{{"RRP_Apatit","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",10}},
			{{"RRP_Malachit","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",13}},
			{{"RRP_Amber","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",16}},
			{{"RRP_Topaz","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",20}},
			{{"RRP_Opal","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",23}},
			{{"RRP_Ruby","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",27}},
			{{"RRP_Sapphire","VirtualItem"},"","",{ {"RRP_Mineral",1} },{"Minerals_Prof",30}}
		};
	};

    class RRP_Proc_Scallops {
		proccessingInVehicle = "('Diving_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Обработка гребешков";
		 processingProf = "";
		 condition      = "";
		 conditionMess 	= "";
		 Recipes[] = {
			{{"RRP_Scallops_Meat","VirtualItem"},"","",{ {"RRP_Scallops",1} },{"Diving_Prof",0}}
		};
	};

    class RRP_RZ_Proc_1 {
		proccessingInVehicle = "('Drug_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Обработка кокаина/мака";
		 processingProf = "";
		 condition      = "(player getVariable ['RRPSide','error']) in ['civ','reb']";
		 conditionMess 	= "Вы не можете перерабатывать нелегальные ресурсы!";
		 Recipes[] = {
			{{"RRP_Cocaine","VirtualItem"},"","",{ {"RRP_Cocaine_Leaf",1} },{"Drug_Prof",0}},
			{{"RRP_Heroin","VirtualItem"},"","",{ {"RRP_Opium",1} },{"Drug_Prof",0}}
		};
	};

    class RRP_RZ_Proc_2 {
		proccessingInVehicle = "('Drug_Prof' call RRPCLient_util_getSkillInfo) # 1 >= 5";
		proccessingInVehicleMsg = "Для переработки в машину вы должны достичь 5го уровня!";
		 processingName = "Обработка табака/конопли";
		 processingProf = "";
		 condition      = "(player getVariable ['RRPSide','error']) in ['civ','reb']";
		 conditionMess 	= "Вы не можете перерабатывать нелегальные ресурсы!";
		 Recipes[] = {
			{{"RRP_Cigarette","VirtualItem"},"","",{ {"RRP_Tobacco_Leaf",1} },{"Drug_Prof",0}},
			{{"RRP_Hemp","VirtualItem"},"","",{ {"RRP_Hemp_Leaf",1} },{"Drug_Prof",0}}
		};
	};

};
