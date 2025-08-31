class AbstractTab
{
	controlID = -1;
	resource = ""; // Указать название слайда, обязательно!
	action = ""; // Если параметр пуст, то по дефолту будет вызываться слайдер
	name = "Главная";
	condition = "false";	
	icon = "";
};

class CfgMainMenu
{
    font = "";
    fontLight = "";
    fontMedium = "";
    fontBold = "";
    fontItalic = "";
    ignoreSlide[] = {"party_manage", "caseOpen", "dispatch"}; // эти слайды не открываются после открытия планшета
	class Tabs
	{
		// MainMenu не трогать НИКОГДА!
		class MainMenu: AbstractTab
		{
			controlID = 25100;
			name = "Главная";
			condition = "true";
			resource = "MainMenu";
		};
		class messager: AbstractTab
		{
			controlID = 26000;
			name = "Мессенджер";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\messages.paa";
			resource = "MessagerSlide";
		};
		class health: AbstractTab
		{
			controlID = 27000;
			name = "Здоровье";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\health.paa";
			resource = "HealthSlide";
		};
		class achievment: AbstractTab
		{
			controlID = 28000;
			Name = "Достижения";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\achievments.paa";
			resource = "AchievmentSlide";
		};
		class skills: AbstractTab
		{
			controlID = 29000;
			Name = "Карьера";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\career.paa";
			resource = "SkillSlide";
		};
		class keys: AbstractTab
		{
			controlID = 30000;
			Name = "Ключи";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\keys.paa";
			resource = "KeysSlide";
		};
		class documents: AbstractTab
		{
			controlID = 31000;
			Name = "Документы";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\documents.paa";
			resource = "DocumentsSlide";
		};
		class economy: AbstractTab
		{
			controlID = 32000;
			Name = "Экономика";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\stock.paa";
			resource = "EconomySlide";
		};
        /*
		class eco: AbstractTab
		{
			controlID = 17000;
			Name = "Новая Экономика";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\stock.paa";
			resource = "BourseSlide";
		};
        */
		class craft: AbstractTab
		{
			controlID = 33000;
			Name = "Крафтинг";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\craft.paa";
			resource = "CraftSlide";
		};
		class medic: AbstractTab
		{
			controlID = 34000;
			Name = "Медик";
			condition = "player call getSide == 'med'";
			icon = "\rimas_agent\assets\tablet\apps\ems.paa";
			resource = "MedicSlide";
		};
		// class settings: AbstractTab
		// {
		// 	controlID = 35000;
		// 	Name = "Параметры";
		// 	condition = "true";
		// 	icon = "\rimas_agent\assets\tablet\apps\settings.paa";
		// 	resource = "SettingsSlide";
		// };
		class settings: AbstractTab
		{
			controlID = 35500;
			Name = "Параметры";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\settings.paa";
			resource = "SettingsSlide";
		};
        class selectWallpaper: AbstractTab
        {
            controlID = 35100;
            Name = "Обои";
            condition = "false";
            resource = "WallpapersSlide";
        };
        class selectPassports: AbstractTab
        {
            controlID = 35400;
            Name = "Паспорта";
            condition = "false";
            resource = "PassportsSlide";
        };
		class party_manage: AbstractTab
		{
			controlID = 36000;
			Name = "Тусовка";
			icon = "\rimas_agent\assets\tablet\apps\party.paa";
			condition = "false";
			action = "";
			resource = "PartyManageSlide";
		};
		class party_create: AbstractTab
		{
			controlID = 36300;
			Name = "Тусовка";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\party.paa";
			action = "call RRPClient_party_openSlide";
			resource = "PartyCreateSlide";
		};
		class groups: AbstractTab
		{
			controlID = 37000;
			Name = "Организация";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\groups.paa";
			action = "call RRPClient_groups_openSlide";
			resource = "GroupsSlide";
		};
        class group_create: AbstractTab
        {
            controlID = 37500;
            Name = "Регистратор";
            condition = "false";
            resource = "GroupCreateSlide";
        };
		class bug: AbstractTab
		{
			controlID = 23000;
			Name = "Sentry";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\sentry.paa";
			resource = "BugSlide";
		};
		class house: AbstractTab
		{
			controlID = 22000;
			Name = "Мой Дом";
			condition = "true";
			action = "call RRPClient_houses_onOpenMenu";
			icon = "\rimas_agent\assets\tablet\apps\house.paa";
			resource = "HouseSlide";
		};
        class dispatch: AbstractTab
        {
            controlID = 19000;
            Name = "Диспетчер";
            condition = "player call getSide in ['cop','med']";
			icon = "\rimas_agent\assets\tablet\apps\dispatch.paa";
			resource = "DispatchSlide";
        };
        class notes: AbstractTab
        {
            controlID = 18000;
            Name = "Заметки";
            condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\notes.paa";
			resource = "NotesSlide";
        };
        class notesEditor: notes
        {
            controlID = 18100;
            Name = "Редактор заметки";
            condition = "false";
            resource = "NotesSlideEditor";
        };
		class ltds: AbstractTab
		{
			controlID = 38000;
			Name = "Бизнес";
			condition = "false";
			action = "call RRPClient_ltds_openManage";
			icon = "\rimas_agent\assets\tablet\apps\business.paa";
			resource = "LtdSlide";
		};
        class caseStore: AbstractTab
        {
            controlID = 39000;
            Name = "Кейсы";
            condition = "true";
            icon = "\rimas_agent\assets\tablet\apps\case.paa";
            resource = "CaseStoreSlide";
        };
        class myCase: AbstractTab
        {
            controlID = 39100;
            Name = "Мои кейсы";
            condition = "false";
            resource = "MyCaseSlide";
        };
        class caseOpen: AbstractTab
        {
            controlID = 39200;
            Name = "Кейс";
            condition = "false";
            resource = "OpenCaseSlide";
        };
        class caseFaq: AbstractTab
        {
            controlID = 39300;
            Name = "F.A.Q.";
            condition = "false";
            resource = "FAQCaseSlide";
        };
		class carsharing: AbstractTab
		{
			controlID = 21000;
			Name = "BikeNow";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\bike_now.paa";
			resource = "Car2GoSlide";
		};
        class communitygoals: AbstractTab
        {
            controlID = 19000;
            Name = "SmartTenders";
            condition = "true";
            icon = "\rimas_agent\assets\tablet\apps\smartTender.paa";
            resource = "CommunityGoals";
        };
        class trx: AbstractTab
        {
            controlID = 40000;
            Name = "TRX Store";
            condition = "true";
            icon = "\rimas_agent\assets\tablet\apps\trx.paa";
            resource = "TrxSlide";
        };
        class trx_faq: AbstractTab
        {
            controlID = 41000;
            Name = "F.A.Q.";
            condition = "false";
            resource = "TrxFaqSlide";
        };
        class perksUp: AbstractTab
        {
            controlID = 42000;
            icon = "\rimas_agent\assets\tablet\apps\perks.paa";
            Name = "PerksUP";
            condition = "true";
            resource = "PerksGroup";
        };
		/*class wiki: AbstractTab
		{
			controlID = 20000;
			Name = "Rimas Wiki";
			condition = "true";
			icon = "\rimas_agent\assets\tablet\apps\wiki.paa";
			resource = "WikiSlide";
		};
         */
	};
};

class CfgWallpaper
{
    class IMG_0
    {
        displayName = "IMG_0";
        path = "\rimas_agent\assets\tablet\wallpapers\0.paa";
    };
    class IMG_1
    {
        displayName = "IMG_1";
        path = "\rimas_agent\assets\tablet\wallpapers\1.paa";
    };
    class IMG_2
    {
        displayName = "IMG_2";
        path = "\rimas_agent\assets\tablet\wallpapers\2.paa";
    };
    class IMG_3
    {
        displayName = "IMG_3";
        path = "\rimas_agent\assets\tablet\wallpapers\3.paa";
    };
    class IMG_4
    {
        displayName = "IMG_4";
        path = "\rimas_agent\assets\tablet\wallpapers\4.paa";
    };
    class IMG_5
    {
        displayName = "IMG_5";
        path = "\rimas_agent\assets\tablet\wallpapers\5.paa";
    };
    class IMG_6
    {
        displayName = "IMG_6";
        path = "\rimas_agent\assets\tablet\wallpapers\6.paa";
    };
    class IMG_7
    {
        displayName = "IMG_7";
        path = "\rimas_agent\assets\tablet\wallpapers\7.paa";
    };
    class IMG_8
    {
        displayName = "IMG_8";
        path = "\rimas_agent\assets\tablet\wallpapers\8.paa";
    };
    class IMG_9
    {
        displayName = "IMG_9";
        path = "\rimas_agent\assets\tablet\wallpapers\9.paa";
    };
    class IMG_10
    {
        displayName = "IMG_10";
        path = "\rimas_agent\assets\tablet\wallpapers\10.paa";
    };
    class IMG_11
    {
        displayName = "IMG_11";
        path = "\rimas_agent\assets\tablet\wallpapers\11.paa";
    };
    class IMG_12
    {
        displayName = "IMG_12";
        path = "\rimas_agent\assets\tablet\wallpapers\12.paa";
    };
    class IMG_13
    {
        displayName = "IMG_13";
        path = "\rimas_agent\assets\tablet\wallpapers\13.paa";
    };
    class IMG_14
    {
        displayName = "IMG_14";
        path = "\rimas_agent\assets\tablet\wallpapers\14.paa";
    };
    class IMG_15
    {
        displayName = "IMG_15";
        path = "\rimas_agent\assets\tablet\wallpapers\15.paa";
    };
    class IMG_16
    {
        displayName = "IMG_16";
        path = "\rimas_agent\assets\tablet\wallpapers\16.paa";
    };
    class IMG_17
    {
        displayName = "IMG_17";
        path = "\rimas_agent\assets\tablet\wallpapers\17.paa";
    };
    class IMG_18
    {
        displayName = "IMG_18";
        path = "\rimas_agent\assets\tablet\wallpapers\18.paa";
    };
    class IMG_19
    {
        displayName = "IMG_19";
        path = "\rimas_agent\assets\tablet\wallpapers\19.paa";
    };
    class IMG_20
    {
        displayName = "IMG_20";
        path = "\rimas_agent\assets\tablet\wallpapers\20.paa";
    };
    class IMG_21
    {
        displayName = "IMG_21";
        path = "\rimas_agent\assets\tablet\wallpapers\21.paa";
    };
    class IMG_22
    {
        displayName = "IMG_22";
        path = "\rimas_agent\assets\tablet\wallpapers\22.paa";
    };
    class IMG_23
    {
        displayName = "IMG_23";
        path = "\rimas_agent\assets\tablet\wallpapers\23.paa";
    };
    class IMG_24
    {
        displayName = "IMG_24";
        path = "\rimas_agent\assets\tablet\wallpapers\24.paa";
    };
    class IMG_25
    {
        displayName = "IMG_25";
        path = "\rimas_agent\assets\tablet\wallpapers\25.paa";
    };
    class IMG_26
    {
        displayName = "IMG_26";
        path = "\rimas_agent\assets\tablet\wallpapers\26.paa";
    };
    class IMG_27
    {
        displayName = "IMG_27";
        path = "\rimas_agent\assets\tablet\wallpapers\27.paa";
    };
    class IMG_28
    {
        displayName = "IMG_28";
        path = "\rimas_agent\assets\tablet\wallpapers\28.paa";
    };
    class IMG_29
    {
        displayName = "IMG_29";
        path = "\rimas_agent\assets\tablet\wallpapers\29.paa";
    };
    class IMG_30
    {
        displayName = "IMG_30";
        path = "\rimas_agent\assets\tablet\wallpapers\30.paa";
    };
    class IMG_31
    {
        displayName = "IMG_31";
        path = "\rimas_agent\assets\tablet\wallpapers\31.paa";
    };
    class IMG_32
    {
        displayName = "IMG_32";
        path = "\rimas_agent\assets\tablet\wallpapers\32.paa";
    };
    class IMG_33
    {
        displayName = "IMG_33";
        path = "\rimas_agent\assets\tablet\wallpapers\33.paa";
    };
    class IMG_34
    {
        displayName = "IMG_34";
        path = "\rimas_agent\assets\tablet\wallpapers\34.paa";
    };
    class IMG_35
    {
        displayName = "IMG_35";
        path = "\rimas_agent\assets\tablet\wallpapers\35.paa";
    };
    class IMG_36
    {
        displayName = "IMG_36";
        path = "\rimas_agent\assets\tablet\wallpapers\36.paa";
    };
    class IMG_37
    {
        displayName = "IMG_37";
        path = "\rimas_agent\assets\tablet\wallpapers\37.paa";
    };
    class IMG_38
    {
        displayName = "IMG_38";
        path = "\rimas_agent\assets\tablet\wallpapers\38.paa";
    };
    class IMG_39
    {
        displayName = "IMG_39";
        path = "\rimas_agent\assets\tablet\wallpapers\39.paa";
    };
    class IMG_40
    {
        displayName = "IMG_40";
        path = "\rimas_agent\assets\tablet\wallpapers\40.paa";
    };
};
