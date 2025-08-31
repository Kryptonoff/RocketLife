class UnionDialogGovAtm {
	idd = 3900;
	name= "UnionDialogGovAtm";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		class BackGround:RRP_background {
			idc = -1;
			x = 0.3125;
			y = 0.18;
			w = 0.375;
			h = 0.36;
		};
	};
	class controls {
		class Title : RRP_title {
			idc = -1;
			text = "Казна";
			x = 0.3125;
			y = 0.18;
			w = 0.3375;
			h = 0.04;
		};
		class BankTitle : RscStructuredText
		{
			idc = 3901;
			text = "";
			
			x = 0.3125;
			y = 0.22;
			w = 0.375;
			h = 0.14;
		};
		class WithdrawButton : RRP_btn_blue 
		{
			idc = -1;
			text = "Снять";
			onButtonClick = "[""take""] call RRPClient_system_govBank";
			x = 0.325;
			y = 0.46;
			w = 0.1625;
			h = 0.06;
		};
		class DepositButton : RRP_btn_blue 
		{
			idc = -1;
			text = "Внести";
			onButtonClick = "[""add""] call RRPClient_system_govBank";
			x = 0.5125;
			y = 0.46;
			w = 0.1625;
			h = 0.06;
		};
		class moneyEdit : RRP_RscEdit {
			idc = 3902;
			text = "1";
			sizeEx = 0.030;
			x = 0.3625; 
			y = 0.38;
			w = 0.3; 
			h = 0.06;
		};
		class Close : RRP_btn_exit_text {
			idc = -1;
			x = 0.65;
			y = 0.18;
			w = 0.0375;
			h = 0.04;
		};
	};
};