/* #Beheli
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-1000,"background",[0,"",[0,0.08,1,0.88],[-1,-1,-1,-1],[-1,-1,-1,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"title",[0,"WarZone",[0,0.04,0.9625,0.04],[-1,-1,-1,-1],[-1,-1,-1,1],[-1,-1,-1,-1],"","-1"],[]],
	[-1002,"close",[0,"X",[0.9625,0.04,0.0375,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"map",[0,"",[0.277572,0.1,0.45,0.76],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"nametext",[0,"Name",[0.0125,0.16,0.1125,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"nameBox",[0,"",[0.1375,0.16,0.125,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1401,"radiusBox",[0,"",[0.1375,0.24,0.125,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"radiusText",[0,"Radius",[0.0125,0.24,0.1125,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"placeZone",[0,"Set WarZone",[0.0125,0.32,0.25,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2401,"removeButtone",[0,"Remove WarZone",[0.0125,0.88,0.25,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"information",[0,"",[0.0125,0.4,0.25,0.46],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1005,"addText",[0,"Add War Zone",[0.0125,0.1,0.25,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2402,"impulseBtn",[0,"Impulse",[0.275,0.88,0.45,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2403,"sendMsg",[0,"Send",[0.7375,0.88,0.25,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1402,"textEdit",[0,"1",[0.7375,0.8,0.25,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2300,"textBox",[0,"",[0.7375,0.1,0.25,0.68],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"chatText",[2300,"",[0,0.02,0.25,0.6],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


class RRPDialogWarZone
{
	idd = 25000;
	name= "RRPDialogWarZone";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur; uiNamespace setVariable ['RRPDialogWarZone',_this#0]";
	onUnload = "call RRPClient_WarZone_unload";
	class controlsBackground
	{
		class background: RRP_background_fade
		{
			idc = -1;
			x = 0;
            y = 0.08;
            w = 1;
            h = 0.88;
		};
		class title: RRP_title
		{
			idc = -1;
            moving = 1;
			text = "Военное положение"; //--- ToDo: Localize;
			x = 0;
            y = 0.04;
            w = 0.9625;
            h = 0.04;
		};
		class close: RRP_btn_exit_text
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.9625;
            y = 0.04;
            w = 0.0375;
            h = 0.04;
		};
		class addText: RRP_RscStructuredText
		{
			idc = -1;
			text = "Установить военное положение"; //--- ToDo: Localize;
			x = 0.0125;
            y = 0.1;
            w = 0.25;
            h = 0.04;
		};
		class radiusText: RRP_RscStructuredText
		{
			idc = 25005;
			text = "Радиус:"; //--- ToDo: Localize;
            x = 0.0125;
            y = 0.24;
            w = 0.1125;
            h = 0.06;
		};
		class nametext: RRP_RscStructuredText
		{
			idc = 25002;
			text = "Название"; //--- ToDo: Localize;
            x = 0.0125;
            y = 0.16;
            w = 0.1125;
            h = 0.06;
		};
	};
	class controls
	{
		class map: RscMapControl
		{
			idc = 25001;
			x = 0.277572;
            y = 0.1;
            w = 0.45;
            h = 0.76;
			onMouseButtonDown = "[_this,""mouseButtonDown""] call RRPClient_WarZone_mouseEventsHandler";
			onMouseButtonUp = "[_this,""mouseButtonUp""] call RRPClient_WarZone_mouseEventsHandler";
			onDraw = "_this call SmartClient_gui_map_event_onDraw";
		};
		class nameBox: RRP_RscEdit
		{
			idc = 25003;
			text = "";
            x = 0.1375;
            y = 0.16;
            w = 0.125;
            h = 0.06;
		};
		class radiusBox: RRP_RscEdit
		{
            idc = 25004;
			text = "1000";
            x = 0.1375;
            y = 0.24;
            w = 0.125;
            h = 0.06;
			maxChars = 4;
			onChar = "_this call RRPClient_gui_util_typeOnlyInt";
		};
		class placeZone: RRP_btn_green
		{
			idc = 25006;
			text = "Установить"; //--- ToDo: Localize;
            x = 0.0125;
            y = 0.32;
            w = 0.25;
            h = 0.06;
			onMouseButtonClick = "call RRPClient_WarZone_create";
		};
		class removeButtone: RRP_btn_yellow
		{
			idc = 25007;
			text = "Удалить"; //--- ToDo: Localize;
            x = 0.0125;
            y = 0.88;
            w = 0.25;
            h = 0.06;
			onMouseButtonClick = "call RRPClient_WarZone_delete";
		};
		class information: RRP_RscStructuredText
		{
			idc = 25008;
			x = 0.0125;
            y = 0.4;
            w = 0.25;
            h = 0.46;
		};
        class impulseBtn: RRP_btn_yellow
        {
            idc = 25009;
            text = "Вызвать сканирующий импульс"; //--- ToDo: Localize;
            x = 0.277572;
            y = 0.88;
            w = 0.45;
            h = 0.06;
			enable = 0;
			// onButtonClick = "_this call RRPClient_WarZone_impulseAsk";
        };
		class textBox: ctrlControlsGroup
		{
            idc = 25010;
			x = 0.7375;
			y = 0.1;
			w = 0.25;
			h = 0.68;
			class VScrollBar: ScrollBar
			{
				width = 0.011;
				height=0;
				autoScrollEnabled = 1;
		        autoScrollDelay = 0.1;
		        autoScrollRewind = 0;
		        autoScrollSpeed = 0.005;
			};
			class Controls
			{
				class chatText: RRP_RscStructuredText
				{
					idc = 25013;
					x = 0;
					y = 0.02;
					w = 0.25;
					h = 0.6;
				};
			};
		};
        class sendMsg: RRP_btn_yellow
        {
            idc = 25011;
            text = "Отправить сообщение"; //--- ToDo: Localize;
            x = 0.7375;
            y = 0.88;
            w = 0.25;
            h = 0.06;
			onMouseButtonClick = "_this call RRPClient_WarZone_sendMessage";
        };
        class textEdit: RRP_RscEdit
        {
            idc = 25012;
            text = ""; //--- ToDo: Localize;
            x = 0.7375;
            y = 0.8;
            w = 0.25;
            h = 0.06;
        };
	};
};