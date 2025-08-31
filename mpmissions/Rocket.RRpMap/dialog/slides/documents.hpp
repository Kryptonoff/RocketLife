class DocumentsSlide: SlideTab
{
    idc = 31000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class Tree: AppRscTree
		{
			idc = 31001;
			onTreeSelChanged = "[_this, 'tablet'] call Client_documents_viewSelect";
			sizeEx = 0.85 * GUI_GRID_H;
			x = 0.00206286 * safezoneW;
			y = 0.00660274 * safezoneH;
			w = 0.169133 * safezoneW;
			h = 0.539187 * safezoneH;
		};
		class docInfoGroup: RscControlsGroup
		{
			idc = 31002;
			x = 0.174295 * safezoneW;
			y = 0.00660274 * safezoneH;
			w = 0.222767 * safezoneW;
			h = 0.539187 * safezoneH;
			class Controls
			{
				class docInfo : AppRscStructuredText
				{
					idc = 31003;
					sizeEx = 0.020;
					font = "SFCompactDisplay";
					text = "";
					x = 0;
					y = 0;
					w = 0.54;
					h = 0.628;
				};
			};
		};
		class unitList: AppRscCombo
		{
			idc = 31004;
			x = 0.00206277 * safezoneW;
			y = 0.552379 * safezoneH;
			w = 0.169133 * safezoneW;
			h = 0.0330094 * safezoneH;
		};
		class buttonGiveInfo: AppTabletButton
		{
			idc = 31005;
			text = "Показать документ";
			onButtonClick = "[] call Client_documents_viewGiveInfo";
			x = 0.175326 * safezoneW;
			y = 0.552378 * safezoneH;
			w = 0.10829 * safezoneW;
			h = 0.0330094 * safezoneH;
		};
		class buttonDelete: AppTabletButton
		{
			idc = 31006;
			text = "Удалить документ";
			x = 0.293 * safezoneW;
			y = 0.5523 * safezoneH;
			w = 0.10829 * safezoneW;
			h = 0.0330094 * safezoneH;
		};
        class back: MainMenuButton
        {
            idc = 31007;
        };
	};
};