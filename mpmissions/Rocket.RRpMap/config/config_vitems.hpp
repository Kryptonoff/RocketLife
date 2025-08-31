class VirtualShops {

    class RRP_Buyer_Fruits {
        name = "Скупщик фруктов и овощей";
        items[] = { 
            "RRP_Apple",
            "RRP_Potato",
            "RRP_Rice"
        };
		legal = "true";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_Bricks {
        name = "Скупщик кирпичей";
        items[] = { "RRP_Brick" };
		legal = "true";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_Glass {
        name = "Скупщик стекла";
        items[] = { "RRP_Glass" };
		legal = "true";
		conditions = "";
        side = "";
    };
    
    class RRP_Buyer_Matches {
        name = "Скупщик спичек";
        items[] = { "RRP_Matches" };
		legal = "true";
		conditions = "";
        side = "";
    };
    
    class RRP_Buyer_Palladium {
        name = "Скупщик палладия";
        items[] = { "RRP_Palladium_Ref" };
		legal = "false";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_InkJail {
        name = "Скупщик чернил";
        items[] = { "RRP_InkJail" };
		legal = "true";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_Bread {
        name = "Скупщик хлеба";
        items[] = { "RRP_Bread" };
		legal = "true";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_Gasolin {
        name = "Скупщик бензина";
        items[] = { "RRP_ClearGasolin" };
		legal = "true";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_Trash {
        name = "Скупщик хлама";
        items[] = {
            "RRP_Treasure_1",
            "RRP_Treasure_2",
            "RRP_Treasure_3",
            "RRP_Treasure_4",
            "RRP_Treasure_5",
            "RRP_Treasure_6",
            "RRP_Treasure_7",
            "RRP_Treasure_8",
            "RRP_Treasure_9",
            "RRP_Treasure_10"
        };
		legal = "true";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_Mining {
        name = "Скупщик минералов/руды";
        items[] = {
            "RRP_Coal",
            "RRP_Copper",
            "RRP_Iron",
            "RRP_Tin",
            "RRP_Lead",
            "RRP_Nickel",
            "RRP_Silver",
            "RRP_Gold",
            "RRP_Titan",
            "RRP_Mithril",
            "RRP_Yashma",
            "RRP_Nephritis",
            "RRP_Obsidian",
            "RRP_Apatit",
            "RRP_Malachit",
            "RRP_Amber",
            "RRP_Topaz",
            "RRP_Opal",
            "RRP_Ruby",
            "RRP_Sapphire"
        };
		legal = "true";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_RZ {
        name = "Наркодилер";
        items[] = { 
            "RRP_Cocaine", 
            "RRP_Heroin", 
            "RRP_Cigarette", 
            "RRP_Hemp" 
        };
		legal = "false";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_StolenGold {
        name = "Скупщик золота";
        items[] = { 
            "RRP_Gold"
        };
		legal = "false";
		conditions = "";
        side = "";
    };

    class RRP_Buyer_Scallops {
        name = "Наркодилер";
        items[] = { "RRP_Scallops_Meat" };
		legal = "false";
		conditions = "";
        side = "";
    };
};

class VirtualItems {
    class money_virt {
        displayName = "Деньги";
        weight = 0;
        icon = "\rimas_pack\icons\items\money.paa";
        variable = "money_virt";
    };
    class dmoney_virt {
        displayName = "Грязные деньги";
        weight = 0;
        icon = "\rimas_pack\icons\items\dmoney.paa";
        variable = "dmoney_virt";
    };
    /* Обычный фарм */

    class RRP_Apple {
        displayName = "Яблоко";
        weight = 1;
        icon = "\RRP_icons\virtItems\apple.paa";
        variable = "RRP_Apple";
    };

    class RRP_Potato {
        displayName = "Картофель";
        weight = 1;
		icon = "\RRP_icons\Farm\Potato.paa";
        variable = "RRP_Potato";
    };

    class RRP_Rice {
        displayName = "Рис";
        weight = 1;
		icon = "\RRP_icons\Farm\Rice.paa";
        variable = "RRP_Rice";
    };

    class RRP_Cotton {
        displayName = "Хлопок";
        weight = 1;
		icon = "\RRP_icons\Farm\Cotton.paa";
        variable = "RRP_Cotton";
    };

    class RRP_Gasolin {
        displayName = "Бензин";
        weight = 4;
		icon = "\RRP_icons\Farm\Canister.paa";
        variable = "RRP_Gasolin";
    };

    class RRP_ClearGasolin {
        displayName = "Чистый бензин";
        weight = 4;
		icon = "\RRP_icons\Farm\CanisterOil.paa";
        variable = "RRP_ClearGasolin";
    };

    class RRP_Wheat {
        displayName = "Пшеница";
        weight = 4;
		icon = "\RRP_icons\virtItems\pheno.paa";
        variable = "RRP_Wheat";
    };

    class RRP_Bread {
        displayName = "Хлеб";
        weight = 4;
		icon = "\RRP_icons\Farm\Bread.paa";
        variable = "RRP_Bread";
    };

    class RRP_Clay {
        displayName = "Глина";
        weight = 4;
        icon = "\RRP_icons\Farm\Clay.paa";
        variable = "RRP_Clay";
    };

    class RRP_Brick {
        displayName = "Кирпич";
        weight = 4;
        icon = "\RRP_icons\Farm\Brick.paa";
        variable = "RRP_Brick";
    };

    class RRP_Sand {
        displayName = "Песок";
        weight = 4;
        icon = "\RRP_icons\Farm\Sand.paa";
        variable = "RRP_Sand";
    };

    class RRP_Glass {
        displayName = "Стекло";
        weight = 4;
        icon = "\RRP_icons\Farm\Glass.paa";
        variable = "RRP_Glass";
    };

    class RRP_Sulfur {
        displayName = "Сера";
        weight = 4;
        icon = "\RRP_icons\Farm\Sulfur.paa";
        variable = "RRP_Sulfur";
    };

    class RRP_Matches {
        displayName = "Спички";
        weight = 4;
        icon = "\RRP_icons\Farm\Matches.paa";
        variable = "RRP_Matches";
    };

    class RRP_Palladium {
        displayName = "Палладиевая руда";
        weight = 4;
        icon = "\RRP_icons\Farm\Palladium_ore.paa";
        variable = "RRP_Palladium";
    };

    class RRP_Palladium_Ref {
        displayName = "Палладий";
        weight = 4;
        icon = "\RRP_icons\Farm\Palladium.paa";
        variable = "RRP_Palladium_Ref";
    };

    class RRP_CoalJail {
        displayName = "Уголь";
        weight = 4;
        icon = "\RRP_icons\Farm\Coal.paa";
        variable = "RRP_CoalJail";
    };

    class RRP_InkJail {
        displayName = "Чернила";
        weight = 4;
        icon = "\RRP_icons\Farm\Ink.paa";
        variable = "RRP_InkJail";
    };

    /* Руда */

    class RRP_Ore {
        displayName = "Горнорудная руда";
        weight = 4;
        icon = "\RRP_icons\Farm\Mining.paa";
        variable = "RRP_Ore";
    };

    class RRP_Coal {
        displayName = "Уголь";
        weight = 4;
        icon = "\RRP_icons\Farm\Coal.paa";
        variable = "RRP_Coal";
    };

    class RRP_Copper {
        displayName = "Медь";
        weight = 4;
        icon = "\RRP_icons\virtItems\copper.paa";
        variable = "RRP_Copper";
    };

    class RRP_Iron {
        displayName = "Железо";
        weight = 4;
        icon = "\RRP_icons\virtItems\iron.paa";
        variable = "RRP_Iron";
    };

    class RRP_Tin {
        displayName = "Олово";
        weight = 4;
        icon = "\RRP_icons\virtItems\olovorefined.paa";
        variable = "RRP_Tin";
    };

    class RRP_Lead {
        displayName = "Свинец";
        weight = 4;
        icon = "\RRP_icons\virtItems\platina_refined.paa";
        variable = "RRP_Lead";
    };

    class RRP_Nickel {
        displayName = "Никель";
        weight = 4;
        icon = "\RRP_icons\virtItems\nikelin.paa";
        variable = "RRP_Nickel";
    };

    class RRP_Silver {
        displayName = "Серебро";
        weight = 4;
        icon = "\RRP_icons\virtItems\silver.paa";
        variable = "RRP_Silver";
    };

    class RRP_Gold {
        displayName = "Золото";
        weight = 4;
        icon = "\RRP_icons\virtItems\gold.paa";
        variable = "RRP_Gold";
    };

    class RRP_Titan {
        displayName = "Титаний";
        weight = 4;
        icon = "\RRP_icons\virtItems\titaniuRefined.paa";
        variable = "RRP_Titan";
    };

    class RRP_Mithril {
        displayName = "Мифрил";
        weight = 4;
        icon = "\RRP_icons\virtItems\mithrilRefined.paa";
        variable = "RRP_Mithril";
    };



    class RRP_Mineral {
        displayName = "Минеральная порода";
        weight = 4;
        icon = "\RRP_icons\Farm\Mineral.paa";
        variable = "RRP_Mineral";
    };

    class RRP_Yashma {
        displayName = "Яшма";
        weight = 4;
        icon = "\RRP_icons\virtItems\yashmaRefined.paa";
        variable = "RRP_Yashma";
    };

    class RRP_Nephritis {
        displayName = "Нефрит";
        weight = 4;
        icon = "\RRP_icons\virtItems\nephritisRefined.paa";
        variable = "RRP_Nephritis";
    };

    class RRP_Obsidian {
        displayName = "Обсидиан";
        weight = 4;
        icon = "\RRP_icons\virtItems\obsidianRefined.paa";
        variable = "RRP_Obsidian";
    };

    class RRP_Apatit {
        displayName = "Апатит";
        weight = 4;
        icon = "\RRP_icons\virtItems\apatitenRefined.paa";
        variable = "RRP_Apatit";
    };

    class RRP_Malachit {
        displayName = "Малахит";
        weight = 4;
        icon = "\RRP_icons\virtItems\malachiteRefined.paa";
        variable = "RRP_Malachit";
    };

    class RRP_Amber {
        displayName = "Янтарь";
        weight = 4;
        icon = "\RRP_icons\virtItems\amberRefined.paa";
        variable = "RRP_Amber";
    };

    class RRP_Topaz {
        displayName = "Топаз";
        weight = 4;
        icon = "\RRP_icons\virtItems\topazRefined.paa";
        variable = "RRP_Topaz";
    };

    class RRP_Opal {
        displayName = "Опал";
        weight = 4;
        icon = "\RRP_icons\virtItems\opalRefined.paa";
        variable = "RRP_Opal";
    };

    class RRP_Ruby {
        displayName = "Рубин";
        weight = 4;
        icon = "\RRP_icons\virtItems\rubyRefined.paa";
        variable = "RRP_Ruby";
    };

    class RRP_Sapphire {
        displayName = "Сапфир";
        weight = 4;
        icon = "\RRP_icons\virtItems\sapphireRefined.paa";
        variable = "RRP_Sapphire";
        description = "";
    };

    /* Красные ресы */

    /* Необ. */
    class RRP_Scallops {
        displayName = "Морские гребешки";
        weight = 4;
        icon = "\RRP_icons\Farm\Scallop.paa";
        variable = "RRP_Scallops";
    };

    class RRP_Cocaine_Leaf {
        displayName = "Лист коки";
        weight = 4;
        icon = "\RRP_icons\Farm\Coca_leaf.paa";
        variable = "RRP_Cocaine_Leaf";
    };

    class RRP_Hemp_Leaf {
        displayName = "Лист конопли";
        weight = 4;
        icon = "\RRP_icons\Farm\Hemp_leaf.paa";
        variable = "RRP_Hemp_Leaf";
    };

    class RRP_Tobacco_Leaf {
        displayName = "Лист табака";
        weight = 4;
        icon = "\RRP_icons\Farm\Tobacco_leaf.paa";
        variable = "RRP_Tobacco_Leaf";
    };

    class RRP_Opium {
        displayName = "Опиумный мак";
        weight = 4;
        icon = "\RRP_icons\Farm\Opium_poppy.paa";
        variable = "RRP_Opium";
    };

    /* Обраб. */
    class RRP_Scallops_Meat {
        displayName = "Мясо гребешка";
        weight = 4;
        icon = "\RRP_icons\Farm\ScallopFillet.paa";
        variable = "RRP_Scallops_Meat";
    };

    class RRP_Cocaine {
        displayName = "Кокаин";
        weight = 4;
        icon = "\RRP_icons\Farm\Cocaine.paa";
        variable = "RRP_Cocaine";
    };

    class RRP_Hemp {
        displayName = "Гашишное масло";
        weight = 4;
        icon = "\RRP_icons\Farm\Hash_oil.paa";
        variable = "RRP_Hemp";
    };

    class RRP_Cigarette {
        displayName = "Самокрутка";
        weight = 4;
        icon = "\RRP_icons\Farm\Cigarette.paa";
        variable = "RRP_Cigarette";
    };

    class RRP_Heroin {
        displayName = "Героин";
        weight = 4;
        icon = "\RRP_icons\Farm\Heroin.paa";
        variable = "RRP_Heroin";
    };

    /* Дайвинг | Мусорка */

    class RRP_Treasure_1 {
        displayName = "Хлам";
        weight = 2;
        icon = "\RRP_UWW\UW_Items\Item_10.paa";
        variable = "RRP_Treasure_1";
	};

    class RRP_Treasure_2 {
        displayName = "Подвеска";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_1.paa";
        variable = "RRP_Treasure_2";
	};

    class RRP_Treasure_3 {
        displayName = "Браслет";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_2.paa";
        variable = "RRP_Treasure_3";
	};

    class RRP_Treasure_4 {
        displayName = "Ложка";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_3.paa";
        variable = "RRP_Treasure_4";
	};

    class RRP_Treasure_5 {
        displayName = "Украшение";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_4.paa";
        variable = "RRP_Treasure_5";
	};

    class RRP_Treasure_6 {
        displayName = "Пустая банка";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_5.paa";
        variable = "RRP_Treasure_6";
	};

    class RRP_Treasure_7 {
        displayName = "Медальон";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_6.paa";
        variable = "RRP_Treasure_7";
	};

    class RRP_Treasure_8 {
        displayName = "Корона";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_7.paa";
        variable = "RRP_Treasure_8";
	};

    class RRP_Treasure_9 {
        displayName = "Диадема";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_8.paa";
        variable = "RRP_Treasure_9";
	};

    class RRP_Treasure_10 {
        displayName = "Золотая монета";
        weight = 1;
        icon = "\RRP_UWW\UW_Items\Item_9.paa";
        variable = "RRP_Treasure_10";
	};

	/* Аномальная зона */

    class RRP_Scandium {
		displayName = "Скандий";
		weight = 1;
		icon = "\RRP_icons\Farm\Scandium.paa";
		variable = "RRP_Scandium";
	};

    /* Мишаня хуйни добавил */
    class RRP_Corn {
        displayName = "Кукуруза";
        weight = 3;
        icon = "\rimas_pack\icons\items\cornmeal.paa";
        variable = "RRP_Corn";
    };
    class RRP_Cannabis {
        displayName = "Каннабис";
        weight = 1;
        icon = "\rimas_pack\icons\items\cannabis.paa";
        variable = "RRP_Cannabis";
    };
    class RRP_beans {
        displayName = "Бобы";
        weight = 3;
        icon = "\rimas_pack\icons\items\hops.paa";
        variable = "RRP_beans";
    };
    class RRP_sunflower {
        displayName = "Подсолнух";
        weight = 3;
        icon = "\rimas_pack\icons\items\yeast.paa";
        variable = "RRP_sunflower";
    };
};