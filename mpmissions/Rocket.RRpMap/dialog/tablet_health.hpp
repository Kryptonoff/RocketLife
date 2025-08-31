class UnionDialogHealth {
	idd = 3600;
	name= "UnionDialogHealth";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class padImage : RscPicture {
			idc = 3602;
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
			idc = 3601;
			text = "Здоровье игрока";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};	
		
		class HeadImage:RscPicture {
			idc = 3611;
			text = "";
			
			x = 0.0374988;
			y = 0.2;
			w = 0.462501;
			h = 0.58;
		};
		
		class BodyImage:RscPicture {
			idc = 3612;
			text = "\rimas_pack\pictures\health\body1.paa";
			
			x = 0.0374988;
			y = 0.2;
			w = 0.462501;
			h = 0.58;
		};	
		
		class HandsImage:RscPicture {
			idc = 3613;
			text = "\rimas_pack\pictures\health\hands1.paa";
			
			x = 0.0374988;
			y = 0.2;
			w = 0.462501;
			h = 0.58;
		};
		
		class LegsImage:RscPicture {
			idc = 3614;
			text = "\rimas_pack\pictures\health\legs1.paa";
			
			x = 0.0374988;
			y = 0.2;
			w = 0.462501;
			h = 0.58;
		};
		
		class HeadButton: RscPictureButtonMenu
		{
			idc = 3621;
			text = "";	
			onButtonClick = "[""head""] spawn RRPClient_system_healPart;";
			tooltip = "Лечить раны на голове";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.221221;
			y = 0.2;
			w = 0.092538;
			h = 0.0901009;
		};
		
		class BodyButton: RscPictureButtonMenu
		{
			idc = 3622;
			text = "";	
			onButtonClick = "[""body""] spawn RRPClient_system_healPart;";
			tooltip = "Лечить раны на теле";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.214924;
			y = 0.296633;
			w = 0.102614;
			h = 0.291785;
		};
		
		class LefHandButton: RscPictureButtonMenu
		{
			idc = 3623;
			text = "";	
			onButtonClick = "[""hands""] spawn RRPClient_system_healPart;";
			tooltip = "Лечить раны на руках";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.32878;
			y = 0.358316;
			w = 0.0624999;
			h = 0.2;
		};
		
		class RightHandButton: RscPictureButtonMenu
		{
			idc = 3624;
			text = "";	
			onButtonClick = "[""hands""] spawn RRPClient_system_healPart;";
			tooltip = "Лечить раны на руках";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.149999;
			y = 0.36;
			w = 0.0550379;
			h = 0.2;
		};
		
		class LegsButton: RscPictureButtonMenu
		{
			idc = 3625;
			text = "";	
			onButtonClick = "[""legs""] spawn RRPClient_system_healPart;";
			tooltip = "Лечить раны на ногах";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.199999;
			y = 0.6;
			w = 0.1375;
			h = 0.18;
		};		
		
		class HealInfo:RscStructuredText {
			idc = 3615;
			text = "";		
			sizeEx = 0.02;
			colorBackground[] = {0, 0, 0, 0};			
			
			x = 0.512499;
			y = 0.16;
			w = 0.449999;
			h = 0.68;
		};
		
	};
};