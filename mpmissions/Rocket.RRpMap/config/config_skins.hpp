/*

	class default - должен быть всегда!

*/

class LifeCfgPadSkins
{
	class default {
		title = "Черный (Porsche)";
		image = "\rimas_pad\pad_skins\phone_bg2.paa";
		conditions = "";
	};
	class skin1 {
		title = "Черный";
		image = "\rimas_pad\pad_skins\phone_bg1.paa";
		conditions = "";
	};
	class skin2 {
		title = "Серебрянный";
		image = "\rimas_pad\pad_skins\phone_bg3.paa";
		conditions = "";
	};
	class skin3 {
		title = "Серебрянный (Горы)";
		image = "\rimas_pad\pad_skins\phone_bg4.paa";
		conditions = "";
	};
	class skin4 {
		title = "Золотой";
		image = "\rimas_pad\pad_skins\phone_bg5.paa";
		conditions = "";
	};
	class skin5 {
		title = "Золотой+";
		image = "\rimas_pad\pad_skins\phone_bg6.paa";
		conditions = "";
	};
	class skin6 {
		title = "Азимов";
		image = "\rimas_pad\pad_skins\phone_bg7.paa";
		conditions = "";
	};
	class space {
		title = "Азимов (Вертолет)";
		image = "\rimas_pad\pad_skins\phone_bg8.paa";
		conditions = "";
	};
	class crystal {
		title = "Хаки";
		image = "\rimas_pad\pad_skins\phone_bg9.paa";
		conditions = "";
	};
	class stickbomb {
		title = "Хаки (Лес)";
		image = "\rimas_pad\pad_skins\phone_bg10.paa";
		conditions = "";
	};
	class sexy {
		title = "My Little Pony";
		image = "\rimas_pad\pad_skins\phone_bg11.paa";
		conditions = "";
	};
	class crysis {
		title = "My Little Pony (Rainbow)";
		image = "\rimas_pad\pad_skins\phone_bg12.paa";
		conditions = "";
	};
};

class LifeCfgPadIcons {
	class ButtonPhone {
		tooltip = "Телефон";
		image = "\rimas_pad\pad_icons\ico_bg_phone.paa";
		action = "closeDialog 0; [0] spawn RRPClient_system_OpenPhone";
		conditions = "true";
	};

	class ButtonHeal {
		tooltip = "Лечение";
		image = "\rimas_pad\pad_icons\ico_bg_health.paa";
		action = "closeDialog 0; [] spawn RRPClient_system_healMenu";
		conditions = "true";
	};

	class ButtonGang {
		tooltip = "Организация";
		image = "\rimas_agent\assets\tab_icons\ico_AC_org.paa";
		action = "closeDialog 0; [] spawn RRPClient_groups_openManage";
		conditions = "!(RRPClientGroupInfo isEqualTo [])";
	};

	class ButtonParty {
		tooltip = "Тусовка";
		image = "\rimas_agent\assets\tab_icons\ico_AC_party.paa";
		conditions = "";
		action = "closeDialog 0; [] spawn RRPClient_party_hostMenu";
	};
	class documents {
		action = "closeDialog 0; call Client_documents_viewMenu";
		tooltip = "Документы";
		image = "\rimas_pad\pad_icons\ico_bg_documentation.paa";
		conditions = "true";
	};
	class ButtonBusiness
	{
		tooltip = "Бизнес";
		image = "\rimas_pad\pad_icons\ico_bg_business.paa";
		action = "closeDialog 0; if (RRPClientLTDsData isEqualTo []) then {[] spawn RRPClient_ltd_regMenu} else {[] spawn RRPClient_ltd_mainMenu}";

		//action = "closeDialog 0; if (RRPClientLTDsData isEqualTo []) then {['register','openMenu'] spawn RRPClient_ltds_ltd_actions} else {createDialog 'RRPDialogBusiness'}";
		conditions = "player call getSide in ['civ','med']";
	};

	class ButtonKeys
	{
		tooltip = "Ключи";
		image = "\rimas_pad\pad_icons\ico_bg_keys.paa";
		action = "closeDialog 0; createDialog ""UnionDialogKeyManagement""";
		conditions = "true";
	};

	class ButtonCraft
	{
		tooltip = "Крафт";
		image = "\rimas_pad\pad_icons\ico_bg_craft.paa";
		action = "closeDialog 0; call RRPClient_crafting_openMenu";
		conditions = "true";
	};

	class ButtonMedic
	{
		tooltip = "Меню медика";
		image = "\rimas_pad\pad_icons\ico_bg_calls.paa";
		action = "closeDialog 0; [] spawn RRPClient_system_medicMenuRequest";
		conditions = "player call getSide == 'med'";
	};

	class ButtonGov
	{
		tooltip = "Приемная Губернатора";
		image = "\rimas_pad\pad_icons\ico_bg_senate.paa";
		action = "closeDialog 0; call RRPClient_economy_openMenu";
		conditions = "true";
	};

	class ButtonSettings
	{
		tooltip = "Настройки";
		image = "\rimas_pad\pad_icons\ico_bg_settings.paa";
		action = "closeDialog 0; [] spawn RRPClient_system_settingsMenu";
		conditions = "true";
	};

	class ButtonHouseMenu
	{
		tooltip = "Управления домами";
		image = "\rimas_pad\pad_icons\ico_bg_home.paa";
		action = "closeDialog 0; call RRPClient_houses_onOpenMenu";
		conditions = "true";
	};

	class ButtonAdmin
	{
		tooltip = "Меню админ";
		image = "\rimas_pad\pad_icons\ico_bg_admin.paa";
		action = "closeDialog 0; [] spawn RRPClient_admin_Menu";
		conditions = "(call life_adminlevel) > 1";
	};

	class skills {
		tooltip = "Карьера";
		image = "\rimas_pad\pad_icons\ico_bg_career.paa";
		action = "closeDialog 0; call RRPClient_skills_openMenu";
		conditions = "true";
	};

	class taxi
	{
		tooltip = "Служба такси";
		image = "\rimas_pad\pad_icons\ico_Taxi.paa";
		action = "closeDialog 0; createDialog 'RscDisplayTaxiMenu'";
		conditions = "true";
	};

	class navigator
	{
		tooltip = "Навигатор";
		image = "\rimas_pad\pad_icons\ico_NAVI.paa";
		action = "closeDialog 0; call mav_gps_fnc_initNavigation";
		conditions = "true";
	};
	class achievments
	{
		tooltip = "Достижения";
		image = "\rimas_pad\pad_icons\ico_AC_M.paa";
		action = "closeDialog 0; call RRPClient_ach_openMenu";
		conditions = "true";
	};
	class Dispach_west
	{
		tooltip = "Диспечерская";
		image = "\rimas_pad\pad_icons\ico_bg_police-calls.paa";
		action = "closeDialog 0; [] spawn RRPClient_dispatch_openCallsManagementMenu;";
		conditions = "player call getSide in ['cop','med']";
	};
};
