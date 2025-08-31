class RocketDialogSaw {
	idd = 9700;
	name="RocketDialogSaw";
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
		class tempProgress: RscProgress {
			idc = 9701;
			style = 0x01;
			x = 0.425;
			y = 0.048;
			w = 0.055;
			h = 0.66;
		};

		class tempProgressText: RscText {
			idc = -1;
			text = "Температура:";
			x = 0.2625;
			y = 0.36;
			w = 0.1375;
			h = 0.06;
		};

		class sawProgress: RscProgress {
			idc = 9702;

			x = 0.025;
			y = 0.76;
			w = 0.95;
			h = 0.06;
		};

		class thermometerPicture: RscPicture {
			idc = -1;

			text = "\rimas_agent\assets\minigames\thermometer.paa";

			x = 0.1725;
			y = 0.016;
			w = 0.6375;
			h = 0.72;
		};

		class sawProgressText: RscText {
			idc = 9703;
			text = "0%";
			style = 0x02;

			colorText[] = {0, 0, 0, 1};

			x = 0.025;
			y = 0.76;
			w = 0.95;
			h = 0.06;
		};

		class startButton: RscButton {
			idc = 9704;
			text = "Включить болгарку";
			action = "[] spawn RRPClient_mg_startSaw";
			
			x = 0.025;
			y = 0.88;
			w = 0.225;
			h = 0.1;
		};

		class stopButton: RscButton {
			idc = 9705;
			text = "Выключить болгарку";
			action = "[] spawn RRPClient_mg_stopSaw";
			
			x = 0.75;
			y = 0.88;
			w = 0.225;
			h = 0.1;
		};

	};
};