/* #Komovy
$[
	1.063,
	["template",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"TemplateGroup",[1,"",["0.299488 * safezoneW + safezoneX","0.214084 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"backButton",[2300,"MainMenu",["0.305272 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1400,"SearchFilter",[2300,"",["0.00514084 * safezoneW","0.0109966 * safezoneH","0.102827 * safezoneW","0.0219935 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1500,"TreeList",[2300,"",["0.00514084 * safezoneW","0.0395882 * safezoneH","0.102827 * safezoneW","0.521247 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2301,"Group",[1,"",["0.412597 * safezoneW + safezoneX","0.225081 * safezoneH + safezoneY","0.282774 * safezoneW","0.549839 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1100,"Title",[2301,"",["0.00514102 * safezoneW","0.00659801 * safezoneH","0.272491 * safezoneW","0.0395881 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1200,"Image",[2301,"\rimas_agent\assets\hud\free_case.paa",["0.0308481 * safezoneW","0.054984 * safezoneH","0.226219 * safezoneW","0.197942 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1101,"Description",[2301,"",["0.00308444 * safezoneW","0.257323 * safezoneH","0.276605 * safezoneW","0.237527 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2401,"BuyButton",[2301,"BUY",["0.00205639 * safezoneW","0.505852 * safezoneH","0.277631 * safezoneW","0.0329903 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2402,"",[2300,"MainMenu",["0.00514084 * safezoneW","0.589426 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class ItemGroup: RscControlsGroup
{
	idc = 2301;
	w = 0.282774 * safezoneW;
	h = 0.549839 * safezoneH;
	class Controls
	{
		class Title: AppRscStructuredText
		{
			idc = 1200;
			x = 0.00514102 * safezoneW;
			y = 0.00659801 * safezoneH;
			w = 0.272491 * safezoneW;
			h = 0.0395881 * safezoneH;
		};
		class Image: RscPictureKeepAspect
		{
			idc = 1201;
			text = "";
			x = 0.0308481 * safezoneW;
			y = 0.054984 * safezoneH;
			w = 0.226219 * safezoneW;
			h = 0.197942 * safezoneH;
		};
		class Description: ctrlControlsGroupNoScrollbars
		{
			idc = 1100;
			x = 0.00308444 * safezoneW;
			y = 0.257323 * safezoneH;
			w = 0.276605 * safezoneW;
			h = 0.237527 * safezoneH;
			class controls 
			{
				class description: AppRscStructuredText
				{
					idc = 1101;
					text = "";
					x = 0;
					y = 0;
					w = 0.303339 * safezoneW;
					h = 0.263956 * safezoneH;
				};
			};
		};
		class BuyButton: AppTabletButton
		{
			idc = 2402;
			text = "BUY"; //--- ToDo: Localize;
			x = 0.00205639 * safezoneW;
			y = 0.505852 * safezoneH;
			w = 0.277631 * safezoneW;
			h = 0.0329903 * safezoneH;
		};
	};
};
class TrxSlide: RscControlsGroup
{
	idc = 40000;
	x = 0.299488 * safezoneW + safezoneX;
	y = 0.224897 * safezoneH + safezoneY;
	w = 0.402222 * safezoneW;
	h = 0.629227 * safezoneH;
	class Controls
	{
		class backButton: MainMenuButton
		{
			idc = 40001;
		};
		class faqButton: AppTabletButton
		{
			idc = 40002;
			text = "F.A.Q."; //--- ToDo: Localize;
			x = 0.00514084 * safezoneW;
			y = 0.589426 * safezoneH;
			w = 0.0928206 * safezoneW;
			h = 0.0330014 * safezoneH;
			onButtonClick = "['trx_faq',0] call RRPClient_tablet_slide";
		};
		class listGroup: RscControlsGroup
		{
			idc = 40003;
			x = 0.113109 * safezoneW;
			y = 0.0109966 * safezoneH;
			w = 0.282774 * safezoneW;
			h = 0.549839 * safezoneH;
			class controls
			{};
		};
		class SearchFilter: AppRscEdit
		{
			idc = 40004;
			text = "";
			x = 0.00514084 * safezoneW;
			y = 0.0109966 * safezoneH;
			w = 0.102827 * safezoneW;
			h = 0.0219935 * safezoneH;
		};
		class TreeList: AppRscTree
		{
			idc = 40005;
            idcSearch = 40004;
			x = 0.00514084 * safezoneW;
			y = 0.0395882 * safezoneH;
			w = 0.102827 * safezoneW;
			h = 0.521247 * safezoneH;
		};
	};
};
class TrxFaqSlide: SlideTab
{
	idc = 41000;
	show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 41001;
			onButtonClick = "['trx',0] call RRPClient_tablet_slide";
        };
		class FAQGroup: ctrlControlsGroupNoHScrollbars
		{
			idc = 41002;
			x = 0.00205692 * safezoneW;
			y = 0.00440142 * safezoneH;
			w = 0.39796 * safezoneW;
			h = 0.572222 * safezoneH;
			class controls
			{
				class FAQ: AppRscStructuredText
				{
					idc = 41003;
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