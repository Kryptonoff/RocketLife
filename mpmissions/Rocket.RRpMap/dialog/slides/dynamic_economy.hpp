/* #Tegyci
$[
	1.063,
	["template",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"TemplateGroup",[1,"",["0.299415 * safezoneW + safezoneX","0.214105 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2400,"backButton",[2300,"MainMenu",["0.305272 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"TimeBetweenNewCalcul",[2300,"",["0.031314 * safezoneW","0.060895 * safezoneH","0.160417 * safezoneW","0.0342593 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"TimeBetweenNewEvent",[2300,"",["0.212043 * safezoneW","0.060895 * safezoneH","0.160417 * safezoneW","0.0342593 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"BourseItems",[2300,"",["0.02246 * safezoneW","0.160895 * safezoneH","0.134896 * safezoneW","0.35 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"TimeCalcul",[2300,"",["0.031314 * safezoneW","0.095154 * safezoneH","0.160417 * safezoneW","0.0342593 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"TimeEvent",[2300,"",["0.212043 * safezoneW","0.095154 * safezoneH","0.160417 * safezoneW","0.0342593 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"ItemIcon",[2300,"#(argb,8,8,3)color(1,1,1,1)",["0.165689 * safezoneW","0.160895 * safezoneH","0.0192708 * safezoneW","0.0361111 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"ItemName",[2300,"",["0.185481 * safezoneW","0.160895 * safezoneH","0.19375 * safezoneW","0.0361111 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1105,"PriceTendance",[2300,"",["0.165689 * safezoneW","0.208117 * safezoneH","0.213542 * safezoneW","0.0287037 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1106,"GeneralPriceTendance",[2300,"",["0.165689 * safezoneW","0.208117 * safezoneH","0.213542 * safezoneW","0.0287037 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1107,"ItemInformation",[2300,"",["0.165689 * safezoneW","0.254414 * safezoneH","0.213542 * safezoneW","0.25463 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class BourseSlide: SlideTab
{
	idc = 17000;
    show = "false";
	x = 0;
	y = 0;
	class Controls
	{
		class backButton: MainMenuButton
		{
			idc = 17001;
		};
		class TimeBetweenNewCalcul: AppRscStructuredText
		{
			idc = 17002;
			time = "";
			x = 0.031314 * safezoneW;
			y = 0.060895 * safezoneH;
			w = 0.160417 * safezoneW;
			h = 0.0342593 * safezoneH;
		};
		class TimeBetweenNewEvent: AppRscStructuredText
		{
			idc = 17003;
			time = "";
			x = 0.212043 * safezoneW;
			y = 0.060895 * safezoneH;
			w = 0.160417 * safezoneW;
			h = 0.0342593 * safezoneH;
		};
		class BourseItems: AppRscListbox
		{
			idc = 17004;
			x = 0.02246 * safezoneW;
			y = 0.160895 * safezoneH;
			w = 0.134896 * safezoneW;
			h = 0.35 * safezoneH;
		};
		class TimeCalcul: AppRscStructuredText
		{
			idc = 17005;
			x = 0.031314 * safezoneW;
			y = 0.095154 * safezoneH;
			w = 0.160417 * safezoneW;
			h = 0.0342593 * safezoneH;
		};
		class TimeEvent: AppRscStructuredText
		{
			idc = 17006;
			time = "";
			x = 0.212043 * safezoneW;
			y = 0.095154 * safezoneH;
			w = 0.160417 * safezoneW;
			h = 0.0342593 * safezoneH;
		};
		class ItemIcon: RscPicture
		{
			idc = 17007;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.165689 * safezoneW;
			y = 0.160895 * safezoneH;
			w = 0.0192708 * safezoneW;
			h = 0.0361111 * safezoneH;
		};
		class ItemName: AppRscStructuredText
		{
			idc = 17008;
			time = "";
			x = 0.185481 * safezoneW;
			y = 0.160895 * safezoneH;
			w = 0.19375 * safezoneW;
			h = 0.0361111 * safezoneH;
		};
		class PriceTendance: AppRscStructuredText
		{
			idc = 17009;
			time = "";
			x = 0.165689 * safezoneW;
			y = 0.208117 * safezoneH;
			w = 0.213542 * safezoneW;
			h = 0.0287037 * safezoneH;
		};
		class GeneralPriceTendance: AppRscStructuredText
		{
			idc = 17010;
			time = "";
			x = 0.165689 * safezoneW;
			y = 0.208117 * safezoneH;
			w = 0.213542 * safezoneW;
			h = 0.0287037 * safezoneH;
		};
		class ItemInformation: AppRscStructuredText
		{
			idc = 17011;
			time = "";
			x = 0.165689 * safezoneW;
			y = 0.254414 * safezoneH;
			w = 0.213542 * safezoneW;
			h = 0.25463 * safezoneH;
		};
	};
};