class partymeat {
	idd = 9465;
	name= "RRPDialogPartyMeat";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable ['RRPDialogPartyMeat',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogPartyMeat',displayNull]; false call RRPClient_gui_util_blur;";

    class controlsBackground
    {
        class backgrnd: RRP_background
        {
            idc = -1;
            x = 0.0500001;
            y = 0.0199999;
            w = 0.9;
            h = 0.9;
            //[0.0500001,0.0199999,0.9,0.9]
        };
    };
    class Controls {
        class RscStructuredText: RRP_RscStructuredText
        {
            idc = 94650;
            text = "";
            x = 0.1375;
            y = 0.08;
            w = 0.725;
            h = 0.72;
            //[0.1375,0.08,0.725,0.72]
        };
        class edit: RRP_RscEdit
        {
            idc = 94651;
            text = "0";
            x = 0.1375;
            y = 0.82;
            w = 0.15;
            h = 0.06;
            //[0.1375,0.82,0.15,0.06]
        };
        class btn_start: RRP_btn_green
        {
            idc = 94652;
            text = "На вечеринку!";
            onMouseButtonClick="[] spawn RRPCLient_partymeat_initAction";
            x = 0.3;
            y = 0.82;
            w = 0.5625;
            h = 0.06;
            //[0.3,0.82,0.5625,0.06]
        };
    };
};
