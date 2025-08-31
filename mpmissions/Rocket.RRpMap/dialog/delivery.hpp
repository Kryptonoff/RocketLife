class UnionDialogDeliver {
	idd = 4300;
	name= "UnionDialogDeliver";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call RRPClient_gui_Tiles";

	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};
		class Tiles: RscTiles {};
		
		class Title : RscTitle {			
			idc = 4301;
			text = "";
			
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.033 * safezoneH;
			
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls {

		class List : RscListBox 
		{
			idc = 4302;
			text = "";
			
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.198 * safezoneH;
			
			colorBackground[] = {0,0,0,0.8};
		};

		class GetButton : RscButtonUC {
			idc = 4303;			
			text = "Взять заказ";
			onButtonClick = "[] spawn RRPClient_delivery_getMission";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};		
				
		class DoneButton : RscButtonUC {
			idc = 4304;			
			text = "Сдать заказ";
			onButtonClick = "[] spawn RRPClient_delivery_finishMission";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class CloseButton : RscButtonUC {
			idc = -1;			
			text = "Закрыть";
			onButtonClick = "closedialog 0;";
			
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
class RocketDialogDeliver {
	idd = 4300;
	name= "RocketDialogDeliver";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.25 };
		};
		class Tiles: RscTiles {};
		
		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.4088 * safezoneH;
		};
	};
	
	class controls {
		class Title : RRP_title {			
			idc = 4301;
			text = "";
			x = 0.395 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\rimas_gui\data\v3\button_close.paa";
			
			x = 0.585312 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.585312 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class Deposlist : RRP_RscListBox 
		{
			idc = 4302;
			text = "";	
			
			x = 0.398934 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.3616 * safezoneH;
		};	
		
		class ButtonOrder : RscButtonMenu
		{
			idc = -1;
			text = "Взять заказ";			
			onButtonClick = "[] call RRPClient_dlv_getMission";
			
			x = 0.397997 * safezoneW + safezoneX;
			y = 0.690178 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	};
};
class RocketDialogGasDeliver {
	idd = 8200;
	name= "RocketDialogGasDeliver";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call RRPClient_gui_Tiles";
	
	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.25 };
		};
		class Tiles: RscTiles {};
		
		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.4088 * safezoneH;
		};
	};
	
	class controls {
		class Title : RRP_title {			
			idc = 8201;
			text = "Взять заказ на доставку топлива";
			x = 0.395 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\rimas_gui\data\v3\button_close.paa";
			
			x = 0.585312 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.585312 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class Stationslist : RRP_RscListBox 
		{
			idc = 8202;
			text = "";	
			
			x = 0.398934 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.3616 * safezoneH;
		};	
		
		class ButtonOrder : RscButtonMenu
		{
			idc = -1;
			text = "Взять заказ";			
			onButtonClick = "[] call RRPClient_gas_getMission";
			
			x = 0.397997 * safezoneW + safezoneX;
			y = 0.690178 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	};
};