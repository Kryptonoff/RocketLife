class GroupCreateSlide: SlideTab
{
	idc = 37500;
	x = 0;
	y = 0;
	show = "false";
	deletable = 1;
	class Controls
	{
		class backButton: MainMenuButton
		{
			idc = 37501;
		};
		class Description: ctrlControlsGroupNoScrollbars
		{
			idc = 37502;
			text = "";
			x = 0.0565543 * safezoneW;
			y = 0.0989831 * safezoneH;
			w = 0.303339 * safezoneW;
			h = 0.263956 * safezoneH;
			class controls
			{
				class description: AppRscStructuredText
				{
					idc = 37512;
					text = "";
					x = 0;
					y = 0;
					w = 0.303339 * safezoneW;
					h = 0.263956 * safezoneH;
				};
			};
		};
		class GroupEdit: AppRscEdit
		{
			idc = 37503;
			text = "";
			x = 0.0565543 * safezoneW;
			y = 0.373937 * safezoneH;
			w = 0.149099 * safezoneW;
			h = 0.0329945 * safezoneH;
		};
		class CreateGroup: AppTabletButton
		{
			idc = 37504;
			text = "Создать организацию"; //--- ToDo: Localize;
			x = 0.210795 * safezoneW;
			y = 0.373937 * safezoneH;
			w = 0.149099 * safezoneW;
			h = 0.0329945 * safezoneH;
		};
	};
};
class GroupsSlide: SlideTab
{
	idc = 37000;
	x = 0;
	y = 0;
	show = "false";
	deletable = 1;
	class Controls
	{
		class backButton: MainMenuButton
		{
			idc = 37001;
		};
		class tabs: ctrlToolbox
		{
			idc = 23998;
			x = 0.0464034 * safezoneW;
			y = 0.519214 * safezoneH;
			w = 0.309355 * safezoneW;
			h = 0.033 * safezoneH;
			font="SFCompactTextBold";
			onToolBoxSelChanged="_this call RRPClient_groups_onToolBoxChanged";
			columns=7;
			strings[]=
			{
				"Главная", 		// 0
				"Члены",   		// 1
				"Звания",  		// 2
				"Налоги",  		// 3
				"Прокачка", 	// 4
				"Зарплаты", 	// 5
				"Настройки" 	// 6
			};
			values[]={
				1037, // Главная
				1038, // Члены

				1041, // Налоги
				1042, // Прокачка
				1043, // Зарплаты

				1039, // Звания
				1040 // Настройки
			};
			sizeEx="4 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
		};
		class titleText: AppRscStructuredText
		{
			idc = 23999;
			text = "RocketGuys"; //--- ToDo: Localize;
			x = 0.0464034 * safezoneW;
			y = 0.024214 * safezoneH;
			w = 0.309357 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pageMain: ctrlControlsGroupNoScrollbars
		{
			idc = 1037;
			x = 0.0464034 * safezoneW;
			y = 0.068214 * safezoneH;
			w = 0.309357 * safezoneW;
			h = 0.44 * safezoneH;
			show="true";
			class Controls
			{
				class informationText: AppRscStructuredText
				{
					idc = 11036;
					x = 0.00515632 * safezoneW;
					y = 0.0374 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.132 * safezoneH;
				};
				class messageDay: AppRscStructuredText
				{
					idc = 11035;
					x = 0.00515632 * safezoneW;
					y = 0.2002 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.231 * safezoneH;
				};
				class informText: AppRscStructuredText
				{
					idc = 11034;
					text="<t size='.75'>Информация</t>";
					x = 0.00515596 * safezoneW;
					y = 0.0044 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class msgDayText: AppRscStructuredText
				{
					idc = 11033;
					text="<t size='.75'>Сообщения дня</t>";
					x = 0.00515596 * safezoneW;
					y = 0.1738 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.022 * safezoneH;
					enable = "false";
				};
				class editMSGdPic: RscPicture
				{
					idc = 11032;
					text = "\rimas_agent\assets\groups\edit.paa";
					x = 0.292858 * safezoneW;
					y = 0.2024 * safezoneH;
					w = 0.0103119 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class editMSGbtn: AppTabletButton
				{
					idc = 11031;
					x = 0.7125;
					y = 0.32;
					w = 0.025;
					h = 0.04;

					tooltip="Редактировать сообщение дня";
					onButtonClick="[""start""] call RRPClient_groups_editDayText";
					colorBackgroundFocused[]={1,1,1,0.0080000004};
					colorBackground2[]={0.75,0.75,0.75,0.0040000002};
					colorBackground[] = {1,1,1,0.004};
					sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * 0.04";
				};
			};
		};
		class pageMembers: pageMain
		{
			idc = 1038;
			show="false";
			class Controls
			{
				class filter: AppRscListNbox
				{
					idc = 12037;
					x = 0.00515632 * safezoneW;
					y = 0.00220001 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.022 * safezoneH;
					disableOverflow=1;
					columns[]={0,0.55000001};
					class Items
					{
						class Name
						{
							text="Имя";
							value=-1;
						};
						class Title
						{
							text="Должность";
							value=-1;
						};
					};
				};
				class playerList: AppRscListNbox
				{
					idc = 12036;
					x = 0.00515595 * safezoneW;
					y = 0.0286 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.2904 * safezoneH;
					onLbSelChanged = "_this call RRPClient_groups_onLbMemberList";
					columns[]={0,0.55000001};
					disableOverflow=1;
				};
				class upBtn: AppTabletButton
				{
					idc = 12035;
					text="Повысить";
					onButtonClick = "_this call RRPClient_groups_addRankRequest";
					x = 0.201076 * safezoneW;
					y = 0.3608 * safezoneH;
					w = 0.103119 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class promote: AppTabletButton
				{
					idc = 12034;
					text="Назн. замом";
					onButtonClick = "_this call RRPClient_groups_setDeuptyRequest";
					x = 0.00515576 * safezoneW;
					y = 0.3608 * safezoneH;
					w = 0.103119 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class downBtn: AppTabletButton
				{
					idc = 12033;
					text="Понизить";
					onButtonClick = "_this call RRPClient_groups_minRankRequest";
					x = 0.201076 * safezoneW;
					y = 0.396 * safezoneH;
					w = 0.103119 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class kick: AppTabletButton
				{
					idc = 12032;
					text="Исключить";
					onButtonClick = "_this call RRPClient_groups_kickRequest";
					x = 0.00515575 * safezoneW;
					y = 0.396 * safezoneH;
					w = 0.103119 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class SetOwner: AppTabletButton
				{
					idc = 12033;
					text = "Назн. Главой"; //--- ToDo: Localize;
					x = 0.00514137 * safezoneW;
					y = 0.325547 * safezoneH;
					w = 0.103119 * safezoneW;
					h = 0.033 * safezoneH;
					onButtonClick = "_this call RRPClient_groups_transferOwnership";
				};
			};
		};
		class pageRanks: pageMain
		{
			idc = 1039;
			show="false";
			class Controls
			{
				class rankCombo: AppRscCombo
				{
					idc = 13038;
					x = 0.00515665 * safezoneW;
					y = 0.0286 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.022 * safezoneH;
					onLbSelChanged = "_this call RRPClient_groups_onLbTitles";
				};
				class selranktext: AppRscStructuredText
				{
					idc = 13037;
					text="Выберите должность";
					x = 0.00515596 * safezoneW;
					y = 0.0022 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class setRankEdit: AppRscEdit
				{
					idc = 13036;
					text = ""; //--- ToDo: Localize;
					x = 0.00515596 * safezoneW;
					y = 0.088 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.0286 * safezoneH;
				};
				class srnText: AppRscStructuredText
				{
					idc = 13035;
					text="Название должности";
					x = 0.00515596 * safezoneW;
					y = 0.0594 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class srnButton: AppTabletButton
				{
					idc = 13034;
					text="Сохранить изменения";
					onButtonClick = "_this call RRPClient_groups_saveTitleRequest";
					x = 0.0125;
					y = 0.72;
					w = 0.725;
					h = 0.06;
				};
				class PermissionsText: AppRscStructuredText
				{
					idc = 13033;
					text = "Настройки доступа"; //--- ToDo: Localize;
					x = 0.00515596 * safezoneW;
					y = 0.1232 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class PermissionsGroup: ctrlControlsGroup
				{
					idc = 13031;
					x = 0.00515596 * safezoneW;
					y = 0.154 * safezoneH;
					w = 0.299045 * safezoneW;
					h = 0.2354 * safezoneH;
					class controls
					{};
				};
			};
		};
		class pageSettings: pageMain
		{
			idc = 1040;
			show="false";
			class Controls
			{
				class saveTfarBtn: AppTabletButton
				{
					idc = 14039;
					text="";
					onButtonClick = "_this call RRPClient_groups_updateTFAR";
					x = 0.65;
					y = 0.08;
					w = 0.0500001;
					h = 0.06;
				};
				class msgFrame: RscFrame
				{
					idc = 1801;
					text = "Сообщение в организацию"; //--- ToDo: Localize;
					sizeEx="1 * 0.04";
					x = 0.025;
					y = 0.18;
					w = 0.6875;
					h = 0.12;
				};
				class tfarFrame: RscFrame
				{
					idc = 14038;
					text="Частоты рации";
					sizeEx="1 * 0.04";
					x = 0.025;
					y = 0.02;
					w = 0.6875;
					h = 0.16;
				};
				class kvEditBox: AppRscEdit
				{
					idc = 14037;
					text="36.6";
					x = 0.0375;
					y = 0.06;
					w = 0.15;
					h = 0.04;
				};
				class dvEditBox: AppRscEdit
				{
					idc = 14036;
					text="101.2";
					x = 0.0375;
					y = 0.12;
					w = 0.15;
					h = 0.04;
				};
				class kvText: AppRscStructuredText
				{
					idc = 14035;
					text="Короткие волны";
					x = 0.0824953 * safezoneW;
					y = 0.033 * safezoneH;
					w = 0.170146 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class dvText: AppRscStructuredText
				{
					idc = 14034;
					text="Длинные волны";
					x = 0.0824953 * safezoneW;
					y = 0.066 * safezoneH;
					w = 0.170146 * safezoneW;
					h = 0.022 * safezoneH;
				};
				class cleanMarker: AppTabletButton
				{
					idc = 14033;
					text="Удалить все маркеры";
					onButtonClick = "_this call RRPClient_groups_removeAllMarkers";
					x = 0.0102829 * safezoneW;
					y = 0.219964 * safezoneH;
					w = 0.282774 * safezoneW;
					h = 0.0329945 * safezoneH;
				};
				class messageEdit: AppRscEdit
				{
					idc = 14030;
					style=16;
					text="";
					x = 0.0154679 * safezoneW;
					y = 0.121 * safezoneH;
					w = 0.247486 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class sendMessage: AppTabletButton
				{
					idc = 14029;
					text="";
					onButtonClick = "_this call RRPClient_groups_sendMessageRequest";
					x = 0.268109 * safezoneW;
					y = 0.121 * safezoneH;
					w = 0.0206238 * safezoneW;
					h = 0.033 * safezoneH;
				};
				/*
				class addSlots: AppTabletButton
				{
					idc = 14027;
					text="Купить дополнительный слот";
					onButtonClick = "_this call RRPClient_groups_upgradeRequest";
					x = 0.0824953 * safezoneW;
					y = 0.275 * safezoneH;
					w = 0.144367 * safezoneW;
					h = 0.033 * safezoneH;
				};
				*/
				class dropAllPermissions: AppTabletButton
				{
					idc = 14026;
					text="!!! СБРОСИТЬ ВСЕ РАЗРЕШЕНИЯ !!!";
					onButtonClick = "_this call RRPClient_groups_dropAllPermissionRequest";
					x = 0.0102829 * safezoneW;
					y = 0.175971 * safezoneH;
					w = 0.282774 * safezoneW;
					h = 0.0329945 * safezoneH;
				};
				class leaveButton: AppTabletButton
				{
					idc = 14025;
					text="Покинуть организацию";
					onButtonClick = "_this call RRPClient_groups_leaveRequest";
					x = 0.0102829 * safezoneW;
					y = 0.395935 * safezoneH;
					w = 0.287915 * safezoneW;
					h = 0.0329945 * safezoneH;
				};
				class saveTfarBtnPic: RscPictureKeepAspect
				{
					idc = 14024;
					text="\rimas_agent\assets\groups\update_kv.paa";
					x = 0.65;
					y = 0.08;
					w = 0.05;
					h = 0.06;
				};
				class sendMsgPic: RscPictureKeepAspect
				{
					idc = 14023;
					text="\rimas_agent\assets\groups\send_messege.paa";
					x = 0.65;
					y = 0.22;
					w = 0.05;
					h = 0.06;
				};
			};
		};
		class pageTaxes: pageMain
		{
			idc = 1041;
			show = "false";
			class controls
			{
				class TaxGroup: ctrlControlsGroupNoScrollbars
				{
					idc = 15001;
					x = 0.00102898 * safezoneW;
					y = 0.00220002 * safezoneH;
					w = 0.30663 * safezoneW;
					h = 0.385032 * safezoneH;
					class controls
					{};
				};
				class SaveButton: AppTabletButton
				{
					idc = 15002;
					text="Сохранить";
					x = 0.00514499 * safezoneW;
					y = 0.396033 * safezoneH;
					w = 0.298398 * safezoneW;
					h = 0.0330027 * safezoneH;
					onButtonClick = "_this call RRPClient_groups_saveTaxes";
				};
			};
		};
		class pageBuffs: pageMain
		{
			idc = 1042;
			show = "false";
			class controls
			{

			};
		};
		class pageSalarys: pageMain
		{
			idc = 1043;
			show = "false";
			class controls
			{
				class SalGroup: ctrlControlsGroupNoScrollbars
				{
					idc = 16001;
					x = 0.00102898 * safezoneW;
					y = 0.00220002 * safezoneH;
					w = 0.30663 * safezoneW;
					h = 0.385032 * safezoneH;
					class controls
					{};
				};
				class SaveButton: AppTabletButton
				{
					idc = 16002;
					text="Сохранить";
					x = 0.00514499 * safezoneW;
					y = 0.396033 * safezoneH;
					w = 0.298398 * safezoneW;
					h = 0.0330027 * safezoneH;
					onButtonClick = "_this call RRPClient_groups_saveSalary";
				};
			};
		};
	};
};