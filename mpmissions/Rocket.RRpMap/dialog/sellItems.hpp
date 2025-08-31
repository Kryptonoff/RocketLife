class RRPDialogSellItems {
	idd = 776655;
	name = "RRPDialogSellItems";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur; uiNamespace setVariable ['RRPDialogSellItems',_this select 0]";
	onUnload = "false call RRPClient_gui_util_blur; uiNamespace setVariable ['RRPDialogSellItems',nil] ";

    class controlsBackground
	{
		class backgrnd: RRP_background_fade
		{
			idc = -1;
            x = 0;
            y = 0;
            w = 1;
            h = 1;
		};
	};

    class Controls
	{
        class lb_items: RRP_RscListBoxBigTiles_vInv
        {
			fade = 1;
            idc = 1500;
            x = 0.025;
            y = 0.06;
            w = 0.5125;
            h = 0.9;
        };
		class welcome: RRP_RscStructuredText
		{
			idc = 1555;
			x = 0.025;
			y = 0.2;
			w = 0.425;
			h = 0.08;
		};
        class title: RRP_title
        {
            idc = 1201;
            text = "Продажа вещей";
            x = 0;
            y = 0;
            w = 0.975;
            h = 0.04;
        };
        class exit: RRP_btn_exit_text
        {
            idc = -1;
            x = 0.975;
            y = 0;
            w = 0.025;
            h = 0.04;
        };
        class sell: RRP_btn_blue
        {
            idc = 23234;
			text = "Продать";
			onButtonClick = "'one' spawn RRPClient_sellItems_sellAction;";
            x = 0.575;
            y = 0.81;
            w = 0.3875;
            h = 0.06;
        };
        class frame_select_car: RscFrame
        {
            idc = -1;
			text = "Выберите инвентарь";
			sizeEx = 0.03;
            x = 0.575;
            y = 0.7;
            w = 0.3875;
            h = 0.08;
        };
        class sell_all: RRP_btn_blue
        {
            idc = 23235;
			text = "Продать все";
			onButtonClick = "'all' spawn RRPClient_sellItems_sellAction;";
            x = 0.57625;
            y = 0.8796;
            w = 0.3875;
            h = 0.06;
        };
        class combo_select_car: RRP_RscCombo
        {
			onLBSelChanged = "_this call RRPClient_sellItems_onLBSelectVehicle;";
            idc = 2100;
            x = 0.5875;
            y = 0.73;
            w = 0.3625;
            h = 0.04;
        };
        class right_left_frame: RscFrame
        {
            idc = -1;
            x = 0.5625;
            y = 0.06;
            w = 0.4125;
            h = 0.9;
        };
        class descr_str_text: RRP_RscStructuredText
        {
            idc = 1203;
            text = "";
            x = 0.575;
            y = 0.08;
            w = 0.3875;
            h = 0.62;
        };
    };

}
