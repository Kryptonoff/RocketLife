class RRPDialogXP
{
	idd = 25100;
	onLoad = "uiNamespace setVariable ['RRPDialogXP',_this#0];true call RRPClient_gui_util_blur";
	onUnload = "uiNamespace setVariable ['RRPDialogXP',displayNull];false call RRPClient_gui_util_blur";
	class controlsBackground
	{
		class background: RRP_background_fade
		{
			idc = -1;
			x = 0.293767 * safezoneW + safezoneX;
			y = 0.258079 * safezoneH + safezoneY;
			w = 0.412465 * safezoneW;
			h = 0.516832 * safezoneH;
		};
		class title: RRP_title
		{
			idc = -1;
			text = "Ваши навыки"; //--- ToDo: Localize;
			x = 0.293879 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.39832 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Close: RRP_btn_exit_text
		{
			idc = -1;
			x = 0.692199 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.0139453 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls
	{
		class list: RscControlsGroup
		{
			idc = 25101;
			x = 0.298923 * safezoneW + safezoneX;
			y = 0.269075 * safezoneH + safezoneY;
			w = 0.268103 * safezoneW;
			h = 0.494839 * safezoneH;
			class Controls
			{
			};
		};
		class textGroup: RscControlsGroupNoScrollbars
		{
			idc = 25102;
			x = 0.572181 * safezoneW + safezoneX;
			y = 0.510996 * safezoneH + safezoneY;
			w = 0.128895 * safezoneW;
			h = 0.252918 * safezoneH;
			class Controls
			{
				class description: RRP_RscStructuredText
				{
					idc = 25103;
					x = 0.00515626 * safezoneW;
					y = 0.0109968 * safezoneH;
					w = 0.118584 * safezoneW;
					h = 0.230925 * safezoneH;
				};
			};
		};
		class RscPicture_1201: RscPictureKeepAspect
		{
			idc = 25104;
			text = "\a3\ui_f\data\gui\rsc\rscdisplaymain\spotlight_1_apex_ca.paa";
			x = 0.572181 * safezoneW + safezoneX;
			y = 0.269075 * safezoneH + safezoneY;
			w = 0.128895 * safezoneW;
			h = 0.186939 * safezoneH;
		};
		class SkillText: RscText
		{
			idc = 25105;
			text = "Навык"; //--- ToDo: Localize;
			x = 0.572181 * safezoneW + safezoneX;
			y = 0.467011 * safezoneH + safezoneY;
			w = 0.128895 * safezoneW;
			h = 0.0329893 * safezoneH;
		};
	};
};
