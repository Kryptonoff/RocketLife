class RRPDialogPoliceDropMyCrimes
{	
	idd = 7900;
	name = "RRPDialogPoliceDropMyCrimes";
	onLoad = "uiNamespace setVariable ['RRPDialogPoliceDropMyCrimes',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPDialogPoliceDropMyCrimes',displayNull]; false call RRPClient_gui_util_blur;";
	class controlsBackground
	{
		class background: RRP_background
		{
			idc = -1;
			x = 0.378413 * safezoneW + safezoneX;
			y = 0.291077 * safezoneH + safezoneY;
			w = 0.243174 * safezoneW;
			h = 0.417846 * safezoneH;
		};
		class crimesTitle: RRP_title
		{
			idc = -1;
			text = "Мои преступления";  
			x = 0.378413 * safezoneW + safezoneX;
			y = 0.269085 * safezoneH + safezoneY;
			w = 0.228584 * safezoneW;
			h = 0.0219919 * safezoneH;
		};
		class Closebtn: RRP_btn_exit_text
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.606997 * safezoneW + safezoneX;
			y = 0.269085 * safezoneH + safezoneY;
			w = 0.0145904 * safezoneW;
			h = 0.0219919 * safezoneH;
		};		
	};
	class controls
	{
		class dropWbutton: RRP_btn_blue
		{
			idc = 7901;
			text = "ОПЛАТИТЬ";  
			x = 0.383276 * safezoneW + safezoneX;
			y = 0.664939 * safezoneH + safezoneY;
			w = 0.233447 * safezoneW;
			h = 0.0329878 * safezoneH;
			onButtonClick = "_this call RRPClient_police_dropMyCrime";
		};
		class crimeList: RRP_RscListBox
		{
			idc = 7902;
			x = 0.383276 * safezoneW + safezoneX;
			y = 0.423028 * safezoneH + safezoneY;
			w = 0.233447 * safezoneW;
			h = 0.230915 * safezoneH;
			onLbSelChanged = "_this call RRPClient_police_onLbSelMyCrimes";
		};
		class structText: RscStructuredText
		{
			idc = 7903;
			text = "Здесь вы можете увидеть список своих преступлений, погасить можно только легкие нарушения!";  
			x = 0.383276 * safezoneW + safezoneX;
			y = 0.302073 * safezoneH + safezoneY;
			w = 0.233447 * safezoneW;
			h = 0.109959 * safezoneH;
		};
	};
};
