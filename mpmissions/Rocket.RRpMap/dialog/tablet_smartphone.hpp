class ExtremoDialogMessager 
{
	idd = 9000;
	name= "ExtremoDialogMessager";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "['onLoad',_this select 0] call RRPClient_tg_main";
	onUnload = "['onUnload',_this select 0] call RRPClient_tg_main";
	class controlsBackground {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};
		class Tiles: RscTiles {};

		class padImage : RscPicture {
			idc = 9100;
			text = "";
			
			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
			//[-0.0875004,-0.38,1.175,1.72]
		};
		
		//Белвый фон
		class RscWiteBackground : RscText {
			idc = 9107;
			type = 0;
	        style = 0;
			x = 0.3;
			y = 0.152;
			w = 0.675;
			h = 0.72;
			colorBackground[] = {0.8,0.8,0.8,1};
			//[0.3,0.152,0.675,0.72]
			//["0.408333 * safezoneW + safezoneX","0.3086 * safezoneH + safezoneY","0.309375 * safezoneW","0.396 * safezoneH"]
		};
		
		//Оранджевый фон colorBackground[] = {1,0.5,0,1};
		class RscBlueTitle : RscText 
		{
			idc = 9108;
			x = 0.025;
			y = 0.0701018;
			w = 0.951;
			h = 0.08;
			type = 0;
	        style = 0;
			colorBackground[] = {0.349,0.49,0.639,1};
			//[0.025,0.0701018,0.951,0.08]
			//["0.282292 * safezoneW + safezoneX","0.263556 * safezoneH + safezoneY","0.4345 * safezoneW","0.044 * safezoneH"]
		};
		
		class RscBlueBackground : RscText 
		{
			idc = 9109;
			x = 0.025;
			y = 0.152;
			w = 0.275;
			h = 0.72;
			type = 0;
	        style = 0;
			colorBackground[] = {0.8,0.8,0.8,1};
			//[0.025,0.152,0.275,0.72]
			//["0.282292 * safezoneW + safezoneX","0.3086 * safezoneH + safezoneY","0.126042 * safezoneW","0.396 * safezoneH"]
		};
		
		//[0.0234866,0.0701018,0.951055,0.8] весь экран
		
		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Назад";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
			
			x = 0.375001;
			y = 0.86;
			w = 0.0624999;
			h = 0.06;
		};
		
		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Закрыть";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.462499;
			y = 0.86;
			w = 0.075;
			h = 0.06;
		};
		
		//[0.0234866,0.0701018,0.951055,0.8] весь экран
	};
	
	class controls 
	{
		class PlayerList : RscListBox
		{
			idc = 9001;	
			colorBackground[] = {0,0,0,0}; // Fill color
			colorSelectBackground[] = {0.349,0.49,0.639, 0.2}; // Selected item fill color
			colorSelectBackground2[] = {0.349,0.49,0.639, 0.2}; // Selected item fill color (oscillates between this and colorSelectBackground)
			colorText[] = {0.349,0.49,0.639,1};
			colorSelect[] = {0.349,0.49,0.639,1}; // Text selection color
			colorSelect2[] = {0.349,0.49,0.639, 1}; // Text selection color (oscillates between this and colorSelect)
			colorPictureRight[] = {0,0,0,0}; // Right picture color
	        colorPictureRightSelected[] = {0,0,0,0}; // Selected right picture color
			class ListScrollBar: ListScrollBar
	        {
				color[] = {0.349,0.49,0.639,0.9};
	        };
			rowHeight = 0.06;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";
			

			x = 0.025;
			y = 0.152;
			w = 0.2725;
			h = 0.64;
		};
		
		class searchPicture : RscPicture {
		    idc = 9222;
		    text = "rimas_agent\assets\telegram\find.paa";
			x = 0.0368; 
			y = 0.09;
		    w = 0.035; 
			h = 0.045;
		};
		
		class searchFilter : RscEdit 
		{
		    idc = 9002;
		    text = "";
			lineSpacing = 1;
			style = 16 + 512;
			
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.078,0.23,0.37,1};
			colorSelection[] = {0.349,0.49,0.639,1};
			x = 0.077576; 
			y = 0.09;
		    w = 0.22; 
			h = 0.044;
		};
		
		class modFilter : RscCombo 
		{
		    idc = 9003;
		    text = "";
			colorBackground[] = {0.349,0.49,0.639,1};
			x = 0.0375; 
			y = 0.81;
		    w = 0.25; 
			h = 0.04;
		};
		
		class tilesStatus : RscStructuredText 
		{
			idc = 9004;
			colorBackground[] = {0,0,0,0};
			text = "";
			x = 0.4875;
			y = 0.08;
			w = 0.2875;
			h = 0.075;
		};
		
		class showText : RscControlsGroup {
			idc = 9005;
			colorBackground[] = {0.28,0.28,0.28,0};
			x = 0.3;
			y = 0.152;
			w = 0.6735;
			h = 0.6;
			class VScrollBar : VScrollBar {
				width = 0.011;
				autoScrollEnabled = 1; // 1 to enable automatic scrolling
		        autoScrollDelay = 0.1; // Время начала автопрокрутки
		        autoScrollRewind = 0; // Repeat the autoscroll once it's finished
		        autoScrollSpeed = 0.005; // Autoscroll speed
				color[] = {0.349,0.49,0.639,0.9};
			};
			class HScrollbar : HScrollbar {
				height = 0;
			};

			class controls {
				class textShow : RscStructuredText {
					idc = 9006;
					text = "";
					//show = 0;
					lineSpacing = 1;
					colorBackground[] = {0.28,0.28,0.28,0};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = 0;
					y = 0.01;
					w = 0.669;
					h = 0.6;
				};
			};
		};
		
		class EditText : RscEdit 
		{
			idc = 9007;
			text = "";
			style = 16;
			shadow = 0;
			lineSpacing = 1;
			colorText[] = {0,0,0,1};
			colorSelection[] = {0.349,0.49,0.639,0.6};
			colorBackground[] = {1,1,1,1};
			colorBorder[] = {0.349,0.49,0.639,0.6};
			x = 0.3125; 
			y = 0.76;
			w = 0.5; 
			h = 0.1;
		};
		
		class ButtonSendMessage : RscPictureButtonMenu {
		    idc = 9208;
		    text = "Отправить";
			colorBackground[] = {0.349,0.49,0.639,0.6};
			x = 0.825; 
			y = 0.76;
		    w = 0.1375; 
			h = 0.06;
			class Attributes
			{
				align = "center";
			};
		};
		
		class ListEmoje : RscCombo {
		    idc = 9207;
			colorBackground[] = {0.349,0.49,0.639,1};
			x = 0.825; 
			y = 0.82;
		    w = 0.1375; 
			h = 0.04;
		};
		
		class comingTime : RscText {
			idc = 9008;
			text = "";
			colorBackground[] = {0.28,0.28,0.28,0};
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";

			x = 0.3125;
			y = 0.16;
			w = 0.25;
			h = 0.06;
		};
		class BtnCompleteCall : RscPictureButtonMenu {
			idc = 9009;
			text = "Завершить";
			colorBackground[] = {1,0,0,0.8};
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			
			x = 0.575;
			y = 0.016;
			w = 0.125;
			h = 0.06;
		};
		class BtnVolPlus : RscPictureButtonMenu {
			idc = 9010;
			text = "+";
			show = 0;
			colorBackground[] = {1,0,0,0};
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			
			x = 0.7125;
			y = 0.16;
			w = 0.05;
			h = 0.06;
		};
		class BtnVolMin : RscPictureButtonMenu {
			idc = 9011;
			text = "-";
			show = 0;
			colorBackground[] = {1,0,0,0};
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			
			x = 0.775001;
			y = 0.16;
			w = 0.05;
			h = 0.06;
		};
		
		class BtnSpeakers : RscPictureButtonMenu {
			idc = 9012;
			text = "Динамики";
			//show = 0;
			colorBackground[] = {0.28,0.28,0.28,0};
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			
			x = 0.837499;
			y = 0.16;
			w = 0.125;
			h = 0.06;
		};
		
		class Button1 : RscPictureButtonMenu {
		    idc = 9201;
		    text = "";
			colorBackground[] = {0.28,0.28,0.28,0};
			x = 0.3; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class Button2 : RscPictureButtonMenu {
		    idc = 9202;
		    text = "";
			colorBackground[] = {0.28,0.28,0.28,0};
			x = 0.3625; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class Button3 : RscPictureButtonMenu {
		    idc = 9203;
		    text = "";
			colorBackground[] = {0.28,0.28,0.28,0};
			x = 0.425; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class Button4 : RscPictureButtonMenu {
		    idc = 9204;
		    text = "";
			colorBackground[] = {0.28,0.28,0.28,0};
			x = 0.7875; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class Button5 : RscPictureButtonMenu {
		    idc = 9205;
		    text = "";
			colorBackground[] = {0.28,0.28,0.28,0};
			x = 0.85; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class Button6 : RscPictureButtonMenu {
		    idc = 9206;
		    text = "";
			colorBackground[] = {0.28,0.28,0.28,0};
			x = 0.9125; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class btn1Picture : RscPicture {
		    idc = 9101;
		    text = "";
			x = 0.3; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class btn2Picture : RscPicture {
		    idc = 9102;
		    text = "";
			x = 0.3625; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class btn3Picture : RscPicture {
		    idc = 9103;
		    text = "";
			x = 0.425; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class btn4Picture : RscPicture {
		    idc = 9104;
		    text = "";
			x = 0.7875; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class btn5Picture : RscPicture {
		    idc = 9105;
		    text = "";
			x = 0.85; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class btn6Picture : RscPicture {
		    idc = 9106;
		    text = "";
			x = 0.9125; 
			y = 0.08;
		    w = 0.05; 
			h = 0.06;
		};
		
		class incomingCall : RscControlsGroupNoScrollbars {
			idc = 9013;
			colorBackground[] = {0.28,0.28,0.28,0.8};
			show = 0;
			x = "0.494271 * safezoneW + safezoneX";
			y = "0.346 * safezoneH + safezoneY";
			w = "0.131771 * safezoneW";
			h = "0.099 * safezoneH";
			//["0.494271 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.131771 * safezoneW","0.088 * safezoneH"]
			//[0.5375,0.28,0.2,0.18]
			class controls {
				class incomingName : RscText {
					idc = 9014;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					class Attributes {align = "center";};
					
					x = 0.0125;
					y = 0.01;
					w = "0.131771 * safezoneW";
					h = "0.044 * safezoneH";
					//[0.0125,0.01,0.25,0.08]
					//["0.270833 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.131771 * safezoneW","0.044 * safezoneH"]
				};
				class AcceptCall : RscButtonUC {
					idc = 9015;
					text = "Принять";
					colorBackground[] = {1,0,0,0.8};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					class Attributes {align = "center";};
					
					x = 0;
					y = 0.01;
					w = "0.0630208 * safezoneW";
					h = "0.033 * safezoneH";
					//[0,0.1,0.1375,0.08]
					//["0.270833 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.0630208 * safezoneW","0.033 * safezoneH"]
				};
				class DeclineCall : RscButtonUC {
					idc = 9016;
					text = "Отклонить";
					colorBackground[] = {1,0,0,0.8};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					class Attributes {align = "center";};
					
					x = 0.1375;
					y = 0.01;
					w = "0.0630208 * safezoneW";
					h = "0.033 * safezoneH";
					//[0.1375,0.1,0.1375,0.08]
					//["0.339584 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.0630208 * safezoneW","0.033 * safezoneH"]
				};
			};
		};
		
		class btnCall: ctrlActivePicture {
			idc = 9017;
			text = "";
			x = 0.325;
			y = 0.08;
			w = 0.04;
			h = 0.06;
		};
		
	};
};
class FatumDialogCallPhone {
	idd = 2863;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {	
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};
		class Tiles: RscTiles {};

		class padImage : RscPicture {
			idc = 7201;
			text = "";
			
			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};

		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0;";
			tooltip = "Назад";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.375001;
			y = 0.86;
			w = 0.0624999;
			h = 0.06;
		};
		
		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Закрыть";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.462499;
			y = 0.86;
			w = 0.075;
			h = 0.06;
		};
	};
	
	class controls {
		class Info: RscStructuredText {
			idc = 2864;
			text = "";
			x = 0.0404999;
			y = 0.096;
			w = 0.925;
			h = 0.54;
			colorBackground[] = {0,0,0,0};
		};
		class Btn1: ctrlActivePicture {
			idc = 2865;
			text = "rimas_agent\assets\telegram\RedCall.paa";
			x = 0.6375;
			y = 0.66;
			w = 0.0875;
			h = 0.1;
			colorBackground[] = {1,1,1,1};
		};
		class Btn2: ctrlActivePicture {
			idc = 2866;
			text = "rimas_agent\assets\telegram\GreenCall.paa";
			x = 0.25;
			y = 0.66;
			w = 0.0875;
			h = 0.1;
			colorBackground[] = {1,1,1,1};
		};
	};
};
class UnionDialogSmartphone {
	idd = 88888;
	name = "UnionDialogSmartphone";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "[] spawn RRPClient_system_smartphone; true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class padImage : RscPicture {
			idc = 888907;
			text = "";
			
			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};
		
		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; [] spawn RRPClient_pad_openMain";
			tooltip = "Вернуться в главное меню";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = "0.475161 * safezoneW + safezoneX";
			y = "0.722828 * safezoneH + safezoneY";
			w = "0.0257775 * safezoneW";
			h = "0.0439982 * safezoneH";
			// ["0.475161 * safezoneW + safezoneX","0.722828 * safezoneH + safezoneY","0.0257775 * safezoneW","0.0439982 * safezoneH"]
		};
		
		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Закрыть";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = "0.5 * safezoneW + safezoneX";
			y = "0.719991 * safezoneH + safezoneY";
			w = "0.0257775 * safezoneW";
			h = "0.0439982 * safezoneH";
			
			// ["0.475161 * safezoneW + safezoneX","0.722828 * safezoneH + safezoneY","0.0257775 * safezoneW","0.0439982 * safezoneH"]
		};
	};
	
	class controls {
		
		class MessagesTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = 88886;
			text = "";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			
			x = 0.299999;
			y = 0.1;
			w = 0.6625;
			h = 0.04;
		};		
		
		class MessageTextTitle : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = 88890;
			text = "Выберите сообщение для прочтения";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			
			x = 0.299999;
			y = 0.44;
			w = 0.6625;
			h = 0.04;
			
		};
		
		class PlayerList : RscListBox
		{
			idc = 88881;
			onLBSelChanged = "[2] spawn RRPClient_system_smartphone;";
			
			x = 0.0374988;
			y = 0.16;
			w = 0.250001;
			h = 0.6;
			
		};
		
		class MessageList : RscListNBox
		{
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] spawn RRPClient_system_showMsg;";
			//sizeEx = 0.04;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3};
			
			x = 0.299999;
			y = 0.16;
			w = 0.6625;
			h = 0.26;
		};

		class TextShow : RscControlsGroup {
			x = 0.299999;
			y = 0.5;
			w = 0.6625;
			h = 0.26;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.6625;
					h = 1;
				};
			};
		};
				
		class NewMessageButton: RscButtonUC
		{
			idc = 887892;
			text = "Новое сообщение";	
			onButtonClick = "[4] spawn RRPClient_system_smartphone";			
			
			x = 0.0374988;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};
		
		class 911MessageButton: RscButtonUC
		{
			idc = -1;
			text = "Экстренный вызов";	
			onButtonClick = "createDialog ""RRPDialogSmartphoneNotruf""";			
			
			x = 0.299999;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};
		
		class ClearMessageButton: RscButtonUC
		{
			idc = -1;
			text = "Удалить сообщения";	
			onButtonClick = "[3] spawn RRPClient_system_smartphone";
			tooltip = "Очистить историю сообщений";
			
			x = 0.7125;
			y = 0.78;
			w = 0.250001;
			h = 0.06;
		};

		class ContactsTitle : RscTitle {
			idc = -1;
			text = "Контакты";
			colorBackground[] = {1,1,1,0.1};
			
			x = 0.0374988;
			y = 0.1;
			w = 0.250001;
			h = 0.04;
		};
	};

};

class UnionDialogSmartphoneTargetMessage
{
	idd = 88883;
	name = "UnionDialogSmartphoneTargetMessage";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	

	class controlsBackground {
		class RscTitleBackground:RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.1;
		};
		
	};
	class controls {
		class Title : RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "Сообщение:";
			x = 0.1;
			y = 0.2;
			w = 0.95;
			h = (1 / 25);
		};
		
		class Absenden : RscButtonMenu {
			idc = 88885;
			text = "Отправить";
			onButtonClick = "[1,-1,(ctrlText 88884)] call RRPClient_system_newMsg;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.6 - (6.25 / 40) + 0.088;
			y = 0.3 + (1 / 25)  - 0.048;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class AdminMsg : RscButtonMenu 
		{
			idc = 888897;
			text = "От админа";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			onButtonClick = "[5,-1,(ctrlText 88884)] call RRPClient_system_newMsg;";
			
			x = 0.6 - (6.25 / 40) - 0.121;
			y = 0.3 + (1 / 25)  - 0.048;
			w = 0.2;
			h = (1 / 25);
		};
		
		class Close : RscButtonMenu {
			idc = -1;
			text = "Закрыть";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			x = 0.11;
			y = 0.3 + (1 / 25)  - 0.048;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class textEdit : RscEdit {
			idc = 88884;
			text = "";
			sizeEx = 0.030;
			x = 0.11; y = 0.3 - 0.048;
			w = 0.58; h = 0.03;
		};
	
	};
	
};


class RRPDialogSmartphoneNotruf 
{
	idd = 887890;
	name= "RRPDialogSmartphoneNotruf";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[6] spawn RRPClient_system_newMsg;";
	class controlsBackground 
	{
		class RscTitleBackground:RscText 
		{
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.64;
			h = (1 / 25);
		};
		class MainBackground:RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.64;
			h = 0.15 - (5 / 250);
		};
	};
	
	class controls 
	{
		class Title : RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 888892;
			text = "Экстренный вызов";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		class textEdit : RscEdit 
		{
			idc = 888894;
			text = "";
			sizeEx = 0.030;
			x = 0.11; y = 0.25;
			w = 0.62; h = 0.03;	
		};
		class TxtCopButton : RscButtonMenu 
		{
			idc = 888895;
			text = "Полиция";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[2,-1,(ctrlText 888894)] call RRPClient_system_newMsg;";
			
			x = 0.32;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class TxtAdminButton : RscButtonMenu 
		{
			idc = 888896;
			text = "Админу";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[3,-1,(ctrlText 888894)] call RRPClient_system_newMsg;";
			
			x = 0.53;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
				
		class AdminMsgAll : RscButtonMenu 
		{
			idc = 888898;
			text = "Админ всем";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[7,-1,(ctrlText 888894)] call RRPClient_system_newMsg;";
			
			x = 0.53;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class CopAllButton : RscButtonMenu 
		{
			idc = 888900;
			text = "Полиц всем";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[8,-1,(ctrlText 888894)] call RRPClient_system_newMsg;";
			
			x = 0.32;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class EMSReq : RscButtonMenu
		{
			idc = 888899;
			text = "МЧС";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[4,-1,(ctrlText 888894)] call RRPClient_system_newMsg;";
			
			x = 0.11;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class EMSToAll : RscButtonMenu
		{
			idc = 888905;
			text = "МЧС всем";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[9,-1,(ctrlText 888894)] call RRPClient_system_newMsg;";
			
			x = 0.11;
			y = 0.30;
			w = 0.2;
			h = (1 / 25);
		};
		
		class TaxiButton : RscButtonMenu 
		{
			idc = 888906;
			text = "Такси";
			colorBackground[] = {0.655,0.318,0.094,1};
			onButtonClick = "[10,-1,(ctrlText 888894)] call RRPClient_system_newMsg;";
			x = 0.53;
			y = 0.36 + (1 / 50);
			w = 0.2;
			h = (1 / 25);
		};		
		
		class CloseButton : RscButtonMenu 
		{
			idc = -1;
			text = "Закрыть";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.36 + (1 / 50);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Shab1 : RscButtonMenu 
		{
			idc = 888901;
			text = "КПП Кавала";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[8,-1,""Уважаемые граждане! Работает КПП 'Кавала'. Будьте готовы предъявить документы, а также предоставить личные вещи и автотранспорт к досмотру.""] call RRPClient_system_newMsg;";
			x = 0.53;
			y = 0.38;
			w = 0.2;
			h = (1 / 25);
		};
		
		class Shab2 : RscButtonMenu 
		{
			idc = 888902;
			text = "Федрезерв";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[8,-1,""Внимание! Военное положение на Национальном резерве в радиусе 2км! Всем покинуть территорию, ведется огонь на поражение!""] call RRPClient_system_newMsg;";
			x = 0.53;
			y = 0.43;
			w = 0.2;
			h = (1 / 25);
		};

		class PressButton : RscButtonMenu 
		{
			idc = 888908;
			text = "7NEWS";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			onButtonClick = "[11,-1,(ctrlText 888894)] call RRPClient_system_newMsg;";
			x = 0.53;
			y = 0.43;
			w = 0.2;
			h = (1 / 25);
		};
		
		class Shab3 : RscButtonMenu 
		{
			idc = 888903;
			text = "Руки Вверх!";
			
			onButtonClick = "[8,-1,(ctrlText 888894) + ""! Сдавайтесь! Вы окружены, сопротивление бесполезно! В случае невыполнения требований полиции будет открыт огонь на поражение!""] call RRPClient_system_newMsg;";
			x = 0.53;
			y = 0.5;
			w = 0.2;
			h = (1 / 25);
		};
		
		class Shab4 : RscButtonMenu 
		{
			idc = 888904;
			text = "Стой и выйди";
			
			onButtonClick = "[8,-1,(ctrlText 888894) + ""! Немедленно остановитесь, выйдите из техники и поднимите руки вверх! В случае невыполнения требований полиции будет открыт огонь на поражение!""] call RRPClient_system_newMsg;";
			x = 0.53;
			y = 0.55;
			w = 0.2;
			h = (1 / 25);
		};
		class Shab5 : RscButtonMenu 
		{
			idc = 888909;
			text = "Стой и сиди";
			
			onButtonClick = "[8,-1,(ctrlText 888894) + ""! Немедленно остановитесь! Заглушите двигатель и оставайтесь в транспортном средстве! Ожидайте дальнейших указаний! В случае невыполнения требований будет применено оружие!""] call RRPClient_system_newMsg;";
			x = 0.53;
			y = 0.6;
			w = 0.2;
			h = (1 / 25);
		};
		class listBoxMedMsg: RscCombo
		{
			idc = 9852;
			x = 0.335041 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0824797 * safezoneW;
			h = 0.0219919 * safezoneH;
		};
		class medMsg: RscButtonMenu
		{
			idc = 888911;
			onButtonClick = "[12] spawn RRPClient_system_newMsg;";
			text = "ГЛОБАЛ СООБЩЕНИЕ";  
			x = 0.335041 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.0824797 * safezoneW;
			h = 0.0219919 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.584,0.086,0.086,1};
		};
	};
};

