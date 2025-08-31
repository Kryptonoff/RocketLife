// $[1.063,["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[-1000,"background: RRP_background_fade",[1,"",["0.346379 * safezoneW + safezoneX","0.313061 * safezoneH + safezoneY","0.309303 * safezoneW","0.373879 * safezoneH"],[-1,-1,-1,-1],[0.26,0.24,0.31,0.8],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],[-1001,"title: RRP_title",[1,"Lobby Poker",["0.346379 * safezoneW + safezoneX","0.293267 * safezoneH + safezoneY","0.300024 * safezoneW","0.0219929 * safezoneH"],[-1,-1,-1,-1],[0.16,0.16,0.19,1],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],[-1600,"close: RRP_btn_exit_text",[1,"X",["0.645373 * safezoneW + safezoneX","0.293267 * safezoneH + safezoneY","0.0103101 * safezoneW","0.0219929 * safezoneH"],[-1,-1,-1,-1],[0.98,0.01,0.38,1],[-1,-1,-1,-1],"","-1"],[]],[1500,"Players",[1,"",["0.350503 * safezoneW + safezoneX","0.46921 * safezoneH + safezoneY","0.301055 * safezoneW","0.15395 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1100,"Decription",[1,"",["0.350503 * safezoneW + safezoneX","0.324057 * safezoneH + safezoneY","0.301055 * safezoneW","0.142954 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2400,"CancelBtn",[1,"CANCEL",["0.350503 * safezoneW + safezoneX","0.642954 * safezoneH + safezoneY","0.128876 * safezoneW","0.0329893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[2401,"ConfirmBtn",[1,"CONFIRM",["0.522682 * safezoneW + safezoneX","0.642954 * safezoneH + safezoneY","0.128876 * safezoneW","0.0329893 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Fairy Tale, v1.063, #Lekoba)
////////////////////////////////////////////////////////
class RRPDialogPokerLobby
{
	idd = 25000;
	onLoad = "uiNamespace setVariable ['RRPDialogPokerLobby',_this#0]";
	onUnload = "uiNamespace setVariable ['RRPDialogPokerLobby',displayNull]";
	class controlsBackground
	{
		class background: RRP_background_fade
		{
			idc = -1;
			x = 0.346379 * safezoneW + safezoneX;
			y = 0.313061 * safezoneH + safezoneY;
			w = 0.309303 * safezoneW;
			h = 0.373879 * safezoneH;
		};
		class title: RRP_title
		{
			idc = 24999;
			text = "Лобби"; //--- ToDo: Localize;
			x = 0.346379 * safezoneW + safezoneX;
			y = 0.293267 * safezoneH + safezoneY;
			w = 0.300024 * safezoneW;
			h = 0.0219929 * safezoneH;
		};
		class close: RRP_btn_exit_text
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.645373 * safezoneW + safezoneX;
			y = 0.293267 * safezoneH + safezoneY;
			w = 0.0103101 * safezoneW;
			h = 0.0219929 * safezoneH;
		};
	};
	class controls
	{
		class Decription: RRP_RscStructuredText
		{
			idc = 25002;
			x = 0.352565 * safezoneW + safezoneX;
			y = 0.324057 * safezoneH + safezoneY;
			w = 0.298993 * safezoneW;
			h = 0.3079 * safezoneH;
		};
		class CancelBtn: RRP_btn_red
		{
			idc = 25003;
			text = "Отказаться"; //--- ToDo: Localize;
			x = 0.350503 * safezoneW + safezoneX;
			y = 0.642954 * safezoneH + safezoneY;
			w = 0.128876 * safezoneW;
			h = 0.0329893 * safezoneH;
			onButtonClick = "closeDialog 0";
		};
		class ConfirmBtn: RRP_btn_blue
		{
			idc = 25004;
			text = "Подтвердить"; //--- ToDo: Localize;
			x = 0.522682 * safezoneW + safezoneX;
			y = 0.642954 * safezoneH + safezoneY;
			w = 0.128876 * safezoneW;
			h = 0.0329893 * safezoneH;
			onButtonClick = "";
		};
	};
};

