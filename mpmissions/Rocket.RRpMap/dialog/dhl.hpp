class UnionDialogDhl
{
	idd = 5800;
	name="UnionDialogDhl";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground
	{
		class MainBackground : RRP_background {			
			idc = -1;
			x = 0.368749 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.224 * safezoneH;
		};
	};
	
	class controls
	{
		class Title : RRP_title
		{
			idc = -1;
			text = "DHL доставка";
			
			x = 0.368722 * safezoneW + safezoneX;
			y = 0.28506 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class CloseBTN : RRP_btn_exit {
			idc = -1;
			x = 0.590729 * safezoneW + safezoneX;
			y = 0.285556 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DHLInfo : RRP_RscStructuredText
		{
			idc = 5801;
			text = "";
			
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.112 * safezoneH;
		};

		class DHLSTart : RRP_RscCombo	{
			idc = 5802;
			onLBSelChanged = "_this call RRPClient_dhl_menuUpdate";
			
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class DHLFinish : RRP_RscCombo	{
			idc = 5803;
			onLBSelChanged = "_this call RRPClient_dhl_menuUpdate";
			
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class DHLMoney : RRP_RscStructuredText
		{
			idc = 5804;
			text = "";
			
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.111562 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class DHKTakeOrder : RRP_btn_blue
		{
			idc = -1;
			text = "Взять заказ";
			onButtonClick = "call RRPClient_dhl_orderTake";
			
			x = 0.493091 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.111875 * safezoneW;
			h = 0.033 * safezoneH;
			//["0.493091 * safezoneW + safezoneX","0.49714 * safezoneH + safezoneY","0.111875 * safezoneW","0.0357777 * safezoneH"]
		};
	};
};