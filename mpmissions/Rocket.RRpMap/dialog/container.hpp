class UnionDialogContainer
{
	idd = 4100;
	name = "UnionDialogContainer";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground
	{
		class main_BG: RRP_background_fade
		{
			idc = -1;
			x = 0.291172 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.517 * safezoneH;
		};	
	};
	
	class Controls
	{
		class HouseWeight: RRP_title
		{
			idc = 4104;
			text = "Управление хранилищем";
			x = 0.291172 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class HouseGear: RRP_RscListBox
		{
			idc = 4102;
			x = 0.310508 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.407 * safezoneH;
		};
		class PlayerGear: RRP_RscListBox
		{
			idc = 4103;
			x = 0.503867 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class HouseEdit: RRP_RscEdit
		{
			idc = 4105;
			text = "1";
			x = 0.310522 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0206179 * safezoneW;
			h = 0.0329987 * safezoneH;
		};
		class PlayerEdit: RRP_RscEdit
		{
			idc = 4106;
			text = "1";
			x = 0.503867 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0310154 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class TakeItem: RRP_btn_blue
		{
			idc = 4109;
			text = "Взять";
			onButtonClick = "[] spawn RRPClient_system_houseTakeItem;";
			x = 0.334636 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0773211 * safezoneW;
			h = 0.0330067 * safezoneH;
		};
		
		class deleteButton : RRP_btn_blue
		{
			idc = 4110;
			text = "Удалить";			
			onButtonClick = "[] spawn RRPClient_system_houseDeleteItem;";
			x = 0.417524 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0773211 * safezoneW;
			h = 0.0330067 * safezoneH;
		};
		class StoreItem: RRP_btn_blue
		{
			idc = 4108;
			text = "Положить";
			onButtonClick = "[] spawn RRPClient_system_houseStoreItem;";
			x = 0.538672 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.15082 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class FilterList: RRP_RscCombo
		{
			idc = 4107;
			onLBSelChanged = "_this call RRPClient_system_containerMenuFilter";
			x = 0.310508 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Close : RRP_btn_exit {
			idc = -1;
			x = 0.687929 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};