/* #Sywuli
$[
	1.063,
	["template",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"TemplateGroup",[1,"",["0.298881 * safezoneW + safezoneX","0.224932 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2400,"backButton",[2300,"MainMenu",["0.305272 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"MessagesTitle",[2300,"",[0.299999,0.1,0.6625,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"MessageTextTitle",[2300,"",[0.299999,0.44,0.6625,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"PlayerList",[2300,"",[0.0374988,0.16,0.250001,0.6],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"MessageList",[2300,"",[0.299999,0.16,0.6625,0.26],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"TextShow",[2300,"",[0.299999,0.5,0.6625,0.26],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2401,"NewMessageButton",[2300,"",[0.0374988,0.78,0.250001,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2402,"911MessageButton",[2300,"",[0.299999,0.78,0.250001,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2403,"ClearMessageButton",[2300,"",[0.7125,0.78,0.250001,0.06],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"ContactsTitle",[2300,"",[0.0374988,0.1,0.250001,0.04],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class MessagerSlide: SlideTab
{
	idc = 26000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 34001;
        };
		class MessagesTitle: AppRscStructuredText
		{
			idc = 88886;
			x = 0.123765 * safezoneW;
			y = 0.0550136 * safezoneH;
			w = 0.273315 * safezoneW;
			h = 0.0220054 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
		};
		class MessageTextTitle: AppRscStructuredText
		{
			idc = 88890;
			x = 0.123765 * safezoneW;
			y = 0.242059 * safezoneH;
			w = 0.273315 * safezoneW;
			h = 0.0220054 * safezoneH;
			text = "Выберите сообщение для прочтения";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
		};
		class PlayerList: AppRscListbox
		{
			idc = 88881;
			x = 0.0154702 * safezoneW;
			y = 0.0880218 * safezoneH;
			w = 0.103138 * safezoneW;
			h = 0.330081 * safezoneH;
			onLBSelChanged = "[2] spawn RRPClient_system_smartphone;";
		};
		class MessageList: AppRscListNbox
		{
			idc = 88882;
			x = 0.123765 * safezoneW;
			y = 0.0880218 * safezoneH;
			w = 0.273315 * safezoneW;
			h = 0.143035 * safezoneH;
			onLBSelChanged = "[(lbCurSel 88882)] spawn RRPClient_system_showMsg;";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
		class TextShow: RscControlsGroup
		{
			idc = 1103;
			x = 0.123765 * safezoneW;
			y = 0.275067 * safezoneH;
			w = 0.273315 * safezoneW;
			h = 0.143035 * safezoneH;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : AppRscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.273315 * safezoneW;
					h = 0.143035 * safezoneH;
				};
			};
		};
		class NewMessageButton: AppTabletButton
		{
			idc = 887892;
			text = "Новое сообщение";	
			onButtonClick = "[4] spawn RRPClient_system_smartphone";	
			x = 0.0154702 * safezoneW;
			y = 0.429105 * safezoneH;
			w = 0.103138 * safezoneW;
			h = 0.0330081 * safezoneH;
		};
		class 911MessageButton: AppTabletButton
		{
			idc = 887893;
			text = "Экстренный вызов";	
			onButtonClick = "createDialog ""RRPDialogSmartphoneNotruf""";	
			x = 0.123765 * safezoneW;
			y = 0.429105 * safezoneH;
			w = 0.103138 * safezoneW;
			h = 0.0330081 * safezoneH;
		};
		class ClearMessageButton: AppTabletButton
		{
			idc = 887894;
			text = "Удалить сообщения";	
			onButtonClick = "[3] spawn RRPClient_system_smartphone";
			tooltip = "Очистить историю сообщений";
			x = 0.293943 * safezoneW;
			y = 0.429105 * safezoneH;
			w = 0.103138 * safezoneW;
			h = 0.0330081 * safezoneH;
		};
		class ContactsTitle: AppRscStructuredText
		{
			idc = 887895;
			text = "Контакты";
			x = 0.0154702 * safezoneW;
			y = 0.0550136 * safezoneH;
			w = 0.103138 * safezoneW;
			h = 0.0220054 * safezoneH;
		};
	};
};
