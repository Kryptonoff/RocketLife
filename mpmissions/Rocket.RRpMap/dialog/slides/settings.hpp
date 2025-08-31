class SettingsSlide: SlideTab
{
	idc = 35500;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class back: MainMenuButton
		{
			idc = 35501;
		};
		class group: RscControlsGroup
		{
			idc = 35502;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.401294 * safezoneW;
			h = 0.572047 * safezoneH;
			class controls {};
		};
	};
};

class Settings2Slide: SlideTab
{
    idc = 35000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 35001;
        };
		class VDonFoot: AppRscStructuredText
		{
			idc = 35002;
			text = "Игрок:"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.0051575 * safezoneW;
			y = 0.0110388 * safezoneH;
			w = 0.177356 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class VDinCar: AppRscStructuredText
		{
			idc = 35003;
			text = "Авто:"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.044 * safezoneH;
			w = 0.176325 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class VDinAir: AppRscStructuredText
		{
			idc = 35004;
			text = "Авиа:"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00516004 * safezoneW;
			y = 0.0769982 * safezoneH;
			w = 0.176325 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class VD_onfoot_slider: AppRscXSlider
		{
			idc = 35005;
			onSliderPosChanged = "[0,_this#0,_this#1] call RRPClient_system_s_onSliderChange;";
			tooltip = "Видимость игрока";
			x = 0.185614 * safezoneW;
			y = 0.011 * safezoneH;
			w = 0.160871 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class VD_onfoot_value: AppRscStructuredText
		{
			idc = 35006;
			text = ""; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.350605 * safezoneW;
			y = 0.011 * safezoneH;
			w = 0.0464098 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class VD_car_slider: AppRscXSlider
		{
			idc = 35007;
			onSliderPosChanged = "[1,_this#0,_this#1] call RRPClient_system_s_onSliderChange;";
			tooltip = "Видимость в наземной технике";
			x = 0.185614 * safezoneW;
			y = 0.044 * safezoneH;
			w = 0.160871 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class VD_car_value: AppRscStructuredText
		{
			idc = 35008;
			text = ""; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.350605 * safezoneW;
			y = 0.044 * safezoneH;
			w = 0.0464098 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class VD_air_slider: AppRscXSlider
		{
			idc = 35009;
			onSliderPosChanged = "[2,_this#0,_this#1] call RRPClient_system_s_onSliderChange;";
			tooltip = "Видимость в воздушной технике";
			x = 0.185614 * safezoneW;
			y = 0.077 * safezoneH;
			w = 0.160871 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class VD_air_value: AppRscStructuredText
		{
			idc = 35010;
			text = ""; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.350605 * safezoneW;
			y = 0.077 * safezoneH;
			w = 0.0464098 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class PlayerTagsHeader: AppRscStructuredText
		{
			idc = 35011;
			text = "Метки игрока";
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.11 * safezoneH;
			w = 0.361949 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class PlayerTagsHeaderCheck: AppToggle
		{
			idc = 35012;
			tooltip = "Определяет будет ли игрок иметь теги над головой.";
			onToggle = "['tags',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.370199 * safezoneW;
			y = 0.11 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class GrassHeader: AppRscStructuredText
		{
			idc = 35013;
			text = "Прорисовка травы (влияет на FPS+)";
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.142998 * safezoneH;
			w = 0.360917 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GrassSwitch: AppToggle
		{
			idc = 35014;
			tooltip = "Полная прорисовка травы. Выключение данного параметра может увеличить производительность";
			onToggle = "['grass',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.371228 * safezoneW;
			y = 0.143 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class ambientSound: AppRscStructuredText
		{
			idc = 35015;
			text = "Звуки окружения (влияет на FPS+)";
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.175998 * safezoneH;
			w = 0.360917 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ambientSoundSwitch: AppToggle
		{
			idc = 35016;
			tooltip = "Отключает звуки окружения, влияет на производительность";
			onToggle = "['sound',(_this select 1)] call RRPClient_system_settingsSwitch";
			
			x = 0.371228 * safezoneW;
			y = 0.176 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class HUDHeader: AppRscStructuredText
		{
			idc = 35017;
			text = "Отображение HUD";
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.209 * safezoneH;
			w = 0.360917 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class HUDSwitch: AppToggle
		{
			idc = 35018;
			tooltip = "Отображение информации о персонаже на экране";
			onToggle = "['HUD',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.371228 * safezoneW;
			y = 0.209 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class ColorTitle: AppRscStructuredText
		{
			idc = 35019;
			text = "<t align='left'>Обои планшета</t><t align='right'> > </t>"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.242 * safezoneH;
			w = 0.392859 * safezoneW;
			h = 0.022 * safezoneH;
			onMouseButtonClick = "['selectWallpaper',1] call RRPClient_tablet_slide";
		};
		class PassTitle: AppRscStructuredText
		{
			idc = 35021;
			text = "<t align='left'>Обложка паспорта</t><t align='right'> > </t>"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.275 * safezoneH;
			w = 0.391828 * safezoneW;
			h = 0.022 * safezoneH;
			onMouseButtonClick = "['selectPassports',1] call RRPClient_tablet_slide";
		};
		/*
		class ColorList: AppRscCombo
		{
			idc = 35020;
			onLBSelChanged = "_this call RRPClient_system_savePadSkin";
			x = 0.268109 * safezoneW;
			y = 0.242 * safezoneH;
			w = 0.128916 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class PassList: AppRscCombo
		{
			idc = 35022;
			onLBSelChanged = "_this call RRPClient_system_savePassport";
			x = 0.268109 * safezoneW;
			y = 0.275 * safezoneH;
			w = 0.128916 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		*/
		class TagTitle: AppRscStructuredText
		{
			idc = 35023;
			text = "Титул:"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.308 * safezoneH;
			w = 0.257798 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TagList: AppRscCombo
		{
			idc = 35024;
			onLBSelChanged = "['updateTitle',(_this select 0),(_this select 1)] call RRPClient_ptags_onLBchangeTag";
			x = 0.268109 * safezoneW;
			y = 0.308 * safezoneH;
			w = 0.128916 * safezoneW;
			h = 0.0219982 * safezoneH;
			style="0x00 + 0x10";
			colorPicture[]={1,1,1,1};
			colorPictureSelected[]={1,1,1,1};
			colorPictureDisabled[]={1,1,1,1};

			colorPictureRight[]={1,1,1,1};
			colorPictureRightSelected[]={1,1,1,1};
			colorPictureRightDisabled[]={1,1,1,1};
		};
		class RankTitle: AppRscStructuredText
		{
			idc = 35025;
			text = "Иконка:";
			colorBackground[] = {1,1,1,0.1};
			x = 0.00515574 * safezoneW;
			y = 0.341 * safezoneH;
			w = 0.257798 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RankList: AppRscCombo
		{
			idc = 35026;
			onLBSelChanged = "['updateIcons',(_this select 0),(_this select 1)] call RRPClient_ptags_onLBchangeTag";
			x = 0.268109 * safezoneW;
			y = 0.341 * safezoneH;
			w = 0.128916 * safezoneW;
			h = 0.0219982 * safezoneH;
			style="0x00 + 0x10";
			colorPicture[]={1,1,1,1};
			colorPictureSelected[]={1,1,1,1};
			colorPictureDisabled[]={1,1,1,1};

			colorPictureRight[]={1,1,1,1};
			colorPictureRightSelected[]={1,1,1,1};
			colorPictureRightDisabled[]={1,1,1,1};
		};
		class CloseApps: AppRscStructuredText
		{
			idc = 35027;
			text = "Запомнить приложение при закрытии"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00544765 * safezoneW;
			y = 0.373154 * safezoneH;
			w = 0.360917 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class StartFromMenuSwitch: AppToggle
		{
			idc = 35028;
			tooltip = "Запомнить приложение при закрытии";
			onToggle = "['OpenApp',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.371729 * safezoneW;
			y = 0.372467 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class SaveBinds: AppRscStructuredText
		{
			idc = 35029;
			text = "Сохранение горячих клавиш"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00544765 * safezoneW;
			y = 0.405308 * safezoneH;
			w = 0.360917 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class SaveBindsSwitch: AppToggle
		{
			idc = 35030;
			tooltip = "Сохранение горячих клавиш";
			onToggle = "['SaveBinds',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.371729 * safezoneW;
			y = 0.405308 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class ShowHotkeys: AppRscStructuredText
		{
			idc = 35031;
			text = "Отображение горячих клавиш"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00544765 * safezoneW;
			y = 0.437462 * safezoneH;
			w = 0.360917 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ShowHotkeysSwitch: AppToggle
		{
			idc = 35032;
			tooltip = "Отображение горячих клавиш";
			onToggle = "['ShowHotkeys',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.371729 * safezoneW;
			y = 0.437462 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class ShowCaseTimer: AppRscStructuredText
		{
			idc = 35033;
			text = "Отображение таймера для кейса"; //--- ToDo: Localize;
			colorBackground[] = {1,1,1,0.1};
			x = 0.00544765 * safezoneW;
			y = 0.469616 * safezoneH;
			w = 0.360917 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ShowCaseTimerSwitch: AppToggle
		{
			idc = 35034;
			tooltip = "Отображение таймера для кейса";
			onToggle = "['ShowCaseTimer',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.371729 * safezoneW;
			y = 0.469616 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
	};
};