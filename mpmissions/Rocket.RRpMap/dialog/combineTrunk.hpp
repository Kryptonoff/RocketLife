class RRPDialogCombineTrunk {
	idd = 7500;
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=0;
	fadein=0;
	duration = 999999999999999999999999;	
	onLoad = "uiNamespace setVariable ['RRPDialogCombineTrunk',_this select 0]";
	onUnload = "uiNamespace setVariable ['RRPDialogCombineTrunk', objNull]";
	
		class controlsBackground {
		class progresActionSpent: RRP_background
		{
			idc = -1;
			text = "";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
	
	class controls {
		class Welcometitle: RRP_title
		{
			idc = 7501;
			text = "Бункер";
			sizeEx = 0.035;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes
			{
				align = "center";
				valign = "middle";
			}; 
		};
		class info: RRP_RscStructuredText
		{
			idc = 7502;
			text = "";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
	
};