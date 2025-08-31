class CfgFarm {
        minerVehicleList[] = {"RRP_Dob"};

        //save time %
        vip[] = {
            10,
            20,
            30,
            40
        };


    class Resources {
        class RRP_Apple {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = {"RRP_Gather_Apple_1", "RRP_Gather_Apple_2", "RRP_Gather_Apple_3", "RRP_Gather_Apple_NewZone"};
            mined = "RRP_Apple";
            zoneSize = 15;
			profName = "Fruit_Prof";
            tool = "treeSearch";
            interactionObject = "apple_tree";
            condition = "";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        /* Картошка */
        class RRP_Potato {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = {"RRP_Gather_Potato_1"};
            mined = "RRP_Potato";
            zoneSize = 7;
			profName = "Fruit_Prof";
            tool = "Extremo_Tool_Shovel";
            interactionObject = "";
            condition = "";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        /* Рис */
        class RRP_Rice {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = {"RRP_Gather_Rice_1"};
            mined = "RRP_Rice";
            zoneSize = 12;
			profName = "Fruit_Prof";
            tool = "Extremo_Tool_Shovel";
            interactionObject = "";
            condition = "";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        /* Бензин */
        class RRP_Gasolin {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "RRP_Gather_Gasoline"};
            mined ="RRP_Gasolin";
            tool = "treeSearch";
            zoneSize = 5;
			profName = "Oil_Prof";
            interactionObject = "Land_SCF_01_pipe_end_F";
            condition = "";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        /* Глина */
        class RRP_Clay {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "RRP_Gather_Clay_1"};
            mined ="RRP_Clay";
            tool = "Extremo_Tool_Shovel";
            zoneSize = 30;
			profName = "Clay_Prof";
            interactionObject = "";
            condition = "";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        /* Песок */
        class RRP_Sand {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "RRP_Gather_Sand_1"};
            mined = "RRP_Sand";
            zoneSize = 30;
			profName = "Sand_Prof";
            interactionObject = "";
            condition = "";
            tool = "Extremo_Tool_Shovel";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        /* Сера */
        class RRP_Sulfur {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "RRP_Gather_Sulfur_1"};
            mined = "RRP_Sulfur";
            zoneSize = 30;
			profName = "Salt_Prof";
            interactionObject = "";
            condition = "";
            tool = "Extremo_Tool_Shovel";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        /* Палладий */
        class RRP_Palladium {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "RRP_Gather_Palladium_1"};
            mined = "RRP_Palladium";
            zoneSize = 30;
			profName = "Uran_Prof";
            interactionObject = "acd_W_sharpStone_02";
            condition = "";
            tool = "Extremo_Tool_PickAxe";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        /* Тюремный уголь */
        class RRP_CoalJail {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "RRP_Gather_Jail_1"};
			mined = "RRP_CoalJail";
            zoneSize = 40;
			profName = "Mining_Prof";
            interactionObject = "";
            condition = "";
            tool = "Extremo_Tool_PickAxe";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        class RRP_Mining {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "RRP_Gather_Mining_1"};
			mined = "RRP_Ore";
            zoneSize = 50;
			profName = "Mining_Prof";
            interactionObject = "";
            condition = "";
            tool = "Extremo_Tool_PickAxe";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };

        class RRP_Minerals {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "RRP_Gather_Mineral_1"};
			mined = "RRP_Mineral";
            zoneSize = 50;
			profName = "Minerals_Prof";
            interactionObject = "";
            condition = "";
            tool = "Extremo_Tool_PickAxe";
            enabledFarmInVeh = 12;
            enabledFarmMiner = 18;
        };
        class RRP_Cotton {
            maxAmount = 1;
            defaultTime = 5;
            zones[] = { "cotton" };
			mined = "RRP_Cotton";
			profName = "Fruit_Prof";
            zoneSize = 25;
            interactionObject = "";
            condition = "life_slave";
        };
    };
};
