class RRPDialogPunish
{
    idd = 25000;
    name = "RRPDialogPunish";
    movingEnable = 0;
  	enableSimulation = 1;
  	onLoad = "uiNamespace setVariable ['RRPDialogPunish',_this select 0]; true call RRPClient_gui_util_blur;";
    onUnload = "uiNamespace setVariable ['RRPDialogPunish',nil]; false call RRPClient_gui_util_blur;";
    class controlsBackground
    {
        
        class bg: RRP_background
        {
            idc = -1;
            x = 0.359452 * safezoneW + safezoneX;
            y = 0.335027 * safezoneH + safezoneY;
            w = 0.276249 * safezoneW;
            h = 0.329946 * safezoneH;
        };
        class title: RRP_title
        {
            idc = -1;
            text = "Наказание"; //--- ToDo: Localize;
            x = 0.359452 * safezoneW + safezoneX;
            y = 0.31303 * safezoneH + safezoneY;
            w = 0.266556 * safezoneW;
            h = 0.0219964 * safezoneH;
        };
        class exitPct: RRP_btn_exit_text
        {
            idc = -1;
            text = "X"; //--- ToDo: Localize;
            x = 0.626008 * safezoneW + safezoneX;
            y = 0.31303 * safezoneH + safezoneY;
            w = 0.00969295 * safezoneW;
            h = 0.0219964 * safezoneH;
        };
    };
    class controls
    {
        class groupText: ctrlControlsGroupNoScrollbars
        {
            idc = 25001;
            x = 0.376525 * safezoneW + safezoneX;
            y = 0.345987 * safezoneH + safezoneY;
            w = 0.23769 * safezoneW;
            h = 0.187015 * safezoneH;
            class Controls
            {
                class desc: RRP_RscStructuredText
                {
                    idc = 25002;
                    x = 0 * safezoneW;
                    y = 0 * safezoneH;
                    w = 0.236662 * safezoneW;
                    h = 0.154013 * safezoneH;
                };
            };
        };
        class edit: RRP_RscEdit
        {
            idc = 25003;
            text = "15"; //--- ToDo: Localize;
            x = 0.378838 * safezoneW + safezoneX;
            y = 0.62098 * safezoneH + safezoneY;
            w = 0.092083 * safezoneW;
            h = 0.0329946 * safezoneH;
        };
        class reasonEdit: RRP_RscEditMulti
        {
            idc = 25004;
            text = "";
            x = 0.377341 * safezoneW + safezoneX;
            y = 0.543961 * safezoneH + safezoneY;
            w = 0.236661 * safezoneW;
            h = 0.0660054 * safezoneH;
        };
        class btn: RRP_btn_blue
        {
            idc = 25005;
            text = "Наказать!"; //--- ToDo: Localize;
            x = 0.495154 * safezoneW + safezoneX;
            y = 0.62373 * safezoneH + safezoneY;
            w = 0.121162 * safezoneW;
            h = 0.0329946 * safezoneH;
        };
    };
};


class RRPDialogCW {
    idd = 1001;
    name = "RRPDialogCW";
    movingEnable = 0;
  	enableSimulation = 1;
  	onLoad = "uiNamespace setVariable ['RRPDialogCW',_this select 0]; true call RRPClient_gui_util_blur;";
    onUnload = "uiNamespace setVariable ['RRPDialogCW',nil]; false call RRPClient_gui_util_blur;";

    class controlsBackground {
      class bg : RRP_background {
          idc = -1;
          text = "";
          sizeEx = 0.035;
          x = 0.15;
          y = 0.38;
          w = 0.7;
          h = 0.38;
      };
    };
    class controls {
        class desc: RRP_RscStructuredText {
            idc = 1002;
            text = "";
            x = 0.2;
            y = 0.4;
            w = 0.6;
            h = 0.14;
        };
        class edit: RRP_RscEdit {
            idc = 1003;
            text = "0";
            sizeEx = 0.035;
            x = 0.375;
            y = 0.56;
            w = 0.225;
            h = 0.06;
        };
        class title: RRP_title {
            idc = 1004;
            text = "Исправительные работы";
            sizeEx = 0.035;
            x = 0.15;
            y = 0.32;
            w = 0.7;
            h = 0.06;
        };
        class btn: RRP_btn_blue {
            idc = 1005;
            text = "Отправить";
            x = 0.325;
            y = 0.64;
            w = 0.325;
            h = 0.065;
        };
    	class exitPct: RRP_btn_exit_text {
			 idc = -1;
			 x = 0.8;
			 y = 0.32;
			 w = 0.05;
			 h = 0.06;
    	};
    };
};
