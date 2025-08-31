class RRPDialogChangeBet
{
	idd = 7200;
	name = "RRPDialogChangeBet";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class RscTitle:RRP_title {
			idc = -1;
			text = "Изменение ставки в одноруком бандите";
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
	};
	
	class controls 
	{
		class betEdit : RRP_RscEdit 
		{
			idc = 7201;
			text = "";
			sizeEx = 0.034;
			x = 0.35; 
			y = 0.3;
			w = 0.3375; 
			h = 0.06;
		};

		class changeBet: RRP_btn_blue {
			idc = -1;
			text = "Изменить";
			onButtonClick = "call RRPClient_slots_changeBet";
			x = 0.35;
			y = 0.38;
			w = 0.3375;
			h = 0.06;
		};
	};
};