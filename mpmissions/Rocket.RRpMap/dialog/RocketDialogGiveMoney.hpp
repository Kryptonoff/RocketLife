class RocketDialogGiveMoney
{
	idd = 9800;
	name = "RocketDialogGiveMoney";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {

		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.43298 * safezoneW + safezoneX;
			y = 0.401018 * safezoneH + safezoneY;
			w = 0.123729 * safezoneW;
			h = 0.131977 * safezoneH;
		};
	};
	
	class controls 
	{
		class Title : RRP_title {			
			idc = 5201;
			text = "";
			x = 0.43298 * safezoneW + safezoneX;
			y = 0.379021 * safezoneH + safezoneY;
			w = 0.123729 * safezoneW;
			h = 0.0219961 * safezoneH;
		};

		class Closebrn : RRP_btn_exit_text {
			idc = -1;
			x = 0.541243 * safezoneW + safezoneX;
			y = 0.379021 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0220001 * safezoneH;
		};

		class t_cost: RscText {
			idc = -1;
			text = "Сумма:";  
			x = 0.443291 * safezoneW + safezoneX;
			y = 0.423014 * safezoneH + safezoneY;
			w = 0.0459375 * safezoneW;
			h = 0.0279999 * safezoneH;			
		};
		
		class moneyEdit : RRP_RscEdit {
			idc = 5202;			
			text = "0";

			x = 0.5 * safezoneW + safezoneX;
			y = 0.423014 * safezoneH + safezoneY;
			w = 0.0524999 * safezoneW;
			h = 0.0279999 * safezoneH;
		};

		class giveMoney: RRP_btn_blue {
			idc = -1;
			text = "Передать";			
			onButtonClick = "call RRPClient_system_giveMoney";
			x = 0.453602 * safezoneW + safezoneX;
			y = 0.489002 * safezoneH + safezoneY;
			w = 0.0853124 * safezoneW;
			h = 0.0279999 * safezoneH;
		};
	};
};
