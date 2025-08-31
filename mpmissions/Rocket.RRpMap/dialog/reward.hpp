class RRPDialogRewards {
	idd = 25000;
	name= "RRPDialogRewards";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable ['RRPDialogRewards',_this select 0]";
	onUnload = "uiNamespace setVariable ['RRPDialogRewards',displayNull]";
	class controls
	{
		class background: RRP_background 
		{
			idc = 25001;
			x = 0.134782 * safezoneW + safezoneX;
			y = 0.21407 * safezoneH + safezoneY;
			w = 0.745868 * safezoneW;
			h = 0.527871 * safezoneH;
		};
		class pic1: RscActiveText 
		{
			idc = 25002;
			style=48;
			x = 0.150214 * safezoneW + safezoneX;
			y = 0.489003 * safezoneH + safezoneY;
			w = 0.128598 * safezoneW;
			h = 0.230944 * safezoneH;
			text="";
			onMouseButtonClick="_this call RRPClient_lootBox_onButtonClick";
			colorActive[]={1,1,1,1};
			colorDisabled[]={1,1,1,0.69999999};
		};
		class pic2: RscActiveText 
		{
			idc = 25003;
			style=48;
			x = 0.294243 * safezoneW + safezoneX;
			y = 0.489003 * safezoneH + safezoneY;
			w = 0.128598 * safezoneW;
			h = 0.230944 * safezoneH;
			text="";
			onMouseButtonClick="_this call RRPClient_lootBox_onButtonClick";
			colorActive[]={1,1,1,1};
			colorDisabled[]={1,1,1,0.69999999};
		};
		class pic3: RscActiveText 
		{
			idc = 25004;
			style=48;
			x = 0.443417 * safezoneW + safezoneX;
			y = 0.489003 * safezoneH + safezoneY;
			w = 0.128598 * safezoneW;
			h = 0.230944 * safezoneH;
			text="";
			onMouseButtonClick="_this call RRPClient_lootBox_onButtonClick";
			colorActive[]={1,1,1,1};
			colorDisabled[]={1,1,1,0.69999999};
		};
		class pic4: RscActiveText 
		{
			idc = 25005;
			style=48;
			x = 0.592591 * safezoneW + safezoneX;
			y = 0.489003 * safezoneH + safezoneY;
			w = 0.128598 * safezoneW;
			h = 0.230944 * safezoneH;
			text="";
			onMouseButtonClick="_this call RRPClient_lootBox_onButtonClick";
			colorActive[]={1,1,1,1};
			colorDisabled[]={1,1,1,0.69999999};
		};
		class pic5: RscActiveText 
		{
			idc = 25006;
			style=48;
			x = 0.73662 * safezoneW + safezoneX;
			y = 0.489003 * safezoneH + safezoneY;
			w = 0.128598 * safezoneW;
			h = 0.230944 * safezoneH;
			text="";
			onMouseButtonClick="_this call RRPClient_lootBox_onButtonClick";
			colorActive[]={1,1,1,1};
			colorDisabled[]={1,1,1,0.69999999};
		};
		class logo: RscActiveText 
		{
			idc = 25007;
			style=48;
			tooltip = "Личный кабинет";
			x = 0.458849 * safezoneW + safezoneX;
			y = 0.0930993 * safezoneH + safezoneY;
			w = 0.102878 * safezoneW;
			h = 0.186954 * safezoneH;
			text="rimas_agent\assets\loot\imgur.paa";
			onMouseEnter="[_this select 0,1.1,0.1] call BIS_fnc_ctrlSetScale";
			onMouseExit = "[_this select 0,0.9,0.1] call BIS_fnc_ctrlSetScale";
			url="https://lk.rocket-rp.fun/login";
			colorActive[]={1,1,1,1};
			colorDisabled[]={1,1,1,0.69999999};
		};
		class inform: RRP_RscStructuredText 
		{
			idc = 25008;
			text = "";
			x = 0.299387 * safezoneW + safezoneX;
			y = 0.269056 * safezoneH + safezoneY;
			w = 0.416657 * safezoneW;
			h = 0.197952 * safezoneH;
		};
	};
};

/*
["NewDialog",1000,[[[["71.4436 * pixelGrid * pixelW","47.7707 * pixelGrid * pixelH","92.2813 * pixelGrid * pixelW","37.7137 * pixelGrid * pixelH"],"","RRP_background_101","","RRP_background",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["74.4204 * pixelGrid * pixelW","67.8847 * pixelGrid * pixelH","14.8841 * pixelGrid * pixelW","15.0855 * pixelGrid * pixelH"],"","RscText_103","","RscText",true,[],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["92.2813 * pixelGrid * pixelW","67.8848 * pixelGrid * pixelH","14.8841 * pixelGrid * pixelW","15.0855 * pixelGrid * pixelH"],"","RscText_103_0","","RscText",true,[],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["110.142 * pixelGrid * pixelW","67.8848 * pixelGrid * pixelH","14.8841 * pixelGrid * pixelW","15.0855 * pixelGrid * pixelH"],"","RscText_103_0_0","","RscText",true,[],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["128.003 * pixelGrid * pixelW","67.8848 * pixelGrid * pixelH","14.8841 * pixelGrid * pixelW","15.0855 * pixelGrid * pixelH"],"","RscText_103_0_1","","RscText",true,[],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["145.864 * pixelGrid * pixelW","67.8847 * pixelGrid * pixelH","14.8841 * pixelGrid * pixelW","15.0855 * pixelGrid * pixelH"],"","RscText_103_0_2","","RscText",true,[],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["74.4204 * pixelGrid * pixelW","50.285 * pixelGrid * pixelH","86.3277 * pixelGrid * pixelW","15.0855 * pixelGrid * pixelH"],"","RscStructuredText_109","","RscStructuredText",true,[],[-1,-1,-1,-1],[0.74,0,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]]]]
*/
