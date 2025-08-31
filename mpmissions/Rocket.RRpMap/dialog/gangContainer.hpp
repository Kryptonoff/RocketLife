class RRPDialogGangContainer
{
	idd = 4800;
	name = "RRPDialogGangContainer";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogGangContainer',_this#0];";
	onUnload = "uiNamespace setVariable ['RRPDialogGangContainer',displayNull];";
	
	class controlsBackground
	
	{
		class main_BG: RRP_background_fade
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};	
		class HouseWeight : RRP_title
		{
			idc = 4804;
			style = 1;
			text = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	
	class Controls
	{
		class HouseGear : RRP_RscListBox
		{
			idc = 4802;
			text = "";
			
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.385 * safezoneH;
		};
		
		class frameHgear : RscFrame {
			idc = -1;
			text = "Хранилище";
			sizeEx = 0.033;
			x = 0.298905 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class framePgear : RscFrame {
			idc = -1;
			sizeEx = 0.033;
			text = "Ваш инвентарь";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.451 * safezoneH;
		};
	
		class PlayerGear : RRP_RscListBox
		{
			idc = 4803;
			text = "";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.418 * safezoneH;
		};
		
		class HouseEdit : RRP_RscEdit
		{
			idc = 4805;
			text = "1";
			sizeEx = 0.030;
			x = 0.299009 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class PlayerEdit : RRP_RscEdit
		{
			idc = 4806;
			text = "1";
			sizeEx = 0.030;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0310154 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class TakeItem : RRP_btn_blue
		{
			idc = 4809;
			text = "Взять";
			onButtonClick = "['request'] call RRPClient_containers_gang_take;";
			x = 0.340569 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class StoreItem : RRP_btn_blue
		{
			idc = 4808;
			text = "Положить";
			onButtonClick = "['request'] call RRPClient_containers_gang_store;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.160246 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class deleteItem : RRP_btn_red
		{
			idc = 4808;
			text = "Удалить";
			onButtonClick = "['request'] call RRPClient_containers_gang_delete";
			x = 0.422657 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Title : RRP_title {			
			idc = -1;
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonClose : RRP_btn_exit_text {
			idc = -1;			
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class FilterList : RRP_RscCombo
		{
			idc = 4807;
			onLBSelChanged = "_this call RRPClient_containers_gang_filterChanged";
			x = 0.299422 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};