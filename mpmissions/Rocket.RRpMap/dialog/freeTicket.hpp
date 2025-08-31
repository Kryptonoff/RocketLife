class UnionDialogFreeTicketGive
{
	idd = 5200;
	name = "UnionDialogFreeTicketGive";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {

		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.112 * safezoneH;
		};
	};
	
	class controls 
	{
		class Title : RRP_title {			
			idc = 5201;
			text = "";
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Closebrn : RRP_btn_exit_text {
			idc = -1;
			x = 0.595765 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class t_cost: RscText {
			idc = -1;
			text = "Сумма:";  
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0459375 * safezoneW;
			h = 0.028 * safezoneH;			
		};
		
		class moneyEdit : RRP_RscEdit {
			idc = 5202;			
			text = "100";

			x = 0.427812 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class cost_message: RscText {
			idc = -1;
			text = "Максимум: $500,000";  
			x = 0.486874 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class payTicket: RRP_btn_blue {
			idc = -1;
			text = "Создать тикет";			
			onButtonClick = "call RRPClient_tickets_Give";
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};

class UnionDialogFreeTicketPay
{
	idd = 5300;
	name = "UnionDialogFreeTicketPay";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {	
		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.349063 * safezoneW + safezoneX;
			y = 0.3292 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.14 * safezoneH;
		};
	};
	
	class controls 
	{
		class title: RRP_title {
			idc = -1;
			text = "Оплата счета";  
			x = 0.348922 * safezoneW + safezoneX;
			y = 0.3075 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.022 * safezoneH;			
		};

		class CloseImage : RRP_btn_exit_text {
			idc = -1;
			x = 0.612097 * safezoneW + safezoneX;
			y = 0.30706 * safezoneH + safezoneY;
			w = 0.0123958 * safezoneW;
			h = 0.022926 * safezoneH;
		};
		
		class InfoMsg : RRP_RscStructuredText
		{
			idc = 5301;
			text = "";

			x = 0.349063 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.275625 * safezoneW;
			h = 0.07 * safezoneH;
		};

		class payTicket: RRP_btn_blue {
			idc = -1;
			text = "Оплатить";
			
			onButtonClick = "call RRPClient_tickets_Pay;";
			x = 0.532812 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};