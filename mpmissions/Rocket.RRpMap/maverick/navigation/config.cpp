/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

// Configuration file for the navigation script

class maverick_navigation_cfg {

	class bindings {
		keyCode		= 49; // Keycodes can be found at https://community.bistudio.com/wiki/DIK_KeyCodes
		reqShift	= 0;
		reqAlt		= 0;
		reqCtrl		= 1;
	};

	option_list[] = {
		{"Текущий маршрут", "\rimas_gui\data\nav\data\currentroute.paa", "!isNil 'mav_gps_v_markers'", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationCurrent';"},
		{"Новый маршрут", "\rimas_gui\data\nav\data\newroute.paa", "isNil 'mav_gps_v_markers'", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationNew';"},
		{"Сохраненные маршруты", "\rimas_gui\data\nav\data\savedroutes.paa", "true", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationSaved';"},
		{"GPS Настройки", "\rimas_gui\data\nav\data\mapsettings.paa", "true", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationSettings';"},
		{"GPS Помощь", "\rimas_gui\data\nav\data\help.paa", "false", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationHelp';"}
	};

	class presets {
		class RRpMap {
			presetLocations[] = {

			};
		};
		class Malden {
			presetLocations[] = {

			};
		};
		class Stratis {
			presetLocations[] = {

			};
		};
		class Tanoa {
			presetLocations[] = {

			};
		};
	};

	class localization {

		// Display messages from around the navigation system
		msgStartPosInvalid = 		"Начальная позиция недействительна.";
		msgEndPosInvalid = 			"Конечная позиция недействительна.";
		msgCheckpointInvalid = 		"Позиция контрольной точки недействительна.";
		msgNoRoadsegmentFound = 	"Не удалось найти жлемент дороги в %1 метрах от позиции %2, прервано...";
		msgAbortCurrentRoute = 		"Вам необходимо завершить свой текущий маршрут, чтобы получить доступ к этой функции!";
		msgSettingsSaved = 			"Настройки навигации успешно сохранены!";
		msgPositionReset = 			"Положение GPS GUI успешно сброшено!";
		msgCalcRoadDirs = 			"Расчет дорожных направлений";
		msgCalcRoadDirsProgress = 	"Расчет дорожных направлений (%1/%2)";
		msgOneMinute = 				"&lt; 1 мин";
		msgSmallerThanMinute = 		"< 1 мин";
		msgMinutesLeft = 			"%1 мин";
		msgReachDestination = 		"Вы достигнете своего пункта назначения в %1";
		msgFollowThenTurnLeft = 	"Следуйте по дороге %1, затем, поверните налево";
		msgFollowThenTurnRight = 	"Следуйте по дороге %1, затем, повернуть направо";
		msgArrivedFormatted = 		"<t align='center'>ПРИБЫЛ!</t>";
		msgReachedDestination = 	"Вы достигли своего пункта назначения";
		msgNoRoadsFound = 			"Дороги не найдены";
		msgInvalidRoadSegment = 	"На этой дороге нет маршрута";
		msgCurrentLocation = 		"Текущее местоположение";
		msgStart = 					"Начало";
		msgCheckpoint = 			"Средняя точка";
		msgDestination = 			"Дистанция";
		msgPressSpace = 			"Нажмите [SPACE] что-бы сохранить GUI позицию";
		msgGpsPosSaved = 			"GPS GUI позиция успешно сохранена!";
		msgNoRouteFound = 			"Маршрут не найден";
		msgTimedOut = 				"Подождите... Попробуйте еще раз!";
		msgRouteFound = 			"Найден маршрут";
		msgRouteInfo = 				"Информация о маршруте";
		msgFrom = 					"Из";
		msgTo = 					"К";
		msgTotalDistance = 			"Общее расстояние";
		msgTotalravelTime = 		"Общее время";
		msgRoadPreference = 		"Лучшая дорога";
		msgRouteCalculate = 		"Маршрут рассчитывается...";
		msgCancelConfirm = 			"Вы действительно хотите отменить свой текущий маршрут?";
		msgCancelRoute = 			"Отменить маршрут";
		msgCancel = 				"Отмена";
		msgProceed = 				"Продолжить";
		msgNoRouteNameGiven = 		"Нет имени маршрута.";
		msgRouteNameLimit = 		"Название превышает лимит в 30 с";
		msgIllegalChars = 			"Название маршрута содержит ограниченные символы!";
		msgRouteLimit = 			"Вы достигли предела сохраненных маршрутов! Вам нужно будет удалить маршрут.";
		msgRouteSaved = 			"Маршрут успешно сохранен!";
		msgRouteDeleted = 			"Маршрут успешно удален!";
		msgFinishRouteFirst = 		"Вам нужно либо закончить свой текущий маршрут, либо отменить его!";
		msgNoSavedRoutes = 			"Нет сохраненных маршрутов...";
		msgTurnNow =				"Поверните сейчас";

		// Localization for the dialogs
		#define dialogMainMenu 		"Навигатор - Меню"
		#define dialogClose 		"Закрыть"
		#define dialogCurrentRoute 	"Навигатор - Текущий маршрут"
		#define dialogResetRoute 	"Отменить маршрут"
		#define dialogRecalculate	"Пересчитать маршрут"
		#define dialogNewRoute 		"Навигатор - новый маршрут"
		#define dialogCalcRoute		"Расчет маршрута"
		#define dialogBack 			"Назад"
		#define dialogStart 		"Начало"
		#define dialogLoad 			"Нагрузка"
		#define dialogCheckpoint 	"Средняя точка"
		#define dialogDestination 	"Дистанция"
		#define dialogCommonDest	"Общие целевые точки"
		#define dialogSavedRouts	"Сохраненные маршруты"
		#define dialogMenuSettings	"Навигатор - Настройки"
		#define dialogSave			"Сохранить"
		#define dialogUnitSpeed		"Единица скорости"
		#define dialogPreference	"Предпочтительный путь"
		#define dialogGpsPos		"GPS GUI Позиция"
		#define dialogCustomize		"Настроить"
		#define dialogReset			"Заново"
		#define dialogGpsColor		"GPS Цвет"
		#define dialogDragHere		"Здесь"
		#define dialogSavedTitle	"Навигатор - Сохраненные маршруты"
		#define dialogDelete		"Удалить"
		#define dialogCalcProgress	"<t size='1.2' align='center'>Маршрут рассчитывается...</t>"
		#define dialogNavigation	"Навигация"
		#define dialogSaveRoute		"Навигатор - Сохранить Маршрут"
		#define dialogRouteName		"Введите название маршрута"
		#define dialogCalculating	"Расчет..."
		#define dialogRouteInfo		"Информация о маршруте"
		#define dialogRouteMapPrev	"Предварительный просмотр маршрута"
		#define dialogVoiceSetting	"Голосовой анонс"
		#define dialogCalculationH	"Навигатор - Расчет маршрута"
	};

	/*
		You should only add / remove / edit any of these parameters if you were advised to do so by Maverick Applications
		Unauthorized Changes can lead to a complete failure of the navigation system!
	*/
	class AlgorithmParameters {

		class Chernarus_Summer {
			greedy = 3.2;
		};

		class australia {
			greedy = 3.2;
		};

		class Malden {
			radius = 45;
		};

		class Sara {
			radius = 66;
		};
	};

	// Do not touch below
	#include "sounds\voicepacks\config.cpp"
};

//Do not touch below
#include "gui\gps_gui_master.cpp"