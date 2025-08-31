/* #Powuso
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-1000,"background: RRP_background_fade",[1,"",["0.354606 * safezoneW + safezoneX","0.246928 * safezoneH + safezoneY","0.290789 * safezoneW","0.396113 * safezoneH"],[-1,-1,-1,-1],[0.26,0.24,0.31,0.8],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1001,"title: RRP_title",[1,"Achievments",["0.354606 * safezoneW + safezoneX","0.224922 * safezoneH + safezoneY","0.281096 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[0.16,0.16,0.19,1],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1600,"close: RRP_btn_exit_text",[1,"X",["0.635701 * safezoneW + safezoneX","0.224922 * safezoneH + safezoneY","0.00969295 * safezoneW","0.0220063 * safezoneH"],[-1,-1,-1,-1],[0.98,0.01,0.38,1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"resourceList",[1,"",["0.359452 * safezoneW + safezoneX","0.257931 * safezoneH + safezoneY","0.092083 * safezoneW","0.374107 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"text",[1,"",["0.456382 * safezoneW + safezoneX","0.257931 * safezoneH + safezoneY","0.184166 * safezoneW","0.143041 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"map",[1,"",["0.456382 * safezoneW + safezoneX","0.411975 * safezoneH + safezoneY","0.184166 * safezoneW","0.17605 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"claimButton",[1,"",["0.456382 * safezoneW + safezoneX","0.599028 * safezoneH + safezoneY","0.184166 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


class RRPDialogResCapture
{
	idd = 4500;
	name= "RRPDialogResCapture";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;uiNamespace setVariable ['RRPDialogResCapture',_this#0]";
	onUnload = "false call RRPClient_gui_util_blur;uiNamespace setVariable ['RRPDialogResCapture',displayNull]";

	class controlsBackground 
	{
		class background: RRP_background_fade
		{
			idc = -1;

			x = 0.354606 * safezoneW + safezoneX;
			y = 0.246928 * safezoneH + safezoneY;
			w = 0.290789 * safezoneW;
			h = 0.396113 * safezoneH;
		};
		class title: RRP_title
		{
			idc = -1;
			text = "Битва за ресурс"; //--- ToDo: Localize;
			x = 0.354606 * safezoneW + safezoneX;
			y = 0.224922 * safezoneH + safezoneY;
			w = 0.281096 * safezoneW;
			h = 0.0220063 * safezoneH;
		};
		class close: RRP_btn_exit_text
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.635701 * safezoneW + safezoneX;
			y = 0.224922 * safezoneH + safezoneY;
			w = 0.00969295 * safezoneW;
			h = 0.0220063 * safezoneH;
		};
	};
	class controls 
	{
		class resourceList: RRP_RscListbox
		{
			idc = 4501;
			x = 0.359452 * safezoneW + safezoneX;
			y = 0.257931 * safezoneH + safezoneY;
			w = 0.092083 * safezoneW;
			h = 0.374107 * safezoneH;
			onLBSelChanged = "_this call RRPClient_resource_capture_Info";
		};
		class text: RRP_RscStructuredText
		{
			idc = 4502;
			x = 0.456382 * safezoneW + safezoneX;
			y = 0.257931 * safezoneH + safezoneY;
			w = 0.184166 * safezoneW;
			h = 0.143041 * safezoneH;
			text = "";
		};
		class map: RscMapControl
		{
			idc = 4504;
			x = 0.456382 * safezoneW + safezoneX;
			y = 0.411975 * safezoneH + safezoneY;
			w = 0.184166 * safezoneW;
			h = 0.17605 * safezoneH;
		};
		class claimButton: RRP_btn_blue
		{
			idc = 4505;
			x = 0.456382 * safezoneW + safezoneX;
			y = 0.599028 * safezoneH + safezoneY;
			w = 0.184166 * safezoneW;
			h = 0.0330094 * safezoneH;
			text = "Принять участие в битве за ресурс";
			onButtonClick = "[] spawn RRPClient_resource_capture_Manage;";
		};
	};
};
/*
class RRPDialogResCapture 
{
	idd = 4500;
	name= "RRPDialogResCapture";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;uiNamespace setVariable ['RRPDialogResCapture',_this#0]";
	onUnload = "false call RRPClient_gui_util_blur;uiNamespace setVariable ['RRPDialogResCapture',displayNull]";
	class controlsBackground {};

	class controls
	{
		class Title : RscTitle 
		{
			idc = -1;
			x = 0.01749881;
			y = 0.1;
			w = 0.94500001;
			h = 0.04;
			text = "Битва за переработку";
			colorBackground[] = {1,1,1,0.1};
		};
		class ResCaptureList : RscListBox 
		{
			idc = 4501;
			x = 0.01749881;
			y = 0.16;
			w = 0.29500002;
			h = 0.68;
			onLBSelChanged = "_this call RRPClient_resource_capture_Info";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";				
			};
		};
		class PardonButtonKey : RscButtonUC 
		{
			idc = 4505;
			show = "false";
			x = 0.325001;
			y = 0.78;
			w = 0.637501;
			h = 0.06;
			text = "Принять участие в битве за этот ресурс";
			onButtonClick = "[] spawn RRPClient_resource_capture_Manage;";
			
		};
		class ProcInfo : RscStructuredText 
		{
			type = 13;
			idc = 4502;
			x = 0.33000008;
			y = 0.16000011;
			w = 0.63000003;
			h = 0.56000004;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {0,0,0,0.5};			
		};
	};
};
*/