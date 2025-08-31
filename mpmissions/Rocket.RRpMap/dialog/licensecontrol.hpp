class RRPDialog_License_Controls 
{
	idd = 6500;
	name= "RRPDialog_License_Controls";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur";
	onUnload = "false call RRPClient_gui_util_blur";
	
	class controlsBackground
	{
		class MainBackground : RRP_background {			
			idc = -1;
			
			x = 0.31441 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.378125 * safezoneW;
			h = 0.465 * safezoneH;
		};
		
		class Text1 : RscText
		{
			idc = -1;			
			text = "Активные лицензии";
			x = 0.363194 * safezoneW + safezoneX;
			y = 0.244889 * safezoneH + safezoneY;
			w = 0.0916667 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Text2 : RscText
		{
			idc = -1;			
			text = "Неактивные лицензии";
			x = 0.542187 * safezoneW + safezoneX;
			y = 0.244889 * safezoneH + safezoneY;
			w = 0.0973958 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls 
	{
		class Title: RRP_title 
		{
			idc = 6510;
			text = "";  
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.226 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class CloseImage : RRP_btn_exit_text {
			idc = -1;
			x = 0.675312 * safezoneW + safezoneX;
			y = 0.226 * safezoneH + safezoneY;
			w = 0.0175 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ActivatedLic: RRP_RscListBox {
			idc = 6501;
			x = 0.316667 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.183333 * safezoneW;
			h = 0.385 * safezoneH;
		};

		class DisabledLic: RRP_RscListBox {
			idc = 6502;
			x = 0.505729 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.183333 * safezoneW;
			h = 0.385 * safezoneH;
		};

		class takebutton: RRP_btn_red {
			idc = -1;
			text = "Конфисковать лицензию";
			onButtonClick = "[""TAKE""] call RRPClient_system_licenseControl";
			x = 0.316667 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.183333 * safezoneW;
			h = 0.033 * safezoneH;
			
		};
		
		class putbutton: RRP_btn_green {
			idc = -1;
			text = "Выдать лицензию";
			onButtonClick = "[""PUT""] call RRPClient_system_licenseControl";
			x = 0.505729 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.183333 * safezoneW;
			h = 0.033 * safezoneH;			
		};
	};
};