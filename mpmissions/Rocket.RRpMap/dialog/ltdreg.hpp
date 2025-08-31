class UnionDialogRegisterLTD {
	idd = 7100;
	name= "UnionDialogRegisterLTD";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		
		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.368749 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.2884 * safezoneH;
		};
	};
	
	class controls {
		class Title : RRP_title {
			idc = -1;
			text = "Регистрация ООО";
			x = 0.368541 * safezoneW + safezoneX;
			y = 0.352482 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseImage : RRP_btn_exit_text {
			idc = -1;		
			x = 0.605677 * safezoneW + safezoneX;
			y = 0.35237 * safezoneH + safezoneY;
			w = 0.0185938 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class infoText: RRP_RscStructuredText
		{
			idc = 7101;			
			x = 0.374 * safezoneW + safezoneX;
			y = 0.3824 * safezoneH + safezoneY;
			w = 0.24675 * safezoneW;
			h = 0.196 * safezoneH;
		};

		class name_e: RRP_RscEdit
		{
			idc = 7102;
			text = "Название вашей компании";
			x = 0.374 * safezoneW + safezoneX;
			y = 0.5868 * safezoneH + safezoneY;
			w = 0.24675 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class regButton: RRP_btn_blue
		{
			idc = 7103;
			text = "Подать запрос";
			onButtonClick = "call RRPClient_ltd_regAction";			
			x = 0.496063 * safezoneW + safezoneX;
			y = 0.6232 * safezoneH + safezoneY;
			w = 0.124687 * safezoneW;
			h = 0.028 * safezoneH;
		};		
	};
};

class RRPDialogRegisterLtd 
{
	idd = 7100;
	name= "RRPDialogRegisterLtd";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {
		
		class MainBackground:RRP_background {			
			idc = -1;
			x = 0.368749 * safezoneW + safezoneX;
			y = 0.374 * safezoneH + safezoneY;
			w = 0.255937 * safezoneW;
			h = 0.2884 * safezoneH;
		};
	};
	
	class controls {
		class Title : RRP_title {
			idc = -1;
			text = "Регистрация компании";
			x = 0.368541 * safezoneW + safezoneX;
			y = 0.352482 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CloseImage : RRP_btn_exit_text {
			idc = -1;		
			x = 0.605677 * safezoneW + safezoneX;
			y = 0.35237 * safezoneH + safezoneY;
			w = 0.0185938 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class infoText: RRP_RscStructuredText
		{
			idc = 7101;			
			x = 0.374 * safezoneW + safezoneX;
			y = 0.3824 * safezoneH + safezoneY;
			w = 0.24675 * safezoneW;
			h = 0.196 * safezoneH;
		};

		class name_e: RRP_RscEdit
		{
			idc = 7102;
			text = "Название вашей компании";
			x = 0.374 * safezoneW + safezoneX;
			y = 0.5868 * safezoneH + safezoneY;
			w = 0.24675 * safezoneW;
			h = 0.028 * safezoneH;
		};
		
		class regButton: RRP_btn_blue
		{
			idc = 7103;
			text = "Подать запрос";
			onButtonClick = "['register','request'] call RRPClient_ltds_ltd_actions";			
			x = 0.496063 * safezoneW + safezoneX;
			y = 0.6232 * safezoneH + safezoneY;
			w = 0.124687 * safezoneW;
			h = 0.028 * safezoneH;
		};		
	};
};