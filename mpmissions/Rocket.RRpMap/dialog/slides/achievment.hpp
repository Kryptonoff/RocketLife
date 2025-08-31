class AchievmentSlide: SlideTab
{
    idc = 28000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class achGroup: RscControlsGroup
		{
			idc = 28001;
			// [0.00722291 * safezoneW,0.12098 * safezoneH,0.389817 * safezoneW,0.466332 * safezoneH]
			x = 0.00722291 * safezoneW;
			y = 0.12098 * safezoneH;
			w = 0.389817 * safezoneW;
			h = 0.466332 * safezoneH;
			class Controls
			{
			};
		};
        class mainGroup: RscControlsGroup
		{
			show = "true";
			idc = 28002;
			x = 0.00722291 * safezoneW;
			y = 0.0109984 * safezoneH;
			w = 0.388786 * safezoneW;
			h = 0.101183 * safezoneH;
			class Controls
			{
				class profileName: AppRscStructuredText
				{
					idc = 28003;
                    x = 0.00412509 * safezoneW;
                    y = 0.00659922 * safezoneH;
                    w = 0.182531 * safezoneW;
                    h = 0.0901848 * safezoneH;
				};
			};
		};
        class back: MainMenuButton
        {
            idc = 28001;
        };
	};
};