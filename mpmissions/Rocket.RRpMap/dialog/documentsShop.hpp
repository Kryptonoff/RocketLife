class ALDialogDocumentsShop {
    idd = 55200;
    name = "ALDialogDocumentsShop";
    movingEnable = 0;
    enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnLoad = "false call RRPClient_gui_util_blur;";

	class controlsBackground {
		class Title: RRP_title
		{
			idc = 55204;
			text = "Магазин документов"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.233903 * safezoneH + safezoneY;
			w = 0.413645 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class Cash : RRP_title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};

		class MainBackground : RRP_background
		{
			idc = -1;

			x = 0.29375 * safezoneW + safezoneX;
			y = 0.266891 * safezoneH + safezoneY;
			w = 0.413645 * safezoneW;
			h = 0.46182 * safezoneH;
			onLoad = "[_this # 0] call Client_gui_createFrame";
		};

		class CloseImage : RscPicture
		{
			idc = -1;
			text = "\rimas_gui\data\v3\button_close.paa";

			x = 0.689807 * safezoneW + safezoneX;
			y = 0.238235 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class CloseButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";

			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.689807 * safezoneW + safezoneX;
			y = 0.238235 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
	};

	class controls
	{
		class DocumentsList: RRP_RscListBox
		{
			idc = 55201;
			onLBSelChanged = "_this call Client_documents_shopSelect";

			x = 0.298334 * safezoneW + safezoneX;
			y = 0.277886 * safezoneH + safezoneY;
			w = 0.201666 * safezoneW;
			h = 0.442027 * safezoneH;
		};

		class DocumentInfoGroup : RscControlsGroup
		{
			idc = -1;
			x = 0.502292 * safezoneW + safezoneX;
			y = 0.277886 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
			h = 0.402444 * safezoneH;
			class Controls
			{
				class DocumentInfo : RRP_RscStructuredText
				{
					idc = 55202;
					text = "";
					x = 0;
					y = 0;
					w = 0.199375 * safezoneW;
					h = 0.402444 * safezoneH;
				};
			};
		};

		class DocumentBuyButton: RRP_btn_green
		{
			idc = 55203;
			text = "Приобрести документ";
			onButtonClick = "[] spawn Client_documents_shopBuyReq";
			x = 0.502292 * safezoneW + safezoneX;
			y = 0.684728 * safezoneH + safezoneY;
			w = 0.199375 * safezoneW;
			h = 0.0351862 * safezoneH;
		};
	};
};
