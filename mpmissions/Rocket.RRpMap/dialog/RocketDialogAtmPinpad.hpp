class RocketDialogAtmPinpad {
	idd = 9400;
	name="RocketDialogAtmPinpad";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";
	onUnload = "";

	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};

		class MiniGameBackground: RscPicture {
			idc = -1;

			text = "\rimas_agent\assets\minigames\minigamebg.paa";

			x = -0.5;
			y = -0.25;
			w = 2;
			h = 1.5;
		};
	};
	
	class controls {
		class CalibrationBackground: RscPicture {
			idc = -1;

			text = "\rimas_agent\assets\minigames\atm_pinpad.paa";

			x = -0.15;
			y = -0.1;
			w = 1.25;
			h = 1.75;
		};

		class firstButton: RscButton {
			idc = 9401;

			onMouseButtonDown = "1 call RRPclient_mg_pinPadAction";

			x = 0.1725;
			y = 0;
			w = 0.11;
			h = 0.112;
		};
		class secondButton: RscButton {
			idc = 9402;

			onMouseButtonDown = "2 call RRPclient_mg_pinPadAction";

			x = 0.32;
			y = 0;
			w = 0.11;
			h = 0.112;
		};
		class thirdButton: RscButton {
			idc = 9403;

			onMouseButtonDown = "3 call RRPclient_mg_pinPadAction";

			x = 0.47;
			y = 0;
			w = 0.11;
			h = 0.112;
		};

		class fourthButton: RscButton {
			idc = 9404;

			onMouseButtonDown = "4 call RRPclient_mg_pinPadAction";

			x = 0.1725;
			y = 0.164;
			w = 0.11;
			h = 0.112;
		};
		class fifthButton: RscButton {
			idc = 9405;

			onMouseButtonDown = "5 call RRPclient_mg_pinPadAction";

			x = 0.32;
			y = 0.164;
			w = 0.11;
			h = 0.112;
		};
		class sixthButton: RscButton {
			idc = 9406;

			onMouseButtonDown = "6 call RRPclient_mg_pinPadAction";

			x = 0.47;
			y = 0.164;
			w = 0.11;
			h = 0.112;
		};

		class seventhButton: RscButton {
			idc = 9407;

			onMouseButtonDown = "7 call RRPclient_mg_pinPadAction";

			x = 0.1725;
			y = 0.332;
			w = 0.11;
			h = 0.112;
		};
		class eighthButton: RscButton {
			idc = 9408;

			onMouseButtonDown = "8 call RRPclient_mg_pinPadAction";

			x = 0.32;
			y = 0.332;
			w = 0.11;
			h = 0.112;
		};
		class ninethButton: RscButton {
			idc = 9409;

			onMouseButtonDown = "9 call RRPclient_mg_pinPadAction";

			x = 0.47;
			y = 0.332;
			w = 0.11;
			h = 0.112;
		};
		class zeroButton: RscButton {
			idc = 9410;

			onMouseButtonDown = "0 call RRPclient_mg_pinPadAction";

			x = 0.32;
			y = 0.5;
			w = 0.11;
			h = 0.112;
		};

		class cancelButton: RscButton {
			idc = 9411;

			onMouseButtonDown = "'cancel' call RRPclient_mg_pinPadAction";

			x = 0.6575;
			y = 0;
			w = 0.1325;
			h = 0.116;
		};
		class clearButton: RscButton {
			idc = 9412;

			onMouseButtonDown = "'clear' call RRPclient_mg_pinPadAction";

			x = 0.6575;
			y = 0.164;
			w = 0.1325;
			h = 0.116;
		};
		class enterButton: RscButton {
			idc = 9413;

			onMouseButtonDown = "'enter' call RRPclient_mg_pinPadAction";

			x = 0.6575;
			y = 0.332;
			w = 0.1325;
			h = 0.116;
		};
	};
};