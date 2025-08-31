class UnionDialogTicketGive
{
	idd = 2650;
	name = "UnionDialogTicketGive";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class RscTitle:RRP_title {
			idc = -1;
			x = 0.2125;
			y = 0.2;
			w = 0.55;
			h = 0.04;
		};
		class MainBackground:RRP_background {
			idc = -1;
			x = 0.2125;
			y = 0.24;
			w = 0.5875;
			h = 0.26;
		};
		class exit:RRP_btn_exit_text {
			idc = -1;
			x = 0.7625;
			y = 0.2;
			w = 0.0372;
			h = 0.04;
		};
		// exit [0.7625,0.2,0.0375,0.04]
	};
	
	class controls 
	{
		class moneyEdit : RRP_RscEdit 
		{
			idc = 2652;
			text = "1";
			sizeEx = 0.034;
			x = 0.35; 
			y = 0.3;
			w = 0.3375; 
			h = 0.06;
		};

		class payTicket: RRP_btn_blue {
			idc = -1;
			text = "Выписать";
			onButtonClick = "call RRPClient_system_ticketGive";
			x = 0.35;
			y = 0.38;
			w = 0.3375;
			h = 0.06;
		};
	};
};

class UnionDialogTicketPay
{
	idd = 2600;
	name = "UnionDialogTicketPay";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class MainBackground:RRP_background {
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : RscStructuredText
		{
			idc = 2601;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class payTicket: RRP_btn_green {
			idc = -1;
			text = "Оплатить";
			onButtonClick = "call RRPClient_system_ticketPay;";
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 18);
		};
		
		class refuseTicket : RRP_btn_red {
			idc = -1;
			text = "Отказаться";
			onButtonClick = "closeDialog 0;";
			x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 18);
		};
	};
};