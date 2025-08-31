class RRPDialogAddDocs
{
    idd = 7700;
    name = "RRPDialogAddDocs";
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = "uiNamespace setVariable ['RRPDialogAddDocs',_this select 0]; true call RRPClient_gui_util_blur;";
    onUnload = "uiNamespace setVariable ['RRPDialogAddDocs',displayNull]; false call RRPClient_gui_util_blur;";
    onDestroy = "uiNamespace setVariable ['RRPDialogAddDocs',displayNull]; false call RRPClient_gui_util_blur;";

    class controlsBackground {
        class bg: RRP_background_fade
        {
            idc = -1;
            x = 0.2625;
            y = 0.08;
            w = 0.475;
            h = 0.82;
        };
    };
    class controls {
        class title: RRP_title
        {
        	idc = -1;
        	text = "Выдача документов";
        	x = 0.2625;
        	y = 0.04;
        	w = 0.4375;
        	h = 0.04;
        };
        class exit: RRP_btn_exit_text
        {
        	idc = -1;
        	x = 0.7;
        	y = 0.04;
        	w = 0.0375;
        	h = 0.04;
        };
        class frame_doc_mod: RscFrame
        {
        	idc = -1;
            text = "Выберите назначение документа";
        	x = 0.2875;
        	y = 0.12;
        	w = 0.425;
        	h = 0.18;
        };
        class type: RRP_RscCombo
        {
        	idc = 2651;
        	text = "";
        	x = 0.3125;
        	y = 0.16;
        	w = 0.375;
        	h = 0.04;
        };
        class doc: RRP_RscCombo
        {
        	idc = 2652;
        	text = "";
        	x = 0.3125;
        	y = 0.24;
        	w = 0.375;
        	h = 0.04;
        };
        class frame_doc_body: RscFrame
        {
        	idc = -1;
            text = "Заполните заголовок и суть документа";
        	x = 0.2875;
        	y = 0.34;
        	w = 0.425;
        	h = 0.44;
        };
        class zagogolovok: RRP_RscEdit
        {
        	idc = 2653;
            text = "";
        	x = 0.3125;
        	y = 0.38;
        	w = 0.375;
        	h = 0.04;
        };
        class descr: RRP_RscEditMulti
        {
        	idc = 2654;
            text = "";
        	x = 0.3125;
        	y = 0.44;
        	w = 0.375;
        	h = 0.24;
        };

        class docDate: RRP_RscEdit
        {
            idc = 2655;
            text = "";
            x = 0.6125;
            y = 0.7;
            w = 0.075;
            h = 0.06;
        };

        class docDateText: RRP_background_fade
        {
            idc = -1;
            text = "Срок действия (в днях): ";
            x = 0.3125;
            y = 0.7;
            w = 0.2875;
            h = 0.06;
        };

        class btn_add_doc: RRP_btn_green
        {
        	idc = 2656;
            text = "Выдать документ";
        	x = 0.2875;
        	y = 0.8;
        	w = 0.425;
        	h = 0.08;
        };
    };
};
