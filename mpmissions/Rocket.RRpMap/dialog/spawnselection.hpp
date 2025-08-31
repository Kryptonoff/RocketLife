class RRPSpawnDialog
{
	idd = 38500;
	name = "RRPSpawnDialog";
	movingenable = 0;
	enablesimulation = 1;	
	onLoad = "uiNamespace setVariable ['RRPSpawnDialog',_this#0]";
	onUnload = "uiNamespace setVariable ['RRPSpawnDialog',displayNull]";
	
	class controlsBackground
	{
		class background: RRP_background
		{
			idc = 1000;
			x = 0.077187 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.572 * safezoneH;
		};
		class title: RscText
		{
			idc = 1000;
			text = "Меню возрождения"; //--- ToDo: Localize;
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text: RscText
		{
			idc = 38501;
			text = "Точка появления";
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls 
	{
		class spawnList: RRP_RscListBox
		{
			idc = 38510;
			rowheight = 0.05;
			onlbselchanged = "_this call RRPClient_spawn_pointselected;";
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class mapCtrl: RscMapControl
		{
			idc = 38502;
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class spawnButton: RRP_btn_blue
		{
			idc = 1600;
			onbuttonclick = "[] spawn RRPClient_spawn_Confirm;";
			text = "Возродиться"; //--- ToDo: Localize;
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class RRPDialogSpawn
{
	idd = 38500;
	name = "RRPDialogSpawn";
	movingenable = 0;
	enablesimulation = 1;	
	onLoad = "uiNamespace setVariable ['RRPDialogSpawn',_this#0]";
	onUnload = "uiNamespace setVariable ['RRPDialogSpawn',displayNull]";
	
	class controlsBackground
	{
		class background: RRP_background
		{
			idc = 1000;
			x = 0.077187 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.572 * safezoneH;
		};
		class title: RscText
		{
			idc = 1000;
			text = "Меню возрождения"; //--- ToDo: Localize;
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class text: RscText
		{
			idc = 38501;
			text = "Точка появления";
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	class controls 
	{
		class spawnList: RRP_RscListBox
		{
			idc = 38510;
			rowheight = 0.05;
			onlbselchanged = "_this call RRPClient_spawn_onLbChanged;";
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class mapCtrl: RscMapControl
		{
			idc = 38502;
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class spawnButton: RRP_btn_blue
		{
			idc = 1600;
			onbuttonclick = "[] spawn RRPClient_spawn_confirmSpawn;";
			text = "Возродиться"; //--- ToDo: Localize;
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
