class ToggleCtrl: ctrlControlsGroupNoScrollbars
{
	w = 0.391005 * safezoneW;
	h = 0.0220018 * safezoneH;
	class Controls
	{
		class Background: RscText
		{
			idc = 1001;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.391005 * safezoneW;
			h = 0.0220018 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class Title: AppRscStructuredText
		{
			idc = 1002;
			text = "Icon"; //--- ToDo: Localize;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.257798 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Toggler: AppToggle
		{
			idc = 1003;
			x = 0.342644 * safezoneW;
			y = 0 * safezoneH;
			w = 0.027 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class Reset: RscPicture
		{
			idc = 1004;
			text = "\a3\ui_f_curator\Data\CfgCurator\waypointCycle_ca.paa";
			x = 0.376601 * safezoneW;
			y = 0 * safezoneH;
			w = 0.0123474 * safezoneW;
			h = 0.0198016 * safezoneH;
		};
	};
};
class SliderCtrl: ctrlControlsGroupNoScrollbars
{
	w = 0.391005 * safezoneW;
	h = 0.0220018 * safezoneH;
	class Controls
	{
		class Background: RscText
		{
			idc = 1101;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.391005 * safezoneW;
			h = 0.0220018 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class Title: AppRscStructuredText
		{
			idc = 1102;
			text = "Player:"; //--- ToDo: Localize;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.176325 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class Slider: AppRscXSlider
		{
			idc = 1103;
			x = 0.17801 * safezoneW;
			y = 0 * safezoneH;
			w = 0.160871 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class ValueText: AppRscStructuredText
		{
			idc = 1104;
			text = "100"; //--- ToDo: Localize;
			x = 0.340585 * safezoneW;
			y = 0 * safezoneH;
			w = 0.0309748 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class Reset: RscPicture
		{
			idc = 1105;
			text = "\a3\ui_f_curator\Data\CfgCurator\waypointCycle_ca.paa";
			x = 0.376518 * safezoneW;
			y = 0 * safezoneH;
			w = 0.0123474 * safezoneW;
			h = 0.0198016 * safezoneH;
		};
	};
};
class DropdownCtrl: ctrlControlsGroupNoScrollbars
{
	w = 0.391005 * safezoneW;
	h = 0.0220018 * safezoneH;
	class Controls
	{
		class Background: RscText
		{
			idc = 1201;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.391005 * safezoneW;
			h = 0.0220018 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class Title: AppRscStructuredText
		{
			idc = 1202;
			text = "Icon"; //--- ToDo: Localize;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.241806 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		class Selector: AppRscCombo
		{
			idc = 1203;
			x = 0.242834 * safezoneW;
			y = 0 * safezoneH;
			w = 0.128916 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class Reset: RscPicture
		{
			idc = 1204;
			text = "\a3\ui_f_curator\Data\CfgCurator\waypointCycle_ca.paa";
			x = 0.376599 * safezoneW;
			y = 0 * safezoneH;
			w = 0.0123474 * safezoneW;
			h = 0.0198016 * safezoneH;
		};
	};
};
class SlideCtrl: ctrlControlsGroupNoScrollbars
{
	w = 0.391005 * safezoneW;
	h = 0.0220018 * safezoneH;
	class Controls
	{
		class Background: RscText
		{
			idc = 1301;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.391005 * safezoneW;
			h = 0.0220018 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class TextButton: AppRscStructuredText
		{
			idc = 1302;
			text = "Tablet"; //--- ToDo: Localize;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.391005 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
	};
};
class TitleCtrl: ctrlControlsGroupNoScrollbars
{
	w = 0.391005 * safezoneW;
	h = 0.0220018 * safezoneH;
	class Controls
	{
		class Background: RscText
		{
			idc = 1401;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.391005 * safezoneW;
			h = 0.0220018 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
		class TextButton: AppRscStructuredText
		{
			idc = 1402;
			text = "Tablet"; //--- ToDo: Localize;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.391005 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
	};
};
