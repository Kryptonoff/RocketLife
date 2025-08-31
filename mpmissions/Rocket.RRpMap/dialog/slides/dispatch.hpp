/* #Qotano
$[
	1.063,
	["asd",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"DispatchSlide",[1,"",["0.300117 * safezoneW + safezoneX","0.194179 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"requests: RscListBox",[2300,"",["0.00927552 * safezoneW","0.0946989 * safezoneH","0.20375 * safezoneW","0.231111 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6943;","onLbSelChanged = |[] spawn RRPClient_dispatch_lbChangedCallsMenu|;"]],
	[1003,"mapcontrol: RscMapControl",[2300,"",["0.214901 * safezoneW","0.0957985 * safezoneH","0.17625 * safezoneW","0.263333 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6944;","maxsatellitealpha = 0.75;","alphafadestartscale = 1.15;","alphafadeendscale = 1.29;"]],
	[1400,"Life_RscEdit_1400",[2300,"",["0.169229 * safezoneW","0.411382 * safezoneH","0.221875 * safezoneW","0.0755555 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6945;"]],
	[1004,"Life_RscCheckbox_2800: RscCheckBox",[2300,"",["0.309948 * safezoneW","0.373996 * safezoneH","0.014375 * safezoneW","0.0266667 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6946;"]],
	[2100,"Life_RscCombo_2100",[2300,"",["0.189802 * safezoneW","0.374656 * safezoneH","0.115378 * safezoneW","0.0266667 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6947;","onlbselchanged = |[] spawn RRPClient_dispatch_lbChangedMessage;|;"]],
	[1005,"time_input",[2300,"",["0.0873495 * safezoneW","0.496931 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[-1,-1,-1,-1],[0.902,0.902,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 6948;"]],
	[1006,"distance_input",[2300,"",["0.0873495 * safezoneW","0.467021 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[-1,-1,-1,-1],[1,1,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 6949;"]],
	[1007,"dispatch_input",[2300,"",["0.0873495 * safezoneW","0.436893 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[-1,-1,-1,-1],[0.902,0.902,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 6950;"]],
	[1008,"name_input",[2300,"",["0.0873495 * safezoneW","0.376855 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[-1,-1,-1,-1],[1,1,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 6951;"]],
	[1009,"position_input",[2300,"",["0.0873495 * safezoneW","0.406984 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[-1,-1,-1,-1],[0.902,0.902,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["idc = 6952;"]],
	[1600,"Picture_Position_Button",[2300,"",["0.170052 * safezoneW","0.373996 * safezoneH","0.014375 * safezoneW","0.0266667 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0],[1,1,1,1],"","-1"],["idc = 6953;","onbuttonclick = ||;","access = 0;","color[] = {1,1,1,1};","colorbackgroundfocused[] = {1,1,1,0};","style = |48 + 0x800|;","colorselectedbg[] = {1,1,1,0};"]],
	[1601,"accept_call: RscButtonUC",[2300,"Accept",["0.128598 * safezoneW","0.330232 * safezoneH","0.03875 * safezoneW","0.028889 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6954;","onbuttonclick = |[] spawn RRPClient_dispatch_acceptCall;|;"]],
	[1602,"delete_call: RscButtonUC",[2300,"Decline",["0.169847 * safezoneW","0.330232 * safezoneH","0.0435287 * safezoneW","0.028889 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6955;","onButtonClick = |[] spawn RRPClient_dispatch_deleteCall|;"]],
	[2101,"assignTo",[2300,"",["0.00927552 * safezoneW","0.330232 * safezoneH","0.118125 * safezoneW","0.028889 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6956;"]],
	[1010,"name_tite_copy1",[2300,"Name:",["0.0123615 * safezoneW","0.376855 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[1,1,1,1],[1,1,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 0;","idc = -1;","style = 0;","font = |RobotoCondensed|;"]],
	[1011,"koordinates_title",[2300,"Coordinate:",["0.0123615 * safezoneW","0.406984 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[1,1,1,1],[0.902,0.902,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 0;","idc = -1;","style = 0;","font = |RobotoCondensed|;"]],
	[1012,"zakreplen_za_title",[2300,"Attach to:",["0.0123615 * safezoneW","0.436893 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[1,1,1,1],[0.902,0.902,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 0;","idc = -1;","style = 0;","font = |RobotoCondensed|;"]],
	[1013,"rastoyanie_title",[2300,"Distance:",["0.0123615 * safezoneW","0.467021 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[1,1,1,1],[1,1,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 0;","idc = -1;","style = 0;","font = |RobotoCondensed|;"]],
	[1014,"ojidanie_title",[2300,"Waiting:",["0.0123615 * safezoneW","0.496931 * safezoneH","0.061875 * safezoneW","0.0255555 * safezoneH"],[1,1,1,1],[0.902,0.902,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 0;","idc = -1;","style = 0;","font = |RobotoCondensed|;"]],
	[1015,"name_tite",[2300,"Coordinates",["0.327743 * safezoneW","0.375755 * safezoneH","0.061875 * safezoneW","0.0233334 * safezoneH"],[1,1,1,1],[1,1,0.302,0],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 0;","idc = -1;","style = 0;","font = |RobotoCondensed|;"]],
	[1603,"otpravit_msg: RscButtonUC",[2300,"Send",["0.283409 * safezoneW","0.489233 * safezoneH","0.108125 * safezoneW","0.031111 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6942;","onbuttonclick = |[] spawn RRPClient_dispatch_sendMessageManagement;|;"]],
	[1604,"show_call: RscButtonUC",[2300,"Show msg",["0.00217789 * safezoneW","0.529039 * safezoneH","0.184215 * safezoneW","0.0263999 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 6940;"]]
]
*/


class DispatchSlide: SlideTab
{
	idc = 19000;
	show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class back: MainMenuButton
        {
            idc = 19001;
        };
		class requests: AppRscListbox
		{
			idc = 6943;
			onLbSelChanged = "[] spawn RRPClient_dispatch_lbChangedCallsMenu";
			x = 0.00927552 * safezoneW;
			y = 0.0946989 * safezoneH;
			w = 0.20375 * safezoneW;
			h = 0.231111 * safezoneH;
		};
		class mapcontrol: AppRscMap
		{
			idc = 6944;
			x = 0.31 * safezoneW;
			y = 0.05 * safezoneH;
			w = 0.17625 * safezoneW;
			h = 0.263333 * safezoneH;
		};
		class message: AppRscEditMulti
		{
			idc = 6945;
			text = "";
			x = 0.169229 * safezoneW;
			y = 0.411382 * safezoneH;
			w = 0.221875 * safezoneW;
			h = 0.0755555 * safezoneH;
		};
		class Life_RscCheckbox_2800: AppRscCheckBox
		{
			idc = 6946;
			x = 0.309948 * safezoneW;
			y = 0.373996 * safezoneH;
			w = 0.014375 * safezoneW;
			h = 0.0266667 * safezoneH;
		};
		class Life_RscCombo_2100: AppRscCombo
		{
			idc = 6947;
			onlbselchanged = "[] spawn RRPClient_dispatch_lbChangedMessage;";

			x = 0.189802 * safezoneW;
			y = 0.374656 * safezoneH;
			w = 0.115378 * safezoneW;
			h = 0.0266667 * safezoneH;
		};
		class time_input: AppRscStructuredText
		{
			idc = 6948;
			class Attributes
			{
				font="RobotoRegular";
			};
			x = 0.0873495 * safezoneW;
			y = 0.496931 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class distance_input: time_input
		{
			idc = 6949;
			font = "RobotoRegular";
			x = 0.0873495 * safezoneW;
			y = 0.467021 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class dispatch_input: time_input
		{
			idc = 6950;
			font = "RobotoRegular";
			x = 0.0873495 * safezoneW;
			y = 0.436893 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class name_input: time_input
		{
			idc = 6951;
			font = "RobotoRegular";
			x = 0.0873495 * safezoneW;
			y = 0.376855 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class position_input: time_input
		{
			idc = 6952;
			font = "RobotoRegular";
			x = 0.0873495 * safezoneW;
			y = 0.406984 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class Picture_Position_Button: RscButton
		{
			idc = 6953;
			onbuttonclick = "";

			x = 0.170052 * safezoneW;
			y = 0.373996 * safezoneH;
			w = 0.014375 * safezoneW;
			h = 0.0266667 * safezoneH;
		};
		class accept_call: AppTabletButton
		{
			idc = 6954;
			onbuttonclick = "[] spawn RRPClient_dispatch_acceptCall;";

			text = "Принять"; //--- ToDo: Localize;
			x = 0.128598 * safezoneW;
			y = 0.330232 * safezoneH;
			w = 0.03875 * safezoneW;
			h = 0.028889 * safezoneH;
		};
		class delete_call: AppTabletButton
		{
			idc = 6955;
			onButtonClick = "[] spawn RRPClient_dispatch_deleteCall";

			text = "Отказ"; //--- ToDo: Localize;
			x = 0.169847 * safezoneW;
			y = 0.330232 * safezoneH;
			w = 0.0435287 * safezoneW;
			h = 0.028889 * safezoneH;
		};
		class assignTo: AppRscCombo
		{
			idc = 6956;

			x = 0.00927552 * safezoneW;
			y = 0.330232 * safezoneH;
			w = 0.118125 * safezoneW;
			h = 0.028889 * safezoneH;
		};
		class name_tite_copy1: time_input
		{
			idc = -1;
			text = "Имя:"; //--- ToDo: Localize;
			font = "RobotoRegular";
			x = 0.0123615 * safezoneW;
			y = 0.376855 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class koordinates_title: time_input
		{
			idc = -1;
			text = "Координаты:"; //--- ToDo: Localize;
			font = "RobotoRegular";
			x = 0.0123615 * safezoneW;
			y = 0.406984 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class zakreplen_za_title: time_input
		{
			idc = -1;
			text = "Закреплен:"; //--- ToDo: Localize;
			x = 0.0123615 * safezoneW;
			y = 0.436893 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class rastoyanie_title: time_input
		{
			idc = -1;
			text = "Дистанция:"; //--- ToDo: Localize;
			font = "RobotoRegular";
			x = 0.0123615 * safezoneW;
			y = 0.467021 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class ojidanie_title: time_input
		{
			idc = -1;
			font = "RobotoRegular";
			text = "Ждет:"; //--- ToDo: Localize;
			x = 0.0123615 * safezoneW;
			y = 0.496931 * safezoneH;
			w = 0.061875 * safezoneW;
			h = 0.0255555 * safezoneH;
		};
		class name_tite: time_input
		{
			idc = -1;
			text = "Координаты"; //--- ToDo: Localize;
			font = "RobotoRegular";
			x = 0.327743 * safezoneW;
			y = 0.375755 * safezoneH;
			w = 0.061875 * safezoneW;
		};
		class otpravit_msg: AppTabletButton
		{
			idc = 6942;
			onbuttonclick = "[] spawn RRPClient_dispatch_sendMessageManagement;";
			text = "Отправить"; //--- ToDo: Localize;
			x = 0.283409 * safezoneW;
			y = 0.489233 * safezoneH;
			w = 0.108125 * safezoneW;
			h = 0.031111 * safezoneH;
		};
		class show_call: AppTabletButton
		{
			idc = 6940;
			text = "Показать сообщение"; //--- ToDo: Localize;
			x = 0.00217789 * safezoneW;
			y = 0.529039 * safezoneH;
			w = 0.184215 * safezoneW;
			h = 0.0263999 * safezoneH;
		};
	};
};
