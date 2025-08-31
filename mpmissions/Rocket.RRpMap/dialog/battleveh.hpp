class UnionDialogBattleVeh {
	idd = 5900;
	name= "UnionDialogBattleVeh";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.3724 * safezoneH;
		};
	};
	
	class controls {
		class Title : RRP_title {			
			idc = 5901;
			text = "Боевая техника";
			x = 0.39474 * safezoneW + safezoneX;
			y = 0.275704 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class CloseImage : RRP_btn_exit {
			idc = -1;
			x = 0.578854 * safezoneW + safezoneX;
			y = 0.275704 * safezoneH + safezoneY;
			w = 0.026 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Vehlist : RRP_RscListBox 
		{
			idc = 5902;
			text = "";	
			x = 0.398934 * safezoneW + safezoneX;
			y = 0.3236 * safezoneH + safezoneY;
			w = 0.202124 * safezoneW;
			h = 0.322 * safezoneH;
		};	

		class ButtonGetVeh : RRP_btn_blue
		{
			idc = -1;
			text = "Получить технику";			
			onButtonClick = "[] spawn RRPClient_system_getCombatVehicle";
			
			x = 0.397997 * safezoneW + safezoneX;
			y = 0.650978 * safezoneH + safezoneY;
			w = 0.203437 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	};
};