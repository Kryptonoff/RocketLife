class RRPDialogPlaceables
{
	idd = 20000;
	name="RRPDialogPlaceables";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
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
		class Title : RRP_title {
			idc = -1;
			text = "Список объектов";
			
			x = safeZoneX + safeZoneW * 0.408322;
			y = safeZoneY + safeZoneH * 0.335;
			w = safeZoneW * 0.175313;
			h = safeZoneH * 0.022;
		};

		class Close : RRP_btn_exit_text {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.584062;
			y = safeZoneY + safeZoneH * 0.335;
			w = safeZoneW * 0.0133855;
			h = safeZoneH * 0.022;
		};
		class PlaceablesList : RRP_RscListBox {
			idc = 20001;
			text = "";
			x = safeZoneX + safeZoneW * 0.414063;
			y = safeZoneY + safeZoneH * 0.368;
			w = safeZoneW * 0.177604;
			h = safeZoneH * 0.286;
		};

		class spawnButton : RRP_btn_blue {
			idc = -1;
			text = "Установить";
			onButtonClick = "[] spawn RRPClient_placeables_Spawn";
			
			x = safeZoneX + safeZoneW * 0.414063;
			y = safeZoneY + safeZoneH * 0.665;
			w = safeZoneW * 0.0859375;
			h = safeZoneH * 0.033;
		};
		
		class deleteAllButton : RRP_btn_red {
			idc = -1;
			text = "Удалить всё";
			onButtonClick = "call RRPClient_placeables_RemoveAll";
			
			x = safeZoneX + safeZoneW * 0.505729;
			y = safeZoneY + safeZoneH * 0.665;
			w = safeZoneW * 0.0859375;
			h = safeZoneH * 0.033;
		};
	};
};
