/* #Vobuze
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-1000,"background: RRP_background_fade",[0,"",[0.25,0.04,0.75,0.96],[-1,-1,-1,-1],[0.26,0.24,0.31,0.8],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1001,"title: RRP_title",[0,"Achievments",[0.25,0,0.725,0.04],[-1,-1,-1,-1],[0.16,0.16,0.19,1],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1600,"close: RRP_btn_exit_text",[0,"X",[0.975,0,0.025,0.04],[-1,-1,-1,-1],[0.98,0.01,0.38,1],[-1,-1,-1,-1],"","-1"],[]],
	[2300,"achGroup",[0,"",[0.25,0.22,0.75,0.76],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["show = |true|;","idc = 1037;"]],
	[-2301,"mainGroup",[0,"",[0.25,0.04,0.75,0.16],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["show = |true|;","idc = 1037;"]],
	[1100,"profileName",[2301,"",[0.0125,0.02,0.3375,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"progress",[2301,"",[0.3625,0.1,0.375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"progressText",[2301,"",[0.3625,0.02,0.375,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"backgroundMain",[2301,"",[0,0,0.75,0.16],[-1,-1,-1,-1],[0.26,0.24,0.31,1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"c1",[2300,"",[0.0125,0.02,0.725,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"c2",[2300,"",[0.0125,0.16,0.725,0.12],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class RRPDialogBattlePass
{
	idd = 38000;
	onLoad="uiNamespace setVariable ['RRPDialogBattlePass',_this#0]";
	onUnload="uiNamespace setVariable ['RRPDialogBattlePass',displayNull]";
	name="RRPDialogBattlePass";
	movingEnable=1;
	enableSimulation=1;
	class controlsBackground {};
	class controls {};
};

class RRPDialogAchievment
{
	idd=24000;
	onLoad="uiNamespace setVariable ['RRPDialogAchievment',_this#0]";
	onUnload="uiNamespace setVariable ['RRPDialogAchievment',displayNull]";
	name="RRPDialogAchievment";
	movingEnable=1;
	enableSimulation=1;
	class controlsBackground
	{
		class background: RRP_background_fade
		{
			idc = -1;
			x = 0.25;
			y = 0.04;
			w = 0.75;
			h = 0.96;
		};
		class title: RRP_title
		{
			idc = -1;
            moving = 1;
			text = "Достижения"; //--- ToDo: Localize;
			x = 0.25;
			y = 0;
			w = 0.725;
			h = 0.04;
		};
		class close: RRP_btn_exit_text
		{
			idc = 1600;
			text = "X"; //--- ToDo: Localize;
			x = 0.975;
			y = 0;
			w = 0.025;
			h = 0.04;
		};
	};
	class controls
	{
		class achGroup: RscControlsGroup
		{
			idc = 24001;

			x = 0.25;
			y = 0.22;
			w = 0.75;
			h = 0.76;
			class Controls
			{
			};
		};
		class mainGroup: RscControlsGroup
		{
			show = "true";
			idc = 24002;

			x = 0.25;
			y = 0.04;
			w = 0.75;
			h = 0.16;
			class Controls
			{
				class backgroundMain: RRP_background
				{
					idc = 2003;
					x = 0;
					y = 0;
					w = 0.75;
					h = 0.16;
				};
				class profileName: RscStructuredText
				{
					idc = 2000;
					x = 0.0125;
					y = 0.02;
					w = 0.3375;
					h = 0.12;
				};
			};
		};
	};
};