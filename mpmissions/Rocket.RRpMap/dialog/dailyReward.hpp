/* #Cisylu
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"background: RRP_background_fade",[1,"",["0.345287 * safezoneW + safezoneX","0.337154 * safezoneH + safezoneY","0.310456 * safezoneW","0.336697 * safezoneH"],[-1,-1,-1,-1],[0.26,0.24,0.31,0.8],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1001,"title: RRP_title",[1,"Daiy Reward",["0.345287 * safezoneW + safezoneX","0.315147 * safezoneH + safezoneY","0.300142 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[0.16,0.16,0.19,1],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1600,"close: RRP_btn_exit_text",[1,"X",["0.64543 * safezoneW + safezoneX","0.315147 * safezoneH + safezoneY","0.0103142 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[0.98,0.01,0.38,1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"image",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.448425 * safezoneW + safezoneX","0.341554 * safezoneH + safezoneY","0.102121 * safezoneW","0.171641 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"text",[1,"",["0.35354 * safezoneW + safezoneX","0.519796 * safezoneH + safezoneY","0.293954 * safezoneW","0.0946262 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"Claim",[1,"",["0.438115 * safezoneW + safezoneX","0.621035 * safezoneH + safezoneY","0.128927 * safezoneW","0.0440126 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"prevPic",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.360752 * safezoneW + safezoneX","0.372368 * safezoneH + safezoneY","0.0722112 * safezoneW","0.110013 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1202,"nextPic",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.567042 * safezoneW + safezoneX","0.367962 * safezoneH + safezoneY","0.0722112 * safezoneW","0.110013 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Fairy Tale, v1.063, #Rafaxe)
////////////////////////////////////////////////////////

class RRPDialogRewardDialog
{
	idd=24000;
	onLoad="uiNamespace setVariable ['RRPDialogRewardDialog',_this#0]";
	onUnload="uiNamespace setVariable ['RRPDialogRewardDialog',displayNull]";
	name="RRPDialogRewardDialog";
	movingEnable=1;
	enableSimulation=1;

	class controlsBackground
	{
		class background: RRP_background_fade
		{
			idc = -1;
			x = 0.345287 * safezoneW + safezoneX;
			y = 0.337154 * safezoneH + safezoneY;
			w = 0.310456 * safezoneW;
			h = 0.336697 * safezoneH;
		};
		class title: RRP_title
		{
			idc = -1;
			text = "Daiy Reward"; //--- ToDo: Localize;
			x = 0.345287 * safezoneW + safezoneX;
			y = 0.315147 * safezoneH + safezoneY;
			w = 0.300142 * safezoneW;
			h = 0.0220063 * safezoneH;
		};
		class close: RRP_btn_exit_text
		{
			idc = 1600;
			text = "X"; //--- ToDo: Localize;
			x = 0.64543 * safezoneW + safezoneX;
			y = 0.315147 * safezoneH + safezoneY;
			w = 0.0103142 * safezoneW;
			h = 0.0220063 * safezoneH;
		};
	};
	class controls
	{
		class image: RscPicture
		{
			idc = 24001;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.448425 * safezoneW + safezoneX;
			y = 0.341554 * safezoneH + safezoneY;
			w = 0.102121 * safezoneW;
			h = 0.171641 * safezoneH;
		};
		class text: RRP_RscStructuredText
		{
			idc = 24002;
			x = 0.35354 * safezoneW + safezoneX;
			y = 0.519796 * safezoneH + safezoneY;
			w = 0.293954 * safezoneW;
			h = 0.0946262 * safezoneH;
		};
		class Claim: RRP_btn_yellow
		{
			idc = 24003;
			text = "ЗАБРАТЬ НАГРАДУ";
			x = 0.438115 * safezoneW + safezoneX;
			y = 0.621035 * safezoneH + safezoneY;
			w = 0.128927 * safezoneW;
			h = 0.0440126 * safezoneH;
			onButtonClick = "_this call RRPClient_dg_claimReward";
		};	
		class prevPic: RscPicture
		{
			idc = 24004;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.360752 * safezoneW + safezoneX;
			y = 0.372368 * safezoneH + safezoneY;
			w = 0.0722112 * safezoneW;
			h = 0.110013 * safezoneH;
		};
		class nextPic: RscPicture
		{
			idc = 24005;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.567042 * safezoneW + safezoneX;
			y = 0.367962 * safezoneH + safezoneY;
			w = 0.0722112 * safezoneW;
			h = 0.110013 * safezoneH;
		};
	};
};



////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
