/* #Syfagy
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1009,"LoadProgress",[1,"",["0.416455 * safezoneW + safezoneX","0.700257 * safezoneH + safezoneY","0.170184 * safezoneW","0.0220063 * safezoneH"],[1,1,1,0.25],[1,1,1,0.25],[-1,-1,-1,-1],"","-1"],["idc = 2007;","type = 8;","style = 0;","shadow = 2;","colorBar[] = {1,1,1,1};","colorFrame[] = {0,0,0,1};","texture = |#(argb,8,8,3)color(1,1,1,1)|;"]],
	[-1002,"close",[1,"X",["0.582513 * safezoneW + safezoneX","0.224922 * safezoneH + safezoneY","0.0103142 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1003,"Title",[1,"Rewards",["0.411298 * safezoneW + safezoneX","0.224922 * safezoneH + safezoneY","0.171215 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,1],[-1,-1,-1,-1],"","-1"],[]],
	[-1000,"background",[1,"",["0.411298 * safezoneW + safezoneX","0.246928 * safezoneH + safezoneY","0.180498 * safezoneW","0.528151 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0.51],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"RewardsList",[1,"",["0.416455 * safezoneW + safezoneX","0.25353 * safezoneH + safezoneY","0.170184 * safezoneW","0.440126 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"LoadText",[1,"10/10 meme",["0.416455 * safezoneW + safezoneX","0.700257 * safezoneH + safezoneY","0.170184 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"ClaimBox",[1,"",["0.520628 * safezoneW + safezoneX","0.739868 * safezoneH + safezoneY","0.0670421 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"ClaimButton",[1,"",["0.415424 * safezoneW + safezoneX","0.739868 * safezoneH + safezoneY","0.0825133 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class RRPDialogReward
{
	idd = 57347;
	onLoad="uiNamespace setVariable ['RRPDialogReward', _this select 0]";
	onUnload="false call RRPClient_gui_util_blur; uiNamespace setVariable ['RRPDialogReward', displayNull]";
	class controlsBackground
	{
		class close: RRP_btn_exit_text
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.582513 * safezoneW + safezoneX;
			y = 0.224922 * safezoneH + safezoneY;
			w = 0.0103142 * safezoneW;
			h = 0.0220063 * safezoneH;
		};
		class Title: RRP_title
		{
			idc = -1;
			text = "Тайник"; //--- ToDo: Localize;
			x = 0.411298 * safezoneW + safezoneX;
			y = 0.224922 * safezoneH + safezoneY;
			w = 0.171215 * safezoneW;
			h = 0.0220063 * safezoneH;
		};
		class background: RRP_background_fade
		{
			idc = -1;
			x = 0.411298 * safezoneW + safezoneX;
			y = 0.246928 * safezoneH + safezoneY;
			w = 0.180498 * safezoneW;
			h = 0.528151 * safezoneH;
		};
	};
	class controls
	{
		class RewardsList: RRP_RscListBox
		{
			idc = 2003;
			x = 0.416455 * safezoneW + safezoneX;
			y = 0.25353 * safezoneH + safezoneY;
			w = 0.170184 * safezoneW;
			h = 0.440126 * safezoneH;
			onLBSelChanged="_this call RRPClient_gui_rewardsDialog_event_onListBoxSelectionChanged";
			class ListScrollBar
			{
				color[]={1,1,1,1};
				autoScrollEnabled=1;
				colorActive[]={1,1,1,1};
				colorDisabled[]={1,1,1,0.30000001};
				thumb="\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty="\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull="\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border="\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				shadow=0;
				scrollSpeed=0.059999999;
				width=0;
				height=0;
				autoScrollSpeed=-1;
				autoScrollDelay=5;
				autoScrollRewind=0;
			};
			sizeEx="0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx2="0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			rowHeight="2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			
		};
		class ClaimButton: RRP_btn_noLine
		{
			idc = 2004;
			x = 0.415424 * safezoneW + safezoneX;
			y = 0.739868 * safezoneH + safezoneY;
			w = 0.0825133 * safezoneW;
			h = 0.0220063 * safezoneH;
			text = "Забрать";
			onMouseButtonClick="_this call RRPClient_gui_rewardsDialog_event_onClaimButtonClick";
		};
		class ClaimBox: RRP_RscCombo
		{
			idc = 2005;
			x = 0.520628 * safezoneW + safezoneX;
			y = 0.739868 * safezoneH + safezoneY;
			w = 0.0670421 * safezoneW;
			h = 0.0220063 * safezoneH;
			onLBSelChanged="_this call RRPClient_gui_rewardsDialog_event_onDropDownSelectionChanged";
		};
	};
};
