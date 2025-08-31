class party_meat_HUD
{
	idd = 946502;
	movingEnable = 0;
	enableSimulation = 1;
	fadeout=0;
	fadein=0;
	duration = 9999999;
	onLoad = "uiNamespace setVariable ['party_meat_HUD',_this select 0];";
	onUnload = "uiNamespace setVariable ['party_meat_HUD',displayNull];";

	class controlsBackground {};
	class controls {
        class HUD: RRP_RscStructuredText {
            idc = 94650;
            text = "";
            x = 0.414922 * safezoneW + safezoneX;
            y = 0.962 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.033 * safezoneH;
        };
    };

};
