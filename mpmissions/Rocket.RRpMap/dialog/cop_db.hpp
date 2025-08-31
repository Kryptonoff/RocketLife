////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Fairy Tale, v1.063, #Jariky)
////////////////////////////////////////////////////////
class RRPDialogPoliceDatabase
{
	idd = 7700;
	name= "RRPDialogPoliceDatabase";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogPoliceDatabase',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "call RRPClient_police_onUnload; false call RRPClient_gui_util_blur;";
	class controlsBackground
	{
		class background: RRP_background
		{
			idc = -1;
			x = 0.283387 * safezoneW + safezoneX;
			y = 0.20294 * safezoneH + safezoneY;
			w = 0.433227 * safezoneW;
			h = 0.594121 * safezoneH;
		};
		class header: RRP_title
		{
			idc = -1;
			text = "База данных";  
			x = 0.283387 * safezoneW + safezoneX;
			y = 0.20294 * safezoneH + safezoneY;
			w = 0.417754 * safezoneW;
			h = 0.0330067 * safezoneH;
		};
		class closeBtn: RRP_btn_exit
		{
			idc = -1; 
			x = 0.701141 * safezoneW + safezoneX;
			y = 0.20294 * safezoneH + safezoneY;
			w = 0.0154724 * safezoneW;
			h = 0.0330067 * safezoneH;
		};
	};
	class controls
	{
		class typeSearch: RRP_RscCombo
		{
			idc = 7701;
			x = 0.288544 * safezoneW + safezoneX;
			y = 0.246949 * safezoneH + safezoneY;
			w = 0.067047 * safezoneW;
			h = 0.0220045 * safezoneH;
			onLbSelChanged = "_this call RRPClient_police_onDropdownSelect";
		};
		class findEdit: RRP_RscEdit
		{
			idc = 7702;
			text = "";  
			x = 0.360749 * safezoneW + safezoneX;
			y = 0.246949 * safezoneH + safezoneY;
			w = 0.293975 * safezoneW;
			h = 0.0220045 * safezoneH;
		};
		class findBtn: RRP_btn_noLine
		{
			idc = 7703;
			text = "Найти";  
			x = 0.659881 * safezoneW + safezoneX;
			y = 0.246949 * safezoneH + safezoneY;
			w = 0.0515746 * safezoneW;
			h = 0.0220045 * safezoneH;
			onButtonClick = "RRPClientPoliceTypeSearch call RRPClient_police_requestSearch";
		};
		class housesFrame: RscFrame
		{
			idc = 7704;
			text = "Дома";  
			x = 0.56189 * safezoneW + safezoneX;
			y = 0.334967 * safezoneH + safezoneY;
			w = 0.149566 * safezoneW;
			h = 0.143029 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class housesList: RRP_RscListBox
		{
			idc = 7705;
			x = 0.567047 * safezoneW + safezoneX;
			y = 0.356971 * safezoneH + safezoneY;
			w = 0.139251 * safezoneW;
			h = 0.110022 * safezoneH;	
		};
		class carsFrame: RscFrame
		{
			idc = 7706;
			text = "Транспорт";  
			x = 0.56189 * safezoneW + safezoneX;
			y = 0.488997 * safezoneH + safezoneY;
			w = 0.149566 * safezoneW;
			h = 0.132027 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class carsList: RRP_RscListBox
		{
			idc = 7707;
			x = 0.567047 * safezoneW + safezoneX;
			y = 0.511003 * safezoneH + safezoneY;
			w = 0.139251 * safezoneW;
			h = 0.0990201 * safezoneH;
		};
		class citizenInformFrame: RscFrame
		{
			idc = 7708;
			text = "Информация о гражданине";  
			x = 0.2937 * safezoneW + safezoneX;
			y = 0.334967 * safezoneH + safezoneY;
			w = 0.26303 * safezoneW;
			h = 0.286058 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class citizenList: RscControlsGroup
		{
			idc = 7709;
			x = 0.298859 * safezoneW + safezoneX;
			y = 0.356971 * safezoneH + safezoneY;
			w = 0.252716 * safezoneW;
			h = 0.253051 * safezoneH;
			class Controls
			{
				class text_view : RscStructuredText
				{
					idc = 7710;
					sizeEx = 0.020;
					font = "PuristaMedium";
					text = "";
					x = 0;
					y = 0;
					w = 0.624;
					h = 1;
				};
			};
		};
		class crimesFrame: RscFrame
		{
			idc = 7711;
			text = "Преступления";  
			x = 0.293702 * safezoneW + safezoneX;
			y = 0.632027 * safezoneH + safezoneY;
			w = 0.26303 * safezoneW;
			h = 0.154031 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class crimesList: RRP_RscListBox
		{
			idc = 7712;
			x = 0.298859 * safezoneW + safezoneX;
			y = 0.654031 * safezoneH + safezoneY;
			w = 0.252716 * safezoneW;
			h = 0.121025 * safezoneH;
		};
		class punisherThis: RRP_btn_blue
		{
			idc = 7721;
			text = "Погасить";  
			x = 0.56189 * safezoneW + safezoneX;
			y = 0.742049 * safezoneH + safezoneY;
			w = 0.149566 * safezoneW;
			h = 0.044009 * safezoneH;
			onButtonClick = "'drop' call RRPClient_police_workWithCrimes";
		};
		class punishAll: RRP_btn_blue
		{
			idc = 7722;
			text = "Погасить все";  
			x = 0.56189 * safezoneW + safezoneX;
			y = 0.687038 * safezoneH + safezoneY;
			w = 0.149566 * safezoneW;
			h = 0.044009 * safezoneH;
		};
		/*
		class setActive: RRP_btn_blue
		{
			idc = 7723;
			text = "Восстановить";  
			x = 0.56189 * safezoneW + safezoneX;
			y = 0.632027 * safezoneH + safezoneY;
			w = 0.149566 * safezoneW;
			h = 0.044009 * safezoneH;
			onButtonClick = "'active' call RRPClient_police_workWithCrimes";
		};
		*/
		////////////////////////////////////////////////////////
		class hintText: RscText
		{
			idc = 7713;
			text = "ВВЕДИТЕ ДАННЫЕ В ПОЛЕ ВЫШЕ И НАЖМИТЕ 'ПОИСК'";  
			x = 0.288544 * safezoneW + safezoneX;
			y = 0.279955 * safezoneH + safezoneY;
			w = 0.422912 * safezoneW;
			h = 0.044009 * safezoneH;
		};
 
		////////////////////////////////////////////////////////
		// О машине
		////////////////////////////////////////////////////////

		class carFrame: RscFrame
		{
			idc = 7714;
			text = "О машине";  
			x = 0.288544 * safezoneW + safezoneX;
			y = 0.455991 * safezoneH + safezoneY;
			w = 0.422912 * safezoneW;
			h = 0.330067 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class carListFrame: RscFrame
		{
			idc = 7715;
			text = "Найденные машины";  
			x = 0.288544 * safezoneW + safezoneX;
			y = 0.323964 * safezoneH + safezoneY;
			w = 0.422912 * safezoneW;
			h = 0.121025 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class informControlsGroup: RscControlsGroup
		{
			idc = 7716;
			x = 0.293702 * safezoneW + safezoneX;
			y = 0.477995 * safezoneH + safezoneY;
			w = 0.412597 * safezoneW;
			h = 0.29706 * safezoneH;
			class Controls
			{
				class text_view : RscStructuredText
				{
					idc = 7717;
					sizeEx = 0.020;
					font = "PuristaMedium";
					text = "";
					x = 0;
					y = 0;
					w = 0.624;
					h = 1;
				};
			};
		};
		class carList: RRP_RscListBox
		{
			idc = 7718;
			x = 0.293701 * safezoneW + safezoneX;
			y = 0.345968 * safezoneH + safezoneY;
			w = 0.412597 * safezoneW;
			h = 0.0880179 * safezoneH;
			onLbSelChanged = "_this call RRPClient_police_onLbCarList";
		};
		////////////////////////////////////////////////////////
		// Поиск игроков в сети
		////////////////////////////////////////////////////////
		class livePlayerList: RRP_RscListBox
		{
			idc = 7719;
			x = 0.288544 * safezoneW + safezoneX;
			y = 0.334966 * safezoneH + safezoneY;
			w = 0.319763 * safezoneW;
			h = 0.440089 * safezoneH;
		};
		class lookPlayerButton: RRP_btn_blue
		{
			idc = 7720;
			text = "Показать";  
			x = 0.618622 * safezoneW + safezoneX;
			y = 0.334966 * safezoneH + safezoneY;
			w = 0.0928343 * safezoneW;
			h = 0.044009 * safezoneH;
			onButtonClick = "_this call RRPClient_police_searchNETID_request";
		};
	};
};