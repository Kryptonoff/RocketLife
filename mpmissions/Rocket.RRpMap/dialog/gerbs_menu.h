class RRPDialogHerbalist {
	idd = 9900;
	name= "GerbsMenu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad="uiNamespace setVariable ['RRPDialogHerbalist',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogHerbalist', displayNull]; false call RRPClient_gui_util_blur;";


	class controlsBackground {
		class backgrnd: RRP_background_fade
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.517 * safezoneH;
		};
	};


	class controls {

		class title: RRP_title
		{
			idc = -1;
			text = "Сбор растений";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class button_startCollectGerbs: RRP_btn_green
		{
			idc = 9902;
			text = "Начать сбор";
			x = 0.48969 * safezoneW + safezoneX;
			y = 0.653968 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class description_gerbs: RRP_RscStructuredText
		{
			idc = 9903;
			x = 0.48969 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.206206 * safezoneW;
			h = 0.373923 * safezoneH;
		};
		class Image_gerbs: RscPicture
		{
			idc = 9904;
			text = "";
			x = 0.324104 * safezoneW + safezoneX;
			y = 0.333038 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.29 * safezoneH;
		};
		class Gerb_title_name: RRP_title
		{
			colorBackground[]={1,1,1,0};
			idc = 9905;
			text = "";
			style = 2;
			sizeEx = 0.07;
			x = 0.304104 * safezoneW + safezoneX;
			y = 0.269047 * safezoneH + safezoneY;
			w = 0.175275 * safezoneW;
			h = 0.0329932 * safezoneH;
			class Attributes
			{
				align = "center";
			};
		};
		class ExitBTN: RscPictureButtonMenu
		{
			idc = 2501;
			text = "";
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ExitPct: RRP_btn_exit_text
		{
			idc = -1;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
