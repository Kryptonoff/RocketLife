class CfgJobs
{
	life_jobs_array[] = {
		{ "Курьер в DHL (2 ур.)", "[] call RRPClient_jobs_startDhl; closeDialog 0;", "true"},
		{ "Водитель автобуса (4 ур.)", "[] call RRPClient_jobs_startBus; closeDialog 0;", "true"},
		{ "Пробоотборщик земли (6 ур.)", "'gs' call RRPClient_jobs_startEcologist; closeDialog 0;", "true"},
		{ "Электрик (8 ур.)", "[] call RRPClient_jobs_startElectrician; closeDialog 0;", "true"},
		{ "Дальнобойщик (10 ур.)", "[] call RRPClient_jobs_startDelivery; closeDialog 0;", "true"},
		{ "Пробоотборщик воды (12 ур.)", "'ws' call RRPClient_jobs_startEcologist; closeDialog 0;", "true"}
		
	}; //работы легальные {название, экшн, условия}
	
	life_darkjobs_array[] = {
		{ "Грабитель заправок (9 ур.)", "[] call RRPClient_rob_orderTake; closeDialog 0;", "true"},
		{ "Наркокурьер (11 ур.)", "[] call RRPClient_dcourrier_orderTake; closeDialog 0;", "true"},
		{ "Чистильщик (13 ур.)", "[] call RRPClient_dcleaner_orderTake; closeDialog 0;", "true"},
		{ "Диверсант (15 ур.)", "[] call RRPClient_terror_orderTake; closeDialog 0;", "true"}
	}; //работы нелегальные {название, экшн, условия}
	
	life_carrent_price = 20; //цена за минуту

	class dhlland 
	{
		life_ds_price = 240; //сколько платим за выполненное задание +++
		life_ds_box = "plp_cts_CanisterWhite"; //класс коробки, которую надо носить
	};

	class dhl 
	{
		conditions = "true";
		conditionsMessage = "Потому что ты пидор";

		life_office_spawn = "dhl_office_car"; //маркер офиса DHL, где спаун тачек делаем
		life_vehicle_class = "C_Van_01_box_F_EXT_DHL"; //класс фургона, который даем на задание
		life_dhl_box = "plp_cts_CanisterWhite"; //класс коробки, которую надо носить
		life_dhl_price = 1.1; //сколько платим за метр +++
		life_cloth_price = 50; //сколько платим за форму
		life_cloth_uniform = "rimas_dhl_Employee";
		life_cloth_headgear = "rimas_dhl_Cap";
		life_cloth_instrument = "";

		life_vehicle_price = 8500; //сколько платим за машину

		life_dp_points[] = {"dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"};
	};

	class dlv 
	{
		conditions = "true";
		conditionsMessage = "Потому что ты пидор";

		life_dlv_price = 1.5; ////сколько платим за метр

		life_office_spawn = "dlv_office_car"; // маркер офиса электриков, где спаун тачек
		life_vehicle_class = "d3s_next_tent"; //класс фургона, который даем на задание электрикам
		life_vehicle_price = 15000; //сколько платим за машину

		depo_kavala = "Кавала"; //названия депо
		depo_alps = "Альпы"; //названия депо
		depo_north = "Север"; //названия депо
		depo_east = "Восток"; //названия депо
	};

	class bus
	{
		conditions = "true";
		conditionsMessage = "Потому что ты пидор";

		life_office_spawn = "bus_office_car"; // маркер офиса автобусников, где спаун тачек
		life_vehicle_class = "d3s_NewFlyer_XD40"; //класс фургона, который даем на задание
		life_bus_price = 70000; //сколько платим за выполненное задание +++
		life_cloth_price = 50; //сколько платим за форму
		life_cloth_uniform = "rimas_dhl_Employee";
		life_cloth_headgear = "rimas_dhl_Cap";
		life_cloth_instrument = "";

		life_vehicle_price = 5000; //сколько платим за машину
		life_bus_points[] = {
			{3621.32,13111.9,-0.00564694}, //point_1
			{4665.15,14177.4,0}, //point_2
			{6780.64,15683.8,0}, //point_3
			{9103.67,15773.3,0}, //point_4
			{12359.6,15862.2,0}, //point_5
			{14537.4,16882.6,0}, //point_6
			{14048.1,18862.8,0}, //point_7
			{16239.7,17342.3,0}, //point_8
			{25827.3,21467.9,0}, //point_10
			{16733.7,12905.1,0}, //point_11
			{16240.3,17341.3,0}, //point_12
			{14048.3,18863.6,0}, //point_13
			{14538,16883,0}, //point_14
			{12349,15872.3,0}, //point_15
			{9126.65,15796.4,0}, //point_16
			{6770.5,15684.7,0}, //point_17
			{4627.94,14157.6,0}, //point_18
			{3615.47,13143.5,0} //point_19
		}; //позиция маркеров для автобуса
	};

	class eln 
	{
		conditions = "true";
		conditionsMessage = "Потому что ты пидор";

		life_office_spawn = "eln_office_car"; // маркер офиса электриков, где спаун тачек
		life_vehicle_class = "C_Van_02_service_F"; //класс фургона, который даем на задание электрикам
		life_eln_price = 45000; //сколько платим за выполненное задание +++
		life_cloth_price = 50; //сколько платим за форму
		life_cloth_uniform = "rimas_dhl_Employee";
		life_cloth_headgear = "rimas_dhl_Cap";
		life_cloth_instrument = "";

		life_vehicle_price = 5000; //сколько платим за машину

		/*
		
		finalText = "";
		{
			_lamps = nearestObjects [getpos _x, ["Land_LampStreet_F","Land_LampStreet_small_F","Land_LampDecor_F"], 750];
			if (count _lamps > 5) then {
				if (count _lamps > 10) then {_lamps resize 10};
		
				finalText = finalText + format ["
		\\class city_%1 {
		\\\townName = '%2';
		\\\townPosition[] = %3;
		\\\lampsAmount = %4;
		\\};",_forEachIndex,text _x,format["{%1,%2,0}",(position _x)#0,(position _x)#1],str (count _lamps)]
			};
		} foreach nearestLocations [[worldSize/2, worldSize/2], ["NameCity","NameVillage"], worldSize];
		finalText
		
		*/	
		class elnLamps {
			class city_0 { 
				townName = 'Антракия'; 
				townPosition[] = {16584.3,16104,0}; 
				lampsAmount = 10; 
			}; 
			class city_1 { 
				townName = 'Телос'; 
				townPosition[] = {16207,17296.7,0}; 
				lampsAmount = 9; 
			}; 
			class city_3 { 
				townName = 'Ставрос'; 
				townPosition[] = {12950.1,15041.6,0}; 
				lampsAmount = 10; 
			}; 
			class city_4 { 
				townName = 'Харкия'; 
				townPosition[] = {18049.1,15264.1,0}; 
				lampsAmount = 10; 
			}; 
			class city_5 { 
				townName = 'Неохори'; 
				townPosition[] = {12502,14337,0}; 
				lampsAmount = 10; 
			}; 
			class city_6 { 
				townName = 'Лакка'; 
				townPosition[] = {12282,15732.3,0}; 
				lampsAmount = 10; 
			}; 
			class city_7 { 
				townName = 'Родополи'; 
				townPosition[] = {18753.4,16597.1,0}; 
				lampsAmount = 9; 
			}; 
			class city_9 { 
				townName = 'Каталаки'; 
				townPosition[] = {11701.1,13672.1,0}; 
				lampsAmount = 10; 
			}; 
			class city_11 { 
				townName = 'Аликампос'; 
				townPosition[] = {11112.6,14573.7,0}; 
				lampsAmount = 7; 
			}; 
			class city_15 { 
				townName = 'Полиакко'; 
				townPosition[] = {10966.5,13435.3,0}; 
				lampsAmount = 10; 
			}; 
			class city_21 { 
				townName = 'Териса'; 
				townPosition[] = {10618.9,12237.3,0}; 
				lampsAmount = 10; 
			}; 
			class city_22 { 
				townName = 'Парос'; 
				townPosition[] = {20885.4,16958.8,0}; 
				lampsAmount = 10; 
			}; 
			class city_23 { 
				townName = 'Калохори'; 
				townPosition[] = {21351.6,16361.9,0}; 
				lampsAmount = 10; 
			}; 
			class city_25 { 
				townName = 'Айос-Дионисиос'; 
				townPosition[] = {9187.95,15947.8,0}; 
				lampsAmount = 10; 
			}; 
			class city_26 { 
				townName = 'Галати'; 
				townPosition[] = {10270.3,19036,0}; 
				lampsAmount = 6; 
			}; 
			class city_27 { 
				townName = 'Зарос'; 
				townPosition[] = {9091.81,11961.9,0}; 
				lampsAmount = 10; 
			}; 
			class city_28 { 
				townName = 'Сирта'; 
				townPosition[] = {8625.13,18301.6,0}; 
				lampsAmount = 6; 
			}; 
			class city_30 { 
				townName = 'Тополия'; 
				townPosition[] = {7375.81,15429.5,0}; 
				lampsAmount = 7; 
			}; 
			class city_32 { 
				townName = 'Коре'; 
				townPosition[] = {7062.42,16472.1,0}; 
				lampsAmount = 6; 
			}; 
			class city_36 { 
				townName = 'Селакано'; 
				townPosition[] = {20769.8,6736.46,0}; 
				lampsAmount = 9; 
			}; 
			class city_38 { 
				townName = 'Панохори'; 
				townPosition[] = {5033.31,11245.2,0}; 
				lampsAmount = 10; 
			}; 
			class city_39 { 
				townName = 'Айос-Константинос'; 
				townPosition[] = {3948.77,17277.8,0}; 
				lampsAmount = 10; 
			}; 
			class city_40 { 
				townName = 'Аггелохори'; 
				townPosition[] = {3687.78,13776.1,0}; 
				lampsAmount = 10; 
			}; 
			class city_41 { 
				townName = 'Нери'; 
				townPosition[] = {4116.11,11736.1,0}; 
				lampsAmount = 10; 
			}; 
			class city_42 { 
				townName = 'София'; 
				townPosition[] = {25680.5,21365.1,0}; 
				lampsAmount = 10; 
			};
		};
	};


	class eco_gs
	{
		conditions = "true";
		conditionsMessage = "Потому что ты пидор";

		life_office_spawn = "ecolog_office_car"; //маркер офиса эколога, где спаун тачек делаем
		life_vehicle_class = "B_T_Truck_01_mover_F"; //класс фургона, который даем на задание
		life_eco_gs_price = 55000; //сколько платим за работу +++
		life_cloth_price = 50; //сколько платим за форму
		life_cloth_uniform = "rimas_dhl_Employee";
		life_cloth_headgear = "rimas_dhl_Cap";
		life_cloth_instrument = "Extremo_Tool_Shovel";

		life_vehicle_price = 2500; //сколько платим за машину
		life_eco_gs_car_points[] = {
			{9462,13850,0},
			{6667,11542,0},
			{11715,13366,0},
			{12232,15611,0}
		}; //позиция маркеров для пробоотборщика		
	};

	class eco_ws
	{
		conditions = "true";
		conditionsMessage = "Потому что ты пидор";
		
		//Эколог вода
		life_office_spawn = "ecolog_office_boat"; //маркер офиса эколога, где спаун лодки делаем
		life_vehicle_class = "B_Lifeboat"; //класс лодки, которую даем на задание
		life_eco_ws_price = 45000; //сколько платим за работу
		life_cloth_price = 50; //сколько платим за форму
		life_cloth_uniform = "rimas_dhl_Employee";
		life_cloth_headgear = "rimas_dhl_Cap";
		life_cloth_instrument = "";

		life_vehicle_price = 5000; //сколько платим за машину
		life_vehicle_points[] = {
			{995,23319,0},
			{958,19632,0},
			{1986,15958,0},
			{1572,11872,0},
			{2888,7534,0},
			{3866,5403,0},
			{6956,10451,0},
			{3210,11300,0},
			{9409,10244,0},
			{6095,3383,0},
			{3663,2092,0},
			{719,6501,0},
			{1708,15917,0}
		}; //позиция маркеров для пробоотборщика	
	};

	class rob 
	{
		life_rob_price = 7750; //сколько платим за ограбление заправки гарантированная часть, бонусом идет рандомное из этого же
	};
	class dcourrier
	{
		life_dcourrier_price = 7000; //сколько платим за выполненное задание
		/*
		
		finalText = "";
		{
			_towns = nearestObjects [getpos _x, ["Land_i_Stone_Shed_V1_F","Land_Metal_Shed_F","Land_Slum_House02_F"], 1000];
			if (count _towns > 5) then {
		
				finalText = finalText + format ["
		\\class city_%1 {
		\\\townName = '%2';
		\\\townPosition[] = %3;
		\\\housesAmount = %4;
		\\};",_forEachIndex,text _x,format["{%1,%2,0}",(position _x)#0,(position _x)#1],str (count _towns)]
			};
		} foreach nearestLocations [[worldSize/2, worldSize/2], ["NameCity","NameVillage"], worldSize];
		finalText
		
		*/
		class dcourrierTowns {
			class city_0 { 
				townName = 'Антракия'; 
				townPosition[] = {16584.3,16104,0}; 
				housesAmount = 42; 
			}; 
			class city_1 { 
				townName = 'Телос'; 
				townPosition[] = {16207,17296.7,0}; 
				housesAmount = 48; 
			}; 
			class city_2 { 
				townName = 'Гравия'; 
				townPosition[] = {14479.8,17614.3,0}; 
				housesAmount = 56; 
			}; 
			class city_3 { 
				townName = 'Ставрос'; 
				townPosition[] = {12950.1,15041.6,0}; 
				housesAmount = 62; 
			}; 
			class city_4 { 
				townName = 'Харкия'; 
				townPosition[] = {18049.1,15264.1,0}; 
				housesAmount = 95; 
			}; 
			class city_5 { 
				townName = 'Неохори'; 
				townPosition[] = {12502,14337,0}; 
				housesAmount = 32; 
			}; 
			class city_6 { 
				townName = 'Лакка'; 
				townPosition[] = {12282,15732.3,0}; 
				housesAmount = 51; 
			}; 
			class city_7 { 
				townName = 'Родополи'; 
				townPosition[] = {18753.4,16597.1,0}; 
				housesAmount = 70; 
			}; 
			class city_8 { 
				townName = 'Калитея'; 
				townPosition[] = {17826.5,18129.4,0}; 
				housesAmount = 14; 
			}; 
			class city_9 { 
				townName = 'Каталаки'; 
				townPosition[] = {11701.1,13672.1,0}; 
				housesAmount = 40; 
			}; 
			class city_10 { 
				townName = 'Нифи'; 
				townPosition[] = {19473.3,15453.7,0}; 
				housesAmount = 27; 
			}; 
			class city_11 { 
				townName = 'Аликампос'; 
				townPosition[] = {11112.6,14573.7,0}; 
				housesAmount = 38; 
			}; 
			class city_12 { 
				townName = 'Дорида'; 
				townPosition[] = {19336.9,13252.3,0}; 
				housesAmount = 63; 
			}; 
			class city_13 { 
				townName = 'Айос-Петрос'; 
				townPosition[] = {19339.4,17641.6,0}; 
				housesAmount = 35; 
			}; 
			class city_14 { 
				townName = 'Корони'; 
				townPosition[] = {11786.7,18372.4,0}; 
				housesAmount = 19; 
			}; 
			class city_15 { 
				townName = 'Полиакко'; 
				townPosition[] = {10966.5,13435.3,0}; 
				housesAmount = 32; 
			}; 
			class city_16 { 
				townName = 'Ифестиона'; 
				townPosition[] = {12787,19679.3,0}; 
				housesAmount = 26; 
			}; 
			class city_17 { 
				townName = 'Айя-Триада'; 
				townPosition[] = {16668.5,20487,0}; 
				housesAmount = 12; 
			}; 
			class city_18 { 
				townName = 'Орино'; 
				townPosition[] = {10410.4,17243.1,0}; 
				housesAmount = 31; 
			}; 
			class city_19 { 
				townName = 'Фрини'; 
				townPosition[] = {14612.5,20786.7,0}; 
				housesAmount = 39; 
			}; 
			class city_20 { 
				townName = 'Экали'; 
				townPosition[] = {17059.7,9992.32,0}; 
				housesAmount = 15; 
			}; 
			class city_21 { 
				townName = 'Териса'; 
				townPosition[] = {10618.9,12237.3,0}; 
				housesAmount = 21; 
			}; 
			class city_22 { 
				townName = 'Парос'; 
				townPosition[] = {20885.4,16958.8,0}; 
				housesAmount = 121; 
			}; 
			class city_23 { 
				townName = 'Калохори'; 
				townPosition[] = {21351.6,16361.9,0}; 
				housesAmount = 110; 
			}; 
			class city_24 { 
				townName = 'Халкея'; 
				townPosition[] = {20194.6,11660.7,0}; 
				housesAmount = 40; 
			}; 
			class city_25 { 
				townName = 'Айос-Дионисиос'; 
				townPosition[] = {9187.95,15947.8,0}; 
				housesAmount = 46; 
			}; 
			class city_26 { 
				townName = 'Галати'; 
				townPosition[] = {10270.3,19036,0}; 
				housesAmount = 33; 
			}; 
			class city_27 { 
				townName = 'Зарос'; 
				townPosition[] = {9091.81,11961.9,0}; 
				housesAmount = 42; 
			}; 
			class city_28 { 
				townName = 'Сирта'; 
				townPosition[] = {8625.13,18301.6,0}; 
				housesAmount = 44; 
			}; 
			class city_29 { 
				townName = 'Абдера'; 
				townPosition[] = {9425.42,20284,0}; 
				housesAmount = 18; 
			}; 
			class city_30 { 
				townName = 'Тополия'; 
				townPosition[] = {7375.81,15429.5,0}; 
				housesAmount = 54; 
			}; 
			class city_31 { 
				townName = 'Панагия'; 
				townPosition[] = {20490.2,8907.12,0}; 
				housesAmount = 21; 
			}; 
			class city_32 { 
				townName = 'Коре'; 
				townPosition[] = {7062.42,16472.1,0}; 
				housesAmount = 40; 
			}; 
			class city_33 { 
				townName = 'Иоаннина'; 
				townPosition[] = {23199.7,19986.6,0}; 
				housesAmount = 27; 
			}; 
			class city_34 { 
				townName = 'Дельфинаки'; 
				townPosition[] = {23908.6,20144.7,0}; 
				housesAmount = 17; 
			}; 
			class city_35 { 
				townName = 'Ферес'; 
				townPosition[] = {21640.7,7583.93,0}; 
				housesAmount = 21; 
			}; 
			class city_36 { 
				townName = 'Селакано'; 
				townPosition[] = {20769.8,6736.46,0}; 
				housesAmount = 28; 
			}; 
			class city_37 { 
				townName = 'Негадес'; 
				townPosition[] = {4885.98,16171.3,0}; 
				housesAmount = 63; 
			}; 
			class city_38 { 
				townName = 'Панохори'; 
				townPosition[] = {5033.31,11245.2,0}; 
				housesAmount = 66; 
			}; 
			class city_39 { 
				townName = 'Айос-Константинос'; 
				townPosition[] = {3948.77,17277.8,0}; 
				housesAmount = 29; 
			}; 
			class city_40 { 
				townName = 'Аггелохори'; 
				townPosition[] = {3687.78,13776.1,0}; 
				housesAmount = 77; 
			}; 
			class city_41 { 
				townName = 'Нери'; 
				townPosition[] = {4116.11,11736.1,0}; 
				housesAmount = 77; 
			}; 
			class city_42 { 
				townName = 'София'; 
				townPosition[] = {25680.5,21365.1,0}; 
				housesAmount = 53; 
			}; 
			class city_43 { 
				townName = 'Ореокастро'; 
				townPosition[] = {4560.45,21460.6,0}; 
				housesAmount = 22; 
			}; 
			class city_44 { 
				townName = 'Молос'; 
				townPosition[] = {26943.9,23170.7,0}; 
				housesAmount = 48; 
			};
		};
	};
	class terror
	{
		life_terror_price = 7000; //сколько платим за выполненное задание
	};
	class dcleaner
	{
		life_dcleaner_price = 7000; //сколько платим за выполненное задание
		/*
		
		finalText = "";
		{
			_towns = nearestObjects [getpos _x, ["Land_i_Addon_02_V1_F","Land_Metal_Shed_F","Land_u_Addon_01_V1_F","Land_Slum_House03_F"], 1000];
			if (count _towns > 5) then {
		
				finalText = finalText + format ["
		\\class city_%1 {
		\\\townName = '%2';
		\\\townPosition[] = %3;
		\\\housesAmount = %4;
		\\};",_forEachIndex,text _x,format["{%1,%2,0}",(position _x)#0,(position _x)#1],str (count _towns)]
			};
		} foreach nearestLocations [[worldSize/2, worldSize/2], ["NameCity","NameVillage"], worldSize];
		finalText
		
		*/
		class dcleanerTowns {
			class city_0 { 
				townName = 'Антракия'; 
				townPosition[] = {16584.3,16104,0}; 
				housesAmount = 21; 
			}; 
			class city_1 { 
				townName = 'Телос'; 
				townPosition[] = {16207,17296.7,0}; 
				housesAmount = 17; 
			}; 
			class city_2 { 
				townName = 'Гравия'; 
				townPosition[] = {14479.8,17614.3,0}; 
				housesAmount = 40; 
			}; 
			class city_3 { 
				townName = 'Ставрос'; 
				townPosition[] = {12950.1,15041.6,0}; 
				housesAmount = 29; 
			}; 
			class city_4 { 
				townName = 'Харкия'; 
				townPosition[] = {18049.1,15264.1,0}; 
				housesAmount = 27; 
			}; 
			class city_5 { 
				townName = 'Неохори'; 
				townPosition[] = {12502,14337,0}; 
				housesAmount = 34; 
			}; 
			class city_6 { 
				townName = 'Лакка'; 
				townPosition[] = {12282,15732.3,0}; 
				housesAmount = 17; 
			}; 
			class city_7 { 
				townName = 'Родополи'; 
				townPosition[] = {18753.4,16597.1,0}; 
				housesAmount = 37; 
			}; 
			class city_8 { 
				townName = 'Калитея'; 
				townPosition[] = {17826.5,18129.4,0}; 
				housesAmount = 9; 
			}; 
			class city_9 { 
				townName = 'Каталаки'; 
				townPosition[] = {11701.1,13672.1,0}; 
				housesAmount = 50; 
			}; 
			class city_10 { 
				townName = 'Нифи'; 
				townPosition[] = {19473.3,15453.7,0}; 
				housesAmount = 8; 
			}; 
			class city_11 { 
				townName = 'Аликампос'; 
				townPosition[] = {11112.6,14573.7,0}; 
				housesAmount = 29; 
			}; 
			class city_12 { 
				townName = 'Дорида'; 
				townPosition[] = {19336.9,13252.3,0}; 
				housesAmount = 15; 
			}; 
			class city_13 { 
				townName = 'Айос-Петрос'; 
				townPosition[] = {19339.4,17641.6,0}; 
				housesAmount = 6; 
			}; 
			class city_14 { 
				townName = 'Корони'; 
				townPosition[] = {11786.7,18372.4,0}; 
				housesAmount = 6; 
			}; 
			class city_15 { 
				townName = 'Полиакко'; 
				townPosition[] = {10966.5,13435.3,0}; 
				housesAmount = 50; 
			}; 
			class city_16 { 
				townName = 'Ифестиона'; 
				townPosition[] = {12787,19679.3,0}; 
				housesAmount = 7; 
			}; 
			class city_18 { 
				townName = 'Орино'; 
				townPosition[] = {10410.4,17243.1,0}; 
				housesAmount = 11; 
			}; 
			class city_19 { 
				townName = 'Фрини'; 
				townPosition[] = {14612.5,20786.7,0}; 
				housesAmount = 10; 
			}; 
			class city_21 { 
				townName = 'Териса'; 
				townPosition[] = {10618.9,12237.3,0}; 
				housesAmount = 29; 
			}; 
			class city_22 { 
				townName = 'Парос'; 
				townPosition[] = {20885.4,16958.8,0}; 
				housesAmount = 81; 
			}; 
			class city_23 { 
				townName = 'Калохори'; 
				townPosition[] = {21351.6,16361.9,0}; 
				housesAmount = 69; 
			}; 
			class city_24 { 
				townName = 'Халкея'; 
				townPosition[] = {20194.6,11660.7,0}; 
				housesAmount = 10; 
			}; 
			class city_25 { 
				townName = 'Айос-Дионисиос'; 
				townPosition[] = {9187.95,15947.8,0}; 
				housesAmount = 46; 
			}; 
			class city_26 { 
				townName = 'Галати'; 
				townPosition[] = {10270.3,19036,0}; 
				housesAmount = 19; 
			}; 
			class city_27 { 
				townName = 'Зарос'; 
				townPosition[] = {9091.81,11961.9,0}; 
				housesAmount = 56; 
			}; 
			class city_28 { 
				townName = 'Сирта'; 
				townPosition[] = {8625.13,18301.6,0}; 
				housesAmount = 15; 
			}; 
			class city_29 { 
				townName = 'Абдера'; 
				townPosition[] = {9425.42,20284,0}; 
				housesAmount = 10; 
			}; 
			class city_30 { 
				townName = 'Тополия'; 
				townPosition[] = {7375.81,15429.5,0}; 
				housesAmount = 16; 
			}; 
			class city_31 { 
				townName = 'Панагия'; 
				townPosition[] = {20490.2,8907.12,0}; 
				housesAmount = 17; 
			}; 
			class city_32 { 
				townName = 'Коре'; 
				townPosition[] = {7062.42,16472.1,0}; 
				housesAmount = 23; 
			}; 
			class city_33 { 
				townName = 'Иоаннина'; 
				townPosition[] = {23199.7,19986.6,0}; 
				housesAmount = 14; 
			}; 
			class city_34 { 
				townName = 'Дельфинаки'; 
				townPosition[] = {23908.6,20144.7,0}; 
				housesAmount = 8; 
			}; 
			class city_35 { 
				townName = 'Ферес'; 
				townPosition[] = {21640.7,7583.93,0}; 
				housesAmount = 15; 
			}; 
			class city_36 { 
				townName = 'Селакано'; 
				townPosition[] = {20769.8,6736.46,0}; 
				housesAmount = 20; 
			}; 
			class city_37 { 
				townName = 'Негадес'; 
				townPosition[] = {4885.98,16171.3,0}; 
				housesAmount = 22; 
			}; 
			class city_38 { 
				townName = 'Панохори'; 
				townPosition[] = {5033.31,11245.2,0}; 
				housesAmount = 40; 
			}; 
			class city_39 { 
				townName = 'Айос-Константинос'; 
				townPosition[] = {3948.77,17277.8,0}; 
				housesAmount = 10; 
			}; 
			class city_40 { 
				townName = 'Аггелохори'; 
				townPosition[] = {3687.78,13776.1,0}; 
				housesAmount = 118; 
			}; 
			class city_41 { 
				townName = 'Нери'; 
				townPosition[] = {4116.11,11736.1,0}; 
				housesAmount = 44; 
			}; 
			class city_42 { 
				townName = 'София'; 
				townPosition[] = {25680.5,21365.1,0}; 
				housesAmount = 41; 
			}; 
			class city_43 { 
				townName = 'Ореокастро'; 
				townPosition[] = {4560.45,21460.6,0}; 
				housesAmount = 9; 
			}; 
			class city_44 { 
				townName = 'Молос'; 
				townPosition[] = {26943.9,23170.7,0}; 
				housesAmount = 40; 
			};
		};
	};
};