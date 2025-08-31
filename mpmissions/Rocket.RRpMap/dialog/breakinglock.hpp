class RRPbreakinglock
{
	idd = 228;
	name="";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['RRPbreakinglock',_this select 0]; true call RRPClient_gui_util_ShoworHideHUD; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPbreakinglock',displayNull]; false call RRPClient_gui_util_ShoworHideHUD; false call RRPClient_gui_util_blur;";

	class controlsBackground {};
	class controls {};
};
