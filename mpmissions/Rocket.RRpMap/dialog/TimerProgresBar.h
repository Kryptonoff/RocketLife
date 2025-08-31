class timerProgresBar
{
	idd = 2600;
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=0;
	fadein=0;
	duration = 999999999999999999999999;
	onLoad = "uiNamespace setVariable ['timerProgresBar',_this select 0];";
	onUnload = "uiNamespace setVariable ['timerProgresBar',displayNull];";

	class controlsBackground {
		class progresActionSpent: RRP_title
		{
			idc = -1;
			colorBackground[]= {0.55, 0.55, 0.56,1};
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.0055 * safezoneH;
		};
	};

	class controls {
		class Welcometitle: RRP_title
		{
			colorBackground[]={0.26, 0.24, 0.31,1};
			idc = 2601;
			font="Overwatch";
			text = "";
			sizeEx = 0.035;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class progresAction: RRP_title
		{
			idc = 2602;
			colorBackground[]= {0.0, 0.92, 0.99,1};
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class timer: RRP_title
		{
			idc = 2603;
			colorBackground[]= {0, 0, 0, 0};
			font="gtav";
			text = "00:00";
			style = 2;
			sizeEx = 0.04;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes
			{
				align = "center";
			};
		};

		class exit: RRP_title
		{
			idc = 2604;
			colorBackground[]= {0, 0, 0, 0};
			font="Overwatch";
			text = "Нажмите [F] для отмены действия";
			style = 2;
			sizeEx = 0.04;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.044 * safezoneH;
			class Attributes
			{
				align = "center";
			};
		};
	};
};
