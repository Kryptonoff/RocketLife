class RRPDialogSwapVehicle 
{
    idd = 2700;
    name= "RRPDialogSwapVehicle";
    movingEnable = 0;
    enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	class controlsBackground 
	{
        class bg: RRP_background 
		{
            idc = 2705;
			text  = "";
            x = 0.427808 * safezoneW + safezoneX;
            y = 0.433989 * safezoneH + safezoneY;
            w = 0.153635 * safezoneW;
            h = 0.154025 * safezoneH;
            //["0.427808 * safezoneW + safezoneX","0.433989 * safezoneH + safezoneY","0.153635 * safezoneW","0.154025 * safezoneH"]
        };
		class title: RRP_title 
		{
            idc = 2705;
			text = "Передача техники";
            x = 0.427808 * safezoneW + safezoneX;
            y = 0.400984 * safezoneH + safezoneY;
            w = 0.153635 * safezoneW;
            h = 0.0330054 * safezoneH;
            //["0.427808 * safezoneW + safezoneX","0.400984 * safezoneH + safezoneY","0.153635 * safezoneW","0.0330054 * safezoneH"]
        };
        class vehText: RRP_RscStructuredText
        {
            idc = -1;
			text = "Выберите технику";
            x = 0.432964 * safezoneW + safezoneX;
            y = 0.444991 * safezoneH + safezoneY;
            w = 0.139228 * safezoneW;
            h = 0.0220036 * safezoneH;
           //["0.432964 * safezoneW + safezoneX","0.444991 * safezoneH + safezoneY","0.139228 * safezoneW","0.0220036 * safezoneH"] 
        };
        class playerText: RRP_RscStructuredText
        {
            idc = -1;
			text = "Выберите получателя";
            x = 0.432964 * safezoneW + safezoneX;
            y = 0.488998 * safezoneH + safezoneY;
            w = 0.139228 * safezoneW;
            h = 0.0220036 * safezoneH;
            //["0.432964 * safezoneW + safezoneX","0.488998 * safezoneH + safezoneY","0.139228 * safezoneW","0.0220036 * safezoneH"]
        };
    };
    class controls 
	{
        class NearPlayers: RRP_RscCombo 
		{
            idc = 2702;
			text = "";
            x = 0.432964 * safezoneW + safezoneX;
            y = 0.511002 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.022 * safezoneH;
            //["0.432964 * safezoneW + safezoneX","0.511002 * safezoneH + safezoneY","0.139219 * safezoneW","0.022 * safezoneH"]
        };
        class NearVehicle: RRP_RscCombo
        {
            idc = 2701;
			text = "";
            x = 0.432964 * safezoneW + safezoneX;
            y = 0.466995 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.022 * safezoneH;
            //["0.432964 * safezoneW + safezoneX","0.466995 * safezoneH + safezoneY","0.139219 * safezoneW","0.022 * safezoneH"]
        };
        class GiveKey: RRP_btn_blue 
		{
            idc = 2703;
            text = "Передать";
            onButtonClick = "call RRPClient_swapVeh_vehicleGiveTo";
            x = 0.432964 * safezoneW + safezoneX;
            y = 0.544007 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.0329999 * safezoneH;
            //["0.432964 * safezoneW + safezoneX","0.544007 * safezoneH + safezoneY","0.061875 * safezoneW","0.0329999 * safezoneH"]
        };
        class textPrice : RRP_RscEdit 
		{
           idc = 2704;
           text = "Цена";
           x = 0.5 * safezoneW + safezoneX;
           y = 0.544001 * safezoneH + safezoneY;
           w = 0.0773489 * safezoneW;
           h = 0.0330054 * safezoneH;
           //["0.5 * safezoneW + safezoneX","0.544001 * safezoneH + safezoneY","0.0773489 * safezoneW","0.0330054 * safezoneH"]
		};
		class CloseImage : RRP_btn_exit {
			idc = -1;
			text = "";
			x = 0.565973 * safezoneW + safezoneX;
			y = 0.400984 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0329999 * safezoneH;
            //["0.565973 * safezoneW + safezoneX","0.400984 * safezoneH + safezoneY","0.0154688 * safezoneW","0.0329999 * safezoneH"]
		};
    };
};