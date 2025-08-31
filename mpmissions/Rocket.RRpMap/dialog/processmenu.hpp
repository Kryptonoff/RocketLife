class ProcessingDialog {
	idd = 1999;
	name= "ProcessingDialog";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad="uiNamespace setVariable ['ProcessingDialog',_this select 0]; uiNamespace setVariable ['VehINlb', []]; uiNamespace setVariable ['recipe', []]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['ProcessingDialog', displayNull];processing = nil;recipe = nil;readyRecipes = nil; false call RRPClient_gui_util_blur;";

	class controlsBackground {

		class backgrnd: RRP_background
		{
			idc = 2001;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.484 * safezoneH;
		};
	};

	class controls {
		class main_title: RRP_title
		{
			idc = 1995;
			text = "";
			x = 0.293724 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.39832 * safezoneW;
			h = 0.022 * safezoneH;
			//["0.293724 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.39832 * safezoneW","0.022 * safezoneH"]
		};

		class notification : RscStructuredText
		{
			idc = 7777;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0.0, 0.74, 0.29,1};
			text = "";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.275 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.026 * safezoneH;

		};

		class FrameAllRecipes: RscFrame
		{
			idc = 2000;
			text = "Список всех рецептов и статус готовности";
			sizeEx = 0.032;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.521 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class FrameVehicle: RscFrame
		{
			idc = -1;
			text = "Выберите для взаимодействия";
			sizeEx = 0.032;
			x = 0.298905 * safezoneW + safezoneX;
			y = 0.306 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.209 * safezoneH;
		};

		class vehicleLB: RRP_RscListBox
		{
			idc = 1991;
			onLBSelChanged = "_this spawn RRPClient_processing_takePresetsAndCreateRecipes; _this spawn RRPClient_processing_showVehicleInventory";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.328 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.176 * safezoneH;
		};
		class RecipeLB: RRP_RscListBox
		{
			idc = 1992;
			onLBSelChanged = "_this spawn RRPClient_processing_selectrecipe;";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.554 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.176 * safezoneH;
		};
		class FrameInv: RscFrame
		{
			idc = -1;
			sizeEx = 0.032;
			text = "Инвентарь";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.306 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.209 * safezoneH;
		};
		class inventoryLB: RRP_RscListBox
		{
			idc = 1993;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.328 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.176 * safezoneH;
		};
		class ExitPct: RRP_btn_exit
		{
			idc = -1;
			x = 0.690652 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
			//["0.690652 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.0154688 * safezoneW","0.022 * safezoneH"]
		};
		class button_processing: RRP_btn_green
		{
			idc = 1998;
			style="0x02";
			onButtonClick = "if ((readyRecipes select 2) isEqualTo []) then {[] spawn RRPClient_processing_actionForPlayer} else {[] spawn RRPClient_processing_Action}";
			text = "Переработать (Все)";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
			class Attributes
			{
				align="center";
			};

		};
	};
};
