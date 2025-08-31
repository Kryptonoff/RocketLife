class RRPDialogWeaponShop {
	idd = 38400;
	name= "RRPDialogWeaponShop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = 	"false call RRPClient_hud_show;uiNamespace setVariable ['RRPDialogWeaponShop',_this select 0]; call RRPClient_system_shopBoxWeaponCreate;";
	onUnload = 	"true call RRPClient_hud_show;uiNamespace setVariable ['RRPDialogWeaponShop', displayNull]; call RRPClient_system_shopBoxDestroy; uiNamespace setVariable ['shopClass',nil]; RRPWeaponBasket = nil; uiNamespace setVariable ['WeaponShopTotalPrice', nil];  currencyType = nil";

	class controlsBackground {
		class bg: RRP_background
		{
			idc = 38427;

			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.0492 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.9492 * safezoneH;
		};

		class bg2: RRP_background//Корзина
		{
			idc = 38426;

			x = 0.812847 * safezoneW + safezoneX;
			y = 0.571333 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.424755 * safezoneH;
		};

		class bg3: RRP_background//Шаблон
		{
			idc = 38425;

			x = 0.812847 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.35 * safezoneH;
		};

		class MagsBg: RRP_background//ПотроныА
		{
			idc = 38410;
			x = 0.18894 * safezoneW + safezoneX;
			y = 0.8416 * safezoneH + safezoneY;
			w = 0.182437 * safezoneW;
			h = 0.1568 * safezoneH;
		};
	};

	class controls {

		// class filter: RRP_RscCombo {
		// 	idc = 3842811;
		// 	onLBSelChanged  = "call RRPClient_system_renderListItems";
		// 	x = safeZoneX + safeZoneW * 0.00499998;
		// 	y = safeZoneY + safeZoneH * 0.258;
		// 	w = safeZoneW * 0.177891;
		// 	h = safeZoneH * 0.022;
		// };

		class Title : RRP_title
		{
			idc = 38401;
			text = "";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.0048283 * safezoneH + safezoneY;
			w = 0.99 * safezoneW;
			h = 0.0330114 * safezoneH;
		};

		class Cash : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};
		class CloseImage : RRP_btn_exit {
			idc = -1;
			x = 0.974375 * safezoneW + safezoneX;
			y = 0.0048283 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0330114 * safezoneH;
		};

		class FilterList: RRP_RscCombo {
			idc = 38402;
			onLBSelChanged = "RRPWeaponBasket = []; _this call RRPClient_system_renderListItems";

			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class itemList: RRP_RscListBox {
			idc = 38403;
			onLBSelChanged = "_this call RRPClient_system_selectItem";
			onMouseButtonDblClick = "['add','items'] call RRPClient_system_weaponAddToBasket;";
			x = 0.00499998 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.177891 * safezoneW;
			h = 0.66 * safezoneH;
		};

		class itemInfo: RRP_RscStructuredText {
			idc = 38404;
			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.0912 * safezoneH + safezoneY;
			w = 0.178499 * safezoneW;
			h = 0.1596 * safezoneH;
		};

		class basketHeader: RRP_RscStructuredText {
			text = "Корзина пуста...";
			colorBackground[] = {0.26, 0.24, 0.31,1};
			idc = 388656;
			x = 0.813242 * safezoneW + safezoneX;
			y = 0.4912 * safezoneH + safezoneY;
			w = 0.182508 * safezoneW;
			h = 0.0814 * safezoneH;

		}

		class ItemButtonAddCat: RRP_btn_blue {
			idc = 38405;
			text = "В корзину";
			onButtonClick = "['add','items','multi'] call RRPClient_system_weaponAddToBasket;t";

			x = 0.0835 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class ItemCount: RRP_RscEdit {
			idc = 38406;
			text = "1";

			x = 0.0588542 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.021 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class MagsList: RRP_RscListBox {
			idc = 38407;
			onMouseButtonDblClick = "['add','mags'] call RRPClient_system_weaponAddToBasket;";

			x = 0.191564 * safezoneW + safezoneX;
			y = 0.8472 * safezoneH + safezoneY;
			w = 0.177188 * safezoneW;
			h = 0.112 * safezoneH;
		};

		class MagsCount: RRP_RscEdit {
			idc = 38408;
			text = "1";

			x = 0.191563 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.049875 * safezoneW;
			h = 0.028 * safezoneH;

		};

		class MagsButtonAddCat: RRP_btn_blue {
			idc = 38409;
			text = "В корзину";
			onButtonClick = "['add','mags','multi'] call RRPClient_system_weaponAddToBasket;";


			x = 0.244058 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.124688 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class BasketButtonTemplates: RRP_btn_blue {
			idc = -1;
			text = "Шаблоны";
			onButtonClick = "call RRPClient_shops_renderListTemplates";
			tooltip = "Открывает/закрывает меню шаблонов, в котором можно сохранить текущее состояние корзины или загрузить прошлое.";

			x = 0.0051875 * safezoneW + safezoneX;
			y = 0.9648 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class BasketList: RRP_RscListBox {
			idc = 38412;
			onMouseButtonDblClick = "['delete','basket'] call RRPClient_system_weaponAddToBasket;";

			x = 0.815104 * safezoneW + safezoneX;
			y = 0.576 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.352 * safezoneH;
		};
		//["0.859571 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.133204 * safezoneW","0.0311111 * safezoneH"]
		class BasketButtonBuy: RRP_btn_green {
			idc = 38413;
			text = "Купить за $";
			onButtonClick = "call RRPClient_system_sellBuyAction";

			x = safeZoneX + safeZoneW * 0.859571;
			y = safeZoneY + safeZoneH * 0.929;
			w = safeZoneW * 0.133204;
			h = safeZoneH * 0.0311111;
		};

		//["0.815176 * safezoneW + safezoneX","0.929 * safezoneH + safezoneY","0.0421877 * safezoneW","0.0292593 * safezoneH"]
		class MoneyType: RRP_RscCombo {
			idc = 38428;
			onLBSelChanged  = "['updateWeapon'] call RRPClient_shops_utils";
			x = safeZoneX + safeZoneW * 0.815176;
			y = safeZoneY + safeZoneH * 0.929;
			w = safeZoneW * 0.0421877;
			h = safeZoneH * 0.0292593;
		};
		class BasketButtonDelete: RRP_btn_red {
			idc = 38415;
			text = "Очистить корзину";
			onButtonClick = "'items' call RRPCLient_shops_clearBasket;";

			x = 0.815949 * safezoneW + safezoneX;
			y = 0.96486 * safezoneH + safezoneY;
			w = 0.177086 * safezoneW;
			h = 0.0280001 * safezoneH;
			//["0.815949 * safezoneW + safezoneX","0.96486 * safezoneH + safezoneY","0.177086 * safezoneW","0.0280001 * safezoneH"]
		};
		class TemplatesTitle : RRP_title
		{
			idc = 38417;
			text = "Шаблоны";
			x = 0.812855 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.169766 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TemplatesList: RRP_RscListBox {
			idc = 38418;

			x = 0.815104 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.28 * safezoneH;
		};

		class TemplatesEditName : RRP_RscEdit {
			idc = 38419;
			text = "Название шаблона";

			x = 0.815104 * safezoneW + safezoneX;
			y = 0.406 * safezoneH + safezoneY;
			w = 0.177604 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TemplatesButtonSave: RRP_btn_blue {
			idc = 38420;
			text = "Сохранить";
			tooltip = "Сохраняет текущий список покупок";
			onButtonClick = "call RRPClient_shops_saveNewTempate";

			x = 0.878125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0595833 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class TemplatesButtonLoad: RRP_btn_blue {
			idc = 38421;
			text = "Загрузить";
			onButtonClick = "call RRPClient_shops_addToBasketTempate";

			x = 0.815104 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0595833 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class TemplatesButtonDelete: RRP_btn_red {
			idc = 38422;
			text = "Удалить";
			onButtonClick = "call RRPClient_shops_deleteTempate";

			x = 0.941146 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0527083 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class TemplatesCloseImage : RRP_btn_exit_text {
			idc = 38423;
			x = 0.982234 * safezoneW + safezoneX;
			y = 0.093 * safezoneH + safezoneY;
			w = 0.0139218 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
