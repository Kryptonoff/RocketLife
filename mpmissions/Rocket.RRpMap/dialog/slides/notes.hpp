/* #Zajazo
$[
	1.063,
	["template",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"TemplateGroup",[1,"",["0.299415 * safezoneW + safezoneX","0.214105 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2400,"backButton",[2300,"MainMenu",["0.305272 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"list",[2300,"",["0.0051429 * safezoneW","0.0109964 * safezoneH","0.118294 * safezoneW","0.516809 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"Text",[2300,"",["0.12858 * safezoneW","0.0109964 * safezoneH","0.267447 * safezoneW","0.516809 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2401,"New",[2300,"New",["0.0051429 * safezoneW","0.538802 * safezoneH","0.118299 * safezoneW","0.0329878 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2402,"Delete",[2300,"Delete",["0.278748 * safezoneW","0.538802 * safezoneH","0.118299 * safezoneW","0.0329878 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2403,"Edit",[2300,"Edit",["0.128542 * safezoneW","0.538802 * safezoneH","0.118299 * safezoneW","0.0329878 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class NotesSlide: SlideTab
{
	idc=18000;
	x=0;
	y=0;
	class Controls
	{
		class back: MainMenuButton
		{
			idc = 18001;
		};
		class list: AppRscListbox
		{
			idc = 18002;
			x = 0.0051429 * safezoneW;
			y = 0.0109964 * safezoneH;
			w = 0.118294 * safezoneW;
			h = 0.516809 * safezoneH;
		};
		class Text: RscControlsGroup
		{
			idc = 18003;
			x = 0.12858 * safezoneW;
			y = 0.0109964 * safezoneH;
			w = 0.267447 * safezoneW;
			h = 0.516809 * safezoneH;
			class Controls
			{
				class Text: AppRscStructuredText
				{
					idc = 18004;
					x = 0;
					y = 0;
					w = 0.267447 * safezoneW;
					h = 0.516809 * safezoneH;
				};
			};
		};
		class New: AppTabletButton
		{
			idc = 18005;
			text = "Новая заметка"; //--- ToDo: Localize;
			x = 0.0051429 * safezoneW;
			y = 0.538802 * safezoneH;
			w = 0.118299 * safezoneW;
			h = 0.0329878 * safezoneH;
			onButtonClick = "['new'] call RRPClient_notes_editor";
		};
		class Delete: AppTabletButton
		{
			idc = 18006;
			text = "Удалить"; //--- ToDo: Localize;
			x = 0.278748 * safezoneW;
			y = 0.538802 * safezoneH;
			w = 0.118299 * safezoneW;
			h = 0.0329878 * safezoneH;
			onButtonClick = "_this call RRPClient_notes_delete";
		};
		class Edit: AppTabletButton
		{
			idc = 18007;
			text = "Редактировать"; //--- ToDo: Localize;
			onButtonClick = "['edit'] call RRPClient_notes_editor";
			x = 0.128542 * safezoneW;
			y = 0.538802 * safezoneH;
			w = 0.118299 * safezoneW;
			h = 0.0329878 * safezoneH;
		};
	};
};

/* #Xakixy
$[
	1.063,
	["template",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-2300,"TemplateGroup",[1,"",["0.299415 * safezoneW + safezoneX","0.214105 * safezoneH + safezoneY","0.402222 * safezoneW","0.629227 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-2400,"backButton",[2300,"MainMenu",["0.305272 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"TitleTheme",[2300,"",["0.0051429 * safezoneW","0.0109964 * safezoneH","0.390884 * safezoneW","0.0263902 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"EditTheme",[2300,"",["0.0051429 * safezoneW","0.0417849 * safezoneH","0.391913 * safezoneW","0.0241911 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"TitleText",[2300,"",["0.0051429 * safezoneW","0.0769721 * safezoneH","0.391913 * safezoneW","0.0263902 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1401,"EditText",[2300,"",["0.00617144 * safezoneW","0.10996 * safezoneH","0.390886 * safezoneW","0.468424 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2401,"End",[2300,"End",["0.00617194 * safezoneW","0.58749 * safezoneH","0.0928206 * safezoneW","0.0330014 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class NotesSlideEditor: SlideTab
{
	idc=18100;
	x=0;
	y=0;
	class Controls
	{
		class backButton: MainMenuButton
		{
			idc = 18101;
			onButtonClick = "['notes',0] call RRPClient_tablet_slide";
		};
		class TitleTheme: AppRscStructuredText
		{
			idc = 18102;
			text = "Введите тему заметки:";
			x = 0.0051429 * safezoneW;
			y = 0.0109964 * safezoneH;
			w = 0.390884 * safezoneW;
			h = 0.0263902 * safezoneH;
		};
		class EditTheme: AppRscEdit
		{
			idc = 18103;
			x = 0.0051429 * safezoneW;
			y = 0.0417849 * safezoneH;
			w = 0.391913 * safezoneW;
			h = 0.0241911 * safezoneH;
		};
		class TitleText: AppRscStructuredText
		{
			idc = 18104;
			text = "Введите текст заметки:";
			x = 0.0051429 * safezoneW;
			y = 0.0769721 * safezoneH;
			w = 0.391913 * safezoneW;
			h = 0.0263902 * safezoneH;
		};
		class EditText: AppRscEditMulti
		{
			idc = 18105;
			x = 0.00617144 * safezoneW;
			y = 0.10996 * safezoneH;
			w = 0.390886 * safezoneW;
			h = 0.468424 * safezoneH;
		};
		class End: AppTabletButton
		{
			idc = 18106;
			text = "Закончить";
			onButtonClick = "_this call RRPClient_notes_save";
			x = 0.00617194 * safezoneW;
			y = 0.58749 * safezoneH;
			w = 0.0928206 * safezoneW;
			h = 0.0330014 * safezoneH;
		};
	};
};
