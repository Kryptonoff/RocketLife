class LifeCfgCrypto {
 	
 	farmLevels = 3; // 1-3
 	
 	// Это число выдается каждую минуту
     miningAward_level_1 = 1 / 60; // Уровень 1: 1 BTC за 60 минут
     miningAward_level_2 = 2 / 60; // Уровень 2: 2 BTC за 60 минут
     miningAward_level_3 = 3 / 60; // Уровень 3: 3 BTC за 60 минут
 
 	resourcesToUpFarmLevel[] = {
 		// level . [ [className . count], [className . count] ]
 		{1, { {"welmen_GPU", 1}, {"welmen_CPU", 1}, {"welmen_OZU", 1} }},
 		{2, { {"welmen_GPU2", 2}, {"welmen_CPU2", 2}, {"welmen_OZU2", 2} }},
 		{3, { {"welmen_GPU3", 3}, {"welmen_CPU2", 3}, {"welmen_OZU2", 3} }}
 	};
 
     // Цена BTC
     btcPrice = 33333;
 };