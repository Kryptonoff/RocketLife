/* #Vuwomu
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"CloseImage",[1,"\rimas_gui\data\v3\button_close.paa",["0.603148 * safezoneW + safezoneX","0.37903 * safezoneH + safezoneY","0.0144375 * safezoneW","0.0251999 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[2400,"CloseButton: RscPictureButtonMenu",[1,"",["0.603148 * safezoneW + safezoneX","0.37903 * safezoneH + safezoneY","0.0144375 * safezoneW","0.0251999 * safezoneH"],[1,1,1,1],[1,1,1,0.004],[-1,-1,-1,-1],"Ð—Ð°ÐºÑ€Ñ‹Ñ‚ÑŒ","(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["onButtonClick = |closeDialog 0|;","colorBackgroundFocused[] = {1,1,1,0.008};","colorBackground2[] = {0.75,0.75,0.75,0.004};"]],
	[1000,"background",[1,"",["0.38138 * safezoneW + safezoneX","0.412021 * safezoneH + safezoneY","0.242398 * safezoneW","0.241941 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],["idc = 25599;"]],
	[1001,"title",[1,"Title",["0.38138 * safezoneW + safezoneX","0.368032 * safezoneH + safezoneY","0.242398 * safezoneW","0.0439893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,1],[-1,-1,-1,-1],"","-1"],["idc = 1001;"]],
	[2401,"accept",[1,"",["0.386537 * safezoneW + safezoneX","0.609973 * safezoneH + safezoneY","0.108305 * safezoneW","0.0329919 * safezoneH"],[1,1,1,1],[0,0,0,0.8],[-1,-1,-1,-1],"","(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 2400;"]],
	[2402,"decline",[1,"",["0.510315 * safezoneW + safezoneX","0.609973 * safezoneH + safezoneY","0.108305 * safezoneW","0.0329919 * safezoneH"],[1,1,1,1],[0,0,0,0.8],[-1,-1,-1,-1],"","(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 2401;"]],
	[2100,"RscCombo_2100",[1,"",["0.386537 * safezoneW + safezoneX","0.565984 * safezoneH + safezoneY","0.232083 * safezoneW","0.0219946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2100;"]],
	[2300,"RscControlsGroup_2300",[1,"",["0.386537 * safezoneW + safezoneX","0.423019 * safezoneH + safezoneY","0.232083 * safezoneW","0.131968 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2300;"]]
]
*/

class RRPDialogCommon
{
	idd = 25600;
	name = "RRPDialogCommon";
	onLoad = "uiNamespace setVariable ['RRPDialogCommon',_this#0];true call RRPClient_gui_util_blur";
	onUnload = "uiNamespace setVariable ['RRPDialogCommon',displayNull];false call RRPClient_gui_util_blur";
	class Controls
	{
		class title: RRP_title
		{
			idc = 25601;

			text = "Title"; //--- ToDo: Localize;
			x = 0.38138 * safezoneW + safezoneX;
			y = 0.368032 * safezoneH + safezoneY;
			w = 0.242398 * safezoneW;
			h = 0.0439893 * safezoneH;
		};
		class CloseImage: RscPicture
		{
			idc = -1;

			text = "\rimas_gui\data\v3\button_close.paa";
			x = 0.603148 * safezoneW + safezoneX;
			y = 0.37903 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0251999 * safezoneH;
		};
		class CloseButton: RscPictureButtonMenu
		{
			onButtonClick = "closeDialog 0";
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			idc = -1;
			x = 0.603148 * safezoneW + safezoneX;
			y = 0.37903 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0251999 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.004};
			tooltip = "Закрыть"; //--- ToDo: Localize;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * GUI_GRID_H;
		};
		class background: RRP_background
		{
			idc = 25599;

			x = 0.38138 * safezoneW + safezoneX;
			y = 0.412021 * safezoneH + safezoneY;
			w = 0.242398 * safezoneW;
			h = 0.241941 * safezoneH;
		};
		class accept: Life_V3_ButtonMenu
		{
			idc = 2400;
			text = "";
			x = 0.386537 * safezoneW + safezoneX;
			y = 0.609973 * safezoneH + safezoneY;
			w = 0.108305 * safezoneW;
			h = 0.0329919 * safezoneH;
		};
		class decline: Life_V3_ButtonMenu
		{
			idc = 2401;
			text = "";
			x = 0.510315 * safezoneW + safezoneX;
			y = 0.609973 * safezoneH + safezoneY;
			w = 0.108305 * safezoneW;
			h = 0.0329919 * safezoneH;
		};
		class RscCombo_2100: RRP_RscCombo
		{
			idc = 2100;

			x = 0.386537 * safezoneW + safezoneX;
			y = 0.565984 * safezoneH + safezoneY;
			w = 0.232083 * safezoneW;
			h = 0.0219946 * safezoneH;
		};
		class RscControlsGroup_2300: RscControlsGroup
		{
			idc = 2300;

			x = 0.386537 * safezoneW + safezoneX;
			y = 0.423019 * safezoneH + safezoneY;
			w = 0.232083 * safezoneW;
			h = 0.131968 * safezoneH;
			class Controls
			{
			};
		};
	};
};