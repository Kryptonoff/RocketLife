class BottomNotification
{
	idd=24900;
	movingEnable=0;
	fadein=1;
	duration = 4;
	fadeout=1;
	name="BottomNotification";
	onLoad="uiNamespace setVariable ['BottomNotification',_this select 0]";
	onUnload = "uiNamespace setVariable ['BottomNotification', objNull]";
	onDestroy = "uiNamespace setVariable ['BottomNotification', objNull]";
	objects[]={};

	class controls
	{
		class message: RscStructuredText
		{
			idc = 24901;
			text = ""; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.0792 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0.188,0.188,0.212,0.75};
		};
		class tile: RscText
		{
			idc = 24902;
			text = ""; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.76378 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.011 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0.188,0.188,0.212,0.75};
		};		
	};   
};
class playerHUD
{
	idd=-1;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	onUnload = "uiNamespace setVariable ['playerHUD', objNull]";
	onDestroy = "uiNamespace setVariable ['playerHUD', objNull]";
	objects[]={};

	class controls
	{
		class runIcon: RscPictureKeepAspect
		{
			idc = 2401;
			text = "\rimas_gui\data\ui\cross.paa";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class steminaPrg: RscProgress
		{
			idc = 2402;
			x = 0.0343906 * safezoneW + safezoneX;
			y = 0.92064 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBar[] = {1,1,1,1};
			sizeEx = 1 * GUI_GRID_H;
		};
		class hungerPic: RscPictureKeepAspect
		{
			idc = 2403;
			text = "\rimas_gui\data\ui\hunger_ca.paa";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorText[] = {1,1,1,1};
			blinkingPeriod = 0.75;
		};
		class thirstPic: RscPictureKeepAspect
		{
			idc = 2404;
			text = "\rimas_gui\data\ui\thirst_ca.paa";
			x = 0.87125 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorText[] = {1,1,1,1};
			blinkingPeriod = 0.75;
		};
		class healPic: RscPictureKeepAspect
		{
			idc = 2405;
			text = "\rimas_gui\data\ui\heal.paa";
			x = 0.956328 * safezoneW + safezoneX;
			y = 0.90106 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class hpText: RscText
		{
			idc = 2406;
			text = "";
			x = 0.950115 * safezoneW + safezoneX;
			y = 0.938204 * safezoneH + safezoneY;
			w = 0.0412476 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 2408;
			text = "Rimas RP";
			x = 0.0101843 * safezoneW + safezoneX;
			y = 0.961962 * safezoneH + safezoneY;
			w = 0.309357 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
	};
};
class ExtremoNotification
{
	idd=24500;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="ExtremoNotification";
	onLoad="uiNamespace setVariable ['ExtremoNotification',_this select 0]";
	onUnload = "uiNamespace setVariable ['ExtremoNotification', objNull]";
	onDestroy = "uiNamespace setVariable ['ExtremoNotification', objNull]";
	objects[]={};

	class controls
	{
		class message1: RscStructuredText
		{
			idc = 24501;
			text = "";
			x = 0.680491 * safezoneW + safezoneX;
			y = 0.8521 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class message2: message1
		{
			idc = 24502;
			y = 0.814691 * safezoneH + safezoneY;
		};
		class message3: message1
		{
			idc = 24503;
			y = 0.777279 * safezoneH + safezoneY;
		};
		class message4: message1
		{
			idc = 24504;
			y = 0.739868 * safezoneH + safezoneY;
		};
		class message5: message1
		{
			idc = 24505;
			y = 0.70466 * safezoneH + safezoneY;
		};
	};
};

class ExtremoBuffs
{
	idd=24600;
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	name="ExtremoBuffs";
	onLoad="uiNamespace setVariable ['ExtremoBuffs',_this select 0]";
	onUnload = "uiNamespace setVariable ['ExtremoBuffs', objNull]";
	onDestroy = "uiNamespace setVariable ['ExtremoBuffs', objNull]";
	objects[]={};

	class controls
	{
		class debuff1_icon_r: RscPictureKeepAspect {
			idc = 24601;
			text = "";
			x = 0.855761 * safezoneW + safezoneX;
			y = 0.889512 * safezoneH + safezoneY;
			w = 0.0209988 * safezoneW;
			h = 0.0392112 * safezoneH;
			colorBackground[] = {1,1,1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class debuff1_icon: debuff1_icon_r
		{
			idc = 24601+10;
		};
		class debuff1_time: RscText
		{
			idc = 24601+20;
			text = "";
			x = 0.855761 * safezoneW + safezoneX;
			y = 0.865305 * safezoneH + safezoneY;
			w = 0.0218424 * safezoneW;
			h = 0.0206059 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
			style = 2;
		};
		class debuff2_icon_r: debuff1_icon_r {
			idc = 24602;
			x = 0.832043 * safezoneW + safezoneX;
		};
		class debuff2_icon: debuff2_icon_r
		{
			idc = 24602+10;
		};
		class debuff2_time: debuff1_time
		{
			idc = 24602+20;
			x = 0.832043 * safezoneW + safezoneX;
		};
		class debuff3_icon_r: debuff1_icon_r {
			idc = 24603;
			x = 0.808326 * safezoneW + safezoneX;
		};
		class debuff3_icon: debuff3_icon_r
		{
			idc = 24603 + 10;
		};
		class debuff3_time: debuff1_time
		{
			idc = 24603 + 20;
			x = 0.808323 * safezoneW + safezoneX;
		};
		class debuff4_icon_r: debuff1_icon_r {
			idc = 24604;
			x = 0.784609 * safezoneW + safezoneX;
		};
		class debuff4_icon: debuff4_icon_r
		{
			idc = 24604 + 10;
		};
		class debuff4_time: debuff1_time
		{
			idc = 24604 + 20;
			x = 0.784606 * safezoneW + safezoneX;
		};
		class debuff5_icon_r: debuff1_icon_r {
			idc = 24605;
			x = 0.760891 * safezoneW + safezoneX;
		};
		class debuff5_icon: debuff5_icon_r
		{
			idc = 24605 + 10;
		};
		class debuff5_time: debuff1_time
		{
			idc = 24605 + 20;
			x = 0.760891 * safezoneW + safezoneX;
		};

		//buffs
		class buff1_icon_r: RscPictureKeepAspect {
			idc = 24701;
			text = "";
			x = 0.855759 * safezoneW + safezoneX;
			y = 0.931327 * safezoneH + safezoneY;
			w = 0.0209988 * safezoneW;
			h = 0.0392112 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class buff1_icon: buff1_icon_r
		{
			idc = 24701 + 10;
		};
		class buff1_time: RscText
		{
			idc = 24701 + 20;
			text = "";
			x = 0.855759 * safezoneW + safezoneX;
			y = 0.973139 * safezoneH + safezoneY;
			w = 0.0208111 * safezoneW;
			h = 0.0206059 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
			style = 2;
		};

		class buff2_icon_r: buff1_icon_r {
			idc = 24702;
			x = 0.832041 * safezoneW + safezoneX;
		};
		class buff2_icon: buff2_icon_r
		{
			idc = 24702 + 10;
		};
		class buff2_time: buff1_time
		{
			idc = 24702 + 20;
			x = 0.832041 * safezoneW + safezoneX;
		};

		class buff3_icon_r: buff1_icon_r {
			idc = 24703;
			x = 0.808324 * safezoneW + safezoneX;
		};
		class buff3_icon: buff3_icon_r
		{
			idc = 24703 + 10;
		};
		class buff3_time: buff1_time
		{
			idc = 24703 + 20;
			x = 0.808323 * safezoneW + safezoneX;
		};

		class buff4_icon_r: buff1_icon_r {
			idc = 24704;
			x = 0.783575 * safezoneW + safezoneX;
		};
		class buff4_icon: buff4_icon_r
		{
			idc = 24704 + 10;
		};
		class buff4_time: buff1_time
		{
			idc = 24704 + 20;
			x = 0.784606 * safezoneW + safezoneX;
		};

		class buff5_icon_r: buff1_icon_r {
			idc = 24705;
			x = 0.760891 * safezoneW + safezoneX;
		};
		class buff5_icon: buff5_icon_r
		{
			idc = 24705 + 10;
		};
		class buff5_time: buff1_time
		{
			idc = 24705 + 20;
			x = 0.760888 * safezoneW + safezoneX;
		};
	};
};
class HintsKeyboard
{
	idd=19931;
	name="HintsKeyboard";
	movingEnable=0;
  	fadein=0;
	duration = 10e10;
  	fadeout=0;
	onLoad="uiNamespace setVariable ['HintsKeyboard', _this select 0];";
	onUnload="uiNamespace setVariable ['HintsKeyboard', displayNull];";
	onDestroy="uiNamespace setVariable ['HintsKeyboard', displayNull];";
	class controls
	{
		class bcg: ctrlControlsGroupNoScrollbars
		{
			idc=19930;
			x="(((safeZoneX + safeZoneW) ) - 	0 * (pixelW * pixelGrid * 0.50) - 	((1920 / 4.5)) * (pixelW * pixelGrid * 0.50) + 	((1920 / 4.5)) * (0 + (1602 / 4.5) / (1920 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - ((	((1080 / 4.5)) / 2 + 	0 * 2) - (	((1080 / 4.5)) * (0 + (231 / 4.5) / (1080 / 4.5)) + 	0)) * (pixelH * pixelGrid * 0.50))";
			w="((	((1920 / 4.5)) * (0 + (300 / 4.5) / (1920 / 4.5))) * (pixelW * pixelGrid * 0.50))";
			h="((	((1080 / 4.5)) * (0 + (600 / 4.5) / (1080 / 4.5))) * (pixelH * pixelGrid * 0.50))";
		};
	};
};
