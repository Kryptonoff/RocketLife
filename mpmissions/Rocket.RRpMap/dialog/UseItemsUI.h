class RRPDialogBuffs
{
	idd = 0001;
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=0;
	fadein=0;
	duration = 999999999999999999999999;
	onLoad = "uiNamespace setVariable ['RRPDialogBuffs',_this select 0];";
	onUnload = "uiNamespace setVariable ['RRPDialogBuffs',displayNull];";

	class controlsBackground {};
	class controls {};
	
};