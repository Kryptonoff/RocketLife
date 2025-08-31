class RRPDialogLottery
{
	idd = 85550;
	onLoad = "uiNamespace setVariable ['RRPDialogLottery',_this#0]; true call RRPClient_gui_util_blur";
	onUnload =  "uiNamespace setVariable ['RRPDialogLottery',displayNull]; false call RRPClient_gui_util_blur";
	class controlsBackground
	{
		class background: RRP_background
		{
			idc = -1;
			x = 0.34492 * safezoneW + safezoneX;
			y = 0.290975 * safezoneH + safezoneY;
			w = 0.315006 * safezoneW;
			h = 0.40705 * safezoneH;
		};
		class title: RRP_title
		{
			idc = -1;
			text = "Лотерея";  
			x = 0.34492 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscPicture_1200: RRP_btn_exit_text
		{
			idc = -1;
			x = 0.644375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls
	{
		class RscControlsGroup_2300: RscControlsGroupNoScrollbars
		{
			idc = 85551;
			x = 0.349766 * safezoneW + safezoneX;
			y = 0.301976 * safezoneH + safezoneY;
			w = 0.305314 * safezoneW;
			h = 0.286035 * safezoneH;
			class Controls
			{
				class descr: RRP_RscStructuredText
				{
					idc = 85552;
					x = 0.00484602 * safezoneW;
					y = 0.011001 * safezoneH;
					w = 0.295621 * safezoneW;
					h = 0.264032 * safezoneH;
				};
			};
		};
		class box: RRP_RscEdit
		{
			idc = 85553;
			x = 0.436999 * safezoneW + safezoneX;
			y = 0.599012 * safezoneH + safezoneY;
			w = 0.135695 * safezoneW;
			h = 0.033004 * safezoneH;
			text = "";
		};
		class buy: RRP_btn_blue
		{
			idc = 85554;
			action = "[2] call RRPClient_lottery_checklotteryinput";
			text = "Купить";
			x = 0.427306 * safezoneW + safezoneX;
			y = 0.643017 * safezoneH + safezoneY;
			w = 0.15508 * safezoneW;
			h = 0.0440054 * safezoneH;
		};
	};
};
