class life_progress {
	idd = 38200;
	fadeout=0;
	fadein=0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	onUnload = "uiNamespace setVariable ['life_progress', displayNull]";
	duration = 10e10;
	name= "life_progress";
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class TypeOfAction: RscPicture {
			idc = 38201;
			text = "";
			colorBackground[] = {0,0,0,0};
			x = 0.45;
			y = 0.02;
			w = 0.125;
			h = 0.16;
		};
		class RollingPic: TypeOfAction {
			idc = 38202;
		};
	};
};

class life_progress_custom {
	idd = 38200;
	fadeout=0;
	fadein=0;
	onLoad="uiNamespace setVariable ['life_progress_custom',_this select 0]";
	onUnload = "uiNamespace setVariable ['life_progress_custom', displayNull]";
	duration = 10e10;
	name= "life_progress_custom";
	controlsBackground[] = {};
	objects[] = {};
	
	class controls
	{
		class progressBack: RscText
		{
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.011 * safezoneH;
			colorBackground[] = {1,1,1,0.35};
		};
		class textExpInfo: RscStructuredText
		{
			idc = 38202;
			text = ""; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class progressLevelProgress: RscProgress
		{
			idc = 38201;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.011 * safezoneH;
			colorFrame[] = {0,0,0,0};
    		colorBackground[] = {0,0,0,0};
   	 		colorBar[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',1])", "(profilenamespace getvariable ['GUI_V3_BTBG_G',1])", "(profilenamespace getvariable ['GUI_V3_BTBG_B',1])", "(profilenamespace getvariable ['GUI_V3_BTBG_A',0.8])"};

		};
	};
	
};

class jail_cost //исправительные работы
{
	name = "jail_cost";
	idd = 38306;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['jail_cost',_this select 0]";
	onUnload = "uiNamespace setVariable ['jail_cost', displayNull]";
	objects[] = {};
	
	
	class controlsBackground
	{
	    class ShadowText: RRP_background
		{
			idc = -1;
			x = 0.0050643 * safezoneW + safezoneX;
			y = 0.664967 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.06 * safezoneH;
        };	
		
	};
	
	class controls
	{     
		class structured_4: RRP_RscStructuredText
		{
			idc = 38307;
			text = "";
			x = 0.0281534 * safezoneW + safezoneX;
			y = 0.686963 * safezoneH + safezoneY;
			w = 0.123734 * safezoneW;
			h = 0.0549891 * safezoneH;
		};
		class img_4: RscPicture
		{
			idc = 1203;
			text = "\welmen_images\images\arrra_znak.paa";
			x = 0.0050643 * safezoneW + safezoneX;
			y = 0.676963 * safezoneH + safezoneY;
			//y = 0.676963 * safezoneH + safezoneY;
			w = 0.0240891 * safezoneW;
			h = 0.0539891 * safezoneH;
		};
		class poloska_4: RRP_title
		{
			idc = 1204;
			text = "Исправительные работы";
			x = 0.0050643 * safezoneW + safezoneX;
			y = 0.664967 * safezoneH + safezoneY;
			w = 0.13 * safezoneW;
			h = 0.0219957 * safezoneH;
		};
	};
};
class life_timer
{
	idd = -1;
	fadeIn = 1;
	duration = 10e+10;
	fadeout = 1;
	movingEnable = 0;
	name = "life_timer";
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['life_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = 38300;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.0140625 * safezoneW;
			h = 0.025 * safezoneH;
		};

		class TimerText : RscText
		{
			idc = 38301;
			text = "";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
};
class death_timer
{
	name = "death_timer"; //зона после смерти
	idd = 38302;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['death_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['death_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TimerText : RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38303;
			text = "";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class jail_timer //кича
{
	name = "jail_timer";
	idd = 38304;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['jail_timer',_this select 0]";
	onUnload = "uiNamespace setVariable ['jail_timer', displayNull]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TimerText : RscStructuredText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38305;
			text = "";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
};
