class RRPDialogAtm {
	idd = 2700;
	name= "RRPDialogAtm";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogAtm',_this select 0]; \
				true call RRPClient_gui_util_blur";
	onUnload = "uiNamespace setVariable ['RRPDialogAtm',displayNull]; \
				false call RRPClient_gui_util_blur";
	
	class controlsBackground {
		class padImage : RscPicture {
			idc = 2702;
			text = "\rimas_pad\atm_skins\atm_sc.paa";
			
			x = -0.0999998;
			y = -0.24;
			w = 1.2125;
			h = 1.46;
		};
		
		class balancebg: RscText
		{
			idc = 2703;
			x = 0.087499;
			y = 0.26;
			w = 0.3875;
			h = 0.28;
			colorBackground[] = {0,0,0,0.8};
		};
		class sendbg: RscText
		{
			idc = 2704;
			x = 0.487501;
			y = 0.26;
			w = 0.4375;
			h = 0.54;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls {
		
		class Title : RscTitle {			
			idc = 2705;
			text = "Управление финансами";
			x = 0.087499;
			y = 0.18;
			w = 0.837499;
			h = 0.06;
			colorBackground[] = {0,0,0,0.8};
		};

		class CashInfo : RscStructuredText
		{
			idc = 2706;
			text = "";
			
			x = 0.100001;
			y = 0.28;
			w = 0.362501;
			h = 0.18;
		};		
				
		class WithdrawButton : RscButtonUC 
		{
			idc = 2707;
			text = "Снять";			
			onButtonClick = "['withdraw'] call RRPClient_atm_actions";
			
			x = 0.087499;
			y = 0.56;
			w = 0.1875;
			h = 0.06;
		};
		
		class DepositButton : RscButtonUC 
		{
			idc = 2708;
			text = "Положить";			
			onButtonClick = "['deposit'] call RRPClient_atm_actions";
			
			x = 0.2875;
			y = 0.56;
			w = 0.1875;
			h = 0.06;
		};
		
		class moneyEdit : RscEdit {		
			idc = 2709;
			text = "1";
		
			x = 0.100001;
			y = 0.48;
			w = 0.362501;
			h = 0.04;
		
		};
		
		class PlayerList : RscListBox 
		{
			idc = 2710;
			x = 0.5;
			y = 0.28;
			w = 0.412501;
			h = 0.42;
		};

		class SendMoneyEdit : RscEdit {		
			idc = 2711;
			text = "1";
		
			x = 0.5;
			y = 0.72;
			w = 0.1625;
			h = 0.06;
		};
		
		class TransferButton : RscButtonUC 
		{
			idc = 2712;
			text = "Перевести";			
			onButtonClick = "['transfer'] call RRPClient_atm_actions";
			
			x = 0.675;
			y = 0.72;
			w = 0.2375;
			h = 0.06;
		};
		class GangWithdraw: RscButtonUC
		{
			idc = 2713;
			onButtonClick = "['orgWithdraw'] call RRPClient_atm_actions";
			//[0.2875,0.64,0.1875,0.06]
			text = "С счета орг."; //--- ToDo: Localize;
			x = 0.2875;
			y = 0.64;
			w = 0.1875;
			h = 0.06;
		};
		class GangDeposit: RscButton
		{
			idc = 2715;
			onButtonClick = "['orgDeposit'] call RRPClient_atm_actions";
			//[0.0875,0.64,0.1875,0.06]
			text = "На счет орг."; //--- ToDo: Localize;
			x = 0.0875;
			y = 0.64;
			w = 0.1875;
			h = 0.06;
		};
		
		class CloseButtonKey : RscButtonUC {
			idc = 2714;
			text = "Закрыть";
			onButtonClick = "closeDialog 0;";			
			
			x = 0.087499;
			y = 0.72;
			w = 0.3875;
			h = 0.08;
		};
	};
};