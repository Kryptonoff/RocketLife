class WallpapersSlide: SlideTab
{
	idc = 35100;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class wallpapersGroup: RscControlsGroup
		{
			idc = 35102;
			// [0.402164 * safezoneW,0.5808 * safezoneH]
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.402164 * safezoneW;
			h = 0.5808 * safezoneH;
			class Controls
			{
			};
		};
		class back: MainMenuButton
		{
			idc = 35101;
			onButtonClick = "['settings',0] call RRPClient_tablet_slide";
		};
	};
};

class PassportsSlide: SlideTab
{
	idc = 35400;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class PassportsGroup: RscControlsGroup
		{
			idc = 35402;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.402164 * safezoneW;
			h = 0.5808 * safezoneH;
			class Controls
			{
			};
		};
		class back: MainMenuButton
		{
			idc = 35401;
			onButtonClick = "['settings',0] call RRPClient_tablet_slide";
		};
	};
};