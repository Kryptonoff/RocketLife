/* #Boqepi
$[
	1.063,
	["idCard",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2300,"passportGroup",[1,"",["0.00565945 * safezoneW + safezoneX","0.555016 * safezoneH + safezoneY","0.252021 * safezoneW","0.217858 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1000,"NameText",[2300,"Onopchenko Oleksandr",["0.133766 * safezoneW","0.048414 * safezoneH","0.0678507 * safezoneW","0.0198055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],["idc = 2750;"]],
	[-1001,"DOBText",[2300,"",["0.133766 * safezoneW","0.0682196 * safezoneH","0.0678507 * safezoneW","0.0176049 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2751;"]],
	[-1002,"IdCodeText",[2300,"",["0.133766 * safezoneW","0.0858247 * safezoneH","0.0680445 * safezoneW","0.0176018 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2752;"]],
	[-1003,"DaRText",[2300,"",["0.133766 * safezoneW","0.11443 * safezoneH","0.0680445 * safezoneW","0.0176018 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2753;"]],
	[-1009,"NameText",[2300,"",["0.0775436 * safezoneW","0.145238 * safezoneH","0.0481589 * safezoneW","0.0220018 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2759;","style = 2;"]],
	[-1011,"SurNameText",[2300,"",["0.152179 * safezoneW","0.145238 * safezoneH","0.0525535 * safezoneW","0.0220018 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2761;","style = 2;"]],
	[-1012,"IdText",[2300,"",["0.0988684 * safezoneW","0.173846 * safezoneH","0.0331461 * safezoneW","0.0220018 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2762;","style = 2;"]],
	[-1200,"PassportPic",[2300,"icons\pas.paa",["0 * safezoneW","0 * safezoneH","0.252021 * safezoneW","0.217858 * safezoneH"],[1,1,1,0.3],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],["idc = 2765;"]]
]
*/

class RRPTitlesIdCard
{
	idd = 25000;
	onLoad = "uiNamespace setVariable [""RRPTitlesIdCard"",_this#0]";
	onUnload = "uiNamespace setVariable [""RRPTitlesIdCard"",displayNull]";
    duration = 10;
    movingEnable = 0;
    fadein = 1;
    fadeout = 1;
	class Controls
	{
		class passportGroup: RscControlsGroupNoScrollbars
		{
			idc = 25001;
			x = 0.00565945 * safezoneW + safezoneX;
			y = 0.555016 * safezoneH + safezoneY;
            w = 0.252021 * safezoneW;
            h = 0.217858 * safezoneH;
			class Controls
			{
				class PassportPic: RscPicture
				{
					idc = 25009;
					text = "";
                    x = 0 * safezoneW;
                    y = 0 * safezoneH;
                    w = 0.252021 * safezoneW;
                    h = 0.217858 * safezoneH;
				};
				class NameSurText: RRP_RscStructuredText
				{
					idc = 25002;

					text = "Name Surname"; //--- ToDo: Localize;
                    x = 0.133766 * safezoneW;
                    y = 0.048414 * safezoneH;
                    w = 0.0678507 * safezoneW;
                    h = 0.0198055 * safezoneH;
				};
				class DOBText: RRP_RscStructuredText
				{
					idc = 25003;
					text = "";
                    x = 0.133766 * safezoneW;
                    y = 0.0682196 * safezoneH;
                    w = 0.0678507 * safezoneW;
                    h = 0.0176049 * safezoneH;
				};
				class IdCodeText: RRP_RscStructuredText
				{
					idc = 25004;
					text = "";
                    x = 0.133766 * safezoneW;
                    y = 0.0858247 * safezoneH;
                    w = 0.0680445 * safezoneW;
                    h = 0.0176018 * safezoneH;
				};
				class DaRText: RRP_RscStructuredText
				{
					idc = 25005;
					text = "";
                    x = 0.133766 * safezoneW;
                    y = 0.11443 * safezoneH;
                    w = 0.0680445 * safezoneW;
                    h = 0.0176018 * safezoneH;
				};
				class NameText: RRP_RscStructuredText
				{
					idc = 25006;
					text = "";
                    x = 0.0775436 * safezoneW;
                    y = 0.145238 * safezoneH;
                    w = 0.0481589 * safezoneW;
                    h = 0.0220018 * safezoneH;
				};
				class SurNameText: RRP_RscStructuredText
				{
					idc = 25007;
					text = "";
                    x = 0.152179 * safezoneW;
                    y = 0.145238 * safezoneH;
                    w = 0.0525535 * safezoneW;
                    h = 0.0220018 * safezoneH;
				};
				class IdText: RRP_RscStructuredText
				{
					idc = 25008;
					text = "";
                    x = 0.0988684 * safezoneW;
                    y = 0.173846 * safezoneH;
                    w = 0.0331461 * safezoneW;
                    h = 0.0220018 * safezoneH;
				};
			};
		};
	};
};

