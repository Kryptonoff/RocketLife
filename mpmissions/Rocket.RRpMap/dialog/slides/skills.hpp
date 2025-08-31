class SkillSlide: SlideTab
{
    idc = 29000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class listGroup: RscControlsGroup
        {
            idc = 29001;
			x = 0.00413053 * safezoneW;
			y = 0.00690812 * safezoneH;
			w = 0.260886 * safezoneW;
			h = 0.589439 * safezoneH;
			class Controls
			{
			};
        };
        class textGroup: RscControlsGroupNoScrollbars
        {
            idc = 29002;
			x = 0.271229 * safezoneW;
			y = 0.239751 * safezoneH;
			w = 0.128895 * safezoneW;
			h = 0.347518 * safezoneH;
            class controls
            {
                class description: AppRscStructuredText
				{
					idc = 29101;
					x = 0.00515626 * safezoneW;
					y = 0.0109968 * safezoneH;
					w = 0.118584 * safezoneW;
					h = 0.230925 * safezoneH;
				};
            };
        };
        class SkillPicture: RscPictureKeepAspect
        {
            idc = 29003;
            text = "\a3\ui_f\data\gui\rsc\rscdisplaymain\spotlight_1_apex_ca.paa";
            x = 0.271201 * safezoneW;
			y = 0.00890366 * safezoneH;
			w = 0.128895 * safezoneW;
			h = 0.186939 * safezoneH;
        };
        class SkillText: AppRscStructuredText
        {
            idc = 29004;
			text = "Навыки"; //--- ToDo: Localize;
			x = 0.27123 * safezoneW;
			y = 0.202367 * safezoneH;
			w = 0.128895 * safezoneW;
			h = 0.0329893 * safezoneH;
        };


        class back: MainMenuButton
        {
            idc = 29005;
        };
	};
};