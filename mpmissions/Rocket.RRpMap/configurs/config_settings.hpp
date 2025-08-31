class CfgSettings
{
	class General
	{
		displayName = "Общие";
		class StreamerMode
		{
			displayName = "Режим стримера";
			tooltip = "БETA версия! Отключает все эффекты, которые могут быть неприятны для зрителей";
			type = "TOGGLE";
			onAction = "['stream',_checked] call RRPClient_system_settingsSwitch";
			actionToggle = "stream";
			defaultValue = 0;
		};
		class Passport
		{
			displayName = "Паспорт";
			tooltip = "Паспорт который вы показываете другим игрокам";
			type = "SLIDE";
			onAction = "['selectPassports',1] call RRPClient_tablet_slide";
		};
		class Title
		{
			displayName = "Титул";
			type = "DROPDOWN";
			fillFunction = "call RRPClient_system_listTags";
			onAction = "['updateTitle',_this#0,_this#1] call RRPClient_ptags_onLBchangeTag";
		};
		class Icon
		{
			displayName = "Иконка";
			type = "DROPDOWN";
			fillFunction = "call RRPClient_system_listIcons";
			onAction = "['updateIcons',_this#0,_this#1] call RRPClient_ptags_onLBchangeTag";
			defaultValue = 0;
		};
		class EnableSaveHotKey
		{
			displayName = "Сохранение горячих клавиш";
			tooltip = "Сохранять настройки горячих клавиш после перезахода";
			type = "TOGGLE";
			actionToggle = "SaveBinds";
			onAction = "['SaveBinds',_checked] call RRPClient_system_settingsSwitch";
			defaultValue = 0;
		};
	};
	class Distance
	{
		displayName = "Прорисовка";
		class Foot
		{
			displayName = "Игрок";
			tooltip = "Видимость игрока";
			type = "SLIDER";
			values[]= { { 100, 2000 }, 1000, { 50,50,100 } };
			var = "viewDistanceFoot";
			onAction = "[0,_this#0,_this#1] call RRPClient_system_s_onSliderChange;";
		};
		class Vehicle
		{
			displayName = "Авто";
			tooltip = "Видимость транспорта";
			type = "SLIDER";
			values[]= { { 100, 2000 }, 1000, { 50,50,100 } };
			var = "viewDistanceCar";
			onAction = "[1,_this#0,_this#1] call RRPClient_system_s_onSliderChange;";
		};
		class Air
		{
			displayName = "Авиа";
			tooltip = "Видимость воздушного транспорта";
			type = "SLIDER";
			values[]= { { 100, 5000 }, 2000, { 50,50,100 } };
			var = "viewDistanceAir";
			onAction = "[2,_this#0,_this#1] call RRPClient_system_s_onSliderChange;";
		};
		class EnableGrass
		{
			displayName = "Трава";
			tooltip = "Включает/выключает траву";
			type = "TOGGLE";
			onAction = "['grass',_checked] call RRPClient_system_settingsSwitch";
		};
	};
	class HUD
	{
		displayName = "Интерфейс";
		class PlayerTags
		{
			displayName = "Имена игроков";
			tooltip = "Включает/выключает отображение имен игроков";
			type = "TOGGLE";
			actionToggle = "tags";
			onAction = "['tags',_checked] call RRPClient_system_settingsSwitch";
		};
		class EnableHUD
		{
			displayName = "Интерфейс";
			tooltip = "Включает/выключает интерфейс";
			type = "TOGGLE";
			actionToggle = "HUD";
			onAction = "['HUD',_checked] call RRPClient_system_settingsSwitch";
		};
		class EnableCaseTimer
		{
			displayName = "Таймер получения кейса";
			tooltip = "Включает/выключает таймер";
			type = "TOGGLE";
			actionToggle = "ShowCaseTimer";
			onAction = "['ShowCaseTimer',_checked] call RRPClient_system_settingsSwitch";
		};
		class EnableHotKeys
		{
			displayName = "Горячие клавиши";
			tooltip = "Включает/выключает отображение горячих клавиш";
			type = "TOGGLE";
			actionToggle = "ShowHotkeys";
			onAction = "['ShowHotkeys',_checked] call RRPClient_system_settingsSwitch";
		};
	};
	class Tablet
	{
		displayName = "Планшет";
		class EnableWelcome
		{
			displayName = "Приветственный экран";
			tooltip = "Включить/выключить приветственный экран при первом включении";
			type = "TOGGLE";
			actionToggle = "WelcomeScreen";
			onAction = "['WelcomeScreen',_checked] call RRPClient_system_settingsSwitch";
		};
		class SaveApp
		{
			displayName = "Запоминать приложение";
			tooltip = "Запомнить какое приложение было открытым последним при следующем включении";
			type = "TOGGLE";
			actionToggle = "OpenApp";
			onAction = "['OpenApp',_checked] call RRPClient_system_settingsSwitch";
		};
		class SelectWallpaper
		{
			displayName = "Обои";
			tooltip = "Выбрать фоновые обои для планшета";
			type = "SLIDE";
			onAction = "['selectWallpaper',1] call RRPClient_tablet_slide";
		};
	};
	class Sounds
	{
		displayName = "Звуки";
		class Music
		{
			displayName = "Музыка";
			tooltip = "Включает/выключает фоновую музыку";
			type = "TOGGLE";
			actionToggle = "music";
			onAction = "['music',_checked] call RRPClient_system_settingsSwitch";
		};
		class Ambient
		{
			displayName = "Звуки окружения";
			tooltip = "Включает/выключает звуки окружающей среды";
			type = "TOGGLE";
			actionToggle = "sound";
			onAction = "['sound',_checked] call RRPClient_system_settingsSwitch";
		};
	};
};