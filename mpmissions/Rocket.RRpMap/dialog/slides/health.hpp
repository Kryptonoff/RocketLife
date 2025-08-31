class HealthSlide: SlideTab
{
    idc = 27000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class HeadImage: RscPicture
		{
			idc = 3611;
			text = "\rimas_pack\pictures\health\head1.paa";
			x = 0.0154696 * safezoneW;
			y = 0.110005 * safezoneH;
			w = 0.190798 * safezoneW;
			h = 0.319013 * safezoneH;
		};
		class BodyImage: RscPicture
		{
			idc = 3612;
			text = "\rimas_pack\pictures\health\body1.paa";
			x = 0.0154696 * safezoneW;
			y = 0.110005 * safezoneH;
			w = 0.190798 * safezoneW;
			h = 0.319013 * safezoneH;
		};
		class HandsImage: RscPicture
		{
			idc = 3613;
			text = "\rimas_pack\pictures\health\hands1.paa";
			x = 0.0154696 * safezoneW;
			y = 0.110005 * safezoneH;
			w = 0.190798 * safezoneW;
			h = 0.319013 * safezoneH;
		};
		class LegsImage: RscPicture
		{
			idc = 3614;
			text = "\rimas_pack\pictures\health\legs1.paa";
			x = 0.0154696 * safezoneW;
			y = 0.110005 * safezoneH;
			w = 0.190798 * safezoneW;
			h = 0.319013 * safezoneH;
		};
		class HeadButton: RscPictureButtonMenu
		{
			idc = 3621;
			x = 0.0912616 * safezoneW;
			y = 0.110005 * safezoneH;
			w = 0.0381752 * safezoneW;
			h = 0.0495575 * safezoneH;
            
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
			tooltip = "Лечить раны на голове";
			onButtonClick = "[""head""] spawn RRPClient_system_healPart;";
		};
		class BodyButton: HeadButton
		{
			idc = 3622;
			x = 0.0886638 * safezoneW;
			y = 0.163155 * safezoneH;
			w = 0.0423319 * safezoneW;
			h = 0.160488 * safezoneH;
			tooltip = "Лечить раны на теле";
			onButtonClick = "[""body""] spawn RRPClient_system_healPart;";
		};
		class LefHandButton: HeadButton
		{
			idc = 3623;
			x = 0.135634 * safezoneW;
			y = 0.197082 * safezoneH;
			w = 0.0257834 * safezoneW;
			h = 0.110005 * safezoneH;
			tooltip = "Лечить раны на руках";
			onButtonClick = "[""hands""] spawn RRPClient_system_healPart;";
		};
		class RightHandButton: HeadButton
		{
			idc = 3624;
			x = 0.0567237 * safezoneW;
			y = 0.198008 * safezoneH;
			w = 0.0257834 * safezoneW;
			h = 0.110005 * safezoneH;
			tooltip = "Лечить раны на руках";
			onButtonClick = "[""hands""] spawn RRPClient_system_healPart;";
		};
		class LegsButton: HeadButton
		{
			idc = 3625;
			x = 0.0825067 * safezoneW;
			y = 0.330014 * safezoneH;
			w = 0.0567237 * safezoneW;
			h = 0.0990041 * safezoneH;
			tooltip = "Лечить раны на ногах";
			onButtonClick = "[""legs""] spawn RRPClient_system_healPart;";
		};
		class HealInfo: AppRscStructuredText
		{
			idc = 3615;
			x = 0.211424 * safezoneW;
			y = 0.0880036 * safezoneH;
			w = 0.185641 * safezoneW;
			h = 0.374015 * safezoneH;
			sizeEx = 0.02;
			colorBackground[] = {0, 0, 0, 0};
		};
        class back: MainMenuButton
        {
            idc = 27001;
        };
	};
};