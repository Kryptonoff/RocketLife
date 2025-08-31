class UnionDialogGov {
	idd = 3200;
	name= "UnionDialogGov";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class padImage : RscPicture {
			idc = 3204;
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
	
	class controls {
	
		class Title : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "Правительство Алтиса";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.4875;
			h = 0.04;
		};

		class PricesTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "Цены";
			
			x = 0.537498;
			y = 0.1;
			w = 0.425;
			h = 0.04;
		};
		
		class BankBalance : RscStructuredText
		{
			idc = 3202;			
			text = "";
			sizeEx = 0.020;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.0374988;
			y = 0.16;
			w = 0.4875;
			h = 0.62;
		};

		class PricesList : RscListBox
		{
			idc = 3207;		
			
			x = 0.537501;
			y = 0.16;
			w = 0.425;
			h = 0.68;
		};		
		class BankButton : RscButtonMenu 
		{
			idc = 3203;
			text = "Казна";
			onButtonClick = "call RRPClient_system_openGovBankMenu";
			
			x = 0.2875;
			y = 0.8;
			w = 0.2375;
			h = 0.04;
		};	
		
		/*	class BankButtonREB : RscButtonMenu {
			idc = 3205;
			text = "Меню";
			onButtonClick = "call RRPClient_system_commandante";
			
			x = 0.2875;
			y = 0.8;
			w = 0.2375;
			h = 0.04;
		};	*/
		
	};
};