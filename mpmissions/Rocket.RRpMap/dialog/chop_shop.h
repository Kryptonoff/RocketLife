class RRPDialogChopShop
{
	idd = 39400;
	name= "RRPDialogChopShop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogChopShop',_this#0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogChopShop',displayNull]; false call RRPClient_gui_util_blur;";

	
	class controlsBackground
	{
		class Title : RRP_title
		{
			idc = -1;
			x = 0.187501;
			y = 0.14;
			w = 0.574999;
			h = 0.06;
			//[0.187501,0.14,0.574999,0.06]
		};

		class MainBackGround : RRP_background
		{
			idc = -1;
			x = 0.187501;
			y = 0.2;
			w = 0.624999;
			h = 0.68;
			//[0.187501,0.2,0.625001,0.66]
		};
		class priceInfo : RscStructuredText
		{
			idc = 39401;
			text = "";
			x = 0.2125;
			y = 0.7;
			w = 0.3625;
			h = 0.06;
			//[0.2125,0.7,0.3625,0.06]	
		};
		class priceOwnInfo : RscStructuredText
		{
			idc = 39403;
			text = "";
			x = 0.212499;
			y = 0.62;
			w = 0.362499;
			h = 0.06;
			//[0.212499,0.62,0.362499,0.06]
		};
		
		class BtnClose : RRP_btn_exit
		{
			idc = -1;
			onButtonClick = "closeDialog 0";
			x = 0.7625;
			y = 0.14;
			w = 0.05;
			h = 0.06;
			//[0.7625,0.14,0.05,0.06]
		};
	};

	class controls
	{
		class vehicleList : RscListBox
		{
			idc = 39402;
			onLBSelChanged = "['onLbSelChanged',_this] call RRPClient_chopShop_action";
			x = 0.212499; y = 0.22;
			w = 0.574999; h = 0.38;
			//[0.212499,0.22,0.574999,0.38]
		};

		class BtnSell : RRP_btn_blue
		{
			idc = 39405;
			text = "Продать";
			onButtonclick = "['sell'] spawn RRPClient_chopShop_action;";
			x = 0.5125; y = 0.78;
			w = 0.275; h = 0.06;
			//[0.5125,0.78,0.275,0.06]
		};
		class BtnOwn : RRP_btn_blue
		{
			idc = 39404;
			text = "Перебить";
			onButtonclick = "['own'] spawn RRPClient_chopShop_action;";
			x = 0.2125; y = 0.78;
			w = 0.275; h = 0.06;
			//[0.2125,0.78,0.275,0.06]
		};
	};
};