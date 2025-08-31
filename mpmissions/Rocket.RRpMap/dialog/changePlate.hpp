class RRPDialogChangePlate
{
	idd = 7600;
	name= "RRPDialogChangePlate";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogChangePlate',_this #0]";
	onUnload = "false call RRPClient_gui_util_blur;";
	class controlsBackground 
	{
		class Closebtn: RRP_btn_exit
		{
			idc = -1;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class titlePlate: RRP_title
		{
			idc = -1;
			text = "Изменение номеров";  
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.3355 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class MainBackground: RRP_background
		{
			idc = -1;
			x = 0.319489 * safezoneW + safezoneX;
			y = 0.312962 * safezoneH + safezoneY;
			w = 0.361022 * safezoneW;
			h = 0.341069 * safezoneH;
		};
	};
	class controls
	{
		class carlist: RRP_RscListBox
		{
			idc = 7601;
			x = 0.329804 * safezoneW + safezoneX;
			y = 0.323964 * safezoneH + safezoneY;
			w = 0.340392 * safezoneW;
			h = 0.19804 * safezoneH;
			onLbSelChanged = "_this call RRPClient_plates_onLb";
		};
		class buyBtn: RRP_btn_green
		{
			onButtonClick = "_this call RRPClient_plates_confirm";
			idc = 7602;
			tooltip = "Стоимость изменения номера составляет 990 RCredits";
			text = "Оплатить";  
			x = 0.329804 * safezoneW + safezoneX;
			y = 0.599017 * safezoneH + safezoneY;
			w = 0.340392 * safezoneW;
			h = 0.0330067 * safezoneH;
			class Attributes{align="center";valign="middle";};
		};
		class text1: RRP_RscEdit
		{
			idc = 7603;
			text = "";
			tooltip = "Используйте только латинские буквы A-Z";
			x = 0.329804 * safezoneW + safezoneX;
			y = 0.533007 * safezoneH + safezoneY;
			w = 0.0309448 * safezoneW;
			h = 0.044009 * safezoneH;
			maxChars = 1;
		};
		class text2: RRP_RscEdit
		{
			idc = 7604;
			text = "";
			tooltip = "Используйте только латинские буквы A-Z";
			x = 0.365906 * safezoneW + safezoneX;
			y = 0.533007 * safezoneH + safezoneY;
			w = 0.0309448 * safezoneW;
			h = 0.044009 * safezoneH;
			maxChars = 1;
		};
		class number1: RRP_RscEdit
		{
			idc = 7605;
			text = "";
			tooltip = "Используйте только цифры от 0-9";
			x = 0.422638 * safezoneW + safezoneX;
			y = 0.533007 * safezoneH + safezoneY;
			w = 0.0309448 * safezoneW;
			h = 0.044009 * safezoneH;
			maxChars = 1;
		};
		class number2: RRP_RscEdit
		{
			idc = 7606;
			text = "";
			tooltip = "Используйте только цифры от 0-9";
			x = 0.463898 * safezoneW + safezoneX;
			y = 0.533007 * safezoneH + safezoneY;
			w = 0.0309448 * safezoneW;
			h = 0.044009 * safezoneH;
			maxChars = 1;
		};
		class number3: RRP_RscEdit
		{
			idc = 7607;
			text = "";
			tooltip = "Используйте только цифры от 0-9";
			x = 0.505157 * safezoneW + safezoneX;
			y = 0.533007 * safezoneH + safezoneY;
			w = 0.0309448 * safezoneW;
			h = 0.044009 * safezoneH;
			maxChars = 1;
		};
		class number4: RRP_RscEdit
		{
			idc = 7608;
			text = "";
			tooltip = "Используйте только цифры от 0-9";
			x = 0.546417 * safezoneW + safezoneX;
			y = 0.533007 * safezoneH + safezoneY;
			w = 0.0309448 * safezoneW;
			h = 0.044009 * safezoneH;
			maxChars = 1;
		};
		class text3: RRP_RscEdit
		{
			idc = 7609;
			text = "";
			tooltip = "Используйте только латинские буквы A-Z";
			x = 0.603149 * safezoneW + safezoneX;
			y = 0.533007 * safezoneH + safezoneY;
			w = 0.0309448 * safezoneW;
			h = 0.044009 * safezoneH;
			maxChars = 1;
		};
		class text4: RRP_RscEdit
		{
			idc = 7610;
			text = "";
			tooltip = "Используйте только латинские буквы A-Z";
			x = 0.639251 * safezoneW + safezoneX;
			y = 0.533007 * safezoneH + safezoneY;
			w = 0.0309448 * safezoneW;
			h = 0.044009 * safezoneH;
			maxChars = 1;
		};
	};
};