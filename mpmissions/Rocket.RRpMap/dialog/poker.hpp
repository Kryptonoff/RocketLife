class ExtremoDialogPokerWaiting
{
	idd = 6300;
	name="ExtremoDialogPokerWaiting";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur";
	onUnload = "false call RRPClient_gui_util_blur";
	
	class controlsBackground
	{

		class Title : RRP_title
		{
			idc = 6301;
			text = "Покерный стол";
			
			x = 0.31437 * safezoneW + safezoneX;
			y = 0.27252 * safezoneH + safezoneY;
			w = 0.370987 * safezoneW;
			h = 0.042 * safezoneH;
		};
	};
	
	class controls
	{
		class pokerInformation : RRP_RscStructuredText
		{
			idc = 6302;
			text = "";
			
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.351656 * safezoneW;
			h = 0.22 * safezoneH;
		};
		
		class CancelButton : RRP_btn_noLine
		{
			idc = 6303;
			text = "Отказаться";
			onButtonClick = "closeDialog 0";
			
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.145226 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class AcceptButton : RRP_btn_noLine
		{
			idc = 6304;
			text = "Согласиться";
			onButtonClick = "";
			
			x = 0.53093 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.145226 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};
class ExtremoDialogPoker
{
	idd = 6200;
	name = "ExtremoDialogPoker";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {

		class ActionsBackground: RRP_background_fade {			
			idc = -1;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.0622 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.9172 * safezoneH;
		};

		class PotBackground: RRP_background_fade {			
			idc = -1;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.0302001 * safezoneH;
		};

		class StackBackground: RRP_background_fade {			
			idc = -1;
			x = 0.438537 * safezoneW + safezoneX;
			y = 0.87246 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.0302 * safezoneH;
		};

		class SidePotsBackground: RRP_background_fade {			
			idc = 6214;
			show = 0;
			
			x = 0.759875 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.222 * safezoneH;
		};
	};
	
	class controls //RscPicture
	{
		class ActionsTitle : RRP_title {			
			idc = -1;
			text = "История ходов";

			x = 0.00971176 * safezoneW + safezoneX;
			y = 0.0204 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class SidePotsTitle : RRP_title {			
			idc = 6215;
			text = "Побочные банки";
			show = 0;

			x = 0.759875 * safezoneW + safezoneX;
			y = 0.0204 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CurrentPot: RRP_RscStructuredText {
			idc = 6201;
			text = ""; //--- ToDo: Localize;

			x = 0.438125 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.0302001 * safezoneH;
		};

		class Pots: RRP_RscStructuredText {
			idc = 6216;
			text = ""; //--- ToDo: Localize;
			show = 0;

			x = 0.766063 * safezoneW + safezoneX;
			y = 0.0732 * safezoneH + safezoneY;
			w = 0.21628 * safezoneW;
			h = 0.1974 * safezoneH;
		};

		class CurrentStack: RRP_RscStructuredText {
			idc = 6204;
			text = ""; //--- ToDo: Localize;

			x = 0.438537 * safezoneW + safezoneX;
			y = 0.87246 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.0302 * safezoneH;
		};

		class ActionsList: RRP_RscListBox {
			idc = 6205;

			x = 0.0153128 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.219367 * safezoneW;
			h = 0.898201 * safezoneH;
		};

		class FoldButton: RRP_btn_noLine {
			idc = 6206;
			text = "Fold";
			onButtonClick = "['fold'] call RRPClient_poker_makeMove";

			x = 0.245591 * safezoneW + safezoneX;
			y = 0.9103 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.0676001 * safezoneH;			
		};

		class CheckCallButton: RRP_btn_noLine {
			idc = 6207;
			text = "";
			onButtonClick = "['checkcall'] call RRPClient_poker_makeMove";

			x = 0.438537 * safezoneW + safezoneX;
			y = 0.90986 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.0676001 * safezoneH;			
		};

		class RaiseButton: RRP_btn_noLine {
			idc = 6208;
			text = "Raise";
			onButtonClick = "['raise'] call RRPClient_poker_makeMove";

			x = 0.631072 * safezoneW + safezoneX;
			y = 0.91008 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.0676001 * safezoneH;			
		};

		class RaiseSlider: RscXSliderH {
			idc = 62081;

			x = 0.631072 * safezoneW + safezoneX;
			y = 0.83506 * safezoneH + safezoneY;
			w = 0.186374 * safezoneW;
			h = 0.0302001 * safezoneH;
		};

		class Card_1: RscPicture {
			idc = 6209;
			text = "\RRP_icons\poker\shirt.paa";

			x = 0.407187 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0409674 * safezoneW;
			h = 0.1534 * safezoneH;			
		};

		class Card_2: RscPicture {
			idc = 6210;
			text = "shirt.paa";

			x = 0.45875 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0409674 * safezoneW;
			h = 0.1534 * safezoneH;			
		};

		class Card_3: RscPicture {
			idc = 6211;
			text = "shirt.paa";

			x = 0.510312 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0409674 * safezoneW;
			h = 0.1534 * safezoneH;			
		};

		class Card_4: RscPicture {
			idc = 6212;
			text = "\RRP_icons\poker\shirt.paa";

			x = 0.561875 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0409674 * safezoneW;
			h = 0.1534 * safezoneH;			
		};

		class Card_5: RscPicture {
			idc = 6213;
			text = "\RRP_icons\poker\shirt.paa";

			x = 0.613437 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0409674 * safezoneW;
			h = 0.1534 * safezoneH;			
		};
		//----------------- FIRST -----------------//
		class FirstPlayerNameAndStack: RRP_RscStructuredText {
			idc = 62161;
			text = ""; //--- ToDo: Localize;

			x = 0.676344 * safezoneW + safezoneX;
			y = 0.3518 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.0432 * safezoneH;
		};
		class FirstPlayerProgress: Life_V3_RscProcessBar {
			idc = 62171;
			text = ""; //--- ToDo: Localize;

			x = 0.676344 * safezoneW + safezoneX;
			y = 0.405 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};
		class FirstPlayerProgressText: Life_V3_RscProcessBarText {
			idc = 62181;
			text = ""; //--- ToDo: Localize;

			x = 0.676344 * safezoneW + safezoneX;
			y = 0.405 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};

		class FirstPlayerCard_1: RscPicture {
			idc = 62191;
			text = ""; //--- ToDo: Localize;

			x = 0.691816 * safezoneW + safezoneX;
			y = 0.4446 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		class FirstPlayerCard_2: RscPicture {
			idc = 62201;
			text = ""; //--- ToDo: Localize;

			x = 0.746475 * safezoneW + safezoneX;
			y = 0.4446 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		//----------------- SECOND -----------------//
		class SecondPlayerNameAndStack: RRP_RscStructuredText {
			idc = 62162;
			text = ""; //--- ToDo: Localize;

			x = 0.54125 * safezoneW + safezoneX;
			y = 0.6078 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.0432 * safezoneH;
		};
		class SecondPlayerProgress: Life_V3_RscProcessBar {
			idc = 62172;
			text = ""; //--- ToDo: Localize;

			x = 0.54125 * safezoneW + safezoneX;
			y = 0.661 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};
		class SecondPlayerProgressText: Life_V3_RscProcessBarText {
			idc = 62182;
			text = ""; //--- ToDo: Localize;

			x = 0.54125 * safezoneW + safezoneX;
			y = 0.661 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};

		class SecondPlayerCard_1: RscPicture {
			idc = 62192;
			text = ""; //--- ToDo: Localize;

			x = 0.55672 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		class SecondPlayerCard_2: RscPicture {
			idc = 62202;
			text = ""; //--- ToDo: Localize;

			x = 0.60922 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		//----------------- THIRD -----------------//
		class ThirdPlayerNameAndStack: RRP_RscStructuredText {
			idc = 62163;
			text = ""; //--- ToDo: Localize;

			x = 0.402031 * safezoneW + safezoneX;
			y = 0.6078 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.0432 * safezoneH;
		};
		class ThirdPlayerProgress: Life_V3_RscProcessBar {
			idc = 62173;
			text = ""; //--- ToDo: Localize;

			x = 0.402031 * safezoneW + safezoneX;
			y = 0.661 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};
		class ThirdPlayerProgressText: Life_V3_RscProcessBarText {
			idc = 62183;
			text = ""; //--- ToDo: Localize;

			x = 0.402031 * safezoneW + safezoneX;
			y = 0.661 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};

		class ThirdPlayerCard_1: RscPicture {
			idc = 62193;
			text = ""; //--- ToDo: Localize;

			x = 0.4175 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		class ThirdPlayerCard_2: RscPicture {
			idc = 62203;
			text = ""; //--- ToDo: Localize;

			x = 0.47 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		//----------------- FOURTH -----------------//
		class FourthPlayerNameAndStack: RRP_RscStructuredText {
			idc = 62164;
			text = ""; //--- ToDo: Localize;

			x = 0.264871 * safezoneW + safezoneX;
			y = 0.3518 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.0432 * safezoneH;
		};
		class FourthPlayerProgress: Life_V3_RscProcessBar {
			idc = 62174;
			text = ""; //--- ToDo: Localize;

			x = 0.264871 * safezoneW + safezoneX;
			y = 0.405 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};
		class FourthPlayerProgressText: Life_V3_RscProcessBarText {
			idc = 62184;
			text = ""; //--- ToDo: Localize;

			x = 0.264871 * safezoneW + safezoneX;
			y = 0.405 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};

		class FourthPlayerCard_1: RscPicture {
			idc = 62194;
			text = ""; //--- ToDo: Localize;

			x = 0.280343 * safezoneW + safezoneX;
			y = 0.4446 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		class FourthPlayerCard_2: RscPicture {
			idc = 62204;
			text = ""; //--- ToDo: Localize;

			x = 0.335002 * safezoneW + safezoneX;
			y = 0.4446 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		//----------------- FIFTH -----------------//
		class FifthPlayerNameAndStack: RRP_RscStructuredText {
			idc = 62165;
			text = ""; //--- ToDo: Localize;

			x = 0.402031 * safezoneW + safezoneX;
			y = 0.131275 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.0432 * safezoneH;
		};
		class FifthPlayerProgress: Life_V3_RscProcessBar {
			idc = 62175;
			text = ""; //--- ToDo: Localize;

			x = 0.402031 * safezoneW + safezoneX;
			y = 0.185075 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};
		class FifthPlayerProgressText: Life_V3_RscProcessBarText {
			idc = 62185;
			text = ""; //--- ToDo: Localize;

			x = 0.402031 * safezoneW + safezoneX;
			y = 0.185075 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};

		class FifthPlayerCard_1: RscPicture {
			idc = 62195;
			text = ""; //--- ToDo: Localize;

			x = 0.4175 * safezoneW + safezoneX;
			y = 0.222075 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		class FifthPlayerCard_2: RscPicture {
			idc = 62205;
			text = ""; //--- ToDo: Localize;

			x = 0.47 * safezoneW + safezoneX;
			y = 0.222075 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		//----------------- SIXTH -----------------//
		class SixthPlayerNameAndStack: RRP_RscStructuredText {
			idc = 62166;
			text = ""; //--- ToDo: Localize;

			x = 0.54125 * safezoneW + safezoneX;
			y = 0.131275 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.0432 * safezoneH;
		};
		class SixthPlayerProgress: Life_V3_RscProcessBar {
			idc = 62176;
			text = ""; //--- ToDo: Localize;

			x = 0.54125 * safezoneW + safezoneX;
			y = 0.185075 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};
		class SixthPlayerProgressText: Life_V3_RscProcessBarText {
			idc = 62186;
			text = ""; //--- ToDo: Localize;

			x = 0.54125 * safezoneW + safezoneX;
			y = 0.185075 * safezoneH + safezoneY;
			w = 0.12039 * safezoneW;
			h = 0.030 * safezoneH;
		};

		class SixthPlayerCard_1: RscPicture {
			idc = 62196;
			text = ""; //--- ToDo: Localize;

			x = 0.55672 * safezoneW + safezoneX;
			y = 0.222075 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
		class SixthPlayerCard_2: RscPicture {
			idc = 62206;
			text = ""; //--- ToDo: Localize;

			x = 0.60922 * safezoneW + safezoneX;
			y = 0.222075 * safezoneH + safezoneY;
			w = 0.03478 * safezoneW;
			h = 0.1336 * safezoneH;
		};
	};
};
