class RRPDialogLTDShop 
{
	idd = 7400;
	name= "RRPDialogLTDShop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogLTDShop',_this select 0]; true call RRPClient_gui_util_blur";
	onUnload = "uiNamespace setVariable ['RRPDialogLTDShop',displayNull]; false call RRPClient_gui_util_blur";
	class controlsBackground 
	{
		class MainBackground: RRP_background_fade
		{
			idc = 7401;
			x = 0.283518 * safezoneW + safezoneX;
			y = 0.324051 * safezoneH + safezoneY;
			w = 0.427809 * safezoneW;
			h = 0.362896 * safezoneH;
		};
	};

	class controls 
	{
		class Title: RRP_title
		{
			idc = 7402;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Close: RRP_btn_exit_text
		{
			idc = 7403;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.01535 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class shopItemsTitle: RscText
		{
			idc = 7405;
			text = "Магазин";  
			x = 0.288673 * safezoneW + safezoneX;
			y = 0.324051 * safezoneH + safezoneY;
			w = 0.134013 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class shopItemlist: RRP_RscListBox
		{
			idc = 7406;
			x = 0.288673 * safezoneW + safezoneX;
			y = 0.357041 * safezoneH + safezoneY;
			w = 0.134013 * safezoneW;
			h = 0.274921 * safezoneH;
		};
		class ButtonBuy: RRP_btn_blue
		{
			onButtonClick = "[] spawn RRPClient_ltd_shopBuy";
			idc = 7407;
			text = "Купить";  
			x = 0.329907 * safezoneW + safezoneX;
			y = 0.642959 * safezoneH + safezoneY;
			w = 0.0927779 * safezoneW;
			h = 0.0329905 * safezoneH;
		};
		class userItemsTitle: RscText
		{
			idc = 7408;
			text = "Ваш инвентарь";
			x = 0.427839 * safezoneW + safezoneX;
			y = 0.324051 * safezoneH + safezoneY;
			w = 0.144321 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class userItemlist: RRP_RscListBox
		{
			idc = 7409;
			x = 0.427839 * safezoneW + safezoneX;
			y = 0.357041 * safezoneH + safezoneY;
			w = 0.144321 * safezoneW;
			h = 0.230934 * safezoneH;
		};
		class Price: RscText
		{
			idc = 7410;
			text = "Цена:";  
			x = 0.427839 * safezoneW + safezoneX;
			y = 0.598972 * safezoneH + safezoneY;
			w = 0.030926 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class sellPrice: RRP_RscEdit
		{
			idc = 7411;

			text = "50";  
			x = 0.458765 * safezoneW + safezoneX;
			y = 0.598972 * safezoneH + safezoneY;
			w = 0.0360803 * safezoneW;
			h = 0.0329905 * safezoneH;
		};
		class SellCount: RscText
		{
			idc = 7412;
			text = "Кол-во:";  
			x = 0.5 * safezoneW + safezoneX;
			y = 0.598972 * safezoneH + safezoneY;
			w = 0.0360803 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class sellEdit: RRP_RscEdit
		{
			idc = 7413;
			text = "1";  
			x = 0.53608 * safezoneW + safezoneX;
			y = 0.598972 * safezoneH + safezoneY;
			w = 0.0380625 * safezoneW;
			h = 0.0307999 * safezoneH;
		};
		class ButtonSubmit: RRP_btn_blue
		{
			idc = 7414;
			onButtonClick = "[] spawn RRPClient_ltd_shopSubmit";
			text = "Добавить";
			x = 0.427839 * safezoneW + safezoneX;
			y = 0.642959 * safezoneH + safezoneY;
			w = 0.144321 * safezoneW;
			h = 0.0329905 * safezoneH;
		};
		class aboutStore: RscText
		{
			idc = 7415;
			text = "Об этом магазине";  
			x = 0.577315 * safezoneW + safezoneX;
			y = 0.324051 * safezoneH + safezoneY;
			w = 0.128858 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class aboutListBox: RRP_RscListBox
		{
			idc = 7416;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.275 * safezoneH;
		};
		class RscEdit_1402: RRP_RscEdit
		{
			idc = 7417;
			text = "1";  
			x = 0.288673 * safezoneW + safezoneX;
			y = 0.642959 * safezoneH + safezoneY;
			w = 0.0360803 * safezoneW;
			h = 0.0329905 * safezoneH;
		};
		class medrBtn: RRP_btn_yellow
		{
			onButtonClick = "_this call RRPClient_ltd_trashOnOpen";
			idc = 7418;
			text = "МОДЕРАТОР";  
			x = 0.577335 * safezoneW + safezoneX;
			y = 0.643017 * safezoneH + safezoneY;
			w = 0.128892 * safezoneW;
			h = 0.033004 * safezoneH;
		};
	};
};