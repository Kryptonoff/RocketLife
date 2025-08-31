/* #Myqisy
$[
	1.063,
	["template",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"TemplateGroup",[1,"",["0.298918 * safezoneW + safezoneX","0.203 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2400,"backButton",[2300,"MainMenu",["0.305272 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"SearchBar",[2300,"",["0.015457 * safezoneW","0.0462 * safezoneH","0.12375 * safezoneW","0.0264 * safezoneH"],[-1,-1,-1,-1],[0.102,0.102,0.102,1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"Catagory_List",[2300,"",["0.015457 * safezoneW","0.0748 * safezoneH","0.12375 * safezoneW","0.4972 * safezoneH"],[-1,-1,-1,-1],[0.102,0.102,0.102,1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"SelectedItemDescriptionBackground",[2300,"",["0.144363 * safezoneW","0.0748 * safezoneH","0.2475 * safezoneW","0.4972 * safezoneH"],[-1,-1,-1,-1],[0.102,0.102,0.102,1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"SelectionCtrlsGrp",[2300,"",["0.144366 * safezoneW","0.0748 * safezoneH","0.2475 * safezoneW","0.4972 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"TreeList",[2300,"",["0.0154676 * safezoneW","0.077 * safezoneH","0.12375 * safezoneW","0.495 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"SelectedItemTitle",[2300,"",["0.144363 * safezoneW","0.0462 * safezoneH","0.2475 * safezoneW","0.0264 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"SelectedItemBackground",[2300,"",["0.144363 * safezoneW","0.0462 * safezoneH","0.2475 * safezoneW","0.0264 * safezoneH"],[-1,-1,-1,-1],[0.102,0.102,0.102,1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class WikiSlide: SlideTab
{
	idc=20000;
	x=0;
	y=0;
	class Controls
	{
		class back: MainMenuButton
		{
			idc = 20001;
		};
		class SearchBar: AppRscEdit
		{
			idc = 20002;
			x = 0.015457 * safezoneW;
			y = 0.0462 * safezoneH;
			w = 0.12375 * safezoneW;
			h = 0.0264 * safezoneH;
			tooltip = "Поиск";
			colorBackground[] = {0.102,0.102,0.102,1};
		};
		class SelectionCtrlsGrp: RscControlsGroup
		{
			idc = 20005;
			x = 0.144366 * safezoneW;
			y = 0.0748 * safezoneH;
			w = 0.2475 * safezoneW;
			h = 0.4972 * safezoneH;
			class controls
			{
				class SelectedItemDescription: AppRscStructuredText
				{
					idc = 20015;
					x = 0.00176195 * safezoneW;
					y = 0.00376203 * safezoneH;
					w = 0.243976 * safezoneW;
					h = 0.430595 * safezoneH;
					colorBackground[] = {0,0,0,0};
				};
			};
		};
		class TreeList: AppRscTree
		{
			idc = 20006;
            idcSearch = 20002;
			x = 0.0154676 * safezoneW;
			y = 0.077 * safezoneH;
			w = 0.12375 * safezoneW;
			h = 0.495 * safezoneH;
		};
		class SelectedItemTitle: AppRscStructuredText
		{
			idc = 20007;
			x = 0.144363 * safezoneW;
			y = 0.0462 * safezoneH;
			w = 0.2475 * safezoneW;
			h = 0.0264 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};