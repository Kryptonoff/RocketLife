class RRPWeaponStorageDialog {
	idd = 2000;
	name= "RRPWeaponStorageDialog";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPWeaponStorageDialog',_this select 0]; true call RRPClient_gui_util_blur";
	onUnload = "uiNamespace setVariable ['RRPWeaponStorageDialog',displayNull]; false call RRPClient_gui_util_blur; wpnStorageObj setVariable ['dontUse', nil, true]; wpnStorageObj = nil;";

	class controlsBackground {
	};

	class controls {
		class title: RRP_title
		{
			idc = 1200;
			text = "Оружейный склад";
			x = 0.2;
			y = 0;
			w = 0.575;
			h = 0.04;
		};
		class exit: RRP_btn_exit_text
		{
			idc = 1201;
			x = 0.775;
			y = 0;
			w = 0.025;
			h = 0.04;
		};
		class bg: RRP_background_fade
		{
			idc = 1202;
			text = "";
			x = 0.2;
			y = 0.04;
			w = 0.6;
			h = 0.76;
		};
		class str_title: RRP_RscStructuredText
		{
			idc = 1203;
			text = "";
			x = 0.225;
			y = 0.06;
			w = 0.55;
			h = 0.12;
		};
		class lb: RRP_RscListBoxBigTiles_vInv
		{
			idc = 1204;
			text = "";
			x = 0.225;
			y = 0.2;
			w = 0.55;
			h = 0.46;
		};
		class edit: RRP_RscEdit
		{
			text = "1";
			idc = 1400;
			x = 0.225;
			y = 0.7;
			w = 0.125;
			h = 0.06;
		};
		class btn: RRP_btn_blue
		{
			onButtonClick = "_this call RRPClient_wpnStorage_soldAction";
			text = "Продать";
			idc = 2400;
			x = 0.3625;
			y = 0.7;
			w = 0.4125;
			h = 0.06;
		};
	};
};
