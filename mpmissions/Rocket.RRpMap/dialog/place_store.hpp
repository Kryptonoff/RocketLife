class RRPDialogPlaceStore
{
	idd = 9600;
	
	name= "RRPDialogCompanyMenu";
	movingEnable = 0;
	enableSimulation = 1;
	
	onLoad = "uiNamespace setVariable ['RRPDialogPlaceStore',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogPlaceStore',displayNull]; false call RRPClient_gui_util_blur;";
	class controlsBackground
	{	
        class MainBackground: RRP_background {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.408333;
			y = safeZoneY + safeZoneH * 0.357;
			w = safeZoneW * 0.189062;
			h = safeZoneH * 0.352;
		};
	};
	class controls
	{
		class MainBackground: RRP_background
		{
			idc = -1;

			x = 0.408356 * safezoneW + safezoneX;
			y = 0.357023 * safezoneH + safezoneY;
			w = 0.189062 * safezoneW;
			h = 0.352 * safezoneH;
			
		};
		class Title: RRP_title
		{
			idc = -1;

			text = "Список магазинов";  
			x = 0.408229 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.174843 * safezoneW;
			h = 0.0229259 * safezoneH;
		};
		class CloseImage: RRP_btn_exit_text
		{
			idc = -1;
			x = 0.581979 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class PlaceablesList: RRP_RscListBox
		{
			idc = 9601;
			x = 0.416397 * safezoneW + safezoneX;
			y = 0.368022 * safezoneH + safezoneY;
			w = 0.170093 * safezoneW;
			h = 0.208966 * safezoneH;
		};
		class spawnButton: RRP_btn_blue
		{
			onButtonClick = "[] spawn RRPClient_ltd_placeables_spawn";
			idc = 9602;
			text = "Установить";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class setNameText: RscText
		{
			idc = -1;
			text = "Установите имя вашему магазину";  
			x = 0.417531 * safezoneW + safezoneX;
			y = 0.587986 * safezoneH + safezoneY;
			w = 0.170093 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
		class editNameBox: RRP_RscEdit
		{
			idc = 9604;
			text = "";
			x = 0.417531 * safezoneW + safezoneX;
			y = 0.62098 * safezoneH + safezoneY;
			w = 0.170093 * safezoneW;
			h = 0.0329946 * safezoneH;
		};
	};
};