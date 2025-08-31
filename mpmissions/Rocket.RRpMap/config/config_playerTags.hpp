class playerTags {
	/*
		Титул, разные прикольные статусы для обладателей ВИП > 0 и другие на разные темы
	*/
	class Title
	{
		class example_1
		{
			title = "Меценат";
			conditions = "(call life_donator > 3)";
			conditionsMessage = "Требуется VIP статус 4 уровня";
		};
		class example_2
		{
			title = "Молодой инвестор";
			conditions = "(call life_donator > 1)";
			conditionsMessage = "Требуется VIP статус от 2 уровня";
		};
		class example_3
		{
			title = "Старичек";
			conditions = "'1000hrs' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Старичек'";
		};
		class example_4
		{
			title = "Коренной житель";
			conditions = "'500hrs' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Коренной житель'";
		};
		class example_5
		{
			title = "Терпила";
			conditions = "'terpila' in RRPClientCompleteAch";
		};
		class example_6
		{
			title = "Буржуй";
			conditions = "'capital_2' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Буржуй'";
		};
		class example_7
		{
			title = "Капиталист";
			conditions = "'capital_1' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Капиталист'";
		};
		class example_8
		{
			title = "Почетный Дидус";
			conditions = "'1000hrs' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Старичек'";
		};
		class example_9
		{
			title = "Автолюбитель";
			conditions = "'love_car' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Автолюбитель'";
		};
		class default 
		{
			icon = "";
			title = "Без титула";
			conditions = "true";
		}
	};
	/*
		Иконки, дерни с ТС и сделай прикольные для VIP и не только
	*/
	class icons
	{
		class example_7
		{
			icon = "\RRP_icons\other\example_7.paa";
			title = "Автолюбитель";
			conditions = "'love_car' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Автолюбитель'";
		};
		class example_8
		{
			icon = "\RRP_icons\other\example_8.paa";
			title = "Коренной житель";
			conditions = "'500hrs' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Коренной житель'";
		};
		class example_10
		{
			icon = "\RRP_icons\other\example_10.paa";
			title = "Старичек";
			conditions = "'1000hrs' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Старичек'";
		};
		/*
		Такой ачивки вообще нет
		class example_11
		{
			icon = "\RRP_icons\other\example_11.paa";
			title = "Снайпер";
			conditions = "'sniper' in RRPClientCompleteAch";
			conditionsMessage = "Выстрелите 250 патронов из снайперской винтовки не используя прицел или оптику";
		};
		
		class example_12
		{
			icon = "\RRP_icons\other\example_12.paa";
			title = "Пулеметчик";
			conditions = "'machine_gun' in RRPClientCompleteAch";
			conditionsMessage = "Что нужно что-бы она появилась";
		};
		*/
		class example_39
		{
			icon = "\RRP_icons\other\example_39.paa";
			title = "Бандит";
			conditions = "'buyRcCar' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Позолоченный'";
		};
		class example_44
		{
			icon = "\RRP_icons\other\example_44.paa";
			title = "Огнестойкий";
			conditions = "'burn' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Все в порядке'";
		};
		class example_46
		{
			icon = "\RRP_icons\other\example_46.paa";
			title = "Штурмовик";
			conditions = "'infshots' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Штурмовик'";
		};
		class example_47
		{
			icon = "\RRP_icons\other\example_47.paa";
			title = "Защитник животных";
			conditions = "'animals' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Кыс кыс кыс!'";
		};
		class example_48
		{
			icon = "\RRP_icons\other\example_48.paa";
			title = "Молния Маккуин";
			conditions = "'gofast' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Быстрее ветра'";
		};
		class example_49
		{
			icon = "\RRP_icons\other\example_49.paa";
			title = "Ко дну!";
			conditions = "'bulp' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Буль Буль? Буль!'";
		};
		class example_50
		{
			icon = "\RRP_icons\other\example_50.paa";
			title = "Арбузик";
			conditions = "'ashot' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Ашот'";
		};
		class example_51
		{
			icon = "\RRP_icons\other\example_51.paa";
			title = "BLM";
			conditions = "'blm' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Black Lives Matter'";
		};
		class example_52
		{
			icon = "\RRP_icons\other\example_52.paa";
			title = "Dollar";
			conditions = "'businessman' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Торговец'";
		};
		class example_56
		{
			icon = "\RRP_icons\other\example_56.paa";
			title = "БЕЗ БАБ";
			conditions = "'wank' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Дрочила'";
		};
		class example_57
		{
			icon = "\RRP_icons\other\example_57.paa";
			title = "Он Варюга!";
			conditions = "'thief' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Щипач'";
		};
		class example_58
		{
			icon = "\RRP_icons\other\example_58.paa";
			title = "Терпила";
			conditions = "'terpila' in RRPClientCompleteAch";
		};
		class example_59
		{
			icon = "\RRP_icons\other\example_59.paa";
			title = "Маньяк";
			conditions = "'manyak' in RRPClientCompleteAch";
		};
		class example_60
		{
			icon = "\RRP_icons\other\example_60.paa";
			title = "Джанго";
			conditions = "'jango' in RRPClientCompleteAch";
		};
		class example_61
		{
			icon = "\RRP_icons\other\example_61.paa";
			title = "Маковый Барон";
			conditions = "'jango_pro' in RRPClientCompleteAch";
		};
		class example_62
		{
			icon = "\RRP_icons\other\example_62.paa";
			title = "Потрошитель";
			conditions = "'manyak_pro' in RRPClientCompleteAch";
		};
		class example_63
		{
			icon = "\RRP_icons\other\example_63.paa";
			title = "Сыкло";
			conditions = "'siklo' in RRPClientCompleteAch";
		};
		class example_64
		{
			icon = "\RRP_icons\other\example_64.paa";
			title = "Погостик";
			conditions = "'jumper' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Попрыгунчик'";
		};
		class example_65
		{
			icon = "\RRP_icons\other\example_65.paa";
			title = "Бургер";
			conditions = "'fatGuy' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Обжора'";
		};
		class example_66
		{
			icon = "\RRP_icons\other\example_66.paa";
			title = "Пантера";
			conditions = "(call life_donator) > 0";
			conditionsMessage = "Требуется VIP статус";
		};
		class example_67
		{
			icon = "\RRP_icons\other\example_67.paa";
			title = "Вибухівка";
			conditions = "(call life_donator) > 0";
			conditionsMessage = "Требуется VIP статус";
		};
		class example_68
		{
			icon = "\RRP_icons\other\example_68.paa";
			title = "Петушок";
			conditions = "(call life_donator) > 0";
			conditionsMessage = "Требуется VIP статус";
		};
		class example_69
		{
			icon = "\RRP_icons\other\example_69.paa";
			title = "Домо собутыльник";
			conditions = "(call life_donator) > 0";
			conditionsMessage = "Требуется VIP статус";
		};
		class example_70
		{
			icon = "\RRP_icons\other\example_70.paa";
			title = "Лис";
			conditions = "(call life_donator) > 0";
			conditionsMessage = "Требуется VIP статус";
		};
		class example_71
		{
			icon = "\RRP_icons\other\example_71.paa";
			title = "Почетный Дидус";
			conditions = "'1000hrs' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Старичек'";
		};
		class example_72
		{
			icon = "\RRP_icons\other\example_72.paa";
			title = "VIP 1";
			conditions = "(call life_donator) == 1";
			conditionsMessage = "Требуется VIP статус 1го уровня";
		};
		class example_73
		{
			icon = "\RRP_icons\other\example_73.paa";
			title = "VIP 2";
			conditions = "(call life_donator) == 2";
			conditionsMessage = "Требуется VIP статус 2го уровня";
		};
		class example_74
		{
			icon = "\RRP_icons\other\example_74.paa";
			title = "VIP 3";
			conditions = "(call life_donator) == 3";
			conditionsMessage = "Требуется VIP статус 3го уровня";
		};
		class example_75
		{
			icon = "\RRP_icons\other\example_75.paa";
			title = "VIP 4";
			conditions = "(call life_donator) == 4";
			conditionsMessage = "Требуется VIP статус 4го уровня";
		};
		class example_76
		{
			icon = "\RRP_icons\other\example_76.paa";
			title = "ЧСВ";
			conditions = "(call life_donator) > 3";
			conditionsMessage = "Требуется VIP статус 4го уровня";
		};
		class example_77
		{
			icon = "\RRP_icons\other\example_77.paa";
			title = "Черепок";
			conditions = "(call life_donator) > 0 OR (call life_adminlevel) > 4";
			conditionsMessage = "Требуется VIP статус";
		};
		class example_78
		{
			icon = "\RRP_icons\other\example_78.paa";
			title = "Капиталист";
			conditions = "'capital_1' in RRPClientCompleteAch";
			conditionsMessage = "Ваш гараж должен содержать технику на 20 000 000$";
		};
		class example_79
		{
			icon = "\RRP_icons\other\example_79.paa";
			title = "Машина поддержки";
			conditions = "'fatGuy' in RRPClientCompleteAch";
			conditionsMessage = "Произведите в общей сложности 100000 выстрелов из оружия техники.";
			
		};
		class example_80
		{
			icon = "\RRP_icons\other\example_80.paa";
			title = "Буржуй";
			conditions = "'capital_2' in RRPClientCompleteAch";
			conditionsMessage = "Ваш гараж должен содержать технику на 50 000 000$";
		};
		class example_33
		{
			icon = "\RRP_icons\other\example_33.paa";
			title = "ASH";
			conditions = "'vipmember' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Ручки'";
		};
		class example_16
		{
			icon = "\RRP_icons\other\example_16.paa";
			title = "MIRA";
			conditions = "'vipmember' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Ручки'";
		};
		class example_20
		{
			icon = "\RRP_icons\other\example_20.paa";
			title = "TWICH";
			conditions = "'vipmember' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Ручки'";
		};
		class example_29
		{
			icon = "\RRP_icons\other\example_29.paa";
			title = "IQ";
			conditions = "'vipmember' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Ручки'";
		};
		class example_14
		{
			icon = "\RRP_icons\other\example_14.paa";
			title = "ECHO";
			conditions = "'vipmember' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Ручки'";
		};
		class example_18
		{
			icon = "\RRP_icons\other\example_18.paa";
			title = "ELA";
			conditions = "'vipmember' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Ручки'";
		};
		class example_15
		{
			icon = "\RRP_icons\other\example_15.paa";
			title = "HIBANA";
			conditions = "'vipmember' in RRPClientCompleteAch";
			conditionsMessage = "Требуется достижение 'Ручки'";
		};
		class example_elections_1
		{
			icon = "\RRP_icons\other\example_elections_1.paa";
			title = "Выборы 01. Рождение Демократии";
			conditions = "false";
			conditionsMessage = "Необходимо поприсутствовать на Дебатах 25.12.21";
		};
		class example_elections_2
		{
			icon = "\RRP_icons\other\example_elections_2.paa";
			title = "Надежный";
			conditions = "(getPlayerUID player) in ['32323232']";
			conditionsMessage = "Скрыто";
		};
		class example_elections_3
		{
			icon = "\RRP_icons\other\example_elections_3.paa";
			title = "Выше всех";
			conditions = "false";
			conditionsMessage = "Необходимо проголосовать в выборах 08.01.22/09.01.22";
		};
		class example_elections_4:example_elections_3
		{
			icon = "\RRP_icons\other\example_elections_4.paa";
			title = "Честный и Неподкупный";
		};
		class example_elections_5:example_elections_3
		{
			icon = "\RRP_icons\other\example_elections_5.paa";
			title = "Настоящий Гражданин";
		};
		class example_elections_6
		{
			icon = "\RRP_icons\other\example_elections_5.paa";
			title = "Защитник Родины";
			conditions = "(getPlayerUID player) in ['32323232']";
			conditionsMessage = "Скрыто";
		};
		class default 
		{
			icon = "";
			title = "Без иконки";
			conditions = "true";
		}
	};

	class oraganization
	{
		class cigane
		{
			title = "Cigane";
			conditions = "license_cigane";
		};
		class anvil
		{
			title = "Anvil";
			conditions = "license_anvil";
		};
		class shark
		{
			title = "Shark";
			conditions = "license_shark";
		};
		class umbrella
		{
			title = "Bears";
			conditions = "license_bears";
		};
		class blacksnow
		{
			title = "BlackSnow";
			conditions = "license_blacksnow";
		};
		class DW
		{
			title = "Sector7";
			conditions = "license_sector";
		};
		class phoenix
		{
			title = "Phoenix";
			conditions = "license_phoenix";
		};
		class cwrka
		{
			title = "CWRKA";
			conditions = "license_cwrka";
		};
		class deadlock
		{
			title = "Damned Knights";
			conditions = "license_dl";
		};
		class taxi
		{
			title = "TAXI";
			conditions = "license_taxi";
		};
		class press
		{
			title = "7NEWS";
			conditions = "license_press";
		};
		class escobaro
		{
			title = "La Escobaro Family";
			conditions = "license_escobaro";
		};
		class sumiyoshi
		{
			title = "Sumiyoshi Kai";
			conditions = "license_sumiyoshi";
		};
		class narcos
		{
			title = "Narcos";
			conditions = "license_narcos";
		};
		class psychokids
		{
			title = "PSYCHOKIDS";
			conditions = "license_psychokids";
		};
		class kas
		{
			title = "KASATKI";
			conditions = "license_kasatky";
		};
		class Chrome
		{
			title = "Alpha";
			conditions = "license_alpha";
		};
		class judge
		{
			title = "Министерство Юстиции";
			conditions = "license_judge";
		};
		class police
		{
			title = "Полиция";
			conditions = "player call getSide == 'cop'";
		};
		class EMS
		{
			title = "EMS";
			conditions = "player call getSide == 'med'";
		};
	};

	/*
		Ранг, название звания
	*/
	class rank {
		class owner
		{
			title = "Глава";
			conditions = "if (life_gangData isEqualTo []) then {false} else {(!((life_gangData select 8) isEqualTo '-1') AND (life_gangData select 1) isEqualTo getPlayerUID player)}";
		};
		class deputy
		{
			title = "Заместитель";
			conditions = "if (life_gangData isEqualTo []) then {false} else {(!((life_gangData select 8) isEqualTo '-1') AND (life_gangData select 2) isEqualTo getPlayerUID player)}";
		};
		class Cadet
		{
			title = "Кадет";
			conditions = "if (life_gangData isEqualTo []) then {false} else {(!((life_gangData select 8) isEqualTo '-1') AND !(life_gangData isEqualto []) AND (('civ' call RRPClient_groups_getSideLevel) == 1))}";
		};
		class Fither
		{
			title = "Боец";
			conditions = "if (life_gangData isEqualTo []) then {false} else {(!((life_gangData select 8) isEqualTo '-1') AND !(life_gangData isEqualto []) AND (('civ' call RRPClient_groups_getSideLevel) == 2))}";
		};
		class Officer
		{
			title = "Офицер";
			conditions = "if (life_gangData isEqualTo []) then {false} else {(!((life_gangData select 8) isEqualTo '-1') AND !(life_gangData isEqualto []) AND (('civ' call RRPClient_groups_getSideLevel) == 3))}";
		};

		class beginner
		{
			title = "Новобранец";
			conditions = "!(player getVariable ['isBeginner',false])";
		};
		class cw_civ
		{
			title = "Осужденый к труду";
			conditions = "(player getVariable ['corrective_work',false])";
		};
		class cw_reb
		{
			title = "Осужденый к труду";
			conditions = "(player getVariable ['corrective_work',false])";
		};
		class cop1
		{
			title = "Cadet";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 1";
		};
		class cop2
		{
			title = "Private";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 2";
		};
		class cop3
		{
			title = "Sergeant l";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 3";
		};
		class cop4
		{
			title = "Sergeant ll";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 4";
		};
		class cop5
		{
			title = "Sergeant lll";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 5";
		};
		class cop6
		{
			title = "P.Officer l";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 6";
		};
		class cop7
		{
			title = "P.Officer ll";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 7";
		};
		class cop8
		{
			title = "Lieutenant l";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 8";
		};
		class cop9
		{
			title = "Lieutenant ll";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 9";
		};
		class cop10
		{
			title = "Сaptain";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 10";
		};
		class cop11
		{
			title = "Major";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 11";
		};
		class cop12
		{
			title = "Detective";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 12";
		};
		class cop13
		{
			title = "Chief Detective";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 13";
		};
		class cop14
		{
			title = "Chief PA";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 14";
		};
		class cop15
		{
			title = "D.Chief PD";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 15";
		};
		class cop16
		{
			title = "Detective O.P.R";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 16";
		};
		class cop17
		{
			title = "Chief O.P.R";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 17";
		};
		class cop18
		{
			title = "F.B.I";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 18";
		};
		class cop19
		{
			title = "Chief F.B.I";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 19";
		};
		class cop20
		{
			title = "Chief PD";
			conditions = "('cop' call RRPClient_groups_getSideLevel) == 20";
		};
		class med1
		{
			title = "Intern";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 1";
		};
		class med2
		{
			title = "Technician";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 2";
		};
		class med3
		{
			title = "Specialist";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 3";
		};
		class med4
		{
			title = "St.specialist";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 4";
		};
		class med5
		{
			title = "Attendant";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 5";
		};
		class med6
		{
			title = "Paramedic";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 6";
		};
		class med7
		{
			title = "Doctor";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 7";
		};
		class med8
		{
			title = "Major";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 8";
		};
		class med9
		{
			title = "Deputy Minister";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 9";
		};
		class med10
		{
			title = "Minister";
			conditions = "('med' call RRPClient_groups_getSideLevel) == 10";
		};
	};
};
