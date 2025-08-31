class RRPDialogSalary
{
	idd = 26800;
	onLoad = "uiNamespace setVariable ['RRPDialogSalary',_this#0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogSalary',displayNull]; false call RRPClient_gui_util_blur;";
	class controlsBackground
	{
		class background: RRP_background
		{
			idc = -1;
			x = 0.413166 * safezoneW + safezoneX;
			y = 0.313046 * safezoneH + safezoneY;
			w = 0.173668 * safezoneW;
			h = 0.362911 * safezoneH;
		};
		class title: RRP_title
		{
			idc = -1;
			text = "Зарплаты";
			x = 0.413375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.157812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Close: RRP_btn_exit_text
		{
			idc = -1;
			x = 0.571156 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0158594 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls
	{
		class text: RRP_RscStructuredText
		{
			idc = 26799;
			x = 0.41799 * safezoneW + safezoneX;
			y = 0.324043 * safezoneH + safezoneY;
			w = 0.16402 * safezoneW;
			h = 0.28593 * safezoneH;
			text = "";
		};
		class take: RRP_btn_green
		{
			idc = 26798;
			text = "Получить зарплату";
			x = 0.41799 * safezoneW + safezoneX;
			y = 0.62097 * safezoneH + safezoneY;
			w = 0.16402 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[2] call RRPClient_salary_actions";
		};
	};
};
