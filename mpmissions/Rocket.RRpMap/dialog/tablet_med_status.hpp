class UnionDialogMedStatus
{
	idd = 39001;
	name = "UnionDialogMedStatus";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
		
	class controlsBackground
	{
		class padImage : RscPicture {
			idc = 39010;
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
	
	class Controls
	{
		class RscTitleText : RscTitle
		{
			colorBackground[] = {1,1,1,0.1};
			idc = -1;
			text = "Меню медика";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};
		
		
		class PlayersList : RscListBox
		{
			idc = 39002;
			text = "";
			
			onLBSelChanged = "call RRPClient_system_medicInfo";
			x = 0.0374988;
			y = 0.16;
			w = 0.449999;
			h = 0.68;
		};
			
		
		class ButtonAccept : RscButtonUC 
		{
			idc = 39003;			
			text = "Принять вызов";
			onButtonClick = "[2] call RRPClient_system_medicSend;";
			colorBackground[] = {0.102,0.643,0.278,1};		
			
			x = 0.5;
			y = 0.16;
			w = 0.462501;
			h = 0.06;
		};
		
		class ButtonDenied : RscButtonUC 
		{
			idc = 39004;			
			text = "Отказать";
			onButtonClick = "[1] call RRPClient_system_medicSend;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			
			x = 0.5;
			y = 0.308;
			w = 0.225;
			h = 0.06;
		};
		
		class ButtonFight : RscButtonUC 
		{
			idc = 39005;			
			text = "Ждите. Идет бой";
			onButtonClick = "[3] call RRPClient_system_medicSend;";
			colorBackground[] = {0.773,0.522,0.031,1};	
			
			x = 0.5;
			y = 0.244;
			w = 0.225;
			h = 0.06;
		};
		
		class ButtonVoenPol : RscButtonUC 
		{
			idc = 39006;			
			text = "Военное положение";
			onButtonClick = "[4] call RRPClient_system_medicSend;";
			colorBackground[] = {0.773,0.522,0.031,1};
			
			x = 0.737499;
			y = 0.244;
			w = 0.225;
			h = 0.06;
		};
		
		
		class ButtonRedZone : RscButtonUC 
		{
			idc = 39007;			
			text = "Красная зона";
			onButtonClick = "[5] call RRPClient_system_medicSend;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};	
			
			x = 0.5;
			y = 0.372;
			w = 0.225;
			h = 0.06;
		};
		
		class ButtonBlack : RscButtonUC 
		{
			idc = 39008;			
			text = "Черный список";
			onButtonClick = "[6] call RRPClient_system_medicSend;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			
			x = 0.737499;
			y = 0.372;
			w = 0.225;
			h = 0.06;
		};
		
		class ButtonWanted : RscButtonUC 
		{
			idc = 39009;			
			text = "Розыск";
			onButtonClick = "[7] call RRPClient_system_medicSend;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			
			x = 0.737499;
			y = 0.308;
			w = 0.225;
			h = 0.06;
		};

		class WantedInfo: RscMapControl
		{
			idc = 39011;
			x = 0.5;
			y = 0.46;
			w = 0.4625;
			h = 0.38;
		};
	};
};