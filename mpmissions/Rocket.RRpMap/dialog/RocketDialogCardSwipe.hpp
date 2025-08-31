class RocketDialogCardSwipe {
	idd = 8700;
	name="RocketDialogCardSwipe";
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
		class cardText: RscButton {
			idc = 8701;
			colorText[] = {0, 0, 0, 0};
			colorDisabled[] = {0, 0, 0, 0};
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundDisabled[] = {0, 0, 0, 0};
			colorBackgroundActive[] = {0, 0, 0, 0};
			colorFocused[] = {0, 0, 0, 0};
			colorShadow[] = {0, 0, 0, 0};
			colorBorder[] = {0, 0, 0, 0};

			x = -0.2;
			y = 0.01;
			w = 0.4;
			h = 0.24;
		};

		class cardReaderBottomPicture: RscPicture {
			idc = -1;

			text = "\rimas_agent\assets\minigames\cardreader_bottom.paa";

			x = 0.1;
			y = 0.05;
			w = 0.8;
			h = 1;
		};

		class cardPicture: RscPicture {
			idc = 8702;

			text = "\rimas_agent\assets\minigames\card.paa";

			x = -0.2;
			y = 0.01;
			w = 0.4;
			h = 0.5;
		};

		class cardReaderTopPicture: RscPicture {
			idc = -1;

			text = "\rimas_agent\assets\minigames\cardreader_top.paa";

			x = 0.1;
			y = -0.15;
			w = 0.8;
			h = 1;
		};


		class cardReaderText: RscText {
			idc = 8703;

			text = "ПРОВЕДИТЕ КАРТОЙ";
			font = "LCD14";
			sizeEx = 0.06;
			
			x = 0.15;
			y = -0.11;
			w = 0.6;
			h = 0.05;
		};
	};
};