class RRPDialogRadio
{
	class controlsBackground
	{
		class Title: RRP_title
		{
			idc = -1;

			text = "Radio Manager"; //--- ToDo: Localize;
			x = 0.1875;
			y = 0.06;
			w = 0.5875;
			h = 0.04;
		};
		class MainBackGround: RRP_background_fade
		{
			idc = -1;

			x = 0.1875;
			y = 0.1;
			w = 0.625;
			h = 0.68;
		};
		class BtnClose: RRP_btn_exit
		{
			onButtonClick = "closeDialog 0";

			idc = 1700;
			x = 0.775;
			y = 0.06;
			w = 0.0375;
			h = 0.04;
		};

	};
	class controls
	{
		class volume: RRP_RscXSliderH
		{
			idc = 2501;
			x = 0.4875;
			y = 0.28;
			w = 0.3125;
			h = 0.06;
		};
		class vehicleList: RscListBox
		{
			idc = 2502;
			onLBSelChanged = "['onLbSelChanged',_this] call RRPClient_chopShop_action";

			x = 0.2;
			y = 0.12;
			w = 0.275;
			h = 0.64;
		};
		class Play: RRP_btn_blue
		{
			idc = 2503;
			text = "Запустить"; //--- ToDo: Localize;
			x = 0.4875;
			y = 0.12;
			w = 0.3125;
			h = 0.06;
		};
		class Stop: RRP_btn_blue
		{
			idc = 2504;
			text = "Выключить"; //--- ToDo: Localize;
			x = 0.4875;
			y = 0.2;
			w = 0.3125;
			h = 0.06;
		};
		
	};
	
};