/*
	Доступные валюты:

	cash 
	atm  
	TRX  
	point

RRPCash	- за наличку
RRPAtm - за банковский счет
RRPPoint - за rcredits
RRPTRX - за TRX
*/

/*
	type:
		item - единоразовый предмет, туда относится все что не в пропись, count - количество предметов
		rent - предмет в аренду, count - количество дней
		permanent - постоянный предмет
*/

#define TRX_ITEM "item"
#define TRX_RENT "rent"
#define TRX_PERMANENT "permanent"

class AbstractTrxtem
{
	displayName = "";
	item = "";
	image = "";
	description = "";
	currency = "RRPTRX";
	price = 0;
	buyType = "item";
	count = 1;
};

class CfgTRX
{
	class vip_category
	{
		displayName = "VIP Статусы";
		class items 
		{
			class vip1: AbstractTrxtem
			{
				displayName = "VIP 1";
				image = "\rimas_agent\assets\hud\vip-1.paa";
				item = "vip1";
				description = "VIP 1: Срок действия - 30 дней";
				currency = "RRPTRX";
				price = 45;
				count = 30;
			};
			class vip2: AbstractTrxtem
			{
				displayName = "VIP 2";
				item = "vip2";
				image = "\rimas_agent\assets\hud\vip-2.paa";
				description = "VIP 2: Срок действия - 30 дней";
				currency = "RRPTRX";
				price = 65;
				count = 30;
			};
			class vip3: AbstractTrxtem
			{
				displayName = "VIP 3";
				item = "vip3";
				image = "\rimas_agent\assets\hud\vip-3.paa";
				description = "VIP 3: Срок действия - 30 дней";
				currency = "RRPTRX";
				price = 85;
				count = 30;
			};
			class vip4: AbstractTrxtem
			{
				displayName = "VIP 4";
				item = "vip4";
				image = "\rimas_agent\assets\hud\vip-4.paa";
				description = "VIP 4: Срок действия - 30 дней";
				currency = "RRPTRX";
				price = 95;
				count = 30;
			};
		};
	};
	class vehicles
	{
		displayName = "Транспорт";
		class items
		{
			class carrera: AbstractTrxtem
			{
				displayName = "Porsche Carrera 4S";
				item = "RRPVehicle_civ_911_carrera";
				image = "config\images\carrera2.jpg";
				description = "Спортивный автомобиль.";
				price = 10;
				count = 1;
			};
			class panamera_alchemist: AbstractTrxtem
			{
				displayName = "Porsche Panamera Alchemist";
				item = "RRPVehicle_civ_panamera_alchemist";
				image = "config\images\panamera.jpg";
				description = "Спортивный автомобиль.";
				price = 30;
				count = 1;
			};
			class knur: AbstractTrxtem
			{
				displayName = "МЗКТ 'КНУР'";
				item = "RRPVehicle_knur_lk";
				image = "config\images\knur.jpg";
				description = "Грузовик на 2000 слотов.";
				price = 65;
				count = 1;
			};
			class MRAP_Ifrit: AbstractTrxtem
			{
				displayName = "Ifrit";
				item = "RRPVehicle_lk_MRAP";
				image = "config\images\ifrit_mrap.jpg";
				description = "Ifrit - это бронированный внедорожник, предназначенный для выполнения множества задач, от быстрого перемещения войск и особых групп до проведения разведки на поле боя. Невооруженная версия Ifrit сосредоточена на мобильности и защите, не включая встроенное оружие.";
				price = 60;
				count = 1;
			};
			class MRAP_Ifrit_12_7: AbstractTrxtem
			{
				displayName = "Ifrit 12.7";
				item = "O_MRAP_02_hmg_F";
				image = "config\images\ifrit.jpg";
				description = "Ifrit HMG - это бронированный внедорожник, оснащенный тяжелым пулеметом. Это мощное и универсальное боевое средство, способное выполнять широкий спектр задач на поле боя. \
<br/>\
Основные характеристики Ifrit HMG:\
<br/>\
Оружие: Ifrit HMG оснащен тяжелым пулеметом калибра 12,7 мм, который может нанести существенный урон как наземным целям, так и воздушным целям на низкой высоте.\
<br/>\
Броня: Кузов Ifrit HMG обеспечивает повышенную защиту от огнестрельного оружия и взрывов благодаря бронированной оболочке. Бронирование спроектировано так, чтобы минимизировать ущерб от направленных взрывов и осколочных поражений.\
<br/>\
Производительность: Ifrit HMG способен развивать высокую скорость и обладает отличной маневренностью, что делает его превосходным средством для быстрого перемещения войск и проведения боевых действий на изменчивом ландшафте.\
<br/>\
Пассажирские места: Внутри Ifrit HMG могут разместиться до пяти человек, включая водителя, стрелка и трех пассажиров. Это позволяет использовать Ifrit HMG для транспортировки малых военных подразделений или особо важных лиц.\
<br/><br/>\
Ifrit HMG - это мощное и гибкое боевое средство, способное справиться с широким спектром военных задач, от быстрого перемещения и разведки до обеспечения огневой поддержки.";
				price = 130;
				count = 1;
			};
			class MRAP_Ifrit_12_7_RC: MRAP_Ifrit_12_7
			{
				currency = "RRPPoint";
				price = 7920;
			};
			class MRAP_Strider_12_7: AbstractTrxtem
			{
				displayName = "Strider 12.7";
				item = "I_MRAP_03_hmg_F";
				image = "config\images\strider.jpg";
				description = "Hunter HMG - это высокопроизводительный бронированный внедорожник, оснащенный тяжелым пулеметом для обеспечения как мобильности, так и огневой поддержки на поле боя. \
				Дизайн этого внедорожника сочетает в себе надежность, прочность и боевую мощь. \
<br/>\
Основные характеристики Hunter HMG:\
<br/>\
Оружие: На борту установлен тяжелый пулемет калибра 12,7 мм, который может стрелять по наземным целям и низколетящим воздушным целям.\
<br/>\
Броня: Hunter HMG оснащен бронированной оболочкой, способной выдержать огонь из малокалиберного оружия и обеспечивающей некоторую защиту от взрывов.\
<br/>\
Производительность: Hunter HMG способен развивать высокую скорость и обеспечивать маневренность на различных типах поверхности, что делает его эффективным для быстрых атак и отступлений.\
<br/>\
Пассажирские места: В Hunter HMG могут уместиться до пяти человек, включая водителя, стрелка и трех пассажиров, что делает его удобным для транспортировки небольших групп.\
<br/>\
Hunter HMG является универсальным внедорожником, способным выполнять различные военные задачи, от быстрого перемещения войск до обеспечения огневой поддержки и разведки.";
				price = 130;
				count = 1;
			};
			class MRAP_Strider_12_7_RC: MRAP_Strider_12_7
			{
				currency = "RRPPoint";
				price = 7920;
			};
			class MRAP_Hunter_12_7: AbstractTrxtem
			{
				displayName = "Hunter 12.7";
				item = "B_MRAP_01_hmg_F";
				image = "config\images\hunter.jpg";
				description = "Hunter HMG - это высокопроизводительный бронированный внедорожник, оснащенный тяжелым пулеметом для обеспечения как мобильности, так и огневой поддержки на поле боя. Дизайн этого внедорожника сочетает в себе надежность, прочность и боевую мощь.\
<br/>\
Основные характеристики Hunter HMG:\
<br/>\
Оружие: На борту установлен тяжелый пулемет калибра 12,7 мм, который может стрелять по наземным целям и низколетящим воздушным целям.\
<br/>\
Броня: Hunter HMG оснащен бронированной оболочкой, способной выдержать огонь из малокалиберного оружия и обеспечивающей некоторую защиту от взрывов.\
<br/>\
Производительность: Hunter HMG способен развивать высокую скорость и обеспечивать маневренность на различных типах поверхности, что делает его эффективным для быстрых атак и отступлений.\
<br/>\
Пассажирские места: В Hunter HMG могут уместиться до пяти человек, включая водителя, стрелка и трех пассажиров, что делает его удобным для транспортировки небольших групп.\
<br/>\
Hunter HMG является универсальным внедорожником, способным выполнять различные военные задачи, от быстрого перемещения войск до обеспечения огневой поддержки и разведки.";
				price = 130;
				count = 1;
			};
			class MRAP_Hunter_12_7_RC: MRAP_Hunter_12_7
			{
				currency = "RRPPoint";
				price = 7920;
			};
			class Batmobile: AbstractTrxtem
			{
				displayName = "Batmobile";
				item = "ver_bat";
				image = "config\images\bat.jpg";
				description = "Бетмобиль из фильма ""The Dark Knight"" продолжает впечатлять своей мощью и функциональностью. Он обладает темным, агрессивным дизайном и усовершенствованными возможностями. Бетмобиль из этого фильма оснащен усиленным бронированием, способным выдержать серьезные атаки. Его скорость и маневренность позволяют Бэтмену эффективно передвигаться по городу Готэм. ";
				price = 70;
				count = 1;
			};
		};
	};
	class single_items
	{
		displayName = "Разовые предметы";
		class items
		{
			class RRPWeapon_RPG_7: AbstractTrxtem 
			{
				displayName = "RPG-7";
				item = "RRPWeapon_RPG_7";
				image = "config\images\weapons\rpg7.jpg";
				description = "";
				price = 22;
				count = 1;
			};
			class RRP_RPG7_mag: AbstractTrxtem
			{
				displayName = "RPG-7 Снаряд";
				item = "RRP_RPG7_mag";
				image = "config\images\weapons\rpg7.jpg";
				description = "";
				price = 10;
				count = 1;
			};
			class RRPWeapon_RPG_7_RC: RRPWeapon_RPG_7 
			{
				currency = "RRPPoint";
				price = 125;
			};
			class RRP_RPG7_mag_RC: RRP_RPG7_mag
			{
				currency = "RRPPoint";
				price = 60;
			};
		};
	};
	class items_in_sign
	{
		displayName = "Предметы в аренду";
		class items
		{
			class mrco: AbstractTrxtem
			{
				displayName = "Прицел MRCO";
				item = "mrco_bundle";
				image = "config\images\mrco.jpg";
				description = "Прицел MRCO с двух-кратным увеличением";
				buyType = "rent";
				price = 60;
				count = 30;
			};
			class aim2x_bandle: AbstractTrxtem
			{
				displayName = "RCO Bundle";
				item = "aim2x_bandle";
				image = "config\images\weapons\rcos.jpg";
				description = "Комплект из прицелов RCO, ARCO, ERCO в разных цветах";
				buyType = "rent";
				price = 95;
				count = 30;
			};
			class adr97: AbstractTrxtem {
				displayName = "ADR-97";
				item = "adr_pack_trx";
				image = "config\images\adr97.jpg";
				description = "ADR-97 был построен по схеме булл-пап, автоматика работает по схеме со свободным затвором. Калибр 5.7мм. Огонь ведется с закрытого затвора. Ударно-спусковой механизм куркового типа, позволяющий вести как одиночный, так и автоматический огонь<br/>Не имеет креплений для установки прицелов!";
				buyType = "rent";
				price = 65;
				count = 30;
			};
			
			class AK12_BL: AbstractTrxtem {
				displayName = "AK-12";
				item = "AK12_BL";
				image = "config\images\weapons\ak12.jpg";
				description = "Аренда на 30 дней";
				buyType = "rent";
				price = 85;
				count = 30;
			};
			class FN_FAL_02: AbstractTrxtem {
				displayName = "FN FAL";
				item = "FN_FAL_02";
				image = "config\images\weapons\fnfal.jpg";
				description = "Аренда на 30 дней";
				buyType = "rent";
				price = 110;
				count = 30;
			};
			class GALIL: AbstractTrxtem {
				displayName = "Galil";
				item = "GALIL";
				image = "config\images\weapons\galil.jpg";
				description = "Аренда на 30 дней";
				buyType = "rent";
				price = 60;
				count = 30;
			};
			class LMG_LIM: AbstractTrxtem {
				displayName = "LIM-85";
				item = "LMG_LIM";
				image = "config\images\weapons\lim.jpg";
				description = "Аренда на 30 дней";
				buyType = "rent";
				price = 120;
				count = 30;
			};
			class MX_F: AbstractTrxtem {
				displayName = "MX";
				item = "MX_F";
				image = "config\images\weapons\mxf.jpg";
				description = "Аренда на 30 дней";
				buyType = "rent";
				price = 75;
				count = 30;
			};
			class spar17_pack: AbstractTrxtem {
				displayName = "SPAR-17";
				item = "spar17_pack";
				image = "config\images\weapons\spar17.jpg";
				description = "Аренда на 30 дней";
				buyType = "rent";
				price = 95;
				count = 30;
			};
			class ZBROYAR: AbstractTrxtem {
				displayName = "Зброяр-3ZX";
				item = "ZBROYAR";
				image = "config\images\weapons\zbroyar.jpg";
				description = "Аренда на 30 дней";
				buyType = "rent";
				price = 100;
				count = 30;
			};
			class LMG_ZAFIR: AbstractTrxtem {
				displayName = "Zafir";
				item = "LMG_ZAFIR";
				image = "config\images\weapons\zafir.jpg";
				description = "Аренда на 30 дней";
				buyType = "rent";
				currency = "RRPPoint";
				price = 16500;
				count = 30;
			};
		};
	};
	class items_in_permanent
	{
		displayName = "Предметы навсегда";
		class items
		{
			class panamera_speedhunters: AbstractTrxtem
			{
				displayName = "Porsche Panamera SpeedHunters";
				item = "panamera_speedhunters";
				image = "config\images\panamera_speedhunters.jpg";
				description = "Porsche Panamera 2017 года в уникальном обвесе SpeedHunters. Этот автомобиль, действительно, выделяется своим стильным внешним видом.";
				buyType = "permanent";
				price = 150;
			};
		};
	};
};
