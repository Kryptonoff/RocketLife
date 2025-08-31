class UnionDialogTrunk
{
	idd = 3500;
	name = "UnionDialogTrunk";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground
	{
		class backgrnd: RRP_background
		{
			idc = 2400;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.517 * safezoneH;
		};
	};
	
	class Controls
	{
		class main_title: RRP_title
		{
			idc = 3501;
			text = "Инвентарь";
			x = 0.293879 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.39832 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class VehicleINV: RscFrame
		{
			idc = -1;
			text = "Хранилище";
			sizeEx = 0.03;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class PlayerFrame: RscFrame
		{
			idc = -1;
			text = "Ваш инвентарь";
			sizeEx = 0.03;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class PlayerGear : RRP_RscListBox
		{
			idc = 3503;
			text = "";
			x = 0.510313 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.363 * safezoneH;
		};
		class TrunkGear : RRP_RscListBox
		{
			idc = 3502;
			text = "";
			x = 0.304063 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.363 * safezoneH;
		};
		class TrunkEdit : RRP_RscEdit
		{
			idc = 3505;
			text = "1";	
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class TakeAllItems : RRP_btn_blue
		{
			idc = -1;
			text = "Взять все";			
			onButtonClick = "[true] call RRPClient_containers_takeItems;";
			x = 0.417499 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			style="0x02";
			class Attributes
			{
				align="center";
			};
		};
		class TakeItem : RRP_btn_blue
		{
			idc = -1;
			text = "Взять";			
			onButtonClick = "[false] call RRPClient_containers_takeItems;";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			style="0x02";
			class Attributes
			{
				align="center";
			};
		};
		class StoreAllItems : RRP_btn_blue
		{
			idc = -1;
			text = "Положить все";			
			onButtonClick = "[true] call RRPClient_system_vehStoreItem;";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			style="0x02";
			class Attributes
			{
				align="center";
			};
		};
		class StoreItem : RRP_btn_blue
		{
			idc = -1;
			text = "Положить";			
			onButtonClick = "[false] call RRPClient_system_vehStoreItem;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			style="0x02";
			class Attributes
			{
				align="center";
			};
		};
		class PlayerEdit : RRP_RscEdit
		{
			idc = 3506;
			text = "1";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class message: RRP_title
		{
			idc = 3504;
			text = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class CloseImage : RRP_btn_exit_text {
			idc = -1;
			x = 0.691039 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0150782 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};