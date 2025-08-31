class AppButton: RscButtonMenu
{
	type=16;
	style="0x02";
	period=1.2;
	periodFocus=1.2;
	periodOver=1.2;
	shadow=0;
	shortcuts[]={};
	textureNoShortcut="";
	animTextureDefault="";
	animTextureDisabled="";
	animTextureFocused="";
	animTextureNormal="";
	animTextureOver="";
	animTexturePressed="";
	colorBackground[]={255,255,255,0};
	colorBackground2[]={255,255,255,0};
	colorBackgroundFocused[]={255,255,255,0};
	colorDisabled[]={1,1,1,0.25};
	colorDisabledSecondary[]={1,1,1,0.25};
	colorFocused[]=
	{
		1,1,1,1
	};
	colorFocusedSecondary[]=
	{
		1,1,1,1
	};
	colorText[]={1,1,1,1};
	color[]={1,1,1,1};
	color2[]=
	{
		1,1,1,1
	};
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	font="SFCompactDisplay";
	size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text="Text";
	colorSecondary[]={1,1,1,1};
	color2Secondary[]={1,1,1,1};
	fontSecondary="PuristaLight";
	sizeExSecondary="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	textSecondary="";
	soundClick[] = {"\rrp_ambient\sounds\tablet\button_click",0.230,1};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.090000004,
		1
	};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	tooltipColorText[]={1,1,1,1};
	class Attributes
	{
		align="center";
	};
	class AttributesImage
	{
		align="center";
		color="#E5E5E5";
		font="SFCompactDisplay";
	};
	class ShortcutPos
	{
		left=0;
		top=1;
		h=1;
		w=1;
	};
};

class backgroundMainPage: RscPicture
{
	text = "\rimas_agent\assets\tablet\background.paa";
	x = 0 * safezoneW;
	y = 0 * safezoneH;
	w = 0.402222 * safezoneW;
	h = 0.629227 * safezoneH;
	colorText[] = {0.26, 0.24, 0.31,0.6};
	colorBackground[] = {0.26, 0.24, 0.31,0.6};
};

class SlideTab
{
	x = 0.386553 * safezoneW + safezoneX;
	y = 0.178786 * safezoneH + safezoneY;
	w = 0.402222 * safezoneW;
	h = 0.629227 * safezoneH;
	deletable=1;
	fade=0;
	shadow=0;
	style=16;
	type=15;
	show="false";
	class Controls
	{
	};
	class HScrollbar: Scrollbar
	{
		show="true";
	};
	class VScrollbar: Scrollbar
	{
		show="false";
	};
};

class AppToggle: ctrlControlsGroupNoScrollbars
{
	idc=-100;
	x=0;
	y=0;
	w="256/120*1*(((safezoneW / safezoneH) min 1.2) / 40)";
	h="1*(((safezoneW / safezoneH) min 1.2) / 30)";
	onToggle = "";
	onLoad = "call RRPClient_tablet_initToggle";
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	class controls
	{
		class Fill: RscText
		{
			idc=-101;
			isDisabled=1;
			style=2096;
			colorText[]={0.1,0.1,0.1,1};
			text="\rimas_agent\assets\tablet\toggle\toggleFill.paa";
			x=0;
			y="-(256-120)/2/120*(((safezoneW / safezoneH) min 1.2) / 30)";
			w="256/120*(((safezoneW / safezoneH) min 1.2) / 40)";
			h="256/120*(((safezoneW / safezoneH) min 1.2) / 30)";
			onLoad = "call RRPClient_tablet_initControls";
		};
		class Border: Fill
		{
			isDisabled=1;
			text="\rimas_agent\assets\tablet\toggle\toggleBorder.paa";
			colorText[]={0.85000002,0.85000002,0.85000002,1};
		};
		class Ball: Border
		{
			isDisabled=1;
			colorText[]={0.85000002,0.85000002,0.85000002,1};
			text="\rimas_agent\assets\tablet\toggle\toggleBall.paa";
		};
		class Toggle: RscCheckBox
		{
			idc=-102;
			onSetFocus="";
			x=0;
			y=0;
			w="256/120*(((safezoneW / safezoneH) min 1.2) / 40)";
			h="1*(((safezoneW / safezoneH) min 1.2) / 30)";
			onLoad = "call RRPClient_tablet_initControls";
			onCheckedChanged="[ctrlParentControlsGroup (_this#0), _this#1] call RRPClient_tablet_toggle";
			textureChecked="";
			textureUnchecked="";
			textureFocusedChecked="";
			textureFocusedUnchecked="";
			textureHoverChecked="";
			textureHoverUnchecked="";
			texturePressedChecked="";
			texturePressedUnchecked="";
			color[]={1,1,1,0};
			colorBackground[]={0,0,0,0};
			colorBackgroundDisabled[]={0,0,0,0};
			colorBackgroundFocused[]={0,0,0,0};
			colorBackgroundHover[]={1,1,1,0};
			colorBackgroundPressed[]={1,1,1,0};
			colorFocused[]={0,0,0,0};
			colorHover[]={0,0,0,0};
			colorPressed[]={0,0,0,0};
		};
	};
};
class TabletButton: RRP_btn_blue
{
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	class Attributes
	{
		font = "SFProDisplay";
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
	};
	class TextPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 18) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0;
		bottom = 0;
		forceMiddle = 1;
	};
	fontSecondary = "SFProDisplay";
	animTextureDefault = "\rimas_agent\assets\tablet\buttons\button_main.paa";
	animTextureNormal = "\rimas_agent\assets\tablet\buttons\button_main.paa";
	animTextureDisabled = "\rimas_agent\assets\tablet\buttons\button_notactive.paa";
	animTextureOver = "\rimas_agent\assets\tablet\buttons\button_active.paa";
	animTextureFocused = "\rimas_agent\assets\tablet\buttons\button_active.paa";
	animTexturePressed = "\rimas_agent\assets\tablet\buttons\button_click.paa";
	soundClick[] = {"\rrp_ambient\sounds\tablet\button_click",0.230,1};
};
class MainMenuButton: TabletButton
{
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	text = "Назад"; //--- ToDo: Localize;
	x = 0.305272 * safezoneW;
	y = 0.58749 * safezoneH;
	w = 0.0928206 * safezoneW;
	h = 0.0330014 * safezoneH;
	onButtonClick = "['MainMenu',0] call RRPClient_tablet_slide";
};

class AppTabletButton: TabletButton {};
class AppRscEdit: ctrlEdit {
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	font="SFCompactText";
};
class AppRscEditMulti: AppRscEdit {
	style=16;
};
class AppRscCombo: ctrlCombo {
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	font="SFCompactText";
};
class AppRscTree: ctrlTree {
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	font="SFCompactText";
};
class AppRscListbox: ctrlListbox {
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	font="SFCompactText";
};
class AppRscListBox2: AppRscListbox {
	rowHeight = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	sizeEx = "0.85 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};
class AppRscListNbox: ctrlListNBox {
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	font="SFCompactText";
};
class AppRscStructuredText: ctrlStructuredText {
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	class Attributes
	{
		align="left";
		color="#ffffff";
		colorLink="";
		size=1;
		font="SFCompactText";
	};
};
class AppRscXListBox: ctrlXListbox {
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	font="SFCompactText";
};
class AppRscCheckBox: ctrlCheckbox2 {};
class AppRscMap: RscMapControl
{
	font="SFCompactTextBold";
	fontLabel="SFCompactText";
	fontGrid="SFCompactTextBold";
	fontUnits="SFCompactTextBold";
	fontNames="SFCompactText";
	fontInfo="SFCompactText";
	fontLevel="SFCompactTextBold";
};

class AppRscXSlider: ctrlXSliderH
{
	onMouseEnter = "[player] call RRPClient_tablet_touch";
	onMouseExit = "[player,true] call RRPClient_tablet_touch";
	color[]={228/255,235/255,241/255,0.5};
	colorActive[]={228/255,235/255,241/255,0.75};
	colorDisabled[]={1,1,1,0.25};

	arrowEmpty="\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border="\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	thumb="\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
};

class AppGroupTaxControl: ctrlControlsGroupNoScrollbars
{
	w = 0.300457 * safezoneW;
	h = 0.074806 * safezoneH;
	class Controls
	{
		class background: RscText
		{
			idc = 1002;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.300457 * safezoneW;
			h = 0.074806 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
		class icon: RscPictureKeepAspect
		{
			idc = 15100;
			text = "textures\paycheque_ca.paa";
			x = 0.00205814 * safezoneW;
			y = 0.00440046 * safezoneH;
			w = 0.0360136 * safezoneW;
			h = 0.0660054 * safezoneH;
		};
		class slider: AppRscXSlider
		{
			idc = 15101;
			x = 0.041158 * safezoneW;
			y = 0.0506036 * safezoneH;
			w = 0.2274 * safezoneW;
			h = 0.0176014 * safezoneH;
		};
		class description: AppRscStructuredText
		{
			idc = 15102;
			x = 0.0411584 * safezoneW;
			y = 0.00439987 * safezoneH;
			w = 0.257241 * safezoneW;
			h = 0.0418034 * safezoneH;
		};
		class percents: AppRscStructuredText
		{
			idc = 15103;
			x = 0.270618 * safezoneW;
			y = 0.0484034 * safezoneH;
			w = 0.0277814 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
	};
};
class AppGroupSalaryControl: ctrlControlsGroupNoScrollbars
{
	w = 0.286051 * safezoneW;
	h = 0.063805 * safezoneH;
	class Controls
	{
		class background: RscText
		{
			idc = 15299;
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.286051 * safezoneW;
			h = 0.063805 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class EnableCheckbox: AppRscCheckBox
		{
			idc = 15201;
			x = 0.268559 * safezoneW;
			y = 0.00219582 * safezoneH;
			w = 0.0154344 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		class EnableText: AppRscStructuredText
		{
			idc = 15202;
			text = "<t size='.7'>ВКЛ/ВЫКЛ</t>";
			x = 0.21814 * safezoneW;
			y = 0.004396 * safezoneH;
			w = 0.0493901 * safezoneW;
			h = 0.0176014 * safezoneH;
		};
		class RankName: AppRscStructuredText
		{
			idc = 15203;
			x = 0.00514504 * safezoneW;
			y = 0.004396 * safezoneH;
			w = 0.208879 * safezoneW;
			h = 0.0176014 * safezoneH;
		};
		class TimeText: AppRscStructuredText
		{
			idc = 15204;
			x = 0.241806 * safezoneW;
			y = 0.0307982 * safezoneH;
			w = 0.0411584 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		class TimeSlider: AppRscXSlider
		{
			idc = 15205;
			x = 0.126562 * safezoneW;
			y = 0.0329983 * safezoneH;
			w = 0.113186 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		class MoneyEdit: AppRscEdit
		{
			idc = 15206;
			text = "0";
			x = 0.0720274 * safezoneW;
			y = 0.0307982 * safezoneH;
			w = 0.051448 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
		class MoneyText: AppRscStructuredText
		{
			idc = 15207;
			text = "<t size='.9'>ЗП в $</t>";
			x = 0.00514504 * safezoneW;
			y = 0.0307982 * safezoneH;
			w = 0.0617376 * safezoneW;
			h = 0.0220018 * safezoneH;
		};
	};
};

class PerkCtrl: ctrlControlsGroupNoScrollbars
{
	w = 0.0720272 * safezoneW;
	h = 0.110009 * safezoneH;
	class Controls
	{
		class Background: RscText
		{
			idc = -1;
			w = 0.0720272 * safezoneW;
			h = 0.110009 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.2};
		};
		class Icon: RscPictureKeepAspect
		{
			idc = 101;
			text = "";
			x = 0.00102901 * safezoneW;
			y = 0.0044008 * safezoneH;
			w = 0.0689414 * safezoneW;
			h = 0.0814072 * safezoneH;
		};
		class Button: TabletButton
		{
			idc = 104;
			text = "";
			x = 0 * safezoneW;
			y = 0.0858075 * safezoneH;
			w = 0.0720273 * safezoneW;
			h = 0.024202 * safezoneH;
		};
		class PerkLevel: AppRscStructuredText
		{
			idc = 105;
			x = 0.0308688 * safezoneW;
			w = 0.0411584 * safezoneW;
			h = 0.0220018 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
		};
		 class Cover : RscText {
            idc = 103;
            colorBackground[] = { 0.06,0.06,0.06,0.9 };
            w = 0.0720272 * safezoneW;
			h = 0.110009 * safezoneH;
        };
		class Enabled: RscPictureKeepAspect
		{
			idc = 106;
			text = "\rimas_agent\assets\ok.paa";
			x = 0 * safezoneW;
			y = 0 * safezoneH;
			w = 0.0185214 * safezoneW;
			h = 0.0286024 * safezoneH;
		};
	};
};

#include <tablet_settings.hpp>