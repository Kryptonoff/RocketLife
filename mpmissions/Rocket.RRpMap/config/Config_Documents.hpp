#define true 1
#define false 0
/*
	class:
	other = имя переменной старой переменной
	name = название документа
	description = описание документа
	edit = разрешено ли редактировать описание? true/false
	type = тип документа
	price = цена если -1 то не продается в магазине
	icon = иконка документа
	gang = документ группировки
	conditions = Условие отображения в выдаче. и конф.
*/

class LifeCfgDocumentsType {
	class main {
		name = "Основные";
		icon = "";
		category = 0;
	};
	class licenses {
		name = "Лицензии";
		icon = "";
		category = 1;
	};
	class business {
		name = "Бизнес";
		icon = "";
		category = 2;
	};
	class agreement {
		name = "Договоры";
		icon = "";
		category = 3;
	};
};

class LifeCfgDocumentsShop {
	class all_license {
		name = "Магазин Лицензий"; //заголовок
		object = "all_license"; //заголовок
		conditions = ""; //доступно к магазу
		documents[] = {
			//{"Класснейм документа" , "Условие покупки", "сообщение", "" },
			{"driver" , "", "Водительсое удостоверение. Необходимо для покупки и вождения наземного транспорта.", "true" },
			{"flightschool_grp_plvl_3" , "", "Удостоверение Пилота. Необходимо для покупки и управления воздушной техникой.", "true" },
			{"home" , "", "Документ, позволяющий приобретать недвижимость.", "true" },
			{"diver" , "", "Удостоверение Дайвера. Подтверждает ваше прохождение подготовки к погружению и позволяет приобретать подводное снаряжение.", "true" },
			{"gun","", "Разрешение на ношение оружия, позволяет пользоваться оружейным магазином."},
			//{"air" , "", "", "true" },
			{"boat" , "", "Удостоверение на право владения, управления маломерные судна. Позволит вам купить и управлять маломерными суднами.", "true" },
			{"truck" , "", "Удостоверение на право управлять грузовой техникой. Позволит вам безприпятственно покупать и управлять грузовой транспорт.", "true" }
		};
	};

	class reb_license {
		name = "Магазин Лицензий"; //заголовок
		object = "all_license"; //заголовок
		conditions = ""; //доступно к магазу
		documents[] = {
			{"reb" , "", "Водительсое удостоверение. Необходимо для покупки и вождения наземного транспорта.", "true" },
			{"driver" , "", "Водительсое удостоверение. Необходимо для покупки и вождения наземного транспорта.", "true" },
			{"home" , "", "Документ, позволяющий приобретать недвижимость.", "true" },
			{"diver" , "", "Удостоверение Дайвера. Подтверждает ваше прохождение подготовки к погружению и позволяет приобретать подводное снаряжение.", "true" },
			{"gun","", "Разрешение на ношение оружия, позволяет пользоваться оружейным магазином.", "true"},
			//{"air" , "", "", "true" },
			{"boat" , "", "Удостоверение на право владения, управления маломерные судна. Позволит вам купить и управлять маломерными суднами.", "true" },
			{"truck" , "", "Удостоверение на право управлять грузовой техникой. Позволит вам безприпятственно покупать и управлять грузовой транспорт.", "true" },
			{"falshair" , "", "Фальшивое удостоверение Пилота. Необходимо для покупки и управления воздушной техникой.", "true" },
			{"slavery" , "", "Бумажка от местного Босса, которая, позволит вам продать раба местному кубинцу-психопату и уйти от него живым.", "true" }	
		};
	};
	class business : all_license {
	    documents[] = {
	        {"proc_clay" , "", "", "true" },
	        {"proc_sand" , "", "", "true" },
	        {"proc_sulfur" , "", "", "true" },
	        {"proc_wheat" , "", "", "true" },
	        {"proc_gasolin" , "", "", "true" },
	        {"proc_mining" , "", "", "true" },
	        {"proc_minerals" , "", "", "true" }
	    };
	};
};

class LifeCfgDocuments {
	class default {
		name = "Документ (Общий тип)";
		description = "Нет описания";
		edit = false;
		type = "default";
		icon = "";
		conditions = "false";
		price = -1;
		gang = false;
		expires = -1;
		limited = true;
    };
	class main : default {
		type = "main";
		icon = "";
		expires = 90;
	};
	class licenses : default {
		type = "licenses";
		icon = "";
		expires = 90;
	};
	class business : default {
		type = "business";
		icon = "";
		expires = 90;
	};
	class agreement : default {
		type = "agreement";
		icon = "";
		expires = 90;
	};
	//Кастомные документы - пишутся самостоятельно.
	class custom_cop_1 : main {
		name = "Документ (ПД)";
		description = "Нет описания";
		edit = true;
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 1 || (call life_adminlevel) > 3";
		expires = -1;
		limited = false;
		
	};
    class custom_cop_2 : custom_cop_1 {
		name = "Справка (ПД)";
		conditions = "('cop' call RRPClient_groups_getSideLevel) in [18, 19, 20, 21, 22, 27, 28, 29, 30, 31, 32] || (call life_adminlevel) > 3";
		limited = false;
	};
	class custom_med_1 : custom_cop_1 {
		name = "Документ (МЧС)";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 6 || (call life_adminlevel) > 3";
		limited = false;
	};
	class custom_med_2 : custom_cop_1 {
		name = "Справка (МЧС)";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 1 || (call life_adminlevel) > 3";
		limited = false;
	};
	class custom_taxi : custom_cop_1 {
		name = "Документ (Такси)";
		conditions = "license_taxi || (call life_adminlevel) > 3";
		limited = false;
	};
	class custom_goverment : custom_cop_1 {
		name = "Документ (Правительство)";
		conditions = "life_gov || (call life_adminlevel) > 3";
		limited = false;
	};
	class custom_news : custom_cop_1 {
		name = "Документ (7 News)";
		conditions = "license_press || (call life_adminlevel) > 3";
		limited = false;
	};
	class admittance_goverment : main {
		name = "Допуск (Правительство)";
		description = "Допуск, который позволяет использовать резиденцию правительства.";
		edit = false;
		conditions = "life_gov || (call life_adminlevel) > 3";
		expires = 7;
		limited = true;
	};
	class gov_unemployment_three {
		name = "Пособие по безработице";
		description = "документ дающий право на социальную выплату малоимущему на 3 дня";
		edit = false;
		conditions = "life_gov || (call life_adminlevel) > 3";
		expires = 3;
		limited = true;
	};

	class gov_unemployment_five: gov_unemployment_three {
		description = "документ дающий право на социальную выплату малоимущему на 5 дня";
		expires = 5;
	};

	class gov_unemployment_seven: gov_unemployment_three {
		description = "документ дающий право на социальную выплату малоимущему на 7 дня";
		expires = 7;
	};
    class outcast_grp : main {
		name = "Документ (SOA)";
		description = "Нет описания";
		edit = true;
		conditions = "license_outcast || (call life_adminlevel) > 3";
		expires = -1;
		limited = false;
	};

	class R_GRP_Escobaro_Passport : outcast_grp {
		name = "Документ (La Escobaro Family)";
		conditions = "license_escobaro || (call life_adminlevel) > 3";
		limited = false;
	};

	class RRP_GRP_Sumiyoshi_Passport : outcast_grp {
		name = "Документ (Sumiyoshi Kai)";
		conditions = "license_sumiyoshi || (call life_adminlevel) > 3";
		limited = false;
	};
	class kasatky_grp : outcast_grp {
		name = "Документ (KASATKI)";
		conditions = "license_kasatky || (call life_adminlevel) > 3";
		limited = false;
	};
	class phoenix_grp : outcast_grp {
		name = "Документ (Phoenix)";
		conditions = "license_phoenix || (call life_adminlevel) > 3";
		limited = false;
	};
	class mgrp_2_grp : outcast_grp {
		name = "Документ (Miners)";
		conditions = "license_mgrp_2 || (call life_adminlevel) > 3";
		limited = false;
	};
	class bs_grp : outcast_grp {
		name = "Документ (Black Snow)";
		conditions = "license_blacksnow || (call life_adminlevel) > 3";
		limited = false;
	};
	class cigane_grp : outcast_grp {
		name = "Документ (Cigane)";
		conditions = "license_cigane || (call life_adminlevel) > 3";
		limited = false;
	};
	class inagawakai_grp : outcast_grp {
		name = "Документ (Cigane)";
		conditions = "license_inagawakai || (call life_adminlevel) > 3";
		limited = false;
	};
	class lacosanostra_grp : outcast_grp {
		name = "Документ (lacosanostra)";
		conditions = "license_lacosanostra || (call life_adminlevel) > 3";
		limited = false;
	};
	class blackwolves_grp : outcast_grp {
		name = "Документ (blackwolves)";
		conditions = "license_blackwolves || (call life_adminlevel) > 3";
		limited = false;
	};
	class Sector_grp : outcast_grp {
		name = "Документ (Sector)";
		conditions = "license_sector || (call life_adminlevel) > 3";
		limited = false;
	};
	class PremGRP_2_grp : outcast_grp {
		name = "Документ (PremGRP_2)";
		conditions = "license_PremGRP_2 || (call life_adminlevel) > 3";
		limited = false;
	};
	class PremGRP_3_grp : outcast_grp {
		name = "Документ (PremGRP_3)";
		conditions = "license_PremGRP_3 || (call life_adminlevel) > 3";
		limited = false;
	};
	class PremGRP_4_grp : outcast_grp {
		name = "Документ (PremGRP_4)";
		conditions = "license_PremGRP_4 || (call life_adminlevel) > 3";
		limited = false;
	};
	class cwrka_grp : outcast_grp {
		name = "Документ (Ц.В.Р.К.А)";
		conditions = "license_cwrka || (call life_adminlevel) > 3";
		limited = false;
	};
	class bears_grp : outcast_grp {
		name = "Документ (Bears)";
		conditions = "license_bears || (call life_adminlevel) > 3";
		limited = false;
	};
	class wolves_grp : outcast_grp {
		name = "Документ (Wolves)";
		conditions = "license_wolves || (call life_adminlevel) > 3";
		limited = false;
	};
	class narcos_grp : outcast_grp {
		name = "Документ (Narcos)";
		conditions = "license_narcos || (call life_adminlevel) > 3";
		limited = false;
	};
	class kifo_grp : outcast_grp {
		name = "Документ (KIFO)";
		conditions = "license_kifo || (call life_adminlevel) > 3";
		limited = false;
	};
	class constant_grp : outcast_grp {
		name = "Документ (Constant)";
		conditions = "license_constant || (call life_adminlevel) > 3";
		limited = false;
	};
	class rimas_grp : outcast_grp {
		name = "Документ (Rimas Inc.)";
		conditions = "license_rimas || (call life_adminlevel) > 3";
		limited = false;
	};
	class flightschool_grp_1 : outcast_grp {
		name = "Доступ к аэропорту на 5 дней";
		conditions = "license_flightschool_grp_3 || (call life_adminlevel) > 3";
		limited = true;
		edit = false;
		expires = 5;
	};
	class flightschool_grp_2 : flightschool_grp_1 {
		name = "Доступ к магазинам на 5 дней";
		conditions = "license_flightschool_grp_3 || (call life_adminlevel) > 3";
		expires = 5;
	};
	class flightschool_grp_3 : flightschool_grp_1 {
		name = "Документ инструктора";
		description = "Документ, подтверждающий, что человек явзяется сотрудником летной школы в должности инструктора.";
		conditions = "(call life_adminlevel) > 3";
		expires = 89;
	};
	class flightschool_grp_plvl_1 : flightschool_grp_1 {
		name = "Студенческая лицензия пилота";
		conditions = "license_flightschool_grp_3 || (call life_adminlevel) > 3";
		expires = 1;
	};
	class flightschool_grp_plvl_2 : flightschool_grp_1 {
		name = "Лицензия частного пилота";
		conditions = "license_flightschool_grp_3 || (call life_adminlevel) > 3";
		expires = 15;
	};
	/*
	class flightschool_grp_plvl_3 : flightschool_grp_1 {
		name = "Лицензия коммерческого пилота";
		conditions = "license_flightschool_grp_3 || (call life_adminlevel) > 3";
		expires = 30;
		price = 65000;
	};
	*/
	class flightschool_grp_plvl_4 : flightschool_grp_1 {
		name = "Лицензия линейного пилота";
		conditions = "license_flightschool_grp_3 || (call life_adminlevel) > 3";
		expires = 30;
	};
	class anvil_grp_1 : outcast_grp {
		name = "Пропуск в зону (2 дня)";
		conditions = "license_anvil || (call life_adminlevel) > 3";
		limited = true;
		edit = false;
		expires = 2;
	};
	class anvil_grp_2 : outcast_grp {
		name = "Пропуск в зону (5 дней)";
		conditions = "license_anvil || (call life_adminlevel) > 3";
		limited = true;
		edit = false;
		expires = 5;
	};
	class anvil_grp_3 : outcast_grp {
		name = "Пропуск в зону (7 дней)";
		conditions = "license_anvil || (call life_adminlevel) > 3";
		limited = true;
		edit = false;
		expires = 7;
	};

	//Лицензии - официальный документ требуются для покупок и прочего.
	class isGirl : licenses {
		name = "Допуск к магазину женской одежды";
		description = "Документ, разрешающий доступ к женской одежде.";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 1 || ('med' call RRPClient_groups_getSideLevel) > 4 || (call life_adminlevel) > 3";
		expires = -1;
	};

	class reb : licenses {
		name = "Метка бандита";
		description = "Метка бандита дает вам доступ в криминальный круг острова, где вам откроется доступ ко всем подпольным торговцам нелегальными вещами. Договор, позволяющий торговать с бандитами";
		conditions = "(call life_adminlevel) > 3";
		expires = 30;
		price = 200000;
	};

	class driver : licenses {
		name = "Водительские права";
		description = "Документ, который подтверждает возможность управления легковым транспортным средством.";
		conditions = "(call life_adminlevel) > 3";
		expires = 60;
		price = 1000;
	};
	class flightschool_grp_plvl_3 : licenses {
		name = "Лицензия коммерческого пилота";
		conditions = "(call life_adminlevel) > 3";
		expires = 30;
		price = 160000;
	};
	class diver : licenses {
		name = "Сертификат дайвера";
		description = "Сертификат выдается человеку, прошедшему обучение по курсу дайвинга.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 13000;
	};
	class falshair : licenses {
		name = "Лицензия пилота";
		description = "Сертификат выдается человеку, прошедшему обучение по курсу пилота.";
		conditions = "(call life_adminlevel) > 3";
		expires = 30;
		price = 160000;
	};
	class air : licenses {
		name = "Лицензия пилота";
		description = "Сертификат выдается человеку, прошедшему обучение по курсу пилота.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 40000;
	};
	class boat : licenses {
		name = "Лицензия моряка";
		description = "Документ, который подтверждает возможность управления водным транспортным средством.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 5000;
	};
	class truck : licenses {
		name = "Лицензия дальнобойщика";
		description = "Документ, который подтверждает возможность управления грузовым транспортным средством.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 10000;
	};
	class home : licenses {
		name = "Лицензия домовладельца";
		description = "Документ, который подтверждает возможность покупки домов.";
		conditions = "(call life_adminlevel) > 3";
		expires = -1;
		price = 35000;
	};
	class slavery : licenses {
		name = "Работорговец";
		description = "Документ, который дает возможность сдавать людей в рабство.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 10000;
	};

	class med_gun : licenses {
		name = "Справка о психическом здоровье";
		description = "Справка, которая доказывает, что вы психически стабильны. Получить такую можно обратившись к сотрудникам МЧС.";
		conditions = "('med' call RRPClient_groups_getSideLevel) > 1 || (call life_adminlevel) > 3";
		expires = 14;
	};
	class cop_gun : licenses {
		name = "Разрешение на ношение оружия";
		description = "Разрешение на ношение оружия, позволяет пользоваться оружейным магазином. Получить можно у сотрудников полицейского департамента.";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 1 || (call life_adminlevel) > 3";
		expires = 14;
	};
	class gun: licenses {
		name = "Разрешение на ношение оружия";
		description = "Разрешение на ношение оружия, позволяет пользоваться оружейным магазином. Лицензия куплена.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 75000;
	};
	class cop_hunter : licenses {
		name = "Охотничий билет";
		description = "Дает вам законное право охотиться на животных. Получить можно у сотрудников полицейского департамента или МЧС.";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 1 || ('med' call RRPClient_groups_getSideLevel) > 3";
		expires = 14;
	};

    /* Фиол. ресы*/
	class proc_clay : business {
		name = "Разрешение на переработку глины";
		description = "Разрешение, которое позволяет перерабатывать определенный вид ресурса.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 3500;
	};
	class proc_sand : business {
		name = "Разрешение на переработку песка";
		description = "Разрешение, которое позволяет перерабатывать определенный вид ресурса.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 7000;
	};
	class proc_sulfur : business {
		name = "Разрешение на переработку серы";
		description = "Разрешение, которое позволяет перерабатывать определенный вид ресурса.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 17000;
	};
	class proc_wheat : business {
		name = "Разрешение на переработку пшеницы";
		description = "Разрешение, которое позволяет перерабатывать определенный вид ресурса.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 4500;
	};
	class proc_gasolin : business {
		name = "Разрешение на очистку бензина";
		description = "Разрешение, которое позволяет перерабатывать определенный вид ресурса.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 23000;
	};
	class proc_mining : business {
		name = "Разрешение на переработку руды";
		description = "Разрешение, которое позволяет перерабатывать определенный вид ресурса.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 15000;
	};
	class proc_minerals : business {
		name = "Разрешение на переработку минералов";
		description = "Разрешение, которое позволяет перерабатывать определенный вид ресурса.";
		conditions = "(call life_adminlevel) > 3";
		expires = 14;
		price = 15000;
	};
};
