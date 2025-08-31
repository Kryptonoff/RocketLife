
class RRPDialogGroup
{
	idd=24000;
	onLoad="uiNamespace setVariable ['RRPDialogGroup',_this#0]";
	onUnload="_this call RRPClient_groups_closeManage";
	name="RRPDialogGroup";
	movingEnable=0;
	enableSimulation=1;
	class controlsBackground
	{
		class background: RRP_background_fade
		{
			idc=-1;
            x = 0.25;
            y = 0.0400001;
            w = 0.75;
            h = 0.96;
		};
		class title: RRP_title
		{
			idc=-1;
			text = "Управление организацией";
            x = 0.25;
            y = -2.23517e-008;
            w = 0.725;
            h = 0.04;
		};
        class close: RRP_btn_exit_text
        {
            idc = -1;
            x = 0.975;
            y = 0;
            w = 0.025;
            h = 0.04;
        };
	};
	class controls
	{
        class titleText: RscStructuredText
        {
            idc = 23999;
            text = "RocketGuys"; //--- ToDo: Localize;
            x = 0.25;
            y = 0.04;
            w = 0.75;
            h = 0.06;
            colorBackground[] = {0,0,0,0};
        };
		class tabs: ctrlToolbox
		{
			idc=23998;
			
           	x = 0.2625;
            y = 0.92;
            w = 0.725;
            h = 0.06;
			font="RobotoCondensedBold";
			onToolBoxSelChanged="_this call RRPClient_groups_onToolBoxChanged";
			columns=4;
			strings[]=
			{
				"Главная",
				"Члены",
				"Звания",
				"Настройки"
			};
			values[]={1037,1038,1039,1040};
			sizeEx="7 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
		};
		class pageMain: ctrlControlsGroupNoScrollbars
		{
			idc=1037;
			x = 0.25;
            y = 0.1;
            w = 0.75;
            h = 0.8;
			
			show="false";
			class Controls
			{
				class informationText: RRP_RscStructuredText
				{
					idc=11036;
					x = 0.0125;
                    y = 0.06;
                    w = 0.725;
                    h = 0.24;
					colorBackground[] = {0.26, 0.24, 0.31,1};
				};
				class messageDay: RRP_RscStructuredText
				{
					idc=11035;
					x = 0.0125;
                    y = 0.36;
                    w = 0.725;
                    h = 0.42;
					colorBackground[] = {0.26, 0.24, 0.31,1};
				};
				class informText: RRP_RscStructuredText
				{
					idc=11034;
					text="<t size='.75'>Информация</t>";
					x = 0.0125;
                    y = 0.02;
                    w = 0.725;
                    h = 0.04;
					colorBackground[] = {0.26, 0.24, 0.31,1};
				};
				class msgDayText: RRP_RscStructuredText
				{
					idc=11033;
					text="<t size='.75'>Сообщения дня</t>";
					x = 0.0125;
                    y = 0.32;
                    w = 0.725;
                    h = 0.04;
					enable = "false";
					colorBackground[] = {0.26, 0.24, 0.31,1};
				};
				class editMSGdPic: RscPicture
				{
					idc=11032;
					text="\rimas_agent\assets\groups\edit.paa";
					x = 0.7125;
                    y = 0.32;
                    w = 0.025;
                    h = 0.04;
					colorText[]={1,1,1,1};
				};
				class editMSGbtn: RscPictureButtonMenu
				{
					onButtonClick="[""start""] call RRPClient_groups_editDayText";
					colorBackgroundFocused[]={1,1,1,0.0080000004};
					colorBackground2[]={0.75,0.75,0.75,0.0040000002};
					idc=11031;
					tooltip="Редактировать сообщение дня";
					x = 0.7125;
                    y = 0.32;
                    w = 0.025;
                    h = 0.04;
					colorText[]={1,1,1,1};
					colorBackground[]={1,1,1,0.0040000002};
					sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * 0.04";
				};
			};
		};
		class pageMembers: ctrlControlsGroupNoScrollbars
		{
			idc=1038;
			x = 0.25;
            y = 0.1;
            w = 0.75;
            h = 0.8;
			show="true";
			class Controls
			{
				class filter: RRP_RscListNBox
				{
					idc=12037;
                    x = 0.0125;
                    y = 0.02;
                    w = 0.725;
                    h = 0.04;
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
				class playerList: RRP_RscListNBox
				{
					idc=12036;
                    x = 0.0125;
                    y = 0.08;
                    w = 0.725;
                    h = 0.54;
					onLbSelChanged = "_this call RRPClient_groups_onLbMemberList";
					columns[]={0,0.55000001};
					disableOverflow=1;
				};
				class upBtn: RRP_btn_green
				{
					idc=12035;
					text="Повысить";
					onButtonClick = "_this call RRPClient_groups_addRankRequest";
					x = 0.4;
					y = 0.64;
					w = 0.25;
					h = 0.06;
				};
				class promote: RRP_btn_yellow
				{
					idc=12034;
					text="Назн. замом";
					x = 0.0875;
					y = 0.64;
					w = 0.25;
					h = 0.06;
					onButtonClick = "_this call RRPClient_groups_setDeuptyRequest";
				};
				class downBtn: RRP_btn_red
				{
					idc=12033;
					text="Понизить";
					x = 0.4;
					y = 0.72;
					w = 0.25;
					h = 0.06;
					onButtonClick = "_this call RRPClient_groups_minRankRequest";
				};
				class kick: RRP_btn_red
				{
					idc=12032;
					text="Исключить";
					onButtonClick = "_this call RRPClient_groups_kickRequest";
					x = 0.0875;
					y = 0.72;
					w = 0.25;
					h = 0.06;
				};
			};
		};
		class pageRanks: ctrlControlsGroupNoScrollbars
		{
			idc=1039;
			x = 0.25;
            y = 0.1;
            w = 0.75;
            h = 0.8;
			show="false";
			class Controls
			{
				class rankCombo: RRP_RscCombo
				{
					idc=13038;
					x = 0.0125;
                    y = 0.06;
                    w = 0.725;
                    h = 0.04;
					onLbSelChanged = "_this call RRPClient_groups_onLbTitles";
				};
				class selranktext: RRP_RscStructuredText
				{
					idc=13037;
					text="Выберите должность";
					x = 0.0125;
                    y = 0.02;
                    w = 0.725;
                    h = 0.04;
				};
				class setRankEdit: RRP_RscEdit
				{
					idc=13036;
					text="";
					x = 0.0125;
                    y = 0.16;
                    w = 0.725;
                    h = 0.06;
				};
				class srnText: RRP_RscStructuredText
				{
					idc=13035;
					text="Название должности";
					x = 0.0125;
                    y = 0.12;
                    w = 0.725;
                    h = 0.04;
				};
				class srnButton: RRP_btn_blue
				{
					idc=13034;
					text="Сохранить изменения";
					onButtonClick = "_this call RRPClient_groups_saveTitleRequest";
					x = 0.0125;
                    y = 0.72;
                    w = 0.725;
                    h = 0.06;
				};
                class PermissionsText: RRP_RscStructuredText
                {
                    idc = 13033;
                    text = "Настройки доступа"; //--- ToDo: Localize;
                    x = 0.0125;
                    y = 0.24;
                    w = 0.725;
                    h = 0.04;
                };
				class PermissionsGroup: ctrlControlsGroup
				{
					idc=13031;
					x = 0.0125;
                    y = 0.28;
                    w = 0.725;
                    h = 0.42;
					class controls
					{};
				};
			};
		};
		//size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		class pageSettings: ctrlControlsGroupNoScrollbars
		{
			idc=1040;
			x = 0.25;
            y = 0.1;
            w = 0.75;
            h = 0.8;
			show="false";
			class Controls
			{
				class saveTfarBtn: RscPictureButtonMenu
				{
					idc=14039;
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
                    x = 0.025;
                    y = 0.18;
                    w = 0.6875;
                    h = 0.12;
					sizeEx="1 * 0.04";
                };
				class tfarFrame: RscFrame
				{
					idc=14038;
					text="Частоты рации";
                    x = 0.025;
                    y = 0.02;
                    w = 0.6875;
                    h = 0.16;
					sizeEx="1 * 0.04";
				};
				class kvEditBox: RRP_RscEdit
				{
					idc=14037;
					text="36.6";
                    x = 0.0375;
                    y = 0.06;
                    w = 0.15;
                    h = 0.04;
				};
				class dvEditBox: RRP_RscEdit
				{
					idc=14036;
					text="101.2";
                    x = 0.0375;
                    y = 0.12;
                    w = 0.15;
                    h = 0.04;
				};
				class kvText: RRP_RscStructuredText
				{
					idc=14035;
					text="Короткие волны";
                    x = 0.2;
                    y = 0.06;
                    w = 0.4125;
                    h = 0.04;
				};
				class dvText: RRP_RscStructuredText
				{
					idc=14034;
					text="Длинные волны";
                    x = 0.2;
                    y = 0.12;
                    w = 0.4125;
                    h = 0.04;
				};
				class cleanMarker: RRP_btn_blue
				{
					idc=14033;
					text="Удалить все маркеры";
					onButtonClick = "_this call RRPClient_groups_removeAllMarkers";
					x = 0.2;
                    y = 0.42;
                    w = 0.350001;
                    h = 0.06;
				};
				class ownerSet: RRP_btn_blue
				{
					idc=14031;
					text="Назначить главу организации";
					onButtonClick = "[""InfoTitleAndText"",[""Организация"",""Чтобы сменить главу, вам нужно обратится к администрации""]] call SmartClient_gui_toaster_addTemplateToast";
					x = 0.2;
                    y = 0.58;
                    w = 0.350001;
                    h = 0.06;
				};
				class messageEdit: RRP_RscEdit
				{
					idc=14030;
					style=16;
					text="";
					x = 0.0375;
                    y = 0.22;
                    w = 0.6;
                    h = 0.06;
				};
				class sendMessage: RscPictureButtonMenu
				{
					idc=14029;
					text="";
					onButtonClick = "_this call RRPClient_groups_sendMessageRequest";
					x = 0.65;
                    y = 0.22;
                    w = 0.0500001;
                    h = 0.06;
				};
				class addSlots: RRP_btn_blue
				{
					idc=14027;
					text="Купить дополнительный слот";
                    x = 0.2;
                    y = 0.5;
                    w = 0.350001;
                    h = 0.06;
					onButtonClick = "_this call RRPClient_groups_upgradeRequest";
				};
				class dropAllPermissions: RRP_btn_blue
				{
					idc=14026;
					text="!!! СБРОСИТЬ ВСЕ РАЗРЕШЕНИЯ !!!";
					onButtonClick = "_this call RRPClient_groups_dropAllPermissionRequest";
					x = 0.2;
                    y = 0.34;
                    w = 0.350001;
                    h = 0.06;
				};
				class leaveButton: RRP_btn_red
				{
					idc=14025;
					text="Покинуть организацию";
					onButtonClick = "_this call RRPClient_groups_leaveRequest";
					x = 0.2;
                    y = 0.7;
                    w = 0.350001;
                    h = 0.06;
				};
				class saveTfarBtnPic: RscPictureKeepAspect
				{
					idc=14024;
					text="\rimas_agent\assets\groups\update_kv.paa";
					x = 0.65;
                    y = 0.08;
                    w = 0.0500001;
                    h = 0.06;
				};
				class sendMsgPic: RscPictureKeepAspect
				{
					idc=14023;
					text="\rimas_agent\assets\groups\send_messege.paa";
					x = 0.65;
                    y = 0.22;
                    w = 0.0500001;
                    h = 0.06;
				};
			};
		};
	};
};
