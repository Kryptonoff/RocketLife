class CfgAchievments
{
	//+
	class 10hrs
	{
		displayName = "Френдли?";
		needDo = "Проведите суммарно 10 часов играя на сервере.";
		reward = "[player,'atm','add',1000] remoteExecCall ['RRPServer_system_moneyChange',2]";
		rewardText = "1000$";
		milestone = 10;
		milestoneFraction = 3600;
	};
	//+
	class 100hrs
	{
		displayName = "Приправленный";
		needDo = "Проведите суммарно 100 часов играя на сервере.";
		reward = "[player,'atm','add',5000] remoteExecCall ['RRPServer_system_moneyChange',2]";
		rewardText = "5000$";
		milestone = 100;
		milestoneFraction = 3600;
	};//+
	class 500hrs
	{
		displayName = "Коренной житель";
		needDo = "Проведите суммарно 500 часов играя на сервере.";
		reward = "[player,'atm','add',50000] remoteExecCall ['RRPServer_system_moneyChange',2]";
		rewardText = "50000$";
		milestone = 500;
		milestoneFraction = 3600;
	};//+
	class 1000hrs
	{
		displayName = "Старичек";
		needDo = "Проведите суммарно 1000 часов играя на сервере.";
		reward = "[player,'atm','add',100000] remoteExecCall ['RRPServer_system_moneyChange',2]";
		rewardText = "Знак отличия 'Почетный Дидус' и 100000$";
		milestone = 1000;
		milestoneFraction = 3600;
	};
	class 2500hrs
	{
		displayName = "Великий Магистр";
		needDo = "Проведите суммарно 2500 часов играя на сервере.";
		reward = "";
		rewardText = "Знак отличия 'Великий Магистр'";
		milestone = 2500;
		milestoneFraction = 3600;
	};
	//+
	class tourist
	{
		displayName = "Турист";
		needDo = "Пройдите 10000 метров пешком.";
		reward = "";
		rewardText = "";
		milestone = 10000;
		milestoneFraction = 1;
	};//+
	class rider
	{
		displayName = "Укротивший Шторм";
		needDo = "Проедьте 50000 метров будучи водителем наземной техники.";
		reward = "";
		rewardText = "";
		milestone = 50000;
		milestoneFraction = 1;
	};//+
	class heli
	{
		displayName = "Вертоапокалипсис Сегодня";
		needDo = "Пролетите 100000 метров будучи пилотом воздушной техники.";
		reward = "";
		rewardText = "";
		milestone = 100000;
		milestoneFraction = 1;
	};//+
	class ship
	{
		displayName = "Точно не салага";
		needDo = "Проплывите 25000 метров будучи водителем водной техники.";
		reward = "";
		rewardText = "";
		milestone = 25000;
		milestoneFraction = 1;
	};//+
	class infshots
	{
		displayName = "Штурмовик";
		needDo = "Произведите в общей сложности 50000 выстрелов из оружия пехоты.";
		reward = "";
		rewardText = "Знак отличия 'Штурмовик' и финансовое вознаграждение";
		milestone = 50000;
		milestoneFraction = 1;
	};//+
	class vehshots
	{
		displayName = "Машина Поддержки";
		needDo = "Произведите в общей сложности 100000 выстрелов из оружия техники.";
		reward = "";
		rewardText = "Знак отличия 'Машина Поддержки' и финансовое вознаграждение";
		milestone = 100000;
		milestoneFraction = 1;
	};//+
	class lowprofile
	{
		displayName = "Идем низко";
		needDo = "Пролетите в 3 метрах над землей в любой воздушной технике со скоростью 200км/час.";
		reward = "[player,'atm','add',15000] remoteExecCall ['RRPServer_system_moneyChange',2]";
		rewardText = "15000$";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class halo
	{
		displayName = "Привет, мир!";
		needDo = "Выполните прыжок с парашютом на высоте 500 метров над землей.";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};//+
	class getchoppa
	{
		displayName = "Быстро в вертушку!";
		needDo = "Сядьте в воздушную технику будучи полностью истощенным.";
		reward = "[player,'atm','add',1000] remoteExecCall ['RRPServer_system_moneyChange',2]";
		rewardText = "1000$";
		milestone = 1;
		milestoneFraction = 1;
	};//+
	class dressed
	{
		displayName = "При параде";
		needDo = "Снарядите предметами все слоты инвентаря одновременно.";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};//-
	class burn
	{
		displayName = "Все в порядке";
		needDo = "Получите урон от ожогов 100 раз.";
		reward = "";
		rewardText = "Знак отличия 'Огнестойкий'";
		milestone = 100;
		milestoneFraction = 1;
	};//+
	class damage
	{
		displayName = "Максимальная боль";
		needDo = "Получите суммарно 10000 единиц урона.";
		reward = "";
		rewardText = "Знак отличия 'Ветеран войны'";
		milestone = 100000;
		milestoneFraction = 1;
	};//+
	class heliswitch
	{
		displayName = "Подержи мой дроссель";
		needDo = "Передать управление вашему второму пилоту.";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};//+
	class bta
	{
		displayName = "Раздолбай Свою Тачку";
		needDo = "Ударьте свою технику в любое препятствие 100 раз.";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};//+
	class fuel
	{
		displayName = "Эргономика";
		needDo = "Будьте водителем техники, которая полностью израсходовала топливо.";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};//+
	class animals
	{
		displayName = "Кыс кыс кыс!";
		needDo = "Убейте 500 животных.";
		reward = "";
		rewardText = "Знак отличия 'Защитник животных'";
		milestone = 500;
		milestoneFraction = 1;
	};//+
	class fireup
	{
		displayName = "Зажигай";
		needDo = "Запустите двигатель 250 раз (разных машин).";
		reward = "[player,'atm','add',5000] remoteExecCall ['RRPServer_system_moneyChange',2]";
		rewardText = "5000$";
		milestone = 250;
		milestoneFraction = 1;
	};//+
	class dudes
	{
		displayName = "Мои ребята";
		needDo = "Займите со своими тиммейтами каждое место в технике (как минимум 4-местную технику).";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};//+
	class noscope
	{
		displayName = "Ноускоп";
		needDo = "Выстрелите 250 патронов из снайперской винтовки не используя прицел или оптику.";
		reward = "";
		rewardText = "";
		milestone = 250;
		milestoneFraction = 1;
	};//+
	class gofast
	{
		displayName = "Быстрее ветра";
		needDo = "Достигните сверхзвуковой скорости при помощи воздушной техники.";
		reward = "[player,'atm','add',10000] remoteExecCall ['RRPServer_system_moneyChange',2]";
		rewardText = "10000$ и Знак отличия 'Молния Маккуин'";
		milestone = 1;
		milestoneFraction = 1;
	};//+
	class bulp
	{
		displayName = "Буль Буль? Буль!";
		needDo = "Вы практически утонули 10 раз.";
		reward = "";
		rewardText = "Знак отличия 'Ко дну!'";
		milestone = 10;
		milestoneFraction = 1;
	};//+
	class deploy
	{
		displayName = "Сержант Раскладайко";
		needDo = "Установите статическое оружие 250 раз.";
		reward = "";
		rewardText = "";
		milestone = 250;
		milestoneFraction = 1;
	};//+
	class switchseat
	{
		displayName = "Подвинься ты!";
		needDo = "Пересядьте на другое место в технике 100 раз.";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};

	//Проверить нужно все что ниже
	//+
	class allKnowMe
	{
		displayName = "Все меня знают!";
		needDo = "Покажите свой паспорт 100 разным жителям.";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};
	//+
	class iKnowAll
	{
		displayName = "Я всех знаю!";
		needDo = "Увидеть 100 паспортов от разных жителей.";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;		
	};
	//+
	class blm
	{
		displayName = "Black Lives Matter";
		needDo = "Отмыть 10,000,000$ долларов.";
		reward = "";
		rewardText = "Знак отличия 'BLM'";
		milestone = 100000;
		milestoneFraction = 1;	
	};
	//+
	class fuelstations
	{
		displayName = "Заправщик";
		needDo = "Заправить машину 100 раз";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};
	//+
	class business
	{
		displayName = "Бизнесмен";
		needDo = "Зарегистрировать свою компанию";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class businessman
	{
		displayName = "Торговец";
		needDo = "Выставить 1000 позиций в частном магазине";
		reward = "";
		rewardText = "Знак отличия 'Доллар'";
		milestone = 1000;
		milestoneFraction = 1;
	};
	//+
	class keys
	{
		displayName = "Мастер над ключами";
		needDo = "Дать ключи от своей техники 100 раз";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};
	//+
	class ashot
	{
		displayName = "Ашот";
		needDo = "Установить свой магазин";
		reward = "";
		rewardText = "Знак отличия 'Арбузик'";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class buyRcCar
	{
		displayName = "Позолоченный";
		needDo = "Приобрести машину за RCredits";
		reward = "";
		rewardText = "Знак отличия 'Бандит'";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class diver
	{
		displayName = "Дайвер";
		needDo = "Нырнуть на глубину более 180 метров";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class grabezh
	{
		displayName = "Это грабеж!";
		needDo = "Успешно ограбить заправку!";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class gta
	{
		displayName = "Великий Авто Угонщик";
		needDo = "Продать на свалке чужую технику";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class itNowMy
	{
		displayName = "Моя прелесть!";
		needDo = "Перебить на себя чужую технику";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class badcracker
	{
		displayName = "Нимагу";
		needDo = "Провести 100 неудачных взломов транспорта";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};//+
	class crafter
	{
		displayName = "Ремесленник";
		needDo = "Скрафтить 1000 предметов";
		reward = "";
		rewardText = "";
		milestone = 1000;
		milestoneFraction = 1;
	};
	//+
	class nalog
	{
		displayName = "Налогоплательщик";
		needDo = "Оплатить налогов на 999,999$";
		reward = "";
		rewardText = "";
		milestone = 999999;
		milestoneFraction = 1;
	};
	//+
	class house
	{
		displayName = "Домовладелец";
		needDo = "Купить дом";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class traderCar
	{
		displayName = "Автобарыга";
		needDo = "Продать кому-то свою машину";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class dhl
	{
		displayName = "Курьер";
		needDo = "Перевезти 100 посылок DHL";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};
	//+
	class speedfee
	{
		displayName = "Злостный нарушитель";
		needDo = "Получить штраф за скорость 100 раз";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};
	//+
	class port
	{
		displayName = "Портовый рабочий";
		needDo = "Отнести 100 коробок в порту";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};
	//+
	class kran
	{
		displayName = "Фляга";
		needDo = "Набрать воды во флягу 1000 раз";
		reward = "";
		rewardText = "";
		milestone = 1000;
		milestoneFraction = 1;
	};
	//+
	class prison
	{
		displayName = "Купола";
		needDo = "Попасть в тюрьму";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class fatGuy
	{
		displayName = "Обжора";
		needDo = "Съесть или выпить чего-то 1000 раз";
		reward = "";
		rewardText = "Знак отличия 'Бургер'";
		milestone = 1000;
		milestoneFraction = 1;
	};
	//+
	class vipmember
	{
		displayName = "Ручки";
		needDo = "Приобрести VIP статус";
		reward = "";
		rewardText = "Иконки героев Rainbow Six Siege";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class adjective
	{
		displayName = "Залежный";
		needDo = "Приобрести тяжелую зависимость от препаратов";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class myatezh
	{
		displayName = "Мятежник";
		needDo = "Переметнуться к бандитам";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class zrada
	{
		displayName = "Зрада";
		needDo = "Купить гражданский паспорт, будучи бандитом";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class jumper
	{
		displayName = "Попрыгунчик";
		needDo = "Прыгнуть 1000 раз";
		reward = "";
		rewardText = "Знак отличия 'Погостик'";
		milestone = 1000;
		milestoneFraction = 1;
	};
	//+
	class plate
	{
		displayName = "Номерной";
		needDo = "Поменять на своей машине номерной знак";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};//+
	class iro4ka
	{
		displayName = "Ирочка";
		needDo = "Оплатить штраф или выставленный счет";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class lottery
	{
		displayName = "Лоттерейник";
		needDo = "Купить лоттерейный билет";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class insure
	{
		displayName = "Застрахуй братуху";
		needDo = "Застраховать свою технику";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class whereInsure
	{
		displayName = "Предусмотрительный";
		needDo = "Получить выплату по страховке";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class tree
	{
		displayName = "Это трава?";
		needDo = "Включить отображение травы в настройках планшета";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};//+
	// class taxi
	// {
	// 	displayName = "Эй, желтый!";
	// 	needDo = "Воспользоваться услугами такси";
	// 	reward = "";
	// 	rewardText = "";
	// 	milestone = 1;
	// 	milestoneFraction = 1;
	// };//+
	class stopham
	{
		displayName = "Лось";
		needDo = "Забрать машину со штрафстоянки";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	//+
	class rimas
	{
		displayName = "Поросенок";
		needDo = "Встретить Rimas'a и показать ему паспорт";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	class carBillion
	{
		displayName = "Роскошь";
		needDo = "Купить машину стоимостью более $300,000";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	class spinCasino
	{
		displayName = "Кручу-верчу";
		needDo = "Прокрутить автомат казино 1000 раз";
		reward = "";
		rewardText = "";
		milestone = 1000;
		milestoneFraction = 1;
	};
	//-------------------------------------------------------------------------------------------
	/*
	class blackjack
	{
		displayName = "Блэкджеком и ...";
		needDo = "Сыграть в блэкджек 100 раз, со ставкой не менее $100 (когда будет доступно)";
		reward = "";
		rewardText = "";
		milestone = 100;
		milestoneFraction = 1;
	};
	*/
	class million
	{
		displayName = "Первый миллион";
		needDo = "Сдать ресурсов на 1,000,000$";
		reward = "";
		rewardText = "";
		milestone = 1000000;
		milestoneFraction = 1;
	};
	class goldHand
	{
		displayName = "Золотые руки";
		needDo = "Использовать рем.комплект 1000 раз";
		reward = "";
		rewardText = "";
		milestone = 1000;
		milestoneFraction = 1;
	};
	class camatose
	{
		displayName = "Каматозник";
		needDo = "Пробыл в агонии более 50 часов";
		reward = "";
		rewardText = "";
		milestone = 50;
		milestoneFraction = 3600;
	};
	class wank
	{
		displayName = "Дрочила";
		needDo = "";
		tayna = "Использовал жест дрочить 2000 раз";
		reward = "";
		rewardText = "Знак отличия 'БЕЗ БАБ'";
		milestone = 2000;
		milestoneFraction = 1;
	};
	class thief	
	{
		displayName = "Щипач";
		needDo = "";
		tayna = "Ограбить кого то 500 раз";
		reward = "";
		rewardText = "Знак отличия 'Он Варюга!'";
		milestone = 500;
		milestoneFraction = 1;
	};
	class jango
	{
		displayName = "Джанго";
		needDo = "";
		tayna = "сдать в работорговлю 50 человек";
		reward = "";
		rewardText = "Знак отличия 'Джанго'";
		milestone = 50;
		milestoneFraction = 1;
	};
	class zombie
	{
		displayName = "Моооозгииии";
		needDo = "Убейте 1000 зомби в запретной зоне";
		tayna = "";
		reward = "";
		rewardText = "";
		milestone = 1000;
		milestoneFraction = 1;		
	};
	class looter
	{
		displayName = "Лутер-шутер";
		needDo = "Исследуйте 1000 ящиков в запретной зоне";
		tayna = "";
		reward = "";
		rewardText = "";
		milestone = 1000;
		milestoneFraction = 1;	
	};
	class patron
	{
		displayName = "1 патрон";
		needDo = "Выиграйте в Русскую рулетку";
		tayna = "";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	class jango_pro
	{
		displayName = "Маковый Барон";
		needDo = "";
		tayna = "сдать в работорговлю 500 человек";
		reward = "";
		rewardText = "Знак отличия 'Маковый Барон'";
		milestone = 500;
		milestoneFraction = 1;
	};
	class manyak
	{
		displayName = "Маньяк";
		needDo = "";
		tayna = "Добить 300 человек";
		reward = "";
		rewardText = "Знак отличия 'Маньяк'";
		milestone = 300;
		milestoneFraction = 1;
	};
	class manyak_pro
	{
		displayName = "Потрошитель";
		needDo = "";
		tayna = "Добить 1000 человек";
		reward = "";
		rewardText = "Знак отличия 'Потрошитель'";
		milestone = 1000;
		milestoneFraction = 1;
	};
	class terpila
	{
		displayName = "Терпила";
		needDo = "";
		tayna = "Поднять руки вверх shift v 1000 раз";
		reward = "";
		rewardText = "Знак отличия 'Терпила'";
		milestone = 1000;
		milestoneFraction = 1;
	};
	class siklo
	{
		displayName = "Ссыкло";
		needDo = "";
		tayna = "проведено 100 часов в зеленой зоне";
		reward = "";
		rewardText = "Знак отличия 'Ангел'";
		milestone = 100;
		milestoneFraction = 3600;
	};
	////New
	class capital_1
	{
		displayName = "Капиталист";
		needDo = "Ваш гараж должен содержать технику на 5,000,000$";
		tayna = "сумма гаража 5кк";
		reward = "";
		rewardText = "Знак отличия 'Капиталист'";
		milestone = 1;
		milestoneFraction = 1;
	};
	class capital_2
	{
		displayName = "Буржуй";
		needDo = "Ваш гараж должен содержать технику на 10,000,000$";
		tayna = "сумма гаража 10кк";
		reward = "";
		rewardText = "Знак отличия 'Буржуй'";
		milestone = 1;
		milestoneFraction = 1;
	};
	class love_car
	{
		displayName = "Автолюбитель";
		needDo = "Набейте 10,000 км пробега на любой машине";
		tayna = "10к пробега";
		reward = "";
		rewardText = "Знак отличия 'Автолюбитель'";
		milestone = 1;
		milestoneFraction = 1;
	};
	class impulseDown
	{
		displayName = "Отсканированный";
		needDo = "Попадите под действие импульса в зоне боевых действий";
		tayna = "10к пробега";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
	class allWin
	{
		displayName = "Платина";
		needDo = "Получить все достижения";
		tayna = "";
		reward = "";
		rewardText = "";
		milestone = 1;
		milestoneFraction = 1;
	};
};
