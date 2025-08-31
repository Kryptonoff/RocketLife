class FatumDialogLootbox {
	idd = 9400;
	movingEnable = 0;
	enableSimulation = 1;
	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};
	};
	
	class controls {
		class Title: RscText
		{
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "Лутбоксы";
			
			x = 0.0375;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};	

		class LootBoxesList: RscListBox 
		{
			idc = 9301;
			text = "";
			onLBSelChanged = "_this spawn fsc_lootbox_selectCase";
			
			rowHeight = 0.08;
			sizeEx = 0.022 * safezoneH;
			
			x = 0.0375;
			y = 0.16;
			w = 0.275;
			h = 0.68;
		};


		class LootBoxesBackground: RscText
		{
			idc = -1;
			text = "";
			colorBackground[] = {0,0,0,0.5};

			x = 0.34;
			y = 0.164;
			w = 0.625;
			h = 0.2;
		};

		class LootBoxesBackgroundGroup: RscControlsGroupNoScrollbars
		{
			idc = 9302;

			x = 0.34;
			y = 0.174;
			w = 0.625;
			h = 0.2;

			class controls {
				class LootBoxItemsLineGroup: RscControlsGroupNoScrollbars
				{
					idc = 9303;

					x = 0;
					y = 0;
					w = 100;
					h = 0.2;
				};
			};
		};

		class LootBoxesLine: RscText
		{
			idc = 9304;
			text = "";
			colorBackground[] = {1,1,1,1};

			x = 0.6425;
			y = 0.164;
			w = 0.005;
			h = 0.2;
			// [0.6425, 0.164, 0.005, 0.2]
		};
		
		class OpenLootBox: RscButton
		{
			idc = 9305;
			text = "Открыть лутбокс";
			onMouseButtonClick = "[] spawn fsc_lootbox_openLootbox";
			
			x = 0.515;
			y = 0.4;
			w = 0.3;
			h = 0.08;
		};
	};
};
class FatumDialogLootboxItem: RscControlsGroupNoScrollbars
{
	x = -1;
	w = 0.14;
	h = 0.18;

	class controls {
		class ItemBackground: RscText
		{
			idc = 9306;
			colorBackground[] = {0.5,0.5,0.5,1};

			x = 0.01;
			y = 0.01;
			w = 0.14;
			h = 0.18;
			// [0.01, 0.01, 0.14, 0.18]
		};
		class ItemText: RscText
		{
			idc = 9307;
			colorBackground[] = {0.1,0.1,0.1,0.5};

			x = 0.01;
			y = 0.14;
			w = 0.14;
			h = 0.04;
			// [0.01, 0.14, 0.14, 0.04]
		};
		class ItemImage: RscPictureKeepAspect
		{
			idc = 9308;
			colorBackground[] = {0.1,0.1,0.1,0.5};

			x = 0.01;
			y = 0.01;
			w = 0.13;
			h = 0.14;
			// [0.01, 0.01, 0.13, 0.14]
		};	
	};
};
class CaseItem: RscControlsGroupNoScrollbars
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0.12862 * safezoneW;
	h = 0.231085 * safezoneH;
	class Controls
	{
        class background: RscPicture
        {
            idc = 1000;
			text = "";
			x = 0;
			y = 0;
            w = 0.12862 * safezoneW;
            h = 0.231085 * safezoneH;
			colorBackground[]={0.25999999,0.23999999,0.31,0.5};
        };
		class image: RscPicture
		{
			idc = 1001;
			text = "\a3\ui_f_enoch\data\gui\rsc\rscdisplaywelcomecontact\welcome_contact3_co.paa";
			x = 0.00823171 * safezoneW;
			y = 0.033012 * safezoneH;
			w = 0.114215 * safezoneW;
			h = 0.105639 * safezoneH;
		};
		class description: AppRscStructuredText
		{
			idc = 1002;
			x = 0.00102896 * safezoneW;
			y = 0.140854 * safezoneH;
			w = 0.125534 * safezoneW;
			h = 0.0616225 * safezoneH;
		};
		class buy: TabletButton
		{
			idc = 1003;
			text = "КУПИТЬ"; //--- ToDo: Localize;
			x = 0.00102881 * safezoneW;
			y = 0.204675 * safezoneH;
			w = 0.125534 * safezoneW;
			h = 0.0220081 * safezoneH;
		};
		class Name: AppRscStructuredText
		{
			idc = 1004;
			x = 0.00102881 * safezoneW;
			y = 0.00440147 * safezoneH;
			w = 0.125534 * safezoneW;
			h = 0.0242089 * safezoneH;
		};
	};
};
class CaseLootboxItem: RscControlsGroupNoScrollbars
{
	x= -1;
	w = 0.057622 * safezoneW;
	h = 0.0990364 * safezoneH;
	class controls
	{
		class background: RscPicture
		{
			idc = 1000;
			text = "";
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.057622 * safezoneW;
			h = 0.0990364 * safezoneH;
		};
		class ItemImage: RscPictureKeepAspect
		{
			idc = 1002;
			text = "";
			x = 0.00205793 * safezoneW;
			y = 0.00330122 * safezoneH;
			w = 0.0535061 * safezoneW;
			h = 0.0770283 * safezoneH;
		};
		class ItemText: AppRscStructuredText
		{
			idc = 1001;
			text = "";
			x = 0.00102896 * safezoneW;
			y = 0.0748275 * safezoneH;
			w = 0.055564 * safezoneW;
			h = 0.0220081 * safezoneH;
		};
	};
};
class CaseStoreSlide: SlideTab
{
    idc = 39000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class group: RscControlsGroupNoScrollbars
		{
			idc = 39003;
			x = 0;
			y = 0;
			w = 0.401296 * safezoneW;
			h = 0.57221 * safezoneH;
			class controls {};
		};
		class myCases: MainMenuButton
		{
			idc = 39001;
			text = "Мои кейсы";
			x = 0;
			onButtonClick = "['myCase',1] call RRPClient_tablet_slide";
		};
        class back: MainMenuButton
        {
            idc = 39002;
        };
		class faq: MainMenuButton
		{
			idc = 39003;
			text = "F.A.Q.";
			x = 0.157428 * safezoneW;
			onButtonClick = "['caseFaq',1] call RRPClient_tablet_slide";
		};
	};
};
class MyCaseSlide: SlideTab
{
    idc = 39100;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 39101;
			onButtonClick = "['caseStore',0] call RRPClient_tablet_slide";
        };
		class group: RscControlsGroupNoScrollbars
		{
			idc = 39102;
			x = 0;
			y = 0;
			w = 0.401296 * safezoneW;
			h = 0.57221 * safezoneH;
			class controls {};
		};
		class faq: MainMenuButton
		{
			idc = 39103;
			text = "F.A.Q.";
			x = 0.157428 * safezoneW;
			onButtonClick = "['caseFaq',1] call RRPClient_tablet_slide";
		};
	};
};
/* #Lyqimy
$[
	1.063,
	["template",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"TemplateGroup",[1,"",["0.299352 * safezoneW + safezoneX","0.213895 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2400,"backButton",[2300,"MainMenu",["0.305272 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"CaseName",[2300,"",["0.0648249 * safezoneW","0.0109962 * safezoneH","0.25827 * safezoneW","0.0440162 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"CaseDescription",[2300,"",["0.0648267 * safezoneW","0.235492 * safezoneH","0.258265 * safezoneW","0.176065 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[2401,"OpenBox",[2300,"OPEN",["0.535061 * safezoneW","-0.451166 * safezoneH","0 * safezoneW","0 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"LootBoxWheelGroup",[2300,"",["0.0658538 * safezoneW","0.415955 * safezoneH","0.257241 * safezoneW","0.11004 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Line",[2300,"",["0.195503 * safezoneW","0.415955 * safezoneH","0.00205793 * safezoneW","0.11004 * safezoneH"],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"CasePicture",[2300,"\a3\ui_f_enoch\data\gui\rsc\rscdisplaywelcomecontact\welcome_contact4_co.paa",["0.0956948 * safezoneW","0.0638233 * safezoneH","0.195501 * safezoneW","0.165061 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2402,"OpenButton",[2300,"Open",["0.0668828 * safezoneW","0.528194 * safezoneH","0.257241 * safezoneW","0.0440162 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class OpenCaseSlide: SlideTab
{
    idc = 39200;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 39201;
        };
		class CaseName: AppRscStructuredText
		{
			idc = 39202;
			x = 0.0648249 * safezoneW;
			y = 0.0109962 * safezoneH;
			w = 0.25827 * safezoneW;
			h = 0.0440162 * safezoneH;
		};
		class CaseDescriptionGroup: RscControlsGroupNoScrollbars
		{
			idc = 39203;
			x = 0.0648267 * safezoneW;
			y = 0.235492 * safezoneH;
			w = 0.258265 * safezoneW;
			h = 0.176065 * safezoneH;
			class controls
			{
				class CaseDescription: AppRscStructuredText
				{
					idc = 39204;
					x = 0 * safezoneW;
					y = 0 * safezoneH;
					w = 0.258265 * safezoneW;
					h = 0.176065 * safezoneH;
				};
			};
		};
		class OpenBox: AppTabletButton
		{
			idc = 39205;
			text = "ОТКРЫТЬ";
			x = 0.0668828 * safezoneW;
			y = 0.528194 * safezoneH;
			w = 0.257241 * safezoneW;
			h = 0.0440162 * safezoneH;
		};
		class LootBoxWheelGroup: RscControlsGroupNoScrollbars
		{
			idc = 39206;
			x = 0.0658538 * safezoneW;
			y = 0.415955 * safezoneH;
			w = 0.257241 * safezoneW;
			h = 0.11004 * safezoneH;
			class controls {
				class LootBoxItemsLineGroup: RscControlsGroupNoScrollbars
				{
					idc = 39207;
					x = 0;
					y = 0;
					w = 100;
					h = 0.11004 * safezoneH;
				};
			};
		};
		class Line: RscText
		{
			idc = 39207;
			text = "";
			x = 0.195503 * safezoneW;
			y = 0.415955 * safezoneH;
			w = 0.00205793 * safezoneW;
			h = 0.11004 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class CasePicture: RscPicture
		{
			idc = 39208;
			text = "\a3\ui_f_enoch\data\gui\rsc\rscdisplaywelcomecontact\welcome_contact4_co.paa";
			x = 0.0956948 * safezoneW;
			y = 0.0638233 * safezoneH;
			w = 0.195501 * safezoneW;
			h = 0.165061 * safezoneH;
		};
	};
};
class FAQCaseSlide: SlideTab
{
	idc = 39300;
	show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 39301;
        };
		class FAQGroup: ctrlControlsGroupNoHScrollbars
		{
			idc = 39302;
			x = 0.00205692 * safezoneW;
			y = 0.00440142 * safezoneH;
			w = 0.39796 * safezoneW;
			h = 0.572222 * safezoneH;
			class controls
			{
				class FAQ: AppRscStructuredText
				{
					idc = 39303;
					text = "";
					x = 0 * safezoneW;
					y = 0 * safezoneH;
					w = 0.39796 * safezoneW;
					h = 0.572222 * safezoneH;
				};
			};
		};
	};
};