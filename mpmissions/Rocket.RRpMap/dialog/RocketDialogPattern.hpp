class RocketDialogPattern {
	idd = 8900;
	name="RocketDialogPattern";
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
		class firstSigPicture: RscPicture {
			idc = 8901;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.15;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};
		class secondSigPicture: RscPicture {
			idc = 8902;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.20385;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};
		class thirdSigPicture: RscPicture {
			idc = 8903;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.2575;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};
		class fourthSigPicture: RscPicture {
			idc = 8904;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.3145;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};
		class fifthSigPicture: RscPicture {
			idc = 8905;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.365;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};

		class sixthSigPicture: RscPicture {
			idc = 8906;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.55;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};
		class seventhSigPicture: RscPicture {
			idc = 8907;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.6025;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};
		class eighthSigPicture: RscPicture {
			idc = 8908;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.66;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};
		class ninethSigPicture: RscPicture {
			idc = 8909;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.715;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};
		class tenthSigPicture: RscPicture {
			idc = 8910;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0.224,0.224,0.224,1};

			x = 0.765;
			y = -0.008;
			w = 0.03;
			h = 0.04;
		};

		class CalibrationBackground: RscPicture {
			idc = -1;

			text = "\rimas_agent\assets\minigames\pattern.paa";

			x = -0.15;
			y = -0.1;
			w = 1.25;
			h = 1.75;
		};

		class firstButton: RscButton {
			idc = 8911;

			onMouseButtonDown = "0 call RRPClient_mg_patternAction";

			x = 0.5575;
			y = 0.104;
			w = 0.0675;
			h = 0.096;
		};
		class secondButton: RscButton {
			idc = 8912;

			onMouseButtonDown = "1 call RRPClient_mg_patternAction";

			x = 0.6375;
			y = 0.104;
			w = 0.0675;
			h = 0.096;
		};
		class thirdButton: RscButton {
			idc = 8913;

			onMouseButtonDown = "2 call RRPClient_mg_patternAction";

			x = 0.72;
			y = 0.104;
			w = 0.0675;
			h = 0.096;
		};

		class fourthButton: RscButton {
			idc = 8914;

			onMouseButtonDown = "3 call RRPClient_mg_patternAction";

			x = 0.5575;
			y = 0.22;
			w = 0.0675;
			h = 0.096;
		};
		class fifthButton: RscButton {
			idc = 8915;

			onMouseButtonDown = "4 call RRPClient_mg_patternAction";

			x = 0.6375;
			y = 0.22;
			w = 0.0675;
			h = 0.096;
		};
		class sixthButton: RscButton {
			idc = 8916;

			onMouseButtonDown = "5 call RRPClient_mg_patternAction";

			x = 0.72;
			y = 0.22;
			w = 0.0675;
			h = 0.096;
		};

		class seventhButton: RscButton {
			idc = 8917;

			onMouseButtonDown = "6 call RRPClient_mg_patternAction";

			x = 0.5575;
			y = 0.332;
			w = 0.0675;
			h = 0.096;
		};
		class eighthButton: RscButton {
			idc = 8918;

			onMouseButtonDown = "7 call RRPClient_mg_patternAction";

			x = 0.6375;
			y = 0.332;
			w = 0.0675;
			h = 0.096;
		};
		class ninethButton: RscButton {
			idc = 8919;

			onMouseButtonDown = "8 call RRPClient_mg_patternAction";

			x = 0.72;
			y = 0.332;
			w = 0.0675;
			h = 0.096;
		};

		class firstPicture: RscPicture {
			idc = 8921;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.1625;
			y = 0.104;
			w = 0.0675;
			h = 0.096;
		};
		class secondPicture: RscPicture {
			idc = 8922;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.2425;
			y = 0.104;
			w = 0.0675;
			h = 0.096;
		};
		class thirdPicture: RscPicture {
			idc = 8923;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.325;
			y = 0.104;
			w = 0.0675;
			h = 0.096;
		};

		class fourthPicture: RscPicture {
			idc = 8924;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.1625;
			y = 0.22;
			w = 0.0675;
			h = 0.096;
		};
		class fifthPicture: RscPicture {
			idc = 8925;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.2425;
			y = 0.22;
			w = 0.0675;
			h = 0.096;
		};
		class sixthPicture: RscPicture {
			idc = 8926;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.325;
			y = 0.22;
			w = 0.0675;
			h = 0.096;
		};

		class seventhPicture: RscPicture {
			idc = 8927;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.1625;
			y = 0.332;
			w = 0.0675;
			h = 0.096;
		};
		class eighthPicture: RscPicture {
			idc = 8928;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.2425;
			y = 0.332;
			w = 0.0675;
			h = 0.096;
		};
		class ninethPicture: RscPicture {
			idc = 8929;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			colorText[] = {0,0,0,1};

			x = 0.325;
			y = 0.332;
			w = 0.0675;
			h = 0.096;
		};


	};
};