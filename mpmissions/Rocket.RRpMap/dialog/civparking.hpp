class UnionDialogParkingCiv
{
	idd = 5700;
	name="UnionDialogParkingCiv";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground
	{
		class MainBackground : RRP_background {			
			idc = -1;
			x = 0.276872 * safezoneW + safezoneX;
			y = 0.2172 * safezoneH + safezoneY;
			w = 0.44625 * safezoneW;
			h = 0.518 * safezoneH;
		};
	};
	
	class controls
	{
		class Title : RRP_title
		{
			idc = 5701;
			text = "Оплата штрафстоянки";
			x = 0.276872 * safezoneW + safezoneX;
			y = 0.176866 * safezoneH + safezoneY;
			w = 0.416312 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class CloseImage : RRP_btn_exit {
			idc = -1;		
			x = 0.692741 * safezoneW + safezoneX;
			y = 0.176866 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class VehicleList : RRP_RscListBox
		{
			idc = 5702;
			text = "";
			
			onLBSelChanged = "_this call RRPClient_parking_MenuLBChange";
			
			x = 0.280811 * safezoneW + safezoneX;
			y = 0.2228 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.5068 * safezoneH;
		};
		
		class vehicleInfomationList : RRP_RscStructuredText
		{
			idc = 5703;
			text = "";
			
			x = 0.468497 * safezoneW + safezoneX;
			y = 0.2228 * safezoneH + safezoneY;
			w = 0.250686 * safezoneW;
			h = 0.4704 * safezoneH;
		};	
		
		class PayForCar : RRP_btn_blue
		{
			idc = 5704;
			text = "Оплатить";
			onButtonClick = "call RRPClient_parking_Pay";
			
			x = 0.543297 * safezoneW + safezoneX;
			y = 0.68 * safezoneH + safezoneY;
			w = 0.177187 * safezoneW;
			h = 0.038 * safezoneH;
		};
	};
};