class RRPDialogNY {
	idd = 2000;
	name= "RRPDialogNY";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad="uiNamespace setVariable ['RRPDialogNY',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogNY', displayNull];gift = nil; false call RRPClient_gui_util_blur; playMusic '';";

	class controlsBackground {
		class MainBackground: RRP_background {
			idc = 2001;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.30 * safezoneH;
		};
	};

	class Controls {
		class RscEditPromo: RRP_RscEdit
		{
			idc = 2010;
			style = 2;
			text = "";
			tooltip = "";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
