class MedicSlide: SlideTab
{
    idc = 34000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 34001;
        };
		class PlayersList: AppRscListbox
		{
			idc = 34002;
			onLBSelChanged = "_this call RRPClient_system_medicInfo";
			x = 0.0103141 * safezoneW;
			y = 0.0682347 * safezoneH;
			w = 0.185639 * safezoneW;
			h = 0.450963 * safezoneH;
		};
		class ButtonAccept: AppTabletButton
		{
			idc = 34003;
			text = "Принять вызов";
			onButtonClick = "[2] call RRPClient_system_medicSend;";
			x = 0.206267 * safezoneW;
			y = 0.0682347 * safezoneH;
			w = 0.190796 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class ButtonDenied: AppTabletButton
		{
			idc = 34004;
			text = "Отказать";
			onButtonClick = "[1] call RRPClient_system_medicSend;";
			x = 0.206267 * safezoneW;
			y = 0.156227 * safezoneH;
			w = 0.0928196 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class ButtonFight: AppTabletButton
		{
			idc = 34005;
			text = "Ждите. Идет бой";
			onButtonClick = "[3] call RRPClient_system_medicSend;";
			x = 0.206267 * safezoneW;
			y = 0.112231 * safezoneH;
			w = 0.0928196 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class ButtonVoenPol: AppTabletButton
		{
			idc = 34006;
			text = "Военное положение";
			onButtonClick = "[4] call RRPClient_system_medicSend;";
			x = 0.304243 * safezoneW;
			y = 0.112231 * safezoneH;
			w = 0.0928196 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class ButtonRedZone: AppTabletButton
		{
			idc = 34007;
			text = "Красная зона";
			onButtonClick = "[5] call RRPClient_system_medicSend;";
			x = 0.206267 * safezoneW;
			y = 0.200224 * safezoneH;
			w = 0.0928196 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class ButtonBlack: AppTabletButton
		{
			idc = 34008;
			text = "Черный список";
			onButtonClick = "[6] call RRPClient_system_medicSend;";
			x = 0.304243 * safezoneW;
			y = 0.200224 * safezoneH;
			w = 0.0928196 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class ButtonWanted: AppTabletButton
		{
			idc = 34009;
			text = "Розыск";
			onButtonClick = "[7] call RRPClient_system_medicSend;";
			x = 0.304243 * safezoneW;
			y = 0.156227 * safezoneH;
			w = 0.0928196 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class Map: AppRscMap
		{
			idc = 34011;
			// 0.3 * safeZoneW, 0.198 * safeZoneH, 0.190796 * safeZoneW, 0.274978 * safeZoneH
			x=0.3 * safeZoneW;
			y=0.198 * safeZoneH;
			w=0.190796 * safeZoneW;
			h=0.274978 * safeZoneH;
		};
	};
};