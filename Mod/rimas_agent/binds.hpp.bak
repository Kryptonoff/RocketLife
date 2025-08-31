
enum MouseButtons
{
	MOUSE_BUTTONS_LEFT		= 0,
	MOUSE_BUTTONS_RIGHT		= 1,
	MOUSE_BUTTONS_MIDDLE	= 2,
	MOUSE_BUTTONS_CUSTOM_1	= 3,
	MOUSE_BUTTONS_CUSTOM_2	= 4,
	MOUSE_BUTTONS_CUSTOM_3	= 5,
	MOUSE_BUTTONS_CUSTOM_4	= 6,
	MOUSE_BUTTONS_CUSTOM_5	= 7,
};

#define INPUT_DOUBLE_TAP_OFFSET     0x100
#define MOUSE_CLICK_OFFSET          0x80

class AbstractButton
{
    displayName = "";
    tooltip = "";
    onActivate = "";		// _this is always true
    onDeactivate = "";	// _this is always false
    onAnalog = "_this";	// _this is the scalar analog value
    analogChangeThreshold = 0.01;			// minimum change required to trigger onAnalog EH, default 0.01
};

class CfgUserActions
{
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
#include "\a3\3den\ui\dikcodes.inc"

class CfgDefaultKeysPresets
{
	class Arma2 
	{
        class Mappings 
		{
			PullFlags[] = { {DIK_LSHIFT, DIK_J} };
            Jump[] = { DIK_SPACE };
			WinAction[] = { DIK_LWIN };
			EmsBeacon[] = { {DIK_LSHIFT, DIK_F} };
			HideWeapon[] = { {DIK_LSHIFT, DIK_H} };
			PlaceItems[] = { {DIK_LSHIFT,DIK_NUMPAD8} };
			Restrain[] = { {DIK_LSHIFT,DIK_R} };
			Knockout[] = { {DIK_LSHIFT, DIK_G} };
			Trunk[] = { DIK_T };
			Radar[] = { DIK_L };
			Tablet[] = { DIK_Y };
			Siren[] = {{DIK_LSHIFT, DIK_F}};
			OpenDoors[] = { DIK_U };
			RRP_Surrender[] = {{ DIK_LSHIFT, DIK_V }};
			DanceMenu[] = {{DIK_LCONTROL, DIK_LWIN}};
			WarZone[] = {{DIK_LSHIFT, DIK_NUMPAD5}};
			TargetMenu[] = {{DIK_LSHIFT, DIK_NUMPAD7}};
			VolumeUp[] = {{DIK_LSHIFT, DIK_HOME}};
			VolumeDown[] = {{DIK_LSHIFT, DIK_END}};
			Phone[] = {{DIK_LSHIFT, DIK_P}};
			Phone911[] = {{DIK_LSHIFT, DIK_O}};
			PingMarker[] = {{DIK_LSHIFT,DIK_T}};
			Beginers[] = {DIK_INSERT};
		};
	};
};

class UserActionGroups 
{ 
	class RocketSections
	{ 
		name = "Rocket Настройки" ;  // отображаемое имя вашей 
		group[] = { 
			"Beginers",
			"PingMarker",
			"WinAction",
			"PullFlags",
			"Jump",
			"EmsBeacon",
			"HideWeapon",
			"PlaceItems",
			"Restrain",
			"Knockout",
			"Trunk",
			"Radar",
			"Tablet",
			"Siren",
			"OpenDoors",
			"RRP_Surrender",
			"DanceMenu",
			"WarZone",
			"TargetMenu",
			"VolumeUp",
			"VolumeDown",
			"Phone",
			"Phone911"
		}; 
	};	
};
