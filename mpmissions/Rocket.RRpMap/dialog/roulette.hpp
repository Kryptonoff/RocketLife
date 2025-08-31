/* #Falovo
$[
	1.063,
	["roulette",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-1000,"background: RRP_background",[1,"",["0.344886 * safezoneW + safezoneX","0.291034 * safezoneH + safezoneY","0.316945 * safezoneW","0.40705 * safezoneH"],[-1,-1,-1,-1],[0.26,0.24,0.31,0.5],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[1001,"title: RRP_title",[1,"Roulette",["0.344886 * safezoneW + safezoneX","0.269038 * safezoneH + safezoneY","0.30732 * safezoneW","0.0219964 * safezoneH"],[-1,-1,-1,-1],[0.16,0.16,0.19,1],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1600,"Exit: RRP_btn_exit_text",[1,"X",["0.652109 * safezoneW + safezoneX","0.269038 * safezoneH + safezoneY","0.00969463 * safezoneW","0.0219964 * safezoneH"],[-1,-1,-1,-1],[0.98,0.01,0.38,1],[-1,-1,-1,-1],"","-1"],[]],
	[1900,"BetSlider",[1,"",["0.349733 * safezoneW + safezoneX","0.609982 * safezoneH + safezoneY","0.305383 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"BetText",[1,"",["0.349733 * safezoneW + safezoneX","0.565989 * safezoneH + safezoneY","0.305381 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"JoinGame",[1,"Join",["0.403054 * safezoneW + safezoneX","0.653975 * safezoneH + safezoneY","0.19874 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"RulesText",[1,"",["0.349733 * safezoneW + safezoneX","0.302032 * safezoneH + safezoneY","0.305381 * safezoneW","0.208966 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"GameStatusText",[1,"",["0.349733 * safezoneW + safezoneX","0.521996 * safezoneH + safezoneY","0.305381 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class RRPDialogRouletteJoin
{
	idd=24030;
	onLoad="uiNamespace setVariable ['RRPDialogRouletteJoin', _this select 0]";
	onUnload="call RRPClient_joinRussianRouletteDialog_event_onUnload; uiNamespace setVariable ['RRPDialogRouletteJoin', displayNull]";
	class controlsBackground
	{
		class background: RRP_background
		{
			idc = -1;
			x = 0.344886 * safezoneW + safezoneX;
			y = 0.291034 * safezoneH + safezoneY;
			w = 0.316945 * safezoneW;
			h = 0.40705 * safezoneH;
		};
		class title: RRP_title
		{
			idc = -1;
			text = "Рулетка"; //--- ToDo: Localize;
			x = 0.344886 * safezoneW + safezoneX;
			y = 0.269038 * safezoneH + safezoneY;
			w = 0.30732 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
		class Exit: RRP_btn_exit_text
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.652109 * safezoneW + safezoneX;
			y = 0.269038 * safezoneH + safezoneY;
			w = 0.00969463 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
	};
	class controls
	{
		class BetSlider: RRP_RscXSliderH
		{
			idc = 24031;
			x = 0.349733 * safezoneW + safezoneX;
			y = 0.609982 * safezoneH + safezoneY;
			w = 0.305383 * safezoneW;
			h = 0.0329946 * safezoneH;
		};
		class BetText: RRP_RscStructuredText
		{
			idc = 24032;
			x = 0.349733 * safezoneW + safezoneX;
			y = 0.565989 * safezoneH + safezoneY;
			w = 0.305381 * safezoneW;
			h = 0.0329946 * safezoneH;
		};
		class JoinGame: RRP_btn_blue
		{
			idc = 24033;
			text = "Присоединиться!"; //--- ToDo: Localize;
			x = 0.403054 * safezoneW + safezoneX;
			y = 0.653975 * safezoneH + safezoneY;
			w = 0.19874 * safezoneW;
			h = 0.0329946 * safezoneH;
			onButtonClick="_this call RRPClient_joinRussianRouletteDialog_event_onJoinButtonClick";
		};
		class RulesText: RRP_RscStructuredText
		{
			idc = 24034;
			x = 0.349733 * safezoneW + safezoneX;
			y = 0.302032 * safezoneH + safezoneY;
			w = 0.305381 * safezoneW;
			h = 0.208966 * safezoneH;
		};
		class GameStatusText: RRP_RscStructuredText
		{
			idc = 24035;
			x = 0.349733 * safezoneW + safezoneX;
			y = 0.521996 * safezoneH + safezoneY;
			w = 0.305381 * safezoneW;
			h = 0.0329946 * safezoneH;
		};
	};
	
};

class RscExileJoinRussianRouletteDialog
{
	idd=24030;
	onLoad="uiNamespace setVariable ['RscExileJoinRussianRouletteDialog', _this select 0]";
	onUnload="call RRPClient_joinRussianRouletteDialog_event_onUnload; uiNamespace setVariable ['RscExileJoinRussianRouletteDialog', displayNull]";
	class controlsBackground
	{
		class DialogBackground: RRP_RscStructuredText
		{
			idc=-1;
			x="10 * (0.025) + (0)";
			y="9 * (0.04) + (0)";
			w="20 * (0.025)";
			h="8.5 * (0.04)";
			colorBackground[]={0.050000001,0.050000001,0.050000001,0.69999999};
		};
		class DialogCation: RRP_RscStructuredText
		{
			idc=-1;
			text="Russian Roulette";
			x="10 * (0.025) + (0)";
			y="7.9 * (0.04) + (0)";
			w="20 * (0.025)";
			h="1 * (0.04)";
			colorBackground[]={0.1,0.1,0.1,1};
		};
		class BuyInLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Buy-In:";
			x="10.5 * (0.025) + (0)";
			y="12.5 * (0.04) + (0)";
			w="19 * (0.025)";
			h="1 * (0.04)";
		};
		class GameStatusLabel: RRP_RscStructuredText
		{
			idc=-1;
			text="Game Status:";
			x="10.5 * (0.025) + (0)";
			y="9.5 * (0.04) + (0)";
			w="19 * (0.025)";
			h="1 * (0.04)";
		};
	};
	class controls
	{
		class BuyInValue: RRP_RscStructuredText
		{
			idc=4000;
			text="<t size='1.4'>0</t>";
			x="10.5 * (0.025) + (0)";
			y="13.5 * (0.04) + (0)";
			w="19 * (0.025)";
			h="1.5 * (0.04)";
			colorBackground[]={0,0,0,0};
		};
		class GameStatusValue: RRP_RscStructuredText
		{
			idc=4001;
			text="<t size='1.4' color='#b2ec00'>Waiting for players</t>";
			x="10.5 * (0.025) + (0)";
			y="10.5 * (0.04) + (0)";
			w="19 * (0.025)";
			h="1.5 * (0.04)";
			colorBackground[]={0,0,0,0};
		};
		class CancelButton: RRP_btn_blue
		{
			idc=-1;
			action="closeDialog 0";
			x="23.5 * (0.025) + (0)";
			y="16 * (0.04) + (0)";
			w="6 * (0.025)";
			h="1 * (0.04)";
			onButtonClick = "closeDialog 0";
			colorText[]={1,1,1,1};
			colorBackground[]={0,0,0,0.80000001};
		};
		class JoinButton: RRP_btn_blue
		{
			idc=4002;
			onButtonClick="_this call RRPClient_joinRussianRouletteDialog_event_onJoinButtonClick";
			text="Join";
			x="10.5 * (0.025) + (0)";
			y="16 * (0.04) + (0)";
			w="6 * (0.025)";
			h="1 * (0.04)";
			colorText[]={1,1,1,1};
			colorBackground[]={0,0,0,0.80000001};
		};
	};
};
