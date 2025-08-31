class UnionDialogParkingCop
{
	idd = 5500;
	name = "UnionDialogParkingCop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	class controlsBackground {
		class MainBackground: RRP_background {
			idc = -1;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.154 * safezoneH;	
		};
	};
	class controls 
	{
		class Title : RRP_title {			
			idc = 5501;
			text = "";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.2475  * safezoneW;
			h = 0.044 * safezoneH;
		};

		class CloseImage : RRP_btn_exit {
			idc = -1;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_cost: RscText {
			idc = -1;
			text = "Сумма:";
			x = 0.351685 * safezoneW + safezoneX;
			y = 0.3376 * safezoneH + safezoneY;
			w = 0.0616875 * safezoneW;
			h = 0.042 * safezoneH;			
		};
		class e_cost: RRP_RscEdit {
			idc = 5502;
			text = "500";
			x = 0.418631 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.028 * safezoneH;			
		};
		class cost_message: RscText	{
			idc = -1;
			text = "Максимум: $25000";
			x = 0.49475 * safezoneW + safezoneX;
			y = 0.3376 * safezoneH + safezoneY;
			w = 0.123375 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class t_message: RscText {
			idc = -1;
			text = "Сообщение:";
			x = 0.351685 * safezoneW + safezoneX;
			y = 0.3796 * safezoneH + safezoneY;
			w = 0.0616875 * safezoneW;
			h = 0.042 * safezoneH;			
		};
		class e_Message: RRP_RscEdit {
			idc = 5503;
			text = "";  
			x = 0.418629 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.199501 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class b_send: RRP_btn_red {
			idc = -1;
			text = "Эвакуация";
			onButtonClick = "[life_vInact_curTarget] spawn RRPClient_parking_ImpoundAction;";
			x = 0.536712 * safezoneW + safezoneX;
			y = 0.42938 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};