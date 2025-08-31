class KeysSlide: SlideTab
{
    idc = 30000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class KeyList: AppRscListbox
		{
			idc = 3002;
			x = 0.0103141 * safezoneW;
			y = 0.0154639 * safezoneH;
			w = 0.304242 * safezoneW;
			h = 0.558709 * safezoneH;
		};
		class DropKeyButton: AppTabletButton
		{
			idc = 3003;
			text = "Выбросить ключ"; //--- ToDo: Localize;
			onButtonClick = "call RRPClient_system_keyDrop";
			x = 0.319713 * safezoneW;
			y = 0.288219 * safezoneH;
			w = 0.0773497 * safezoneW;
			h = 0.0329946 * safezoneH;
		};
		class GiveKeyButton: AppTabletButton
		{
			idc = 3004;
			text = "Передать ключ"; //--- ToDo: Localize;
			onButtonClick = "call RRPClient_system_keyGive";
			x = 0.319713 * safezoneW;
			y = 0.0506574 * safezoneH;
			w = 0.0773497 * safezoneW;
			h = 0.0329946 * safezoneH;
		};
		class NearPlayerList: AppRscCombo
		{
			idc = 3005;
			x = 0.319713 * safezoneW;
			y = 0.0176638 * safezoneH;
			w = 0.0773497 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
        class back: MainMenuButton
        {
            idc = 30001;
        };
	};
};