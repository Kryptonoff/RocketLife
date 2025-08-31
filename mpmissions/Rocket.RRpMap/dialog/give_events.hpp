class RRPDialogGiveEvent
{
	idd = 3900;
	name= "RRPDialogGiveEvent";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogGiveEvent', _this select 0]";
	onUnload = "uiNamespace setVariable ['RRPDialogGiveEvent', displayNull]";
	class controlsBackground
	{
		class Background: RscText
		{
			idc = -1;
			x = 0.381741 * safezoneW + safezoneX;
			y = 0.422994 * safezoneH + safezoneY;
			w = 0.215953 * safezoneW;
			h = 0.132011 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
	};
	class controls
	{
		class Text: RscStructuredText
		{
			idc = 3901;
			x = 0.386882 * safezoneW + safezoneX;
			y = 0.433995 * safezoneH + safezoneY;
			w = 0.205669 * safezoneW;
			h = 0.0330027 * safezoneH;
		};
		class Currency: RscCombo
		{
			idc = 3902;
			x = 0.386882 * safezoneW + safezoneX;
			y = 0.477998 * safezoneH + safezoneY;
			w = 0.0822676 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		class Value: RscEdit
		{
			idc = 3903;
			text = "0";
			x = 0.474291 * safezoneW + safezoneX;
			y = 0.477998 * safezoneH + safezoneY;
			w = 0.11826 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		class Give: RscButtonMenu
		{
			idc = 3904;
			x = 0.433158 * safezoneW + safezoneX;
			y = 0.511001 * safezoneH + safezoneY;
			w = 0.102835 * safezoneW;
			h = 0.0330027 * safezoneH;
		};
	};
};


