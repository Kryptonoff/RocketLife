class UnionDialogLicenseShop {
	idd = 5546;
	name= "UnionDialogLicenseShop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur";
	onUnload = "false call RRPClient_gui_util_blur";

	class controlsBackground
	{
		class MainBackground : RRP_background {			
			idc = -1;
			
			x = 0.310766 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.3798 * safezoneW;
			h = 0.448 * safezoneH;
		};
	};

	class controls { 
		class Title: RRP_title {
			idc = -1;
			text = "Магазин лицензий";
			x = 0.310766 * safezoneW + safezoneX;
			y = 0.21224 * safezoneH + safezoneY;
			w = 0.365625 * safezoneW;
			h = 0.022 * safezoneH;	
		
		};
		class Cash : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
			
		};
		class CloseImage : RRP_btn_exit_text {
			idc = -1;			
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.212148 * safezoneH + safezoneY;
			w = 0.01535 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Закрыть";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.673249 * safezoneW + safezoneX;
			y = 0.2032 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		class ShopLic: RRP_RscListBox {
			idc = 55126;
			x = 0.313626 * safezoneW + safezoneX;
			y = 0.2396 * safezoneH + safezoneY;
			w = 0.186375 * safezoneW;
			h = 0.4032 * safezoneH;
		};
		class MyLic: RRP_RscListBox {
			idc = 55131;
			x = 0.502623 * safezoneW + safezoneX;
			y = 0.2396 * safezoneH + safezoneY;
			w = 0.185061 * safezoneW;
			h = 0.4368 * safezoneH;
		};
		class buybutton: RRP_btn_blue {
			idc = -1;
			text = "Купить";
			onButtonClick = "call RRPClient_system_buyLicense";
			x = 0.313626 * safezoneW + safezoneX;
			y = 0.6484 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.028 * safezoneH;			
		};
	};
};