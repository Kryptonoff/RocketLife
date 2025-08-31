class UnionDialogVirtualItemShop {
	idd = 2400;
	name= "UnionDialogVirtualItemShop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = 	"false call RRPClient_hud_show;true call RRPClient_gui_util_blur;";
	onUnload = 	"true call RRPClient_hud_show;false call RRPClient_gui_util_blur;";

	class controlsBackground {

		class MainBackground:RRP_background {
			idc = -1;
			x = 0.395 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.21 * safezoneW;
			h = 0.4088 * safezoneH;
		};
		class Title : RRP_title {
			idc = 2401;
			text = "";
			x = 0.394812 * safezoneW + safezoneX;
			y = 0.29738 * safezoneH + safezoneY;
			w = 0.192929 * safezoneW;
			h = 0.0210741 * safezoneH;
		};
	};

	class controls {
		class Close: RRP_btn_exit_text
		{
			idc = -1;
			x = 0.587785 * safezoneW + safezoneX;
			y = 0.29738 * safezoneH + safezoneY;
			w = 0.0168751 * safezoneW;
			h = 0.0210741 * safezoneH;
		};
		class pItemlist : RRP_RscListBox
		{
			idc = 2402;
			text = "";

			x = 0.403735 * safezoneW + safezoneX;
			y = 0.329 * safezoneH + safezoneY;
			w = 0.194906 * safezoneW;
			h = 0.297 * safezoneH;
		};
		class sellEdit : RRP_RscEdit
		{
			idc = 2403;
			text = "1";
			x = 0.398938 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class ButtonSell : RRP_btn_blue
		{
			idc = -1;
			text = "Продать";
			onButtonClick = " 'one' call RRPClient_system_virt_sell";

			x = 0.454057 * safezoneW + safezoneX;
			y = 0.6512 * safezoneH + safezoneY;
			w = 0.148309 * safezoneW;
			h = 0.0308 * safezoneH;
		};
		class ButtonSellAll : RRP_btn_blue
		{
			idc = -1;
			text = "Продать всё";
			onButtonClick = " 'all' call RRPClient_system_virt_sell";

			x = 0.397997 * safezoneW + safezoneX;
			y = 0.690178 * safezoneH + safezoneY;
			w = 0.203436 * safezoneW;
			h = 0.0308 * safezoneH;
		};
	};
};
