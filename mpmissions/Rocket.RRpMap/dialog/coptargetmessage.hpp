class UnionDialogCopTargetMessage {
	idd = 7000;
	name= "UnionDialogCopTargetMessage";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.401563 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.378 * safezoneH;
		};
	};
	
	class controls {
		class Title : RRP_title {			
			idc = -1;
			text = "Сообщение для машины";
			x = 0.401516 * safezoneW + safezoneX;
			y = 0.32708 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class CloseImage : RRP_btn_exit {
			idc = -1;		
			x = 0.561354 * safezoneW + safezoneX;
			y = 0.32708 * safezoneH + safezoneY;
			w = 0.0242 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Закрыть";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.566936 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class targetInfo: RRP_RscStructuredText
		{
			idc = 7001;			
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.3712 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.1176 * safezoneH;
		};
		
		class b1: RRP_btn_blue
		{
			idc = 7002;
			text = "";  
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;			
		};

		class b2: RRP_btn_blue
		{
			idc = 7003;
			text = "";  
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.5336 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b3: RRP_btn_blue
		{
			idc = 7004;
			text = "";  
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.5672 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b4: RRP_btn_blue
		{
			idc = 7005;
			text = "";  
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.6008 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b5: RRP_btn_blue
		{
			idc = 7006;
			text = "";  
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.6344 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b6: RRP_btn_blue
		{
			idc = 7007;
			text = "";  
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class b7: RRP_btn_blue
		{
			idc = 7008;
			text = "";  
			x = 0.408125 * safezoneW + safezoneX;
			y = 0.7016 * safezoneH + safezoneY;
			w = 0.170625 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};