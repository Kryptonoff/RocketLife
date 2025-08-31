class FatumRscDetector
{
	idd = 4382822;
	movingEnable = 1;
	enableSimulation = 1;
	enableDisplay = 1;
	duration = 10e10;
	fadein = 0;
	fadeout = 0;
	name = "FatumRscDetector";
	sizeEx = 256;
	onLoad = "uinamespace setvariable ['FatumRscDetector', _this select 0]";
	onUnLoad = "uinamespace setvariable ['FatumRscDetector', displayNull]";
	onDestroy = "uiNamespace setVariable ['FatumRscDetector', objNull]";
	objects[]={};

	class controls
	{
		class DetectorPicture
		{
			style = 48;
			type = 0;
			idc = 4382823;
			colorBackground[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			x = 0.028 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.11 * safezoneW;
			h = 0.4 * safezoneH;
			text = "";
			sizeEx = 1;
			size = 1;
		};
	};
};


class DETECTOR_DBG06M {
	idd = 7645255;
	movingEnable = true;
	enableSimulation = 1;
	enableDisplay = 1;
	duration = 10e10;
	fadein=0;
	fadeout=0;
	name = "DETECTOR_DBG06M";
	sizeEx = 256;
	onLoad = "uiNamespace setvariable ['FatumRscRadimetr', _this select 0]; uiNamespace setVariable ['DETECTOR_FIELD', (_this select 0) displayCtrl 764526]";
	onUnLoad = "uiNamespace setVariable ['FatumRscRadimetr',nil]; uiNamespace setVariable ['DETECTOR_FIELD',nil]";
	onDestroy = "uiNamespace setVariable ['FatumRscRadimetr', nil]; uiNamespace setVariable ['DETECTOR_FIELD',nil]";

	class controls {
		class Picture {
			style=48;
			type=0;
			idc=-1;
			colorBackground[]={1,1,1,1};
			colorText[]={1,1,1,1};
			font="PuristaMedium";
			x = 0.170917 * safezoneW + safezoneX;
			y = 0.688704 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.272778 * safezoneH;
			text="\fatum_item\Data\Images\Detector_DBG06M.paa";
			sizeEx = 1;
			size=1;
		};

		class Field {
			idc = 764526;
			type = 0;
			style = 0;
			lineSpacing = 1.0;
			x = 0.213427 * safezoneW + safezoneX;
			y = 0.648704 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.172778 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {0.3, 0.3, 0.3, 0.6};
			font = "PuristaMedium";
			text = "";
			sizeEx = 0.25 * 0.1;
			size = 0.8;
		};
	};
};

class DETECTOR_RKS20 {
	idd = 8645255;
	movingEnable = true;
	enableSimulation = 1;
	enableDisplay = 1;
	duration = 10e10;
	fadein=0;
	fadeout=0;
	name = "DETECTOR_RKS20";
	sizeEx = 256;
	onLoad = "uinamespace setvariable ['FatumRscRadimetr', _this select 0]; uinamespace setvariable ['DETECTOR_FIELD', (_this select 0) displayCtrl 864526]";
	onUnLoad = "uinamespace setvariable ['FatumRscRadimetr',nil]; uinamespace setvariable ['DETECTOR_FIELD',nil]";

	class controls {
		class Picture {
			style=48;
			type=0;
			idc=-1;
			colorBackground[]={1,1,1,1};
			colorText[]={1,1,1,1};
			font="PuristaMedium";
			x = 0.170917 * safezoneW + safezoneX;
			y = 0.688704 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.292778 * safezoneH;
			text="\fatum_item\Data\Images\Detector_RKS20.paa";
			sizeEx = 1;
			size=1;
		};

		class Field {
			idc = 864526;
			type = 0;
			style = 0;
			lineSpacing = 1.0;
			x = 0.203917 * safezoneW + safezoneX;
			y = 0.658704 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.172778 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {0.1, 0.1, 0.1, 0.5};
			font = "PuristaMedium";
			text = "";
			sizeEx = 0.55 * 0.1;
			size = 0.8;
		};
	};
};

class DETECTOR_MKS1009 {
	idd = 9645255;
	movingEnable = true;
	enableSimulation = 1;
	enableDisplay = 1;
	duration = 10e10;
	fadein=0;
	fadeout=0;
	name = "DETECTOR_MKS1009";
	sizeEx = 256;
	onLoad = "uinamespace setvariable ['FatumRscRadimetr', _this select 0]; uinamespace setvariable ['DETECTOR_FIELD', (_this select 0) displayCtrl 964526]";
	onUnLoad = "uinamespace setvariable ['FatumRscRadimetr',nil]; uinamespace setvariable ['DETECTOR_FIELD',nil]";

	class controls {
		class Picture {
			style=48;
			type=0;
			idc=-1;
			colorBackground[]={1,1,1,1};
			colorText[]={1,1,1,1};
			font="PuristaMedium";
			x = 0.170917 * safezoneW + safezoneX;
			y = 0.688704 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.292778 * safezoneH;
			text="\fatum_item\Data\Images\Detector_MKS1009.paa";
			sizeEx = 1;
			size=1;
		};

		class Field {
			idc = 964526;
			type = 13;
			style = 0x00;
			x = 0.175958 * safezoneW + safezoneX;
			y = 0.768704 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.172778 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
			text = "";
			size = 0.8;
			class Attributes {
			    font = "PuristaMedium";
			    color = "#698B69";
			    align = "center";
			    valign = "middle";
			    shadow = true;
			    shadowColor = "#000000";
			    size = 0.055;
			};
		};
	};
};
