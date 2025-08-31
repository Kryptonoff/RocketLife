class RRPDialogClothingShop {
	idd = 3100;
	name= "RRPDialogClothingShop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = 	"false call RRPClient_hud_show;uiNamespace setVariable ['RRPDialogClothingShop',_this select 0]";
	onUnload = 	"true call RRPClient_hud_show;uiNamespace setVariable ['RRPDialogClothingShop', displayNull]; call RRPClient_system_shopBoxDestroy; RRPClothingBasket = nil";

	class controlsBackground {
		class bg: RRP_background
		{
			idc = 3122;

			x = 0.00499998 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.181758 * safezoneW;
			h = 0.968 * safezoneH;
		};

		class bg2: RRP_background
		{
			idc = 3123;

			x = 0.813242 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.182891 * safezoneW;
			h = 0.517 * safezoneH;
		};

		class bg3: RRP_background
		{
			idc = 3121;

			x = 0.812847 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.35 * safezoneH;
		};
	};

	class controls
	{
		class Title : RRP_title
		{
			idc = 3103;
			text = "";

			x = 0.00499998 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.978399 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseImage : RRP_btn_exit {
			idc = -1;
			x = 0.983398 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.0116016 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class strText: RRP_RscStructuredText {
			idc = 21123;
			text = "TODO";
			x = 0.007707 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.0889453 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class ClothingList : RRP_RscListBoxBigTiles
		{
			idc = 3101;
			text = "";
			onLBSelChanged = "_this call RRPClient_system_changeClothes";
			onMouseButtonDblClick = "'add' call RRPClient_system_clothingAddToBasket;";

			x = 0.00799062 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.814 * safezoneH;
		};

		class FilterList : RRP_RscCombo
		{
			idc = 3105;
			onLBSelChanged  = "call RRPClient_system_renderAssortmentList";
			x = 0.00730467 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.177437 * safezoneW;
			h = 0.0280001 * safezoneH;
		};

		class ButtonAddToCat : RRP_btn_blue
		{
			idc = 3106;
			text = "Добавить в корзину";
			onButtonClick = "'add' call RRPClient_system_clothingAddToBasket";
			x = 0.0649414 * safezoneW + safezoneX;
			y = 0.95562 * safezoneH + safezoneY;
			w = 0.119883 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class ButtonTemplates: RRP_btn_blue {
			idc = -1;
			text = "Шаблоны";
			onButtonClick = "call RRPClient_shops_renderListTemplates";

			x = 0.00739765 * safezoneW + safezoneX;
			y = 0.95562 * safezoneH + safezoneY;
			w = 0.0541406 * safezoneW;
			h = 0.033 * safezoneH;

		};

		class BasketTitle : RRP_RscStructuredText
		{
			idc = 3107;
			text = "Корзина";

			x = 0.815625 * safezoneW + safezoneX;
			y = 0.483593 * safezoneH + safezoneY;
			w = 0.177656 * safezoneW;
			h = 0.077 * safezoneH;
		};

		class BasketList: RRP_RscListBoxBigTiles {
			idc = 3108;
			onMouseButtonDblClick = "'delete' call RRPClient_system_clothingAddToBasket;";

			x = 0.815547 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.1775 * safezoneW;
			h = 0.355704 * safezoneH;
		};

		class BasketButtonBuy: RRP_btn_green {
			idc = 3109;
			text = "Купить";
			onButtonClick = "call RRPClient_system_buyAction";

			x = safeZoneX + safeZoneW * 0.814789;
			y = safeZoneY + safeZoneH * 0.929;
			w = safeZoneW * 0.179453;
			h = safeZoneH * 0.033;
		};

		class typeMoney: RRP_RscCombo {
			idc = 31011;
			onLBSelChanged  = "['update'] call RRPClient_shops_utils";
			x = safeZoneX + safeZoneW * 0.0989726;
			y = safeZoneY + safeZoneH * 0.071;
			w = safeZoneW * 0.0859374;
			h = safeZoneH * 0.0283703;
		};

		class BasketButtonDelete: RRP_btn_red {
			idc = 3111;
			text = "Очистить корзину";
			onButtonClick = "'cloth' call RRPCLient_shops_clearBasket;";

			x = 0.815176 * safezoneW + safezoneX;
			y = 0.96398 * safezoneH + safezoneY;
			w = 0.179031 * safezoneW;
			h = 0.028926 * safezoneH;
		};

		class TemplatesTitle : RRP_title
		{
			idc = 3113;
			text = "Шаблоны";

			x = 0.812847 * safezoneW + safezoneX;
			y = 0.088 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.0264445 * safezoneH;
		};

		class TemplatesList: RRP_RscListBox {
			idc = 3114;

			x = 0.815104 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.28 * safezoneH;
		};

		class TemplatesEditName : RRP_RscEdit {
			idc = 3115;
			text = "Название шаблона";

			x = 0.815104 * safezoneW + safezoneX;
			y = 0.406 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TemplatesButtonSave: RRP_btn_blue {
			idc = 3116;
			text = "Сохранить";
			tooltip = "Сохраняет текущий список покупок";
			onButtonClick = "call RRPClient_shops_saveNewTempate";

			x = 0.878125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0595833 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class TemplatesButtonLoad: RRP_btn_blue {
			idc = 3117;
			text = "Загрузить";
			onButtonClick = "call RRPClient_shops_addToBasketTempate";

			x = 0.815104 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0595833 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class TemplatesButtonDelete: RRP_btn_red {
			idc = 3118;
			text = "Удалить";
			onButtonClick = "call RRPClient_shops_deleteTempate";

			x = 0.941146 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0527083 * safezoneW;
			h = 0.028 * safezoneH;
		};

	};
};
