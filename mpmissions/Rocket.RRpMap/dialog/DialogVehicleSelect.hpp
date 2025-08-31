class DialogVehicleSelect
{
	idd = 58000;
	name="DialogVehicleSelect";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnLoad = "false call RRPClient_gui_util_blur; lbdatarefinery = nil;";

	class controlsBackground {
		//[0.2,0.38,0.575,0.2]
		class bg : RRP_background_fade
		{
			idc = -1;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.575 * safezoneW;
			h = 0.2 * safezoneH;
		};
	};

	class controls
	{
		class Title : RRP_title
		{
			idc = -1;
			text = "Выберите транспорт";

			x = 0.2 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.55 * safezoneW;
			h = 0.04 * safezoneH;
			//[0.2,0.34,0.55,0.04]
		};

		class CloseButton: RRP_btn_exit_text {
			x = 0.75 * safezoneW + safezoneX;
			y = 0.34 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04 * safezoneH;
			//[0.75,0.34,0.025,0.04]
		};

		class Vehicles : RRP_RscCombo	{
			idc = 5802;

			x = 0.2125 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.556817 * safezoneW;
			h = 0.0509092 * safezoneH;
			//[0.2125,0.4,0.556817,0.0509092]
		};

		class FacMoney : RRP_RscStructuredText
		{
			idc = 5803;
			text = "";

			x = 0.2125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.270452 * safezoneW;
			h = 0.0509092 * safezoneH;
			//[0.2125,0.5,0.270452,0.0509092]
		};

		class Button : RRP_btn_green
		{
			idc = 5804;
			text = "";
			onButtonClick = "";

			x = 0.5 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.270452 * safezoneW;
			h = 0.0509092 * safezoneH;
			//[0.5,0.5,0.270452,0.0509092]
		};
	};
};
