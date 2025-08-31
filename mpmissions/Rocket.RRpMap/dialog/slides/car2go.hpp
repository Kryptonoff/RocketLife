class Car2GoSlide: SlideTab
{
    idc = 21000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 21001;
        };
		class rentCar: AppTabletButton
		{
			idc = 21002;
			text = "Начать аренду"; //--- ToDo: Localize;
			onButtonClick = "[] spawn RRPClient_c2g_order";
			x = 0.187676 * safezoneW;
			y = 0.48 * safezoneH;
			w = 0.211875 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class rules: AppRscStructuredText
		{
			idc = 21003;
			x = 0.00514498 * safezoneW;
			y = 0.154 * safezoneH;
			w = 0.175774 * safezoneW;
			h = 0.319 * safezoneH;
		};
		class showZones: AppTabletButton
		{
			idc = 21004;
			text = "Показать зоны парковки"; //--- ToDo: Localize;
			onButtonClick = "_this call RRPClient_c2g_showZones";
			x = 0.005144 * safezoneW;
			y = 0.121 * safezoneH;
			w = 0.175774 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class stoprent: AppTabletButton
		{
			idc = 21005;
			text = "Остановить аренду"; //--- ToDo: Localize;
			onButtonClick = "[] spawn RRPClient_c2g_stopRequest";
			x = 0.005144 * safezoneW;
			y = 0.077 * safezoneH;
			w = 0.175774 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class map: AppRscMap
		{
			idc = 21006;
			scaleMin = 0.03;
			scaleMax = 0.6;
			scaleDefault = 0.3;
			x = 0.6 * safezoneW;
			y = 0.03 * safezoneH;
			w = 0.211394 * safezoneW;
			h = 0.3652 * safezoneH;
		};
		class CarsList: AppRscCombo
		{
			idc = 21007;
			onLBSelChanged = "_this call RRPClient_c2g_selectCar";
			x = 0.187676 * safezoneW;
			y = 0.4466 * safezoneH;
			w = 0.211875 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};
