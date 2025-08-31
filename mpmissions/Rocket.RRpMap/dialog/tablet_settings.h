class UnionDialogSettings
{
	idd = 2900;
	name = "UnionDialogSettings";
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "[_this select 0] call RRPClient_gui_Tiles; true call RRPClient_gui_util_blur;";
	onUnload = "tagsFirstUse = nil; false call RRPClient_gui_util_blur;";

	class controlsBackground
	{
		class padImage : RscPicture {
			idc = 2903;
			text = "";

			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};

		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; [] spawn RRPClient_pad_openMain";
			tooltip = "Вернуться в главное меню";

			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = "0.475161 * safezoneW + safezoneX";
			y = "0.722828 * safezoneH + safezoneY";
			w = "0.0257775 * safezoneW";
			h = "0.0439982 * safezoneH";
			// ["0.475161 * safezoneW + safezoneX","0.722828 * safezoneH + safezoneY","0.0257775 * safezoneW","0.0439982 * safezoneH"]
		};

		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0";
			tooltip = "Закрыть";

			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = "0.5 * safezoneW + safezoneX";
			y = "0.719991 * safezoneH + safezoneY";
			w = "0.0257775 * safezoneW";
			h = "0.0439982 * safezoneH";

			// ["0.475161 * safezoneW + safezoneX","0.722828 * safezoneH + safezoneY","0.0257775 * safezoneW","0.0439982 * safezoneH"]
		};
	};

	class controls
	{
		class Title : RscTitle
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "Настройки";

			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};

		class VDonFoot : RscText
		{
			idc = -1;
			text = "Игрок:";

			x = 0.0374988;
			y = 0.16;
			w = 0.0875;
			h = 0.04;
		};

		class VDinCar : RscText
		{
			idc = -1;
			text = "Авто:";

			x = 0.0374988;
			y = 0.22;
			w = 0.0875;
			h = 0.04;
		};

		class VDinAir : RscText
		{
			idc = -1;
			text = "Авиа:";

			x = 0.0374988;
			y = 0.28;
			w = 0.0875;
			h = 0.04;
		};

		class VD_onfoot_slider : RscXSliderH
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call RRPClient_system_s_onSliderChange;";
			tooltip = "Видимость игрока";

			x = 0.137499;
			y = 0.16;
			w = 0.2625;
			h = 0.04;
		};

		class VD_onfoot_value : RscText
		{
			idc = 2902;
			text = "";

			x = 0.412499;
			y = 0.16;
			w = 0.1125;
			h = 0.04;
		};

		class VD_car_slider : RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call RRPClient_system_s_onSliderChange;";
			tooltip = "Видимость в наземной технике";

			x = 0.137499;
			y = 0.22;
			w = 0.2625;
			h = 0.04;
		};

		class VD_car_value : RscText
		{
			idc = 2912;
			text = "";

			x = 0.412499;
			y = 0.22;
			w = 0.1125;
			h = 0.04;
		};

		class VD_air_slider : RscXSliderH
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call RRPClient_system_s_onSliderChange;";
			tooltip = "Видимость в воздушной технике";

			x = 0.137499;
			y = 0.28;
			w = 0.2625;
			h = 0.04;
		};

		class VD_air_value : RscText
		{
			idc = 2922;
			text = "";

			x = 0.412499;
			y = 0.28;
			w = 0.1125;
			h = 0.04;
		};



		class PlayerTagsHeader : RscText
		{
			idc = -1;
			text = "Метки игрока";
			colorBackground[] = {1,1,1,0.1};
			x = 0.0375;
			y = 0.38;
			w = 0.3875;
			h = 0.04;
		};

		class PlayerTagsSwitch : ctrlCheckbox2
		{
			text = "";
			tooltip = "Определяет будет ли игрок иметь теги над головой.";
			idc = 2991;
			sizeEx = 0.04;
			onCheckedChanged = "['tags',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.4375;
			y = 0.38;
			w = 0.035;
			h = 0.04;
		};

		class GrassHeader : RscText
		{
			idc = -1;
			text = "Прорисовка травы (влияет на FPS+)";
			colorBackground[] = {1,1,1,0.1};
			x = 0.0375;
			y = 0.44;
			w = 0.3875;
			h = 0.04;
		};

		class GrassSwitch : ctrlCheckbox2
		{
			tooltip = "Полная прорисовка травы. Выключение данного параметра может увеличить производительность";
			idc = 2992;
			onCheckedChanged = "['grass',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.4375;
			y = 0.44;
			w = 0.035;
			h = 0.04;
		};

		class ambientSound : RscText
		{
			idc = -1;
			text = "Звуки окружения (влияет на FPS+)";
			colorBackground[] = {1,1,1,0.1};
			x = 0.0375;
			y = 0.504;
			w = 0.3875;
			h = 0.04;
		};

		class ambientSoundSwitch : ctrlCheckbox2
		{
			tooltip = "Отключает звуки окружения, влияет на производительность";
			idc = 2993;
			onCheckedChanged = "['sound',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.4375;
			y = 0.504;
			w = 0.035;
			h = 0.04;
		};

		class HUDHeader : RscText
		{
			idc = -1;
			text = "Отображение HUD";
			colorBackground[] = {1,1,1,0.1};
			x = 0.0375;
			y = 0.568;
			w = 0.3875;
			h = 0.04;
		};

		class HUDSwitch : ctrlCheckbox2
		{
			tooltip = "Отображение информации о персонаже на экране";
			idc = 2994;
			onCheckedChanged = "['HUD',(_this select 1)] call RRPClient_system_settingsSwitch";
			x = 0.4375;
			y = 0.568;
			w = 0.035;
			h = 0.04;
		};

		class ColorTitle : RscStructuredText
		{
			idc = -1;
			text = "Планшет:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.16;
			w = 0.1125;
			h = 0.04;
		};

		class ColorList : RscCombo
		{
			idc = 2973;
			onLBSelChanged = "_this call RRPClient_system_savePadSkin";

			x = 0.65;
			y = 0.16;
			w = 0.3125;
			h = 0.04;
		};

		class PassTitle : RscStructuredText
		{
			idc = -1;
			text = "Паспорт:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.22;
			w = 0.1125;
			h = 0.04;
		};

		class PassList : RscCombo
		{
			idc = 2977;
			onLBSelChanged = "_this call RRPClient_system_savePassport";

			x = 0.65;
			y = 0.22;
			w = 0.3125;
			h = 0.04;
		};

		class TagTitle : RscStructuredText
		{
			idc = -1;
			text = "Титул:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.28;
			w = 0.1125;
			h = 0.04;
		};

		class TagList : RscCombo
		{
			idc = 2978;
			onLBSelChanged = "['updateTitle',(_this select 0),(_this select 1)] call RRPClient_ptags_onLBchangeTag";
			x = 0.65;
			y = 0.28;
			w = 0.3125;
			h = 0.04;
			style="0x00 + 0x10";
			colorPicture[]={1,1,1,1};
			colorPictureSelected[]={1,1,1,1};
			colorPictureDisabled[]={1,1,1,1};

			colorPictureRight[]={1,1,1,1};
			colorPictureRightSelected[]={1,1,1,1};
			colorPictureRightDisabled[]={1,1,1,1};
		};

		class RankTitle : RscStructuredText
		{
			idc = -1;
			text = "Иконка:";
			sizeEx = 0.020;

			x = 0.525;
			y = 0.34;
			w = 0.1125;
			h = 0.04;
		};

		class RankList : RscCombo
		{
			idc = 2980;
			onLBSelChanged = "['updateIcons',(_this select 0),(_this select 1)] call RRPClient_ptags_onLBchangeTag";
			x = 0.65;
			y = 0.34;
			w = 0.3125;
			h = 0.04;
			style="0x00 + 0x10";
			colorPicture[]={1,1,1,1};
			colorPictureSelected[]={1,1,1,1};
			colorPictureDisabled[]={1,1,1,1};

			colorPictureRight[]={1,1,1,1};
			colorPictureRightSelected[]={1,1,1,1};
			colorPictureRightDisabled[]={1,1,1,1};
		};


	};
};
