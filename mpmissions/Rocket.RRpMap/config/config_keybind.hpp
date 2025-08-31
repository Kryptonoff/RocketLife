#include "\a3\3den\ui\dikcodes.inc"

class AbstractButton
{
	displayName = "";
	tooltip = "";
	onActivate = "";
	onDeactivate = "";
	button = 0x0;
	reqShift = 0;
	reqAlt = 0;
	reqCtrl = 0;
};

class CfgKeyBinds
{
	class General
	{
		displayName = "Основные";
		class WinAction: AbstractButton
		{
			displayName = "Взаимодействие";
			tooltip = "Взаимодействие с объектами";
			onActivate = "(['WinAction',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['WinAction',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class PullFlags: AbstractButton
		{
			displayName = "Флаг";
			tooltip = "Достать флаг организации";
			onActivate = "(['PullFlags',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['PullFlags',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Jump: AbstractButton
		{
			displayName = "Прыжок";
			tooltip = "";
			onActivate = "(['Jump',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Jump',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class EmsBeacon: AbstractButton
		{
			displayName = "EMS Маячки";
			tooltip = "Может быть недоступен определенной категории игроков";
			onActivate = "(['EMS_beacons',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['EMS_beacons',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class HideWeapon: AbstractButton
		{
			displayName = "Спрятать/Достать оружие";
			tooltip = "";
			onActivate = "(['HideWeapon',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['HideWeapon',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class PlaceItems: AbstractButton
		{
			displayName = "Список объектов";
			tooltip = "Может быть недоступен определенной категории игроков";
			onActivate = "(['PlaceItems',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['PlaceItems',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Restrain: AbstractButton
		{
			displayName = "Связать";
			tooltip = "";
			onActivate = "(['Restrain',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Restrain',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Knockout: AbstractButton
		{
			displayName = "Отправить в нокаут";
			tooltip = "";
			onActivate = "(['Knockout',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Knockout',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Trunk: AbstractButton
		{
			displayName = "Инвентарь ресурсов";
			tooltip = "";
			onActivate = "(['Trunk',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Trunk',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Radar: AbstractButton
		{
			displayName = "Радар";
			tooltip = "Только для полиции";
			onActivate = "(['Radar',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Radar',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Tablet: AbstractButton
		{
			displayName = "Планшет";
			tooltip = "";
			onActivate = "(['Tablet',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Tablet',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Siren: AbstractButton
		{
			displayName = "Сирена";
			tooltip = "Может быть недоступен определенной категории игроков";
			onActivate = "(['Siren',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Siren',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class OpenDoors
		{
			displayName = "Открыть/Закрыть замок";
			tooltip = "Используется для закрытия/открытия замков автомобиля или дверей дома и прочего";
			onActivate = "(['OpenDoors',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['OpenDoors',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class RRP_Surrender
		{
			displayName = "Поднять/Опустить руки";
			tooltip = "";
			onActivate = "(['Surrender',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Surrender',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class DanceMenu
		{
			displayName = "Меню танцев";
			tooltip = "";
			onActivate = "(['DanceMenu',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['DanceMenu',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class WarZone
		{
			displayName = "Установка Военного положения";
			tooltip = "Может быть недоступен определенной категории игроков";
			onActivate = "(['WarZone',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['WarZone',false] call RRPClient_evh_keybinds)";	// _this is always false
		};	
		class TargetMenu
		{
			displayName = "Сообщение цели";
			tooltip = "Доступно только для полиции";
			onActivate = "(['TargetMenu',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['TargetMenu',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class VolumeUp
		{
			displayName = "Повысить громкость";
			tooltip = "";
			onActivate = "(['VolumeUp',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['VolumeUp',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class VolumeDown
		{
			displayName = "Понизить громкость";
			tooltip = "";
			onActivate = "(['VolumeDown',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['VolumeDown',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Phone
		{
			displayName = "Телефон";
			tooltip = "";
			onActivate = "(['Phone',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Phone',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Phone911
		{
			displayName = "Экстренные вызовы";
			tooltip = "";
			onActivate = "(['Phone911',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Phone911',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class PingMarker
		{
			displayName = "Пинг маркер";
			tooltip = "Используеться только вместе с 'Тусовкой'";
			onActivate = "(['PingMarker',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['PingMarker',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
		class Beginers: AbstractButton
		{
			displayName = "Меню новичка";
			tooltip = "Меню новичков";
			onActivate = "(['Beginner',true] call RRPClient_evh_keybinds)";		// _this is always true
			onDeactivate = "(['Beginner',false] call RRPClient_evh_keybinds)";	// _this is always false
		};
	};
	class Animations
	{
		displayName = "Анимации";
		class CRPTHSHold: AbstractButton
		{
			displayName = "Дай пять!";
			tooltip = "";
			onActivate = "(['CRPTHSHold',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['CRPTHSHold',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
		class CRPTHSForward: AbstractButton
		{
			displayName = "Помахать рукой вперед";
			tooltip = "";
			onActivate = "(['CRPTHSForward',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['CRPTHSForward',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
		class CRPTHSWarning: AbstractButton
		{
			displayName = "Помахать рукой";
			tooltip = "";
			onActivate = "(['CRPTHSWarning',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['CRPTHSWarning',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
		class CRPTHSPoint: AbstractButton
		{
			displayName = "Показать пальцем";
			tooltip = "";
			onActivate = "(['CRPTHSPoint',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['CRPTHSPoint',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
		class cl3_yes: AbstractButton
		{
			displayName = "Да!";
			tooltip = "";
			onActivate = "(['cl3_yes',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['cl3_yes',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
		class cl3_no_way: AbstractButton
		{
			displayName = "Нет!";
			tooltip = "";
			onActivate = "(['cl3_no_way',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['cl3_no_way',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
		class cl3_thumbs_up: AbstractButton
		{
			displayName = "Палец вверх";
			tooltip = "";
			onActivate = "(['cl3_thumbs_up',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['cl3_thumbs_up',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
		class cl3_thumbs_down: AbstractButton
		{
			displayName = "Палец вниз";
			tooltip = "";
			onActivate = "(['cl3_thumbs_down',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['cl3_thumbs_down',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
		class cl3_clapping: AbstractButton
		{
			displayName = "Хлопать в ладоши";
			tooltip = "";
			onActivate = "(['cl3_clapping',true] call RRPClient_evh_keybindsAnims)";		// _this is always true
			onDeactivate = "(['cl3_clapping',false] call RRPClient_evh_keybindsAnims)";	// _this is always false
		};
	};
};