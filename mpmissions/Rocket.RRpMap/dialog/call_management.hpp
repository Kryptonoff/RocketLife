class RRPDialogDispatch {
   idd = 6930;
   name = "RRPDialogDispatch";
   movingenable = false;
   enablesimulation = true;
   onLoad = "uiNamespace setVariable ['RRPDialogDispatch',_this select 0]";
   onUnload = "uiNamespace setVariable ['RRPDialogDispatch',displayNull]";
   class controlsBackground 
   {
		class Blackout: RscText
		{
			idc = -1;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			colorBackground[] = { 0, 0, 0, 0.5 };
		};
		class Tiles: RscTiles {};
		
		class padImage : RscPicture 
		{
			idc = 2640;
			text = "";
			
			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};
		
		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; [] spawn RRPClient_pad_openMain";
			tooltip = "Вернуться в главное меню";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = "0.475161 * safezoneW + safezoneX";
			y = "0.722828 * safezoneH + safezoneY";
			w = "0.0257775 * safezoneW";
			h = "0.0439982 * safezoneH";
		};
		
		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Закрыть";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = "0.5 * safezoneW + safezoneX";
			y = "0.719991 * safezoneH + safezoneY";
			w = "0.0257775 * safezoneW";
			h = "0.0439982 * safezoneH";
		};
	};
  
   class controls
   {
	   
	   	class Title : RscTitle
		{   
			idc = -1;
			x = safeZoneX + safeZoneW * 0.30875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.3825;
			h = safeZoneH * 0.02333334;
			colorText[] = {0.95,0.95,0.95,1};
			colorBackground[] = {1,1,1,0};
			style = 0 + 2;
			text = "Блок управления вызовами";
		};
	   
	   
       //class requests : Life_RscListbox
	   class requests : RscListbox
	   {
			idc = 6943;
			x = safeZoneX + safeZoneW * 0.309375;
			y = safeZoneY + safeZoneH * 0.28888889;
			w = safeZoneW * 0.20375;
			h = safeZoneH * 0.23111112;
			onLbSelChanged = "[] spawn RRPClient_dispatch_lbChangedCallsMenu";
		};
	   
	   class mapcontrol : RscMapControl
       {
           idc = 6944;
			x = safeZoneX + safeZoneW * 0.515;
			y = safeZoneY + safeZoneH * 0.29;
			w = safeZoneW * 0.17625;
			h = safeZoneH * 0.26333334;
           maxsatellitealpha = 0.75;
           alphafadestartscale = 1.15;
           alphafadeendscale = 1.29;
       };
	   
        //class Life_RscEdit_1400 : Life_RscEdit
	    class Life_RscEdit_1400 : RscEdit
       {
            idc = 6945;
			text = "";
			x = safeZoneX + safeZoneW * 0.469375;
			y = safeZoneY + safeZoneH * 0.60555556;
			w = safeZoneW * 0.221875;
			h = safeZoneH * 0.07555556;
		   
		   
       };
       //class Life_RscCheckbox_2800 : Life_Checkbox
	   class Life_RscCheckbox_2800 : RscCheckBox
       {
			idc = 6946;
			x = safeZoneX + safeZoneW * 0.605;
			y = safeZoneY + safeZoneH * 0.56777778;
			w = safeZoneW * 0.014375;
			h = safeZoneH * 0.02666667;
       };
      // class Life_RscCombo_2100 : Life_RscCombo
	   class Life_RscCombo_2100 : RscCombo
       {
			idc = 6947;
			x = safeZoneX + safeZoneW * 0.469375;
			y = safeZoneY + safeZoneH * 0.56666667;
			w = safeZoneW * 0.12875;
			h = safeZoneH * 0.02666667;
			onlbselchanged = "[] spawn RRPClient_dispatch_lbChangedMessage;";	
		};
       //class time_input : Life_RscText
	   class time_input : RscText
       {
			idc = 6948;
			x = safeZoneX + safeZoneW * 0.3875;
			y = safeZoneY + safeZoneH * 0.69111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "";
			colorBackground[] = {0.902,0.902,0.302,0};
			colorText[] = {1,1,1,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
       };
      // class distance_input : Life_RscText
	   class distance_input : RscText
       {
			idc = 6949;
			x = safeZoneX + safeZoneW * 0.3875;
			y = safeZoneY + safeZoneH * 0.66111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "";
			colorBackground[] = {1,1,0.302,0};
			colorText[] = {1,1,1,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
       };
       //class dispatch_input : Life_RscText
	   class dispatch_input : RscText
       {
			idc = 6950;
			x = safeZoneX + safeZoneW * 0.3875;
			y = safeZoneY + safeZoneH * 0.63111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "";
			colorBackground[] = {0.902,0.902,0.302,0};
			colorText[] = {1,1,1,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
       };
       //class name_input : Life_RscText
	   class name_input : RscText
       {
			idc = 6951;
			x = safeZoneX + safeZoneW * 0.3875;
			y = safeZoneY + safeZoneH * 0.57111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "";
			colorBackground[] = {1,1,0.302,0};
			colorText[] = {1,1,1,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
       };
       //class position_input : Life_RscText
	   class position_input : RscText
       {
			idc = 6952;
			x = safeZoneX + safeZoneW * 0.3875;
			y = safeZoneY + safeZoneH * 0.60111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "";
			colorBackground[] = {0.902,0.902,0.302,0};
			colorText[] = {1,1,1,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		   
		   
       };
       //class Picture_Position_Button : Life_RscButton
	   class Picture_Position_Button : RscButton
       {
           idc = 6953;
           x = 0.476264333333333 * safezoneW + safezoneX;
           y = 0.587882812192723 * safezoneH + safezoneY;
           w = 0.012375 * safezoneW;
           h = 0.022 * safezoneH;
           onbuttonclick = "";
           type = 1;
           access = 0;
           colorshadow[] = {0,0,0,0};
           color[] = {1,1,1,1};
           coloractive[] = {1,1,1,1};
           colorbackground[] = {0,0,0,0};
           colorbackgroundfocused[] = {1,1,1,0};
           style = 48 + 0x800;
           colorselectedbg[] = {1,1,1,0};
           text = "";
       };
       //class accept_call : Life_RscButtonMenu
	   class accept_call : RscButtonUC
       {
           idc = 6954;
           text = "Принять";
		   x = safeZoneX + safeZoneW * 0.42875;
		   y = safeZoneY + safeZoneH * 0.52444445;
		   w = safeZoneW * 0.03875;
		   h = safeZoneH * 0.02888889;
           onbuttonclick = "[] spawn RRPClient_dispatch_acceptCall;";
       };
       //class delete_call : Life_RscButtonMenu
	   class delete_call : RscButtonUC
	   
	   	{
			idc = 6955;
			x = safeZoneX + safeZoneW * 0.47;
			y = safeZoneY + safeZoneH * 0.52444445;
			w = safeZoneW * 0.0425;
			h = safeZoneH * 0.02888889;
			text = "Удалить";
			onButtonClick = "[] spawn RRPClient_dispatch_deleteCall";
		};
	   class assignTo : RscCombo
       {
           idc = 6956;
			x = safeZoneX + safeZoneW * 0.309375;
			y = safeZoneY + safeZoneH * 0.52444445;
			w = safeZoneW * 0.118125;
			h = safeZoneH * 0.02888889;
       };
	   
	   
	   
		class name_tite_copy1
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3125;
			y = safeZoneY + safeZoneH * 0.57111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Имя:";
			colorBackground[] = {1,1,0.302,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
	    class koordinates_title
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3125;
			y = safeZoneY + safeZoneH * 0.60111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Координаты:";
			colorBackground[] = {0.902,0.902,0.302,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class zakreplen_za_title
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3125;
			y = safeZoneY + safeZoneH * 0.63111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Закреплен за:";
			colorBackground[] = {0.902,0.902,0.302,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class rastoyanie_title
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3125;
			y = safeZoneY + safeZoneH * 0.66111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Растояние:";
			colorBackground[] = {1,1,0.302,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class ojidanie_title
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3125;
			y = safeZoneY + safeZoneH * 0.69111112;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02555556;
			style = 0;
			text = "Ожидание:";
			colorBackground[] = {0.902,0.902,0.302,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		}; 
		
		class name_tite
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.62375;
			y = safeZoneY + safeZoneH * 0.56777778;
			w = safeZoneW * 0.061875;
			h = safeZoneH * 0.02333334;
			style = 0;
			text = "Координаты";
			colorBackground[] = {1,1,0.302,0};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensed";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
		
		class otpravit_msg : RscButtonUC
		{
			idc = 6942;
			x = safeZoneX + safeZoneW * 0.5825;
			y = safeZoneY + safeZoneH * 0.68333334;
			w = safeZoneW * 0.108125;
			h = safeZoneH * 0.03111112;
			text = "Отправить";
			onbuttonclick = "[] spawn RRPClient_dispatch_sendMessageManagement;";
			
		};
		
	    class show_call : RscButtonUC
       {
           idc = 6940;
           text = "Посмотреть сообщ.";
           x = 0.302282666666666 * safezoneW + safezoneX;
           y = 0.723294449360864 * safezoneH + safezoneY;
           w = 0.184215166666667 * safezoneW;
           h = 0.0264 * safezoneH;
       };
		
   };
  
};