class RocketDialogCalibration {
	idd = 8800;
	name="RocketDialogCalibration";
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

		class firstProgress: RscProgress {
			idc = 8801;

			x = 0.29;
			y = 0.066;
			w = 0.3575;
			h = 0.048;
		};

		class CalibrationBackground: RscPicture {
			idc = -1;

			text = "\rimas_agent\assets\minigames\calibration.paa";

			x = -0.15;
			y = -0.1;
			w = 1.25;
			h = 1.75;
		};

		class firstButton: RscButton {
			idc = 8802;

			action = "[8801, 8802, 'first'] call RRPCLient_mg_calibrationAction";
			
			x = 0.3075;
			y = 0.166;
			w = 0.3225;
			h = 0.056;
		};

		class secondProgress: RscProgress {
			idc = 8803;

			x = 0.29l; 
			y = 0.418l; 
			w = 0.3575l; 
			h = 0.052;
		};

		class secondButton: RscButton {
			idc = 8804;

			action = "[8803, 8804, 'second'] call RRPClient_mg_calibrationAction";
			
			x = 0.305; 
			y = 0.526; 
			w = 0.3225; 
			h = 0.056;
		};

		class thirdProgress: RscProgress {
			idc = 8805;

			x = 0.29; 
			y = 0.778; 
			w = 0.3575; 
			h = 0.048;
		};

		class thirdButton: RscButton {
			idc = 8806;

			action = "[8805, 8806, 'third'] call RRPClient_mg_calibrationAction";
			
			x = 0.3075;
			y = 0.87;
			w = 0.3225;
			h = 0.056;
		};
	};
};