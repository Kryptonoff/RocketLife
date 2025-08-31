class RRPDialogHouseSystem
{
	idd = 9000;
	name= "RRPDialogHouseSystem";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogHouseSystem',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogHouseSystem',displayNull]; RRPClientSelectedHouse = objNull; false call RRPClient_gui_util_blur;";

	class controlsBackground 
	{
		class padImage : RscPicture {
			idc = 2640;
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
	class controls
	{
		class Title: RscTitle
		{
			idc = 9001;
			x = 0.0375;
			y = 0.1;
			w = 0.925;
			h = 0.04;
			text = "Панель управления умным домом 'AltisRealty Ltd.'";
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {1,1,1,0.1};
		};
		class HouseMemberList: RscListBox
		{
			idc = 9002;
			x = 0.0375;
			y = 0.22;
			w = 0.65;
			h = 0.38;
		};
		class HouseLeave: RscButtonMenu
		{
			idc = 9003;
			onButtonClick = "[] spawn RRPClient_system_sellHouse";

			text = "ПРОДАТЬ";  
			x = 0.0375;
			y = 0.68;
			w = 0.1625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class HouseLock: RscButtonMenu
		{
			idc = 9004;
			onButtonClick = "[] spawn RRPClient_system_houseModAddSlot";

			text = "Добавить слот";  
			x = 0.275;
			y = 0.62;
			w = 0.175;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class HouseKick: RscButtonMenu
		{
			idc = 9005;
			onButtonClick = "[] spawn RRPClient_houses_kickNeighsRequest";

			text = "ВЫГНАТЬ";  
			x = 0.275;
			y = 0.68;
			w = 0.175;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class InviteMember: RscButtonMenu
		{
			idc = 9006;
			onButtonClick = "[] spawn RRPClient_houses_inviteNeighsRequest";
			text = "ПРОПИСАТЬ В ДОМ";  
			x = 0.7;
			y = 0.56;
			w = 0.2625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class Housenform: Title
		{
			idc = 9008;
			style = 1;
			text = "Дом не выбран";
		};
		class HouseList: RscCombo
		{
			idc = 9009;
			onLBSelChanged="_this call RRPClient_houses_onLbHousesLists";
			x = 0.0375;
			y = 0.16;
			w = 0.65;
			h = 0.04;
		};
		class payText: RscText
		{
			idc = 9010;

			text = "ДАТА ОПЛАТЫ:";  
			x = 0.7;
			y = 0.16;
			w = 0.2625;
			h = 0.04;
		};
		class PayBtn: RscButtonMenu
		{
			idc = 9011;
			onButtonClick = "[] spawn RRPClient_houses_payForHouse";

			text = "ОПЛАТИТЬ";  
			x = 0.0375;
			y = 0.62;
			w = 0.1625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class lightsBtn: RscButtonMenu
		{
			idc = 9012;
			onButtonClick = "_this call RRPClient_system_lightHouseAction";

			text = "Освещение ВКЛ";  
			x = 0.525;
			y = 0.62;
			w = 0.1625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class secBtn: RscButtonMenu
		{
			idc = 9013;
			onButtonClick = "[] spawn RRPClient_houses_installSecurity";

			text = "УСТАНОВИТЬ ОХРАННУЮ СИСТЕМУ";  
			x = 0.7;
			y = 0.74;
			w = 0.2625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class trunkBtn: RscButtonMenu
		{
			idc = 9014;
			onButtonClick = "[] spawn RRPClient_houses_openTrunk";

			text = "Открыть хранилище";  
			x = 0.0375;
			y = 0.74;
			w = 0.65;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class btnFaq: RscButtonMenu
		{
			idc = 9015;
			onButtonClick = "true call RRPClient_houses_FAQ";

			text = "FAQ";  
			x = 0.525;
			y = 0.68;
			w = 0.1625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class listAllPlayers: RscListbox
		{
			idc = 9016;
			x = 0.7;
			y = 0.22;
			w = 0.2625;
			h = 0.32;
		};
		class setName: RscButtonMenu
		{
			idc = 9017;
			onButtonClick = "_this call RRPClient_houses_setNewName";

			text = "ПЕРЕИМЕНОВАТЬ";  
			x = 0.7;
			y = 0.68;
			w = 0.2625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
		class setNameBox: RscEdit
		{
			idc = 9018;
			text = "";
			maxChars = 10;
			x = 0.7;
			y = 0.62;
			w = 0.2625;
			h = 0.04;
		};
		class text_group: RscControlsGroup
		{
			idc = 9021;
			x = 0.0375;
			y = 0.16;
			w = 0.925;
			h = 0.56;
			class controls
			{
				class faqText: RscStructuredText
				{
					idc = 9019;
					text = "";			
					x = 0;
					y = 0;
					w = 0.925;
					h = 0.56;
				};
			};
		};
		class goBack: RscButtonMenu
		{
			idc = 9020;
			onButtonClick = "false call RRPClient_houses_FAQ";

			text = "НАЗАД";  
			x = 0.7;
			y = 0.74;
			w = 0.2625;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (0.04) * GUI_GRID_H;
			class Attributes
			{
				align="center";
			};
		};
	};
};
class RRPDialogHouseBuy
{
	idd = 9100;
	name= "RRPDialogHouseBuy";
	movingEnable = 0;
	enableSimulation = 1;
	
	onLoad = "uiNamespace setVariable ['RRPDialogHouseBuy',_this select 0]; true call RRPClient_gui_util_blur";
	onUnload = "uiNamespace setVariable ['RRPDialogHouseBuy',displayNull]; false call RRPClient_gui_util_blur";
	class controlsBackground
	{
		class DialogBackground: RRP_background
		{
			idc = 9101;

			x = 0.25;
			y = 0.32;
			w = 0.5;
			h = 0.28;
		};
		class DialogCation: RRP_title
		{
			idc = 9102;

			text = "AltisRealty Ltd.";  
			x = 0.25;
			y = 0.28;
			w = 0.4625;
			h = 0.04;
		};
		class ResetCodeFreeLabel: RscText
		{
			idc = 9103;

			text = "Назовите ваш дом!";  
			x = 0.3;
			y = 0.36;
			w = 0.3875;
			h = 0.06;
		};
	};
	class controls
	{
		class CancelButton: RRP_btn_exit_text
		{
			action = "closeDialog 0";
			idc = -1;
			x = 0.7125;
			y = 0.28;
			w = 0.0375;
			h = 0.04;
		};
		class PurchaseButton: RRP_btn_blue
		{
			idc = 9105;
			onMouseButtonClick = "[] spawn RRPClient_system_buyHouse";
			text = "Купить";  
			x = 0.3625;
			y = 0.5;
			w = 0.275;
			h = 0.05;
		};
		class RscEdit: RRP_RscEdit
		{
			idc = 9106;
			maxChars = 10;
			text = "";
			x = 0.3;
			y = 0.42;
			w = 0.4;
			h = 0.06;
		};
	};
};