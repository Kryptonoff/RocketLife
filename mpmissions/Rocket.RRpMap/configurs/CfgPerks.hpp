class CfgPerks {
	baseLimit = 3;
	maxLimit = 15;
	removalCost = 100000;

	class SecondNature {
		icon = "Data\UI\Perks\secondNature.paa";
		displayName = "Вторая натура";
		description = "Уменьшает урон от столкновения в машине.";
		removalMultiplier = 1;
		class Requirements {
			factions[] = { "civ", "cop", "Apd", "med" };
			level = 1;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class ImprovedMetabolism {
		icon = "Data\UI\Perks\improvedMetabolism.paa";
		displayName = "Метаболизм+";
		description = "Замедляет голод на 20%.";
		removalMultiplier = 1;
		class Requirements {
			factions[] = { "civ", "cop", "med" };
			level = 2;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class ImprovedGydration {
		icon = "\A3\Ui_f\data\GUI\Cfg\Hints\Timing_ca.paa";
		displayName = "Гиподинамичный+";
		description = "Замедляет жажду на 20%.";
		removalMultiplier = 1;
		class Requirements {
			factions[] = { "civ", "cop", "med" };
			level = 3;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class Muscleman {
		icon = "Data\UI\Perks\muscleman.paa";
		displayName = "Качок";
		description = "Увеличивает вместимость рюкзака для ресурсов 25%.";
		removalMultiplier = 1;
		class Requirements {
			factions[] = { "civ", "cop", "med" };
			level = 4;
			prestige = 0;
			profession[] = {};
		};
		onSelected = "[] call VRP_fnc_maxCarry;";
		onActivated = "";
	};

	class GeneralMechanic {
		icon = "Data\UI\Perks\generalMechanic.paa";
		displayName = "Механик";
		description = "Ускоряет скорость ремонта техники на %1%2.";
		removalMultiplier = 1;
		class Leveling {
			maxLevel = 4;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "10 * (_this select 0)";
		};
		onChanged = "";
		onActivated = "_params - (_params * (_bonus / 100))";
	};
	

	class StreetCleaner {
		icon = "Data\UI\Perks\vehicleCollector.paa";
		displayName = "Уборщик";
		description = "Увеличивает вознаграждение и уменьшает длительность эвакуации техники %1%2.";
		removalMultiplier = 1;
		class Leveling {
			maxLevel = 4;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "10 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "cop","med" };
			level = 6;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "_params - (_params * (_bonus / 100))";
	};
	// TODO
	class SpeedyLocksmith {
		icon = "Data\UI\Perks\speedyLocksmith.paa";
		displayName = "Автоугонщик";
		description = "Увеличивает шанс взлома на %1%2.";
		removalMultiplier = 1.3;
		class Leveling {
			maxLevel = 3;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "20 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "civ", "cop" };
			level = 7;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "_params - (_params * (_bonus / 100))";
	};
//надо занести координаты
	class WideTraveller {
		icon = "Data\UI\Perks\wideTraveller.paa";
		displayName = "Путешественник";
		description = "Позволяет появляться в Агиос, Софии и Неохори.";
		removalMultiplier = 5;
		class Requirements {
			factions[] = { "civ" };
			level = 8;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class LegalTrader {
		icon = "Data\UI\Perks\legalTrader.paa";
		displayName = "Фармила";
		description = "Увеличивает доход с продажи легальных ресурсов на %1%2.";
		removalMultiplier = 3;
		class Leveling {
			maxLevel = 3;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "5 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "civ", "cop", "Apd", "med" };
			level = 10;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "_params + (_params * (_bonus / 100))";
	};
	class friendly {
		icon = "\A3\Ui_f\data\GUI\Cfg\Hints\Lowering_CA.paa";
		displayName = "Френдли";
		description = "Отключает урон по членам одной тусовки или организации";
		removalMultiplier = 2;
		class Requirements {
			factions[] = { "civ" };
			level = 11;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class BoltCutter {
		icon = "Data\UI\Perks\boltCutter.paa";
		displayName = "Болторез";
		description = "Увеличивает скорость взлома домов на %1%2.";
		removalMultiplier = 1.3;
		class Leveling {
			maxLevel = 2;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "25 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "civ", "cop", "med" };
			level = 12;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "_params - (_params * (_bonus / 100))";
	};

	class ShadyTrader {
		icon = "Data\UI\Perks\shadyTrader.paa";
		displayName = "В тени";
		description = "Увеличивает доход с продажи не легальных ресурсов на %1%2.";
		removalMultiplier = 3;
		class Leveling {
			maxLevel = 2;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "5 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "civ", "cop", "med" };
			level = 13;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "_params + (_params * (_bonus / 100))";
	};

	class cuffCourier {
		icon = "Data\UI\Perks\cuffCourier.paa";
		displayName = "Манжеты";
		description = "Можно связать другого игрока не имея при этом стяжек или клейкой ленты";
		removalMultiplier = 1;
		class Requirements {
			factions[] = { "civ" };
			level = 14;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class EcoDriver {
		icon = "Data\UI\Perks\ecoDriver.paa";
		displayName = "Экология";
		description = "Уменьшает расход топлива в технике на 15%.";
		removalMultiplier = 1;
		class Leveling {
			maxLevel = 2;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "25 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "civ", "cop", "med" };
			level = 16;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class MatesRates {
		icon = "Data\UI\Perks\matesRates.paa";
		displayName = "VIP Клиент";
		description = "Снижает плату за выдачу техники на 25%.";
		removalMultiplier = 6;
		class Requirements {
			factions[] = { "civ" };
			level = 17;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};
	
	class ScrapDealer {
		icon = "Data\UI\Perks\scrapDealer.paa";
		displayName = "Металлолом";
		description = "Увеличивает стоимость продажи украденной техники на %1%2.";
		removalMultiplier = 1;
		class Leveling {
			maxLevel = 19;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "3 * (_this select 0)";
		};
		onChanged = "";
		onActivated = "_params + (_params * (_bonus / 100))";
	};

	class SlightofHand { // TODO
		icon = "Data\UI\Perks\slightOfHand.paa";
		displayName = "Ловкость рук";
		description = "Ускоряет скорость перепаковки магазинов на %1%2.";
		removalMultiplier = 1.5;
		class Leveling {
			maxLevel = 2;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "15 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "civ", "cop" };
			level = 20;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class VehicleCollector {
		icon = "Data\UI\Perks\vehicleCollector.paa";
		displayName = "Коллекционер";
		description = "Увеличивает вместимость гаража на 5 слотов";
		removalMultiplier = 10;
		class Requirements {
			factions[] = { "civ" };
			level = 21;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class IntelligentBanker { // TODONOW
		icon = "Data\UI\Perks\intelligentBanker.paa";
		displayName = "Банкир";
		description = "Уменьшает стоимость банковского перевода на %1%2.";
		removalMultiplier = 1;
		class Leveling {
			maxLevel = 4;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "25 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "civ", "cop", "med" };
			level = 23;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	class LifeSaver {
		icon = "\A3\ui_f\data\GUI\Cfg\Hints\Injury_ca.paa";
		displayName = "Спаситель";
		description = "Увеличивает скорость ревайва на %1%2.";
		removalMultiplier = 1;
		class Leveling {
			maxLevel = 5;
			xpLevel = 100;
			xpMultipler = 2;
			levelCalculation = "10 * (_this select 0)";
		};
		class Requirements {
			factions[] = { "civ", "cop", "Apd", "med" };
			level = 24;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "_params + (_params * (_bonus / 100))";
	};
	class processing {
		icon = "\A3\Ui_f\data\GUI\Cfg\Hints\Rules_ca.paa";
		displayName = "Переработник";
		description = "Ускоряет перерботку ресурсов с рюкзака на %1%2";
		removalMultiplier = 2;
		class Requirements {
			factions[] = { "civ" };
			level = 25;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "_params - (_params * (_bonus / 100))";
	};
	class QuickLearner {
		icon = "Data\UI\Perks\quickLearner.paa";
		displayName = "Индиго";
		description = "Увеличивает получение опыта на 10%.";
		removalMultiplier = 1.5;
		class Requirements {
			factions[] = { "civ", "cop", "med" };
			level = 27;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "_params + (_params * (_bonus / 100))";
	};

	class LandLord {
		icon = "Data\UI\Perks\landLord.paa";
		displayName = "Владелец";
		description = "Позволяет купить на 1 ед. недвижимости больше.";
		removalMultiplier = 4;
		class Requirements {
			factions[] = { "civ" };
			level = 28;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};


	class ozark {
		icon = "\A3\Ui_f\data\GUI\Cfg\Hints\Rules_ca.paa";
		displayName = "Озарк";
		description = "Уменьшает комиссию с отмывки денег на 10%";
		removalMultiplier = 2;
		class Requirements {
			factions[] = { "civ" };
			level = 29;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};
	class washing {
		icon = "\A3\Ui_f\data\GUI\Cfg\Hints\Rules_ca.paa";
		displayName = "Мыльный";
		description = "Уменьшает шанс тряски рук после лечения тяжелого ранения на 50%";
		removalMultiplier = 2;
		class Requirements {
			factions[] = { "civ" };
			level = 30;
			prestige = 0;
			profession[] = {};
		};
		onChanged = "";
		onActivated = "";
	};

	// class rabbitsfoot {
	// 	icon = "Data\UI\Perks\uncertainPerson.paa";
	// 	displayName = "Кроличья лапка";
	// 	description = "Лучшие шансы в азартных играх.";
	// 	removalMultiplier = 2;
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 30;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "((random 100) max 1)";
	// };
	// class FirstAider {
	// 	icon = "Data\UI\Perks\firstAider.paa";
	// 	displayName = "First Aider";
	// 	description = "Increase the effeciency of FirstAidKits by %1%2.";
	// 	removalMultiplier = 1.2;
	// 	class Leveling {
	// 		maxLevel = 5;
	// 		xpLevel = 100;
	// 		xpMultipler = 2;
	// 		levelCalculation = "5 * (_this select 0)";
	// 	};
	// 	class Requirements {
	// 		factions[] = { "civ", "cop", "Apd", "med" };
	// 		level = 24;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "_params + (_params * (_bonus / 100))";
	// };

	// class BloodCarrier {
	// 	icon = "Data\UI\Perks\bloodCarrier.paa";
	// 	displayName = "Blood Carrier";
	// 	description = "Increases Blood bag effenciency by %1%2.";
	// 	removalMultiplier = 1.2;
	// 	class Leveling {
	// 		maxLevel = 4;
	// 		xpLevel = 100;
	// 		xpMultipler = 2;
	// 		levelCalculation = "25 * (_this select 0)";
	// 	};
	// 	class Requirements {
	// 		factions[] = { "civ", "cop", "med" };
	// 		level = 22;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "_params + (_params * (_bonus / 100))";
	// };

	// class JuniorFisherman {
	// 	icon = "Data\UI\Perks\fishing.paa";
	// 	displayName = "Юный рыбак";
	// 	description = "Увеличивает шанс споймать редкую рыбу";
	// 	removalMultiplier = 1;
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 2;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "";
	// };

	// class hiddenpockets {
	// 	icon = "Data\UI\Perks\blackmarketer.paa";
	// 	displayName = "Hidden pockets";
	// 	description = "10% while being searched of nothing to be found";
	// 	removalMultiplier = 2;
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 30;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "((random 100) max 1)";
	// };

	// class rapidStorer {
	// 	icon = "Data\UI\Perks\rapidStorer.paa";
	// 	displayName = "Rapid Storer";
	// 	description = "Decreases the time it takes to garage a vehicle by %1%2.";
	// 	removalMultiplier = 1;
	// 	class Leveling {
	// 		maxLevel = 3;
	// 		xpLevel = 100;
	// 		xpMultipler = 2;
	// 		levelCalculation = "10 * (_this select 0)";
	// 	};
	// 	class Requirements {
	// 		factions[] = { "civ", "cop" };
	// 		level = 29;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "_params - (_params * (_bonus / 100))";
	// };

	// class UncertainMind {
	// 	icon = "Data\UI\Perks\uncertainPerson.paa";
	// 	displayName = "Uncertain Person";
	// 	description = "Gain the chance of keeping a vehicle when chopping.";
	// 	removalMultiplier = 2;
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 30;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "((random 100) max 1)";
	// };

	
	// class SilentLocksmith { // TODO : Add to vehicle lockpicking...
	// 	icon = "Data\UI\Perks\silentLocksmith.paa";
	// 	displayName = "Silent Locksmith";
	// 	description = "Decreases the likelihood of triggering an alarm by %1%2.";
	// 	removalMultiplier = 1.3;
	// 	class Leveling {
	// 		maxLevel = 4;
	// 		xpLevel = 100;
	// 		xpMultipler = 2;
	// 		levelCalculation = "25 * (_this select 0)";
	// 	};
	// 	class Requirements {
	// 		factions[] = { "civ", "cop", "Apd", "med" };
	// 		level = 25;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "_params - (_params * (_bonus / 100))";
	// };

	// class Blackmarketer {
	// 	icon = "Data\UI\Perks\blackmarketer.paa";
	// 	displayName = "Blackmarketer";
	// 	description = "Permits access to the Blackmarket.";
	// 	removalMultiplier = 10;
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 26;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "";
	// };

	// class PartsCarrier {
	// 	icon = "Data\UI\Perks\partsCarrier.paa";
	// 	displayName = "Parts Carrier";
	// 	description = "Decreases the cost of servicing an aircraft by %1%2.";
	// 	removalMultiplier = 2;
	// 	class Leveling {
	// 		maxLevel = 3;
	// 		xpLevel = 100;
	// 		xpMultipler = 2;
	// 		levelCalculation = "25 * (_this select 0)";
	// 	};
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 18;
	// 		prestige = 0;
	// 		profession[] = { "Repairing", 3 };
	// 	};
	// 	onChanged = "";
	// 	onActivated = "_params - (_params * (_bonus / 100))";
	// };

	// class IDForger {
	// 	icon = "Data\UI\Perks\idForger.paa";
	// 	displayName = "ID Forger";
	// 	description = "Allows you to forge fake IDs.";
	// 	removalMultiplier = 3;
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 15;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "";
	// };

	// class RapidSurveyor {
	// 	icon = "Data\UI\Perks\rapidSurveyor.paa";
	// 	displayName = "Rapid Surveyor";
	// 	description = "Increases your surveying speed on dig sites speed by %1%2.";
	// 	removalMultiplier = 1;
	// 	class Leveling {
	// 		maxLevel = 4;
	// 		xpLevel = 100;
	// 		xpMultipler = 2;
	// 		levelCalculation = "15 * (_this select 0)";
	// 	};
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 11;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "_params - (_params * (_bonus / 100))";
	// };

	// class CompletedCV {
	// 	icon = "Data\UI\Perks\completedCV.paa";
	// 	displayName = "Completed CV";
	// 	description = "Allows you to get employed at various job sites.";
	// 	removalMultiplier = 3;
	// 	class Requirements {
	// 		factions[] = { "civ" };
	// 		level = 9;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "";
	// };

	// class GovernmentBonus {
	// 	icon = "Data\UI\Perks\governmentBonus.paa";
	// 	displayName = "Government Pay";
	// 	description = "Increases your base paycheck by 5%.";
	// 	removalMultiplier = 1;
	// 	class Requirements {
	// 		factions[] = { "civ", "cop" };
	// 		level = 3;
	// 		prestige = 0;
	// 		profession[] = {};
	// 	};
	// 	onChanged = "";
	// 	onActivated = "";
	// };
};
