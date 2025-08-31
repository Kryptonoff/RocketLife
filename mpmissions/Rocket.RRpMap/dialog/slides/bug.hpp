class BugSlide: SlideTab
{
    idc = 23000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 23001;
        };
		class text: AppRscStructuredText
		{
			idc = 23002;
			x = 0.00517197 * safezoneW;
			y = 0.013214 * safezoneH;
			w = 0.391853 * safezoneW;
			h = 0.209 * safezoneH;
		};
		class themeText: AppRscStructuredText
		{
			idc = 23003;
			x = 0.00517197 * safezoneW;
			y = 0.226614 * safezoneH;
			w = 0.391853 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class themeEdit: AppRscEdit
		{
			idc = 23004;
			x = 0.00517197 * safezoneW;
			y = 0.255214 * safezoneH;
			w = 0.391853 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class MessageEdit: AppRscEditMulti
		{
			idc = 23005;
			x = 0.00517197 * safezoneW;
			y = 0.305814 * safezoneH;
			w = 0.391853 * safezoneW;
			h = 0.2684 * safezoneH;
		};
		class MessageText: AppRscStructuredText
		{
			idc = 23006;
			x = 0.00517197 * safezoneW;
			y = 0.279414 * safezoneH;
			w = 0.391853 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Report: AppTabletButton
		{
			idc = 23007;
			text = "Отправить"; //--- ToDo: Localize;
			x = 0.00517165 * safezoneW;
			y = 0.587414 * safezoneH;
			w = 0.0928206 * safezoneW;
			h = 0.0330014 * safezoneH;
		};
	};
};