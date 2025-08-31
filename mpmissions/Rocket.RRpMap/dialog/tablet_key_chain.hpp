class UnionDialogKeyManagement {
	idd = 2700;
	name= "UnionDialogKeyManagement";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn RRPClient_system_keyMenu; true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class padImage : RscPicture {
			idc = 2704;
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
			colorBackground[] = {1,1,1,0.2};
			idc = -1;
			text = "Ключи - Список ключей";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};
		
		class KeyChainList : RscListBox 
		{
			idc = 2701;
			text = "";
			
			x = 0.0374988;
			y = 0.16;
			w = 0.925;
			h = 0.4;
		};		
		
		class NearPlayers : RscCombo {
		
			idc = 2702;
		
			x = 0.0374988;
			y = 0.58;
			w = 0.2625;
			h = 0.04;
		
		};
		
		class DropKey : RscButtonMenu {
			idc = -1;			
			text = "Выбросить ключ";
			onButtonClick = "call RRPClient_system_keyDrop";
			
			x = 0.737499;
			y = 0.58;
			w = 0.225;
			h = 0.04;
		};
		
		class GiveKey : RscButtonMenu {
			idc = 2703;			
			text = "Передать ключ";			
			onButtonClick = "call RRPClient_system_keyGive";
			
			x = 0.312501;
			y = 0.58;
			w = 0.2625;
			h = 0.04;
		};
	};
};