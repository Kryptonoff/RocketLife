class CfgGroups
{
	allowAlphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁйцукенгшщзхъфывапролджэячсмитьбюё ";
	createGroupCost = 2000000;
	defaultGroupTitles[] =
	{
		{1,"Первый"},
		{2,"Второй"},
		{3,"Третий"},
		{4,"Четвертый"},
		{5,"Пятый"},
		{6,"Шестой"},
		{7,"Последний"}
	};
	taxToDeposit = 3;
	limitDeposit = 30000000;
	maximumDayChar = 280;
	maximumGroupDeputys = 3;
	maximumIcons = 20;
	maximumIconText = 50; //не более 255
	maximumPolys = 10;
	maximumPolyNode = 10;
	upgradePrices[] =
	{
		/*
			1 - До скольки слотов
			2 - Стоимость слота
		*/
		 {0, 1980}
		,{30, 3300}
		,{40, 4950}
		,{50, 6600}
		,{60, 7920}
	};
	class PremiumAbstract
	{
		name = "";
		picture="";
		description="";
		gates[] = {};
		flagTexture = "";
		location = "";
	};
	class PremiumGroups
	{
		class none {name = "";};

		class mgrp_1: PremiumAbstract
		{
			name = "Подпивасник";
			picture = "";
			description = "Подпивасник";
			location = "getMarkerPos 'RRP_MGRP_Spawn_1'";
			flagTexture = "";
		};

		class mgrp_2: PremiumAbstract
		{
			name = "";
			picture = "";
			description = "";
			location = "getMarkerPos 'RRP_MGRP_Spawn_2'";
			flagTexture = "\flag_pack\flad_miners.paa";
		};

		//Government
		class police: PremiumAbstract
		{
			name = "Altis Police Department";
			picture = "\rimas_agent\assets\organizations\police.paa";
			description = "This is a Police!";
			location = "getMarkerPos 'marker_600'";
			flagTexture = "\rimas_agent\assets\flags\police.paa";
		};
		class ems: PremiumAbstract
		{
			name = "Emergency Medic Services";
			picture = "\rimas_agent\assets\organizations\ems.paa";
			description = "Emergency Medic Service";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\FLAG_emS.paa";
		};
		class taxi: PremiumAbstract
		{
			name = "Taxi Services";
			picture = "\rimas_agent\assets\organizations\taxi.paa";
			description = "Taxi Services";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\rimas_agent\assets\flags\taxi.paa";
		};
		class press: PremiumAbstract
		{
			name = "7-News Agency";
			picture = "\rimas_agent\assets\organizations\7news.paa";
			description = "7-News Agency";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\flag_7news.paa";
		};
		class judge: PremiumAbstract
		{
			name = "Ministry of Justice";
			picture = "\rimas_agent\assets\organizations\judge.paa";
			description = "Ministry of Justice";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\rimas_agent\assets\flags\judge.paa";
		};
		class anvil: PremiumAbstract
		{
			name = "ANVIL";
			picture = "\rimas_agent\assets\organizations\ANVIL.paa";
			description = "ANVIL";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\flad_Anvil.paa";
		};
		class blacksnow: PremiumAbstract
		{
			name = "Black Snow";
			picture = "\rimas_agent\assets\organizations\black_snow.paa";
			description = "Black Snow";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\rimas_agent\assets\flags\bs.paa";
		};
		class cigane: PremiumAbstract
		{
			name = "Cigane";
			picture = "";
			description = "Cigane";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "";
		};
		class inagawakai: PremiumAbstract
		{
			name = "Inagawa Kai";
			picture = "\rimas_agent\assets\organizations\black_panthers.paa";
			description = "Inagawa Kai";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\inagawakai.paa";
		};
		class lacosanostra: PremiumAbstract
		{
			name = "La Cosa Nostra";
			picture = "\rimas_agent\assets\organizations\black_panthers.paa";
			description = "La Cosa Nostra";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\rimas_agent\assets\organizations\lcn.paa";
		};
		class blackwolves: PremiumAbstract
		{
			name = "Black Wolves";
			picture = "\rimas_agent\assets\organizations\black_panthers.paa";
			description = "Black Wolves";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\blackwolves.paa";
		};
		class sumiyoshi: PremiumAbstract
		{
			name = "Sumiyoshi Kai";
			picture = "";
			description = "Банда";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "";
		};
		class escobaro: PremiumAbstract
		{
			name = "La Escobaro Family";
			picture = "";
			description = "Банда";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "";
		};
		class sector: PremiumAbstract
		{
			name = "Банда";
			picture = "\rimas_agent\assets\organizations\black_panthers.paa";
			description = "Банда";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\Sector.paa";
		};
		class PremGRP_2: PremiumAbstract
		{
			name = "Банда";
			picture = "\rimas_agent\assets\organizations\black_panthers.paa";
			description = "Банда";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\PremGRP_2.paa";
		};
		class PremGRP_3: PremiumAbstract
		{
			name = "Банда";
			picture = "\rimas_agent\assets\organizations\black_panthers.paa";
			description = "Банда";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\PremGRP_3.paa";
		};
		class PremGRP_4: PremiumAbstract
		{
			name = "Банда";
			picture = "\rimas_agent\assets\organizations\black_panthers.paa";
			description = "Банда";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\PremGRP_4.paa";
		};
		class dl: PremiumAbstract
		{
			name = "Damned Knights";
			picture = "\rimas_agent\assets\organizations\deadlock.paa";
			description = "Damned Knights";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "\flag_pack\flag_CHINA.paa";
		};
		class flightschool: PremiumAbstract
		{
			name = "Летная школа";
			picture = "";
			description = "flightschool";
			location = "getMarkerPos 'base_hospital_1'";
			flagTexture = "";
		};
		class goverment: PremiumAbstract
		{
			name = "Правителство";
			picture = "\rimas_agent\assets\organizations\police.paa";
			description = "Правителство";
			location = "getMarkerPos 'grp_mi_6'";
			flagTexture = "\flag_pack\flag_IL.paa";
		};
	};
	class AbstractTaxItem
	{
		side = "civ";
		icon = "paycheque_ca.paa";
		displayName = "Налог";
		tooltip = "Налог на прибыль";
		minValue = 0;
		step = 1;
		maxValue = 25;
	};
	class taxes
	{
		class sellLegalResources: AbstractTaxItem
		{
			displayName = "С продажи легальных ресурсов";
		};
		class sellIllegalResources: AbstractTaxItem
		{
			displayName = "С продажи нелегальных ресурсов";
		};
		class slave: AbstractTaxItem
		{
			displayName = "С продажи рабов";
		};
		class chopVehicle: AbstractTaxItem
		{
			displayName = "С продажи краденных авто";
		};
		class ticketPayCop: AbstractTaxItem // ok
		{
			side = "cop";
			maxValue = 50;
			displayName = "С оплаченных штрафов";
		};
		class prison: AbstractTaxItem
		{
			side = "cop";
			maxValue = 50;
			displayName = "С посадки заключенных";
		};
		class gold_bullet: AbstractTaxItem
		{
			side = "cop";
			maxValue = 50;
			displayName = "С золотой пули";
		};
		class ticketPayMed: AbstractTaxItem // ok
		{
			side = "med";
			displayName = "С выставленных счетов";
		};
		class healMed: AbstractTaxItem
		{
			side = "med";
			displayName = "С лечения";
		};
	};
	class permissions
	{
		class deposit
		{
			displayName = "Класть в банк";
			tooltip = "Сможеть класть деньги в банк организации";
			idcCB = 111;
			idcT = 211;
		};
		class withdraw
		{
			displayName = "Снимать с банка";
			tooltip = "Сможет снимать деньги с банка организации";
			idcCB = 112;
			idcT = 212;
		};
		class tfarRead
		{
			displayName = "Видеть частоты";
			tooltip = "Сможет видеть частоты раций";
			idcCB = 113;
			idcT = 213;
		};
		class tfarChange
		{
			displayName = "Изменять частоты";
			tooltip = "Сможет менять частоты для рации (При смене частоты все видят новые частоты и кто инициализировал)";
			idcCB = 114;
			idcT = 214;
		};
		class sendMessage
		{
			displayName = "Отправлять уведомление";
			tooltip = "Сможет отправлять публичное сообщение всем членам группы";
			idcCB = 116;
			idcT = 216;
		};
		class setDayMessage
		{
			displayName = "Сообщение дня";
			tooltip = "Сможет менять сообщение дня";
			idcCB = 117;
			idcT = 217;
		};
		class allowTrunks
		{
			displayName = "Доступ к ящику";
			tooltip = "Разрешает получить доступ к ящику организации";
			idcCB = 118;
			idcT = 218;
		};
		class canInvite
		{
			displayName = "Приглашать";
			tooltip = "Сможет приглашать в организацию";
			idcCB = 119;
			idcT = 219;
		};
		class canKick
		{
			displayName = "Выгонять";
			tooltip = "Может выгнать члена организации ниже его по рангу";
			idcCB = 120;
			idcT = 220;
		};
		class canUp
		{
			displayName = "Повышать";
			tooltip = "Сможет повышать в звании, но не выше своего звания";
			idcCB = 121;
			idcT = 221;
		};
		class canDown
		{
			displayName = "Понижать";
			tooltip = "Сможет понижать в звании";
			idcCB = 122;
			idcT = 222;
		};
		class canMarker
		{
			displayName = "Ставить маркеры";
			tooltip = "Может ставить маркеры и рисовать линии на карте, также сможет удалять маркеры которые ставили другие члены организации";
			idcCB = 123;
			idcT = 223;
		};
		class upgrade
		{
			displayName = "Улучшать";
			tooltip = "Может улучшить организацию";
			idcCB = 124;
			idcT = 224;
		};
		class impulse
		{
			displayName = "Импульс";
			tooltip = "Разрешить вызывать импульс в ВП, средства на его вызов берутся из банка организации";
			idcCB = 126;
			idcT = 226;
		};
		class pullFlag
		{
			displayName = "Вытащить флаг";
			tooltip = "Позволяет вытащить флаг на спину или на некоторый транспорт (SHIFT + F)";
			idcCB = 127;
			idcT = 227;
		};
		class canLeave
		{
			displayName = "Не может покинуть организацию";
			tooltip = "Запрещает покидать организацию самостоятельно";
			idcCB = 128;
			idcT = 228;
		};
		class tax
		{
			displayName = "Изменять налоги";
			tooltip = "Позволяет изменить налоги в организации";
			idcCB = 129;
			idcT = 229;
		};
		class salary
		{
			displayName = "Изменять зарплаты";
			tooltip = "Позволяет изменить зарплатные настройки в организации";
			idcCB = 130;
			idcT = 230;
		};
	};
	Icons[]=
	{
		{ "Text only","\A3\ui_f\data\map\markers\system\dummy_ca.paa"},
		{ "Empty","\A3\ui_f\data\map\markers\system\empty_ca.paa"},
		{ "Objective","\A3\ui_f\data\map\markers\military\objective_CA.paa"},
		{ "Marker","\A3\ui_f\data\map\markers\military\marker_CA.paa"},
		{ "Flag","\A3\ui_f\data\map\markers\military\flag_CA.paa"},
		{ "Arrow","\A3\ui_f\data\map\markers\military\arrow_CA.paa"},
		{ "Arrow (filled)", "\A3\ui_f\data\map\markers\military\arrow2_CA.paa" },
		{ "Ambush", "\A3\ui_f\data\map\markers\military\ambush_CA.paa" },
		{ "Destroy", "\A3\ui_f\data\map\markers\military\destroy_CA.paa" },
		{ "Start", "\A3\ui_f\data\map\markers\military\start_CA.paa" },
		{ "End", "\A3\ui_f\data\map\markers\military\end_CA.paa" },
		{ "Pick Up", "\A3\ui_f\data\map\markers\military\pickup_CA.paa" },
		{ "Join", "\A3\ui_f\data\map\markers\military\join_CA.paa" },
		{ "Warning", "\A3\ui_f\data\map\markers\military\warning_CA.paa" },
		{ "Unknown", "\A3\ui_f\data\map\markers\military\unknown_CA.paa" },
		{ "Circle", "\A3\ui_f\data\map\markers\military\circle_CA.paa" },
		{ "Dot", "\A3\ui_f\data\map\markers\military\dot_CA.paa" },
		{ "Square", "\A3\ui_f\data\map\markers\military\box_CA.paa" },
		{ "Triangle", "\A3\ui_f\data\map\markers\military\triangle_CA.paa" },
		{ "Select", "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa" },
		{ "Waypoint", "\A3\ui_f\data\map\groupicons\waypoint.paa" },
		{ "Selector - Selectable","\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa" },
		{ "Selector - Selected Enemy","\A3\ui_f\data\map\groupicons\selector_selectedEnemy_ca.paa" },
		{ "Selector - Selected Friendly","\A3\ui_f\data\map\groupicons\selector_selectedFriendly_ca.paa" },
		{ "Selector - Selected Mission","\A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa" },
		{ "KIA", "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa" },
		{ "Minefield", "\a3\Ui_F_Curator\Data\CfgMarkers\minefield_ca.paa" },
		{ "Minefield (AP)", "\a3\Ui_F_Curator\Data\CfgMarkers\minefieldAP_ca.paa" },
		{ "NATO", "\A3\ui_f\data\map\markers\flags\nato_ca.paa" },
		{ "CSAT", "\A3\ui_f\data\map\markers\flags\CSAT_ca.paa" },
		{ "Altis Armed Forces", "\A3\ui_f\data\map\markers\flags\AAF_ca.paa" },
		{ "Altis", "\A3\ui_f\data\map\markers\flags\Altis_ca.paa" },
		{ "Altis (Colonial)", "\A3\ui_f\data\map\markers\flags\AltisColonial_ca.paa"},
		{ "FIA", "\A3\ui_f\data\map\markers\flags\FIA_ca.paa" },
		{ "European Union", "\A3\ui_f\data\map\markers\flags\EU_ca.paa" },
		{ "United Nations", "\A3\ui_f\data\map\markers\flags\UN_ca.paa" },
		{ "Belgium", "\A3\ui_f\data\map\markers\flags\Belgium_ca.paa" },
		{ "Canada", "\A3\ui_f\data\map\markers\flags\Canada_ca.paa" },
		{ "Croatia", "\A3\ui_f\data\map\markers\flags\Croatia_ca.paa" },
		{ "Czech Republic", "\A3\ui_f\data\map\markers\flags\CzechRepublic_ca.paa"},
		{ "Denmark", "\A3\ui_f\data\map\markers\flags\Denmark_ca.paa" },
		{ "France", "\A3\ui_f\data\map\markers\flags\France_ca.paa" },
		{ "Georgia", "\A3\ui_f\data\map\markers\flags\Georgia_ca.paa" },
		{ "Germany", "\A3\ui_f\data\map\markers\flags\Germany_ca.paa" },
		{ "Greece", "\A3\ui_f\data\map\markers\flags\Greece_ca.paa" },
		{ "Hungary", "\A3\ui_f\data\map\markers\flags\Hungary_ca.paa" },
		{ "Iceland", "\A3\ui_f\data\map\markers\flags\Iceland_ca.paa" },
		{ "Italy", "\A3\ui_f\data\map\markers\flags\Italy_ca.paa" },
		{ "Luxembourg", "\A3\ui_f\data\map\markers\flags\Luxembourg_ca.paa" },
		{ "Netherlands", "\A3\ui_f\data\map\markers\flags\Netherlands_ca.paa" },
		{ "Norway", "\A3\ui_f\data\map\markers\flags\Norway_ca.paa" },
		{ "Poland", "\A3\ui_f\data\map\markers\flags\Poland_ca.paa" },
		{ "Portugal", "\A3\ui_f\data\map\markers\flags\Portugal_ca.paa" },
		{ "Slovakia", "\A3\ui_f\data\map\markers\flags\Slovakia_ca.paa" },
		{ "Slovenia", "\A3\ui_f\data\map\markers\flags\Slovenia_ca.paa" },
		{ "Spain", "\A3\ui_f\data\map\markers\flags\Spain_ca.paa" },
		{ "UK", "\A3\ui_f\data\map\markers\flags\UK_ca.paa" },
		{ "USA", "\A3\ui_f\data\map\markers\flags\USA_ca.paa" }
	};
};
