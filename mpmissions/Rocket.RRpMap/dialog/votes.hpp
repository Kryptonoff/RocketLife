/* #Kafopa
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-1000,"background: RRP_background_fade",[1,"",["0.293798 * safezoneW + safezoneX","0.247082 * safezoneH + safezoneY","0.411374 * safezoneW","0.527829 * safezoneH"],[-1,-1,-1,-1],[0.26,0.24,0.31,0.8],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1001,"title: RRP_title",[1,"Achievments",["0.293798 * safezoneW + safezoneX","0.225089 * safezoneH + safezoneY","0.401063 * safezoneW","0.0219929 * safezoneH"],[-1,-1,-1,-1],[0.16,0.16,0.19,1],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1600,"close: RRP_btn_exit_text",[1,"X",["0.694861 * safezoneW + safezoneX","0.225089 * safezoneH + safezoneY","0.0103101 * safezoneW","0.0219929 * safezoneH"],[-1,-1,-1,-1],[0.98,0.01,0.38,1],[-1,-1,-1,-1],"","-1"],[]],
	[-2300,"CandidatesGroup",[1,"",["0.29586 * safezoneW + safezoneX","0.251481 * safezoneH + safezoneY","0.40725 * safezoneW","0.521231 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["show = |true|;","idc = 1037;"]],
	[-1800,"FrameCandidate1",[2300,"",["0.00309301 * safezoneW","0.006598 * safezoneH","0.402094 * safezoneW","0.15395 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"ProgressCandidate1",[2300,"",["0.0082478 * safezoneW","0.116562 * safezoneH","0.355699 * safezoneW","0.0329893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"TextPercentage1",[2300,"100%",["0.369102 * safezoneW","0.116562 * safezoneH","0.0319614 * safezoneW","0.0329893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"VoteBtn",[2300,"Vote Candidate",["0.317551 * safezoneW","0.039587 * safezoneH","0.0824809 * safezoneW","0.0439857 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"DescriptionCandidate",[2300,"",["0.00824801 * safezoneW","0.017594 * safezoneH","0.304148 * safezoneW","0.0879714 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1801,"FrameCandidate2",[2300,"",["0.00309274 * safezoneW","0.171544 * safezoneH","0.402094 * safezoneW","0.15395 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"",[2300,"",["0.0082478 * safezoneW","0.18254 * safezoneH","0.304148 * safezoneW","0.0879714 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"",[2300,"",["0.0082478 * safezoneW","0.281508 * safezoneH","0.355699 * safezoneW","0.0329893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"",[2300,"100%",["0.369102 * safezoneW","0.281508 * safezoneH","0.0319614 * safezoneW","0.0329893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2401,"",[2300,"Vote Candidate",["0.317551 * safezoneW","0.204533 * safezoneH","0.0824809 * safezoneW","0.0439857 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1802,"FrameCandidate3",[2300,"",["0.00309274 * safezoneW","0.33649 * safezoneH","0.402094 * safezoneW","0.15395 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"",[2300,"",["0.0082478 * safezoneW","0.446455 * safezoneH","0.355699 * safezoneW","0.0329893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"",[2300,"100%",["0.369102 * safezoneW","0.446455 * safezoneH","0.0319614 * safezoneW","0.0329893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1105,"",[2300,"",["0.0082478 * safezoneW","0.347487 * safezoneH","0.304148 * safezoneW","0.0879714 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2402,"",[2300,"Vote Candidate",["0.317551 * safezoneW","0.36948 * safezoneH","0.0824809 * safezoneW","0.0439857 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class RRPDialogVote
{
	idd = 25000;
	onLoad = "uiNamespace setVariable ['RRPDialogVote',_this # 0]";
	onUnload = "uiNamespace setVariable ['RRPDialogVote',displayNull]";
	class controlsBackground
	{
		class background: RRP_background_fade
		{
			idc = -1;
			x = 0.293798 * safezoneW + safezoneX;
			y = 0.247082 * safezoneH + safezoneY;
			w = 0.411374 * safezoneW;
			h = 0.527829 * safezoneH;
		};
		class title: RRP_title
		{
			idc = -1;
			text = "Кандидаты"; //--- ToDo: Localize;
			x = 0.293798 * safezoneW + safezoneX;
			y = 0.225089 * safezoneH + safezoneY;
			w = 0.401063 * safezoneW;
			h = 0.0219929 * safezoneH;
		};
		class close: RRP_btn_exit_text
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.694861 * safezoneW + safezoneX;
			y = 0.225089 * safezoneH + safezoneY;
			w = 0.0103101 * safezoneW;
			h = 0.0219929 * safezoneH;
		};
	};
	class controls
	{
		class CandidatesGroup: RscControlsGroup
		{
			show = "true";
			idc = 25001;

			x = 0.29586 * safezoneW + safezoneX;
			y = 0.251481 * safezoneH + safezoneY;
			w = 0.40725 * safezoneW;
			h = 0.521231 * safezoneH;
			class Controls
			{
				class FrameCandidate1: RscFrame
				{
					idc = 1800;
					x = 0.00309301 * safezoneW;
					y = 0.006598 * safezoneH;
					w = 0.402094 * safezoneW;
					h = 0.15395 * safezoneH;
				};
				class ProgressCandidate1: RscStructuredText
				{
					idc = 1100;
					x = 0.0082478 * safezoneW;
					y = 0.116562 * safezoneH;
					w = 0.355699 * safezoneW;
					h = 0.0329893 * safezoneH;
				};
				class TextPercentage1: RscText
				{
					idc = 1002;
					text = "100%"; //--- ToDo: Localize;
					x = 0.369102 * safezoneW;
					y = 0.116562 * safezoneH;
					w = 0.0319614 * safezoneW;
					h = 0.0329893 * safezoneH;
				};
				class VoteBtn: RscButtonMenu
				{
					idc = 2400;
					text = "Vote Candidate"; //--- ToDo: Localize;
					x = 0.317551 * safezoneW;
					y = 0.039587 * safezoneH;
					w = 0.0824809 * safezoneW;
					h = 0.0439857 * safezoneH;
				};
				class DescriptionCandidate: RscStructuredText
				{
					idc = 1101;
					x = 0.00824801 * safezoneW;
					y = 0.017594 * safezoneH;
					w = 0.304148 * safezoneW;
					h = 0.0879714 * safezoneH;
				};
				class FrameCandidate2: RscFrame
				{
					idc = 1801;
					x = 0.00309274 * safezoneW;
					y = 0.171544 * safezoneH;
					w = 0.402094 * safezoneW;
					h = 0.15395 * safezoneH;
				};
				class RscStructuredText_1102: RscStructuredText
				{
					idc = 1102;
					x = 0.0082478 * safezoneW;
					y = 0.18254 * safezoneH;
					w = 0.304148 * safezoneW;
					h = 0.0879714 * safezoneH;
				};
				class RscStructuredText_1103: RscStructuredText
				{
					idc = 1103;
					x = 0.0082478 * safezoneW;
					y = 0.281508 * safezoneH;
					w = 0.355699 * safezoneW;
					h = 0.0329893 * safezoneH;
				};
				class RscText_1003: RscText
				{
					idc = 1003;
					text = "100%"; //--- ToDo: Localize;
					x = 0.369102 * safezoneW;
					y = 0.281508 * safezoneH;
					w = 0.0319614 * safezoneW;
					h = 0.0329893 * safezoneH;
				};
				class RscButtonMenu_2401: RscButtonMenu
				{
					idc = 2401;
					text = "Vote Candidate"; //--- ToDo: Localize;
					x = 0.317551 * safezoneW;
					y = 0.204533 * safezoneH;
					w = 0.0824809 * safezoneW;
					h = 0.0439857 * safezoneH;
				};
				class FrameCandidate3: RscFrame
				{
					idc = 1802;
					x = 0.00309274 * safezoneW;
					y = 0.33649 * safezoneH;
					w = 0.402094 * safezoneW;
					h = 0.15395 * safezoneH;
				};
				class RscStructuredText_1104: RscStructuredText
				{
					idc = 1104;
					x = 0.0082478 * safezoneW;
					y = 0.446455 * safezoneH;
					w = 0.355699 * safezoneW;
					h = 0.0329893 * safezoneH;
				};
				class RscText_1004: RscText
				{
					idc = 1004;
					text = "100%"; //--- ToDo: Localize;
					x = 0.369102 * safezoneW;
					y = 0.446455 * safezoneH;
					w = 0.0319614 * safezoneW;
					h = 0.0329893 * safezoneH;
				};
				class RscStructuredText_1105: RscStructuredText
				{
					idc = 1105;
					x = 0.0082478 * safezoneW;
					y = 0.347487 * safezoneH;
					w = 0.304148 * safezoneW;
					h = 0.0879714 * safezoneH;
				};
				class RscButtonMenu_2402: RscButtonMenu
				{
					idc = 2402;
					text = "Vote Candidate"; //--- ToDo: Localize;
					x = 0.317551 * safezoneW;
					y = 0.36948 * safezoneH;
					w = 0.0824809 * safezoneW;
					h = 0.0439857 * safezoneH;
				};
			};
		};
	};
};