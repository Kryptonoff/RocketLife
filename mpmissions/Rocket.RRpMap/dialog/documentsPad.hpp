class RRPialogDocuments {
	idd = 583160;
	name = "RRPialogDocuments";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur; uiNamespace setVariable ['RRPialogDocuments',_this select 0];";
	onUnLoad = "false call RRPClient_gui_util_blur; uiNamespace setVariable ['RRPialogDocuments',displayNull]; curDocID = nil";

	class controlsBackground {
		class padImage : RscPicture
		{
			idc = 7201;
			text = "";
			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};

		class TitleBackground : RscText
		{
			idc = -1;
			text = "Документы";
			x = 0.0375;
			y = 0.084;
			w = 0.925;
			h = 0.048;
			colorBackground[] = {0,0,0,0.4};
		};

		class DocBackground : RscText
		{
			idc = -1;
			text = "";
			x = 0.0375;
			y = 0.14;
			w = 0.375;
			h = 0.628;
			colorBackground[] = {0,0,0,0.4};
		};

		class infoBackground : RscText
		{
			idc = -1;
			text = "";
			x = 0.4225;
			y = 0.14;
			w = 0.54;
			h = 0.628;
			colorBackground[] = {0,0,0,0.4};
		};

		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; [] spawn RRPClient_pad_openMain";
			tooltip = "$STR_PM_BackToMainMenu";

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
			tooltip = "$STR_Global_Close";

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
		class docList : RscTree
		{
			idc = 583162;
			colorBackground[] = {0,0,0,0};
			onTreeSelChanged = "[_this, 'tablet'] call Client_documents_viewSelect";
			sizeEx = 0.85 * GUI_GRID_H;

			x = 0.0375;
			y = 0.14;
			w = 0.375;
			h = 0.628;
		};

		class docInfoGroup : RscControlsGroup
		{
			idc = -1;
			x = 0.4225;
			y = 0.14;
			w = 0.54;
			h = 0.628;
			class Controls
			{
				class docInfo : RRP_RscStructuredText
				{
					idc = 583163;
					sizeEx = 0.020;
					font = "PuristaMedium";
					text = "";
					x = 0;
					y = 0;
					w = 0.54;
					h = 0.628;
				};
			};
		};

		class unitsList : RRP_RscCombo
		{
			idc = 583164;
			colorBackground[] = {0,0,0,0.8};
			x = 0.0375;
			y = 0.776;
			w = 0.375;
			h = 0.06;
		};

		class buttonGiveInfo : RscButtonUC {
			idc = 583165;
			text = "Показать документ";
			onButtonClick = "[] call Client_documents_viewGiveInfo";
			x = 0.425;
			y = 0.78;
			w = 0.2625;
			h = 0.06;
		};

		class buttonDelete : RscButtonUC {
			idc = 583431;
			text = "Удалить документ";
			x = 0.7;
			y = 0.78;
			w = 0.2625;
			h = 0.06;
		};
	};
};
