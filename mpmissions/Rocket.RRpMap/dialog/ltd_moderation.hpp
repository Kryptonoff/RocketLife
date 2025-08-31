class RRPDialogLTDModer
{
	idd = 7500;
	name= "RRPDialogLTDModer";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogLTDModer',_this select 0]; true call RRPClient_gui_util_blur";
	onUnload = "uiNamespace setVariable ['RRPDialogLTDModer',displayNull]; false call RRPClient_gui_util_blur";
	class controlsBackground 
	{
		class MainBackground: RRP_background_fade
		{
			idc = 7502;
			x = 0.304085 * safezoneW + safezoneX;
			y = 0.301976 * safezoneH + safezoneY;
			w = 0.391831 * safezoneW;
			h = 0.363044 * safezoneH;
		};
	};
	class controls 
	{
		class Title: RRP_title
		{
			idc = 7503;
			x = 0.304085 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CloseImage: RRP_btn_exit_text
		{
			idc = 7504;
			x = 0.680469 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.01533 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class shopItemsTitle: RscText
		{
			idc = 7506;
			text = "В продаже";
			x = 0.412354 * safezoneW + safezoneX;
			y = 0.301976 * safezoneH + safezoneY;
			w = 0.11858 * safezoneW;
			h = 0.0220027 * safezoneH;
		};
		class shopItemlist: RRP_RscListBox
		{
			idc = 7507;
			x = 0.412354 * safezoneW + safezoneX;
			y = 0.33498 * safezoneH + safezoneY;
			w = 0.128892 * safezoneW;
			h = 0.275034 * safezoneH;
		};
		class ToTrash: RRP_btn_red
		{
			onButtonClick = "1 call RRPClient_ltd_trashManage";
			idc = 7508;
			text = "В МУСОР";
			x = 0.479377 * safezoneW + safezoneX;
			y = 0.621015 * safezoneH + safezoneY;
			w = 0.061868 * safezoneW;
			h = 0.033004 * safezoneH;
		};
		class trashTitle: RscText
		{
			idc = 7509;
			text = "В мусоре";
			x = 0.546401 * safezoneW + safezoneX;
			y = 0.301976 * safezoneH + safezoneY;
			w = 0.144322 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class trashItemlist: RRP_RscListBox
		{
			idc = 7510;
			x = 0.546401 * safezoneW + safezoneX;
			y = 0.33498 * safezoneH + safezoneY;
			w = 0.144359 * safezoneW;
			h = 0.275034 * safezoneH;
		};
		class ToStockSubmit: RRP_btn_green
		{
			idc = 7511;
			onButtonClick = "2 call RRPClient_ltd_trashManage";
			text = "ВЕРНУТЬ";
			x = 0.546401 * safezoneW + safezoneX;
			y = 0.621015 * safezoneH + safezoneY;
			w = 0.144359 * safezoneW;
			h = 0.033004 * safezoneH;
		};		
		class blackListText: RscText
		{
			idc = 7512;
			text = "В черном списке";
			x = 0.304085 * safezoneW + safezoneX;
			y = 0.301976 * safezoneH + safezoneY;
			w = 0.103113 * safezoneW;
			h = 0.0220027 * safezoneH;
		};
		class blList: RRP_RscListBox
		{
			idc = 7513;
			x = 0.30924 * safezoneW + safezoneX;
			y = 0.33498 * safezoneH + safezoneY;
			w = 0.0979576 * safezoneW;
			h = 0.275034 * safezoneH;
		};
		
		class removeBLbut: RRP_btn_green
		{
			onButtonClick = "4 call RRPClient_ltd_trashManage";
			idc = 7514;
			text = "УДАЛИТЬ ИЗ ЧС";
			x = 0.30924 * safezoneW + safezoneX;
			y = 0.621015 * safezoneH + safezoneY;
			w = 0.0979576 * safezoneW;
			h = 0.033004 * safezoneH;
		};
		class toBLbut: RRP_btn_red
		{
			onButtonClick = "3 call RRPClient_ltd_trashManage";
			idc = 7515;
			text = "В ЧС";
			x = 0.412354 * safezoneW + safezoneX;
			y = 0.621015 * safezoneH + safezoneY;
			w = 0.061868 * safezoneW;
			h = 0.033004 * safezoneH;
		};
	};
};