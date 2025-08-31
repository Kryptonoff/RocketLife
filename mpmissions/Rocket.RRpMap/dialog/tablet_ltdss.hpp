class RRPDialogCompanyMenu
{
	idd = 9400;
	name= "RRPDialogCompanyMenu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogCompanyMenu',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "RRPClientStoreSelected = null;uiNamespace setVariable ['RRPDialogCompanyMenu',displayNull]; false call RRPClient_gui_util_blur;";

	class controlsBackground
	{
		class padImage : RscPicture {
			idc = 7301;
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
		class Title: RscText
		{
			idc = 9401;
			text = "Меню управления компанией от 'AltisStores Inc.'";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {1,1,1,0.1};
		};
		class delStoreBtn: RscButtonMenu
		{
			idc = 9402;
			onButtonClick = "'deleteMe' call RRPClient_ltd_updateStore";

			text = "УДАЛИТЬ МАГАЗИН";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,1};
			class Attributes{align="center";valign="middle";};
			
		};
		class ltdLead: RscButtonMenu
		{
			idc = 9403;
			onButtonClick = "[] spawn RRPClient_ltd_setLeaderRequest";
			text = "СДЕЛАТЬ ЛИДЕРОМ!";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class kickEmpl: RscButtonMenu
		{
			idc = 9404;
			onButtonClick = "[] spawn RRPClient_ltd_kickRequest";

			text = "УВОЛИТЬ";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class taxEdit: RscEdit
		{
			idc = 9405;

			text = "3";  
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class taxBtn: RscButtonMenu
		{
			idc = 9406;
			onButtonClick = "'tax' call RRPClient_ltd_updateStore";

			text = "Пошлина";  
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class storeMode: RscButtonMenu
		{
			idc = 9407;
			onButtonClick = "'mode' call RRPClient_ltd_updateStore";
			text = "OWNER ONLY";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class InviteMember: RscButtonMenu
		{
			idc = 9408;
			onButtonClick = "[] spawn RRPClient_ltd_inviteRequest";

			text = "ПРИГЛАСИТЬ";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class PlayersInviteList: RscCombo
		{
			idc = 9409;

			x = 0.5825 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ltdInfo: RscStructuredText
		{
			idc = 9410;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.121 * safezoneH;
			text = "";
			colorBackground[] = {1,1,1,0.1};
		};
		class storesList: RscCombo
		{
			idc = 9411;
			onLBSelChanged = "_this call RRPClient_ltd_onLbStoreLists";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class delLtdBtn: RscButtonMenu
		{
			idc = 9412;
			onButtonClick = "[] spawn RRPClient_ltd_abolish";

			text = "УДАЛИТЬ КОМПАНИЮ";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,1};
			class Attributes{align="center";valign="middle";};
		};
		class withdraw: RscButtonMenu
		{
			idc = 9428;
			onButtonClick = "call RRPClient_ltd_withdraw";

			text = "ОБНАЛИЧИТЬ";  
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Обналичить средства можно от $1000";
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class discEdit: RscEdit
		{
			idc = 9413;
			tooltip = "Процент скидки возможен от 1% до 25%";
			text = "3";  
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class setDiscBtn: RscButtonMenu
		{
			idc = 9414;
			onButtonClick = "'discount' call RRPClient_ltd_updateStore";
			tooltip = "Выбранная скидка не сможет быть изменена до истечения выбранного срока!";
			text = "УСТ. СКИДКУ";  
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class discListBtn: RscCombo
		{
			idc = 9415;
			tooltip = "Выберите когда скидка закончится";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class nameStoreEdit: RscEdit
		{
			idc = 9416;
			text = "";  
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class renameBtn: RscButtonMenu
		{
			idc = 9417;
			onButtonClick = "'rename' call RRPClient_ltd_updateStore";
			text = "Переименовать";  
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class employeeList: RscListbox
		{
			idc = 9418;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class buildStore: RscButtonMenu
		{
			idc = 9419;
			onButtonClick = "_this call RRPClient_ltd_buildMyStore";

			text = "Установить свой магазин";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class plusPos: RscButtonMenu
		{
			idc = 9420;
			onButtonClick = "'Plus5Pos' call RRPClient_ltd_updateStore";

			text = "ДОБ. 5 ПОЗИЦИЙ";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Стоимость 660 RCredits";
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0.843,0,1};
			class Attributes{align="center";valign="middle";};
		};
		class plusDay: RscButtonMenu
		{
			idc = 9421;
			onButtonClick = "'Plus30Day' call RRPClient_ltd_updateStore";
			
			text = "ДОБАВИТЬ 30 ДНЕЙ";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Стоимость 6600 RCredits";
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0.843,0,1};
			class Attributes{align="center";valign="middle";};
		};
		class closeStoreBtn: RscButtonMenu
		{
			idc = 9422;
			onButtonClick = "'status' call RRPClient_ltd_updateStore";

			text = "CLOSE STORE";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class faqBtn: RscButtonMenu
		{
			idc = 9423;
			onButtonClick = "true call RRPClient_ltd_FAQ";
			text = "FAQ";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
		class informListStore: RscListbox
		{
			idc = 9424;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.154 * safezoneH;
		};
		
		class text_group: RscControlsGroup
		{
			idc = 9425;
			x = 0.30929 * safezoneW + safezoneX;
			y = 0.280036 * safezoneH + safezoneY;
			w = 0.38142 * safezoneW;
			h = 0.373939 * safezoneH;
			class controls
			{
				class faqText: RscStructuredText
				{
					idc = 9426;
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
			idc = 9427;
			onButtonClick = "false call RRPClient_ltd_FAQ";

			text = "НАЗАД";  
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,0.1};
			class Attributes{align="center";valign="middle";};
		};
	};
};