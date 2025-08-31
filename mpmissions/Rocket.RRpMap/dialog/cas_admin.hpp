class RRPDialogCasinoAdmin
{
	idd = 22999;
	onLoad = "uiNamespace setVariable ['RRPDialogCasinoAdmin',_this#0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogCasinoAdmin',displayNull]; false call RRPClient_gui_util_blur;";
	class controlsBackground
	{
		class title: RRP_title
		{
			idc = -1;
			text = "Управление казино";  
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class background: RRP_background
		{
			idc = -1;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.385 * safezoneH;
		};
		class Close: RRP_btn_exit_text
		{
			idc = -1;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			//["0.597969 * safezoneW + safezoneX","0.203 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"]
		};	
	};
	class controls
	{
		class nameEdit: RRP_RscEdit
		{
			idc = 22998;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			maxChars = 12;
			text = "";
			//["0.505156 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.0979687 * safezoneW","0.033 * safezoneH"]
		};
		class setNameBtn: RRP_btn_blue
		{
			idc = 22997;
			text = "Уст. название";  
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "['setName'] call RRPClient_ltd_slots_admin";
			//["0.396875 * safezoneW + safezoneX","0.39 * safezoneH + safezoneY","0.0979687 * safezoneW","0.033 * safezoneH"]
		};
		class limEdit: RRP_RscEdit
		{
			idc = 22996;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			text = "";
			//["0.505156 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.0979687 * safezoneW","0.033 * safezoneH"]
		};
		class limBtn: RRP_btn_blue
		{
			idc = 22995;
			text = "Уст. лимит";  
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "['setLimit'] call RRPClient_ltd_slots_admin";
			//["0.396875 * safezoneW + safezoneX","0.434 * safezoneH + safezoneY","0.0979687 * safezoneW","0.033 * safezoneH"]
		};
		class blcFrame: RscFrame
		{
			idc = 22994;
			text = "Баланс";  
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.11 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			//["0.396875 * safezoneW + safezoneX","0.478 * safezoneH + safezoneY","0.20625 * safezoneW","0.11 * safezoneH"]
		};
		class blcEdit: RRP_RscEdit
		{
			idc = 22993;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
			text = "";
			//["0.4175 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.165 * safezoneW","0.033 * safezoneH"]
		};
		class addBtn: RRP_btn_blue
		{
			idc = 22992;
			text = "Положить";  
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Средства будут сняты с банковского счета";
			onButtonClick = "['addBank'] call RRPClient_ltd_slots_admin";
			//["0.412344 * safezoneW + safezoneX","0.544 * safezoneH + safezoneY","0.0825 * safezoneW","0.033 * safezoneH"]
		};
		class takeBtn: RRP_btn_blue
		{
			idc = 22991;
			text = "Снять";  
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Средства будут выведены на банковский счет";
			onButtonClick = "['takeBank'] call RRPClient_ltd_slots_admin";
			//["0.505156 * safezoneW + safezoneX","0.544 * safezoneH + safezoneY","0.0825 * safezoneW","0.033 * safezoneH"]
		};
		class RscStructuredText_1100: RRP_RscStructuredText
		{
			idc = 22990;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.099 * safezoneH;
			//["0.396875 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.20625 * safezoneW","0.099 * safezoneH"]
		};
		class clsOpBtn: RRP_btn_yellow
		{
			idc = 22989;
			text = "Закрыть";  
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			//["0.033 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.0979687 * safezoneW","0.033 * safezoneH"]
		};
		class payBtn: RRP_btn_blue
		{
			idc = 22988;
			text = "Оплатить";  
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "['pay'] call RRPClient_ltd_slots_admin";
			//["0.505156 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.0979687 * safezoneW","0.033 * safezoneH"]
		};
	};
};