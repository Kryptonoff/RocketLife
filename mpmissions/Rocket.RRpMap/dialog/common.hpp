#include "\a3\ui_f\hpp\definecommongrids.inc"
#include "gridCommon.inc"

import RscTree;
import RscEditMulti;
import Scrollbar;
class ctrlDefault
{
	access=0;
	idc=-1;
	style=0;
	default=0;
	show=1;
	fade=0;
	blinkingPeriod=0;
	deletable=0;
	x=0;
	y=0;
	w=0;
	h=0;
	tooltip="";
	tooltipMaxWidth=0.5;
	tooltipColorShade[]={0,0,0,1};
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={0,0,0,0};
	class ScrollBar
	{
		width=0;
		height=0;
		scrollSpeed=0.059999999;
		arrowEmpty="\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull="\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border="\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb="\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[]={1,1,1,1};
	};
};
class ctrlDefaultText: ctrlDefault
{
	sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	font="RobotoCondensedLight";
	shadow=1;
};
class ctrlDefaultButton: ctrlDefaultText
{
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.090000004,
		1
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.090000004,
		1
	};
};
class ctrlStatic: ctrlDefaultText
{
	type=0;
	colorBackground[]={0,0,0,0};
	text="";
	lineSpacing=1;
	fixedWidth=0;
	colorText[]={1,1,1,1};
	colorShadow[]={0,0,0,1};
	moving=0;
	autoplay=0;
	loops=0;
	tileW=1;
	tileH=1;
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onVideoStopped="";
};
class ctrlStaticPicture: ctrlStatic
{
	style=48;
};
class ctrlStaticPictureKeepAspect: ctrlStaticPicture
{
	style="0x30 + 0x800";
};
class ctrlStaticPictureTile: ctrlStatic
{
	style=144;
};
class ctrlStaticFrame: ctrlStatic
{
	style=64;
};
class ctrlStaticLine: ctrlStatic
{
	style=176;
};
class ctrlStaticMulti: ctrlStatic
{
	style="0x10 + 0x200";
};
class ctrlStaticBackground: ctrlStatic
{
	colorBackground[]={0.2,0.2,0.2,1};
};
class ctrlStaticOverlay: ctrlStatic
{
	colorBackground[]={0,0,0,0.5};
};
class ctrlStaticTitle: ctrlStatic
{
	moving=1;
	colorBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
};
class ctrlStaticFooter: ctrlStatic
{
	colorBackground[]={0,0,0,0.30000001};
};
class ctrlStaticBackgroundDisable: ctrlStatic
{
	x=-4;
	y=-2;
	w=8;
	h=4;
	colorBackground[]={1,1,1,0.5};
};
class ctrlStaticBackgroundDisableTiles: ctrlStaticPictureTile
{
	x=-4;
	y=-2;
	w=8;
	h=4;
	text="\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
	tileW="8 / (32 * pixelW)";
	tileH="4 / (32 * pixelH)";
	colorText[]={1,1,1,0.050000001};
};
class ctrlButton: ctrlDefaultButton
{
	type=1;
	style="0x02 + 0xC0";
	colorBackground[]={0,0,0,1};
	colorBackgroundDisabled[]={0,0,0,0.5};
	colorBackgroundActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorFocused[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	font="PuristaLight";
	text="";
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	borderSize=0;
	colorBorder[]={0,0,0,0};
	colorShadow[]={0,0,0,0};
	offsetX=0;
	offsetY=0;
	offsetPressedX="pixelW";
	offsetPressedY="pixelH";
	period=0;
	periodFocus=2;
	periodOver=0.5;
	class KeyHints
	{
		class A
		{
			key="0x00050000 + 0";
			hint="KEY_XBOX_A";
		};
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onButtonClick="";
	onButtonDown="";
	onButtonUp="";
};
class ctrlButtonPicture: ctrlButton
{
	style="0x02 + 0x30";
};
class ctrlButtonPictureKeepAspect: ctrlButton
{
	style="0x02 + 0x30 + 0x800";
};
class ctrlButtonOK: ctrlButton
{
	default=1;
	idc=1;
	text="$STR_DISP_OK";
};
class ctrlButtonCancel: ctrlButton
{
	idc=2;
	text="$STR_DISP_CANCEL";
};
class ctrlButtonClose: ctrlButtonCancel
{
	text="$STR_DISP_CLOSE";
};
class ctrlButtonToolbar: ctrlButtonPictureKeepAspect
{
	colorBackground[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
};
class ctrlButtonSearch: ctrlButton
{
	style="0x02 + 0x30 + 0x800";
	text="\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
	textSearch="\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
	tooltip="$STR_3den_display3den_menubar_search_text";
};
class ctrlButtonExpandAll: ctrlButtonToolbar
{
	style="0x02 + 0x30 + 0x800";
	text="\a3\3DEN\Data\Displays\Display3DEN\tree_expand_ca.paa";
	tooltip="$STR_3DEN_ctrlButtonExpandAll_text";
};
class ctrlButtonCollapseAll: ctrlButtonToolbar
{
	style="0x02 + 0x30 + 0x800";
	text="\a3\3DEN\Data\Displays\Display3DEN\tree_collapse_ca.paa";
	tooltip="$STR_3DEN_ctrlButtonCollapseAll_text";
};
class ctrlButtonFilter: ctrlButton
{
	colorBackground[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
	colorBackgroundActive[]={1,1,1,0.30000001};
	colorFocused[]={0,0,0,0};
};
class ctrlEdit: ctrlDefaultText
{
	type=2;
	colorBackground[]={0,0,0,0.5};
	text="";
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorSelection[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	canModify=1;
	autocomplete="";
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
};
class ctrlEditMulti: ctrlEdit
{
	style=16;
};
class ctrlSliderV: ctrlDefault
{
	type=3;
	style=0;
	color[]={0,0,0,1};
	colorDisabled[]={1,1,1,0.25};
	colorActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	sliderRange[]={0,1};
	sliderPosition=1;
	lineSize=0.1;
	pageSize=3;
	class Title
	{
		idc=-1;
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	class Value
	{
		idc=-1;
		format="%.f";
		type="SPTPlain";
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onSliderPosChanged="";
};
class ctrlSliderH: ctrlSliderV
{
	style=1024;
};
class ctrlCombo: ctrlDefaultText
{
	type=4;
	style="0x00 + 0x10";
	colorBackground[]={0.050000001,0.050000001,0.050000001,1};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorSelect[]={1,1,1,1};
	colorTextRight[]={1,1,1,1};
	colorSelectRight[]={1,1,1,0.25};
	colorSelect2Right[]={1,1,1,1};

	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,1};

	colorPictureRight[]={1,1,1,1};
	colorPictureRightSelected[]={1,1,1,1};
	colorPictureRightDisabled[]={1,1,1,1};

	arrowEmpty="\a3\3DEN\Data\Controls\ctrlCombo\arrowEmpty_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\ctrlCombo\arrowFull_ca.paa";
	wholeHeight="12 * 	5 * (pixelH * pixelGrid * 	0.50)";
	maxHistoryDelay=1;
	soundExpand[]=
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[]=
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	class ComboScrollBar
	{
		width=0;
		height=0;
		scrollSpeed=0.0099999998;
		arrowEmpty="\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull="\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border="\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb="\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[]={1,1,1,1};
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
};
class ctrlComboToolbar: ctrlCombo
{
	colorBackground[]={0.050000001,0.050000001,0.050000001,1};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	arrowEmpty="\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
	wholeHeight="12 * 	5 * (pixelH * pixelGrid * 	0.50)";
};
class ctrlListbox: ctrlDefaultText
{
	type=5;
	style="0x00 + 0x10";
	colorBackground[]={0,0,0,0.5};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorSelectBackground2[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorShadow[]={0,0,0,0.5};
	colorDisabled[]={1,1,1,0.25};
	colorText[]={1,1,1,1};
	colorSelect[]={1,1,1,1};
	colorSelect2[]={1,1,1,1};
	colorTextRight[]={1,1,1,1};
	colorSelectRight[]={1,1,1,1};
	colorSelect2Right[]={1,1,1,1};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,0.25};
	colorPictureRight[]={1,1,1,1};
	colorPictureRightSelected[]={1,1,1,1};
	colorPictureRightDisabled[]={1,1,1,0.25};
	period=1;
	rowHeight="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	itemSpacing=0;
	maxHistoryDelay=1;
	canDrag=0;
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	class ListScrollBar: ScrollBar
	{
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
	onLBDblClick="";
	onLBDrag="";
	onLBDragging="";
	onLBDrop="";
};
class ctrlToolbox: ctrlDefaultText
{
	type=6;
	style=2;
	colorBackground[]={0.16, 0.16, 0.19,1};
	colorText[]={1,1,1,1};
	colorTextSelect[]={0, 0.92, 0.99,1};
	rows=1;
	columns=1;
	strings[]={};
	values[]={};
	color[]={1,0,1,1};
	colorSelect[]={0,0,0,0};
	colorTextDisable[]={0,0,0,0};
	colorDisable[]={0,0,0,0};
	colorSelectedBg[]={0.16, 0.16, 0.19,1};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onToolBoxSelChanged="";
};
class ctrlToolboxPicture: ctrlToolbox
{
	style="0x02 + 0x30";
};
class ctrlToolboxPictureKeepAspect: ctrlToolbox
{
	style="0x02 + 0x30 + 0x800";
};
class ctrlCheckboxes: ctrlDefaultText
{
	type=7;
	colorBackground[]={0,0,0,0.5};
	colorText[]={1,1,1,1};
	colorTextSelect[]={1,1,1,1};
	rows=1;
	columns=1;
	strings[]={};
	checked_strings[]={};
	color[]={1,0,1,1};
	colorSelect[]={0,0,0,0};
	colorTextDisable[]={0,0,0,0};
	colorDisable[]={0,0,0,0};
	colorSelectedBg[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onCheckBoxesSelChanged="";
};
class ctrlCheckboxesCheckbox: ctrlCheckboxes
{
	style=48;
	strings[]=
	{
		"\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa"
	};
	checked_strings[]=
	{
		"\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa"
	};
	colorBackground[]={0,0,0,0};
	colorSelectedBg[]={0,0,0,0};
};
class ctrlProgress: ctrlDefault
{
	type=8;
	texture="#(argb,8,8,3)color(1,1,1,1)";
	colorBar[]={1,1,1,1};
	colorFrame[]={0,0,0,1};
	onCanDestroy="";
	onDestroy="";
};
class ctrlHTML: ctrlDefaultText
{
	type=9;
	colorBackground[]={0,0,0,0};
	colorText[]={1,1,1,1};
	colorBold[]={1,1,1,0.5};
	colorLink[]={1,1,1,1};
	colorLinkActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorPicture[]={1,1,1,1};
	colorPictureBorder[]={0,0,0,0};
	colorPictureLink[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	prevPage="\a3\3DEN\Data\Controls\CtrlHTML\prevPage_ca.paa";
	nextPage="\a3\3DEN\Data\Controls\CtrlHTML\nextPage_ca.paa";
	filename="";
	cycleLinks=0;
	cycleAllLinks=0;
	class P
	{
		font="RobotoCondensedLight";
		fontBold="RobotoCondensedBold";
		sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H1: P
	{
		sizeEx="5.58 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H2: P
	{
		sizeEx="4.86 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H3: P
	{
	};
	class H4: P
	{
	};
	class H5: P
	{
	};
	class H6: P
	{
		font="RobotoCondensedLight";
		fontBold="RobotoCondensedLight";
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onHTMLLink="";
};
class ctrlActiveText: ctrlDefaultButton
{
	type=11;
	text="";
	color[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		0.75
	};
	colorActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onButtonClick="";
	onButtonDown="";
	onButtonUp="";
};
class ctrlActivePicture: ctrlActiveText
{
	style=48;
	color[]={1,1,1,1};
};
class ctrlActivePictureKeepAspect: ctrlActiveText
{
	style="0x30 + 0x800";
};
class ctrlTree: ctrlDefaultText
{
	type=12;
	colorBorder[]={0,0,0,1};
	colorLines[]={0,0,0,0};
	colorBackground[]={0,0,0,0};
	colorSelect[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorMarked[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		0.5
	};
	colorMarkedSelected[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
	colorSelectText[]={1,1,1,1};
	colorMarkedText[]={1,1,1,1};
	colorSearch[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,0.25};
	colorPictureRight[]={1,1,1,1};
	colorPictureRightSelected[]={1,1,1,1};
	colorPictureRightDisabled[]={1,1,1,0.25};
	multiselectEnabled=0;
	expandOnDoubleclick=1;
	hiddenTexture="\a3\3DEN\Data\Controls\ctrlTree\hiddenTexture_ca.paa";
	expandedTexture="\a3\3DEN\Data\Controls\ctrlTree\expandedTexture_ca.paa";
	maxHistoryDelay=1;
	disableKeyboardSearch=0;
	class ScrollBar: ScrollBar
	{
		scrollSpeed=0.050000001;
	};
	colorDisabled[]={0,0,0,0};
	colorArrow[]={0,0,0,0};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onTreeSelChanged="";
	onTreeLButtonDown="";
	onTreeDblClick="";
	onTreeExpanded="";
	onTreeCollapsed="";
	onTreeMouseExit="";
};
class ctrlStructuredText: ctrlDefaultText
{
	type=13;
	colorBackground[]={0,0,0,0};
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text="";
	class Attributes
	{
		align="left";
		color="#ffffff";
		colorLink="";
		size=1;
		font="RobotoCondensedLight";
	};
	onCanDestroy="";
	onDestroy="";
};
class ctrlStructuredText2: ctrlDefaultText
{
	type=13;
	colorBackground[]={0,0,0,0};
	size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text="";
	class Attributes
	{
		align="left";
		color="#ffffff";
		colorLink="";
		size=1;
		font="RobotoCondensed";
	};
	onCanDestroy="";
	onDestroy="";
};
class ctrlControlsGroup: ctrlDefault
{
	type=15;
	style=16;
	x=0;
	y=0;
	w=1;
	h=1;
	class VScrollBar: ScrollBar
	{
		width="2 * (pixelW * pixelGrid * 	0.50)";
		height=0;
		autoScrollEnabled=0;
		autoScrollDelay=1;
		autoScrollRewind=1;
		autoScrollSpeed=1;
	};
	class HScrollBar: ScrollBar
	{
		width=0;
		height="2 * (pixelH * pixelGrid * 	0.50)";
	};
	onCanDestroy="";
	onDestroy="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
};
class ctrlControlsGroupNoScrollbars: ctrlControlsGroup
{
	class VScrollbar: VScrollBar
	{
		width=0;
	};
	class HScrollbar: HScrollBar
	{
		height=0;
	};
};
class ctrlControlsGroupNoHScrollbars: ctrlControlsGroup
{
	class HScrollbar: HScrollBar
	{
		height=0;
	};
};
class ctrlControlsGroupNoVScrollbars: ctrlControlsGroup
{
	class VScrollbar: VScrollBar
	{
		width=0;
	};
};
class ctrlShortcutButton: ctrlDefaultButton
{
	type=16;
	style=192;
	colorBackground[]={0,0,0,1};
	colorBackground2[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundFocused[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	text="";
	size="4.86 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	shadow=0;
	color[]={1,1,1,1};
	color2[]={1,1,1,1};
	colorFocused[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	period=1;
	periodFocus=1;
	periodOver=0.5;
	shortcuts[]=
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	textureNoShortcut="#(argb,8,8,3)color(1,1,1,1)";
	class Attributes
	{
		align="center";
		color="#ffffff";
		font="PuristaLight";
		shadow=0;
	};
	class HitZone
	{
		left=0;
		top=0;
		right=0;
		bottom=0;
	};
	class TextPos
	{
		left=0;
		top=0;
		right=0;
		bottom=0;
	};
	class ShortcutPos
	{
		left=0;
		top=0;
		w=0;
		h=0;
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onButtonClick="";
	onButtonDown="";
	onButtonUp="";
};
class ctrlShortcutButtonOK: ctrlShortcutButton
{
	default=1;
	idc=1;
	text="$STR_DISP_OK";
};
class ctrlShortcutButtonCancel: ctrlShortcutButton
{
	idc=2;
	text="$STR_DISP_CANCEL";
};
class ctrlShortcutButtonSteam: ctrlShortcutButton
{
	colorBackground[]={0.031372551,0.72156864,0.91764706,1};
	textureNoShortcut="\a3\3DEN\Data\Controls\CtrlShortcutButton\steam_ca.paa";
	class TextPos
	{
		left="1.5 * 	5 * (pixelW * pixelGrid * 	0.50)";
		top=0;
		right=0;
		bottom=0;
	};
	class ShortcutPos
	{
		left=0;
		top=0;
		w="5 * (pixelW * pixelGrid * 	0.50)";
		h="5 * (pixelH * pixelGrid * 	0.50)";
	};
};
class ctrlXListbox: ctrlDefaultText
{
	type=42;
	style="0x400 + 0x02 + 0x10";
	color[]={1,1,1,1};
	colorActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
	colorSelect[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[]={1,1,1,0.25};
	colorPicture[]={1,1,1,1};
	cycle=1;
	arrowEmpty="\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border="\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
	onLBDblClick="";
};
class ctrlXSliderV: ctrlDefault
{
	type=43;
	style=0;
	color[]={1,1,1,0.60000002};
	colorActive[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	sliderRange[]={0,1};
	sliderPosition=1;
	lineSize=0.1;
	arrowEmpty="\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border="\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	thumb="\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
	class Title
	{
		idc=-1;
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	class Value
	{
		idc=-1;
		format="%.f";
		type="SPTPlain";
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onSliderPosChanged="";
};
class ctrlXSliderH: ctrlXSliderV
{
	style=1024;
};
class ctrlMenu: ctrlDefaultText
{
	type=46;
	font="RobotoCondensedLight";
	colorBorder[]={0,0,0,0};
	colorBackground[]={0,0,0,1};
	colorText[]={1,1,1,1};
	colorSelect[]={0,0,0,1};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[]={1,1,1,0.25};
	colorPicture[]={1,1,1,1};
	colorPictureSelect[]={0,0,0,1};
	colorPictureDisabled[]={1,1,1,0.5};
	arrow="\a3\3DEN\Data\Controls\ctrlMenu\arrow_ca.paa";
	rowHeight=0;
	itemSpacingW=0.0099999998;
	itemSpacingH=0.0099999998;
	pictureCheckboxEnabled="\a3\3DEN\Data\Controls\CtrlMenu\pictureCheckboxEnabled_ca.paa";
	pictureCheckboxDisabled="#(argb,8,8,3)color(0,0,0,0)";
	pictureRadioEnabled="\a3\3DEN\Data\Controls\CtrlMenu\pictureRadioEnabled_ca.paa";
	pictureRadioDisabled="#(argb,8,8,3)color(0,0,0,0)";
};
class ctrlMenuStrip: ctrlMenu
{
	type=47;
	colorStripBackground[]={0,0,0,1};
	colorStripText[]={1,1,1,1};
	colorStripSelect[]={0,0,0,1};
	colorStripSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorStripDisabled[]={1,1,1,0.25};
};
class ctrlObject
{
};
class ctrlObjectContainer: ctrlObject
{
};
class ctrlObjectZoom: ctrlObject
{
};
class ctrlMap: ctrlDefault
{
	type=101;
	style=48;
	x="safezoneXAbs";
	y="safezoneY";
	w="safezoneWAbs";
	h="safezoneH";
	sizeEx=0.050000001;
	font="RobotoCondensedLight";
	colorText[]={0,0,0,1};
	moveOnEdges=1;
	ptsPerSquareSea=5;
	ptsPerSquareTxt=20;
	ptsPerSquareCLn=10;
	ptsPerSquareExp=10;
	ptsPerSquareCost=10;
	ptsPerSquareFor=9;
	ptsPerSquareForEdge=9;
	ptsPerSquareObj=9;
	ptsPerSquareForLod1=4;
	ptsPerSquareForLod2=1;
	ptsPerSquareRoad=6;
	ptsPerSquareMainRoad=6;
	ptsPerSquareRoadSimple=1;
	ptsPerSquareMainRoadSimple=1;
	drawShaded=0.25;
	shadedSea=0.30000001;
	runwayFont="LCD14";
	scaleMin=9.9999997e-005;
	scaleMax=1;
	scaleDefault=0.16;
	maxSatelliteAlpha=0.85000002;
	alphaFadeStartScale=2;
	alphaFadeEndScale=2;
	text="#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]={0.96899998,0.95700002,0.949,1};
	colorOutside[]={0,0,0,1};
	colorSea[]={0.46700001,0.63099998,0.85100001,0.5};
	colorForest[]={0.62400001,0.77999997,0.38800001,0.5};
	colorForestTextured[]={0.62400001,0.77999997,0.38800001,0.25};
	colorForestBorder[]={0,0,0,0};
	colorRocks[]={0,0,0,0.30000001};
	colorRocksBorder[]={0,0,0,0};
	colorLevels[]={0.28600001,0.177,0.093999997,0.5};
	colorMainCountlines[]={0.57200003,0.354,0.18799999,0.5};
	colorCountlines[]={0.57200003,0.354,0.18799999,0.25};
	colorMainCountlinesWater[]={0.491,0.57700002,0.70200002,0.60000002};
	colorCountlinesWater[]={0.491,0.57700002,0.70200002,0.30000001};
	colorPowerLines[]={0.1,0.1,0.1,1};
	colorRailWay[]={1,0,0,1};
	colorNames[]={0.1,0.1,0.1,0.89999998};
	colorInactive[]={1,1,1,0.5};
	colorTracks[]={0.83999997,0.75999999,0.64999998,0.15000001};
	colorTracksFill[]={0.83999997,0.75999999,0.64999998,1};
	colorRoads[]={0.69999999,0.69999999,0.69999999,1};
	colorRoadsFill[]={1,1,1,1};
	colorMainRoads[]={0.89999998,0.5,0.30000001,1};
	colorMainRoadsFill[]={1,0.60000002,0.40000001,1};
	colorTrails[]={0.83999997,0.75999999,0.64999998,0.15000001};
	colorTrailsFill[]={0.83999997,0.75999999,0.64999998,0.64999998};
	colorGrid[]={0.1,0.1,0.1,0.60000002};
	colorGridMap[]={0.1,0.1,0.1,0.60000002};
	widthRailWay=4;
	fontLabel="RobotoCondensedLight";
	sizeExLabel=0.050000001;
	fontGrid="TahomaB";
	sizeExGrid=0.02;
	fontUnits="TahomaB";
	sizeExUnits=0.050000001;
	fontNames="RobotoCondensed";
	sizeExNames=0.050000001;
	fontInfo="RobotoCondensedLight";
	sizeExInfo=0.050000001;
	fontLevel="TahomaB";
	sizeExLevel=0.02;
	showCountourInterval=1;
	idcMarkerColor=-1;
	idcMarkerIcon=-1;
	textureComboBoxColor="#(argb,8,8,3)color(1,1,1,1)";
	showMarkers="true";
	class LineMarker
	{
		lineWidthThin=0.0080000004;
		lineWidthThick=0.014;
		lineDistanceMin=2.9999999e-005;
		lineLengthMin=5;
	};
	class Legend
	{
		x=0.5;
		y=0.5;
		w=0.40000001;
		h=0.1;
		color[]={0,0,0,1};
		colorBackground[]={1,1,1,0.5};
		font="RobotoCondensedLight";
		sizeEX="3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class Task
	{
		icon="\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		color[]={1,1,1,1};
		iconCreated="\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		colorCreated[]={1,1,0,1};
		iconCanceled="\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		colorCanceled[]={0.69999999,0.69999999,0.69999999,1};
		iconDone="\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		colorDone[]={0.69999999,1,0.30000001,1};
		iconFailed="\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		colorFailed[]={1,0.30000001,0.2,1};
		size=27;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class ActiveMarker
	{
		color[]={0,0,0,1};
		size=2;
	};
	class Waypoint
	{
		coefMax=1;
		coefMin=1;
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		importance=1;
		size=24;
	};
	class WaypointCompleted: Waypoint
	{
		icon="\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};
	class CustomMark: Waypoint
	{
		icon="\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
	};
	class Command: Waypoint
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size=18;
	};
	class Bush: Waypoint
	{
		coefMax=4;
		coefMin=0.25;
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance=0.0070000002;
		size=7;
	};
	class SmallTree: Bush
	{
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance=0.36000001;
		size=12;
	};
	class Tree: SmallTree
	{
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance=0.72000003;
	};
	class Rock: SmallTree
	{
		color[]={0.1,0.1,0.1,0.80000001};
		icon="\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		importance=0.30000001;
	};
	class BusStop: Bush
	{
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
	};
	class FuelStation: Waypoint
	{
		coefMax=1;
		coefMin=0.85000002;
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
	};
	class Hospital: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
	};
	class Church: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\church_CA.paa";
	};
	class Lighthouse: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
	};
	class Power: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\power_CA.paa";
	};
	class PowerSolar: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
	};
	class PowerWave: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
	};
	class PowerWind: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
	};
	class Quay: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
	};
	class Transmitter: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
	};
	class Watertower: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
	};
	class Cross: Waypoint
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
	};
	class Chapel: Cross
	{
		icon="\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
	};
	class Shipwreck: Cross
	{
		icon="\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
	};
	class Bunker: Waypoint
	{
		coefMax=4;
		coefMin=0.25;
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance=1.05;
		size=14;
	};
	class Fortress: Bunker
	{
		icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance=1.6;
		size=16;
	};
	class Fountain: Bunker
	{
		icon="\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		importance=0.60000002;
		size=11;
	};
	class Ruin: Waypoint
	{
		coefMax=4;
		coefMin=1;
		icon="\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		importance=0.95999998;
		size=16;
	};
	class Stack: Waypoint
	{
		coefMax=2;
		coefMin=0.40000001;
		icon="\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		importance=1.6;
		size=16;
	};
	class Tourism: Waypoint
	{
		coefMax=4;
		coefMin=0.69999999;
		icon="\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		importance=2.8;
		size=16;
	};
	class ViewTower: Waypoint
	{
		coefMax=4;
		coefMin=0.5;
		icon="\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		importance=2;
		size=16;
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onDraw="";
};
class ctrlMapEmpty: ctrlMap
{
	ptsPerSquareSea=1000;
	ptsPerSquareTxt=1000;
	ptsPerSquareCLn=1000;
	ptsPerSquareExp=1000;
	ptsPerSquareCost=1000;
	ptsPerSquareFor=1000;
	ptsPerSquareForEdge=1000;
	ptsPerSquareRoad=1000;
	ptsPerSquareObj=1000;
	alphaFadeStartScale=0;
	alphaFadeEndScale=0;
	colorBackground[]={1,1,1,1};
	colorOutside[]={1,1,1,1};
	colorSea[]={0,0,0,0};
	colorForest[]={0,0,0,0};
	colorForestBorder[]={0,0,0,0};
	colorRocks[]={0,0,0,0};
	colorRocksBorder[]={0,0,0,0};
	colorLevels[]={0,0,0,0};
	colorMainCountlines[]={0,0,0,0};
	colorCountlines[]={0,0,0,0};
	colorMainCountlinesWater[]={0,0,0,0};
	colorCountlinesWater[]={0,0,0,0};
	colorPowerLines[]={0,0,0,0};
	colorRailWay[]={0,0,0,0};
	colorNames[]={0,0,0,0};
	colorInactive[]={0,0,0,0};
	colorGrid[]={0,0,0,0};
	colorGridMap[]={0,0,0,0};
	class Task: Task
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		iconCreated="#(argb,8,8,3)color(0,0,0,0)";
		iconCanceled="#(argb,8,8,3)color(0,0,0,0)";
		iconDone="#(argb,8,8,3)color(0,0,0,0)";
		iconFailed="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		colorCreated[]={0,0,0,0};
		colorCanceled[]={0,0,0,0};
		colorDone[]={0,0,0,0};
		colorFailed[]={0,0,0,0};
		size=0;
	};
	class Waypoint: Waypoint
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class WaypointCompleted: WaypointCompleted
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class CustomMark: CustomMark
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Command: Command
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Bush: Bush
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Rock: Rock
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class SmallTree: SmallTree
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Tree: Tree
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class busstop: BusStop
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class fuelstation: FuelStation
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class hospital: Hospital
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class church: Church
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class lighthouse: Lighthouse
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class power: Power
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class powersolar: PowerSolar
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class powerwave: PowerWave
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class powerwind: PowerWind
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class quay: Quay
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class shipwreck: Shipwreck
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class transmitter: Transmitter
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class watertower: Watertower
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Bunker: Bunker
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Cross: Cross
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Fortress: Fortress
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Fountain: Fountain
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Chapel: Chapel
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Ruin: Ruin
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Stack: Stack
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Tourism: Tourism
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class ViewTower: ViewTower
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
};
class ctrlMapMain: ctrlMap
{
};
class ctrlListNBox: ctrlDefaultText
{
	type=102;
	style="0x00 + 0x10";
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorSelectBackground2[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorSelect[]={1,1,1,1};
	colorSelect2[]={1,1,1,1};
	colorShadow[]={0,0,0,0.5};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,0.25};
	columns[]={0};
	drawSideArrows=0;
	idcLeft=-1;
	idcRight=-1;
	period=1;
	disableOverflow=0;
	rowHeight="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	maxHistoryDelay=1;
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	class ListScrollBar: ScrollBar
	{
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
	onLBDblClick="";
};
class ctrlCheckbox: ctrlDefault
{
	type=77;
	checked=0;
	color[]={1,1,1,0.69999999};
	colorFocused[]={1,1,1,1};
	colorHover[]={1,1,1,1};
	colorPressed[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorBackground[]={0,0,0,0};
	colorBackgroundFocused[]={0,0,0,0};
	colorBackgroundHover[]={0,0,0,0};
	colorBackgroundPressed[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
	textureChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureFocusedChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureFocusedUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureHoverChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureHoverUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	texturePressedChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	texturePressedUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureDisabledChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureDisabledUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.090000004,
		1
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.090000004,
		1
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onCheckedChanged="";
};
class ctrlCheckBox2: ctrlCheckbox
{
	textureChecked="\rimas_agent\assets\common\RscCheckbox\textureChecked_ca.paa";
	textureUnchecked="\rimas_agent\assets\common\RscCheckbox\textureUnchecked_ca.paa";
	textureFocusedChecked="\rimas_agent\assets\common\RscCheckbox\textureChecked_ca.paa";
	textureFocusedUnchecked="\rimas_agent\assets\common\RscCheckbox\textureUnchecked_ca.paa";
	textureHoverChecked="\rimas_agent\assets\common\RscCheckbox\textureChecked_ca.paa";
	textureHoverUnchecked="\rimas_agent\assets\common\RscCheckbox\textureUnchecked_ca.paa";
	texturePressedChecked="\rimas_agent\assets\common\RscCheckbox\textureChecked_ca.paa";
	texturePressedUnchecked="\rimas_agent\assets\common\RscCheckbox\textureUnchecked_ca.paa";
	textureDisabledChecked="\rimas_agent\assets\common\RscCheckbox\textureChecked_ca.paa";
	textureDisabledUnchecked="\rimas_agent\assets\common\RscCheckbox\textureUnchecked_ca.paa";
};
class ctrlCheckboxToolbar: ctrlCheckbox
{
	color[]={1,1,1,1};
	colorBackgroundHover[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundPressed[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
};
class ctrlCheckboxBaseline: ctrlCheckbox
{
	textureChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureFocusedChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureFocusedUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureHoverChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureHoverUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	texturePressedChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	texturePressedUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureDisabledChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureDisabledUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
};
import RscObject;
class RscButton
{
	deletable = 0;
	fade = 0;
	type = 1;
	text = "";
	colorText[] =
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] =
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] =
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundDisabled[] =
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundActive[] =
	{
		0,
		0,
		0,
		1
	};
	colorFocused[] =
	{
		0,
		0,
		0,
		1
	};
	colorShadow[] =
	{
		0,
		0,
		0,
		0
	};
	colorBorder[] =
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	idc = -1;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	url = "";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};

class RscButtonUC: RscButton
{
	style = "0xC0 + 0x02";
};

class RscScrollBar
{
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};

class RscControlsGroup
{
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;

	class VScrollBar : RscScrollBar
	{
		width = 0.021;
		autoScrollEnabled = 1;
	};

	class HScrollBar : RscScrollBar
	{
		height = 0.028;
	};

	class Controls {};
};

class RscControlsGroupNoScrollbars : RscControlsGroup
{
	class VScrollbar : VScrollbar {
		width = 0;
	};

	class HScrollbar : HScrollbar {
		height = 0;
	};
};

class RscListNBox
{
	style="0x00 + 0x10";
	type = 102;
	shadow = 0;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0.95,0.95,0.95,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.8,0.8,0.8,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
   	colorPictureDisabled[] = {1,1,1,1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	period = 1.2;
	maxHistoryDelay = 0.5;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	rowHeight = 0.04;
	drawSideArrows = 0;
	idcLeft = -1;
	idcRight = -1;
	class ListScrollBar: RscScrollBar{};
	class ScrollBar: RscScrollBar{};
};

class RscText
{
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "RobotoCondensed";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscLine : RscText
{
	idc = -1;
	style = 176;
	x = 0.17;
	y = 0.48;
	w = 0.66;
	h = 0;
	text = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1.0};
};

class RscTitle : RscText
{
	colorText[] = {0.95, 0.95, 0.95, 1};
};

class RscPicture
{
	shadow = 0;
	type = 0;
	style = 48;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 43.4) * 1)";
	font = "RobotoCondensed";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscPictureKeepAspect: RscPicture
{
	style="0x30 + 0x800";
};
class RscVideo: RscPicture
{
	autoplay=1;
	loops=1;
};
class RscVideoKeepAspect: RscPictureKeepAspect
{
	autoplay=1;
	loops=1;
};

class RscStructuredText
{
	type = 13;
	style = 0;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	class Attributes {
		font = "RobotoCondensed";
        color = "#ffffff";
		align = "left";
		valign = "middle";
		shadow = 0;
	};
	class TextPos
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};



};

class RscActiveText
{
	idc = -1;
    type = 11;
    style = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    font = "RobotoCondensed";
    color[] = {1, 1, 1, 1};
    colorActive[] = {1, 0.2, 0.2, 1};
	colorDisabled[] = {1, 0.2, 0.2, 0.4};
    soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
    soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
    action = "";
    text = "";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class RscShortcutButton
{
	deletable = 0;
	fade = 0;
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	shortcuts[] =
	{
	};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] =
	{
		1,
		1,
		1,
		1
	};
	colorFocused[] =
	{
		1,
		1,
		1,
		1
	};
	color2[] =
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabled[] =
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorBackgroundFocused[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorBackground2[] =
	{
		1,
		1,
		1,
		1
	};
	soundEnter[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	textSecondary = "";
	colorSecondary[] =
	{
		1,
		1,
		1,
		1
	};
	colorFocusedSecondary[] =
	{
		1,
		1,
		1,
		1
	};
	color2Secondary[] =
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorDisabledSecondary[] =
	{
		1,
		1,
		1,
		0.25
	};
	sizeExSecondary = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary = "RobotoCondensed";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	period = 0.4;
	font = "RobotoCondensed";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	url = "";
	action = "";
	class AttributesImage
	{
		font = "RobotoCondensed";
		color = "#E5E5E5";
		align = "left";
	};
};

class RscButtonMenu : RscShortcutButton
{
	idc=-1;
	type=16;
	style="0x02 + 0xC0";
	default=0;
	shadow=0;
	x=0;
	y=0;
	w=0.095588997;
	h=0.039216001;
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]={0,0,0,0.80000001};
	colorBackgroundFocused[]={1,1,1,1};
	colorBackground2[]={0.75,0.75,0.75,1};
	color[]={1,1,1,1};
	colorFocused[]={0,0,0,1};
	color2[]={0,0,0,1};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	textSecondary="";
	colorSecondary[]={1,1,1,1};
	colorFocusedSecondary[]={0,0,0,1};
	color2Secondary[]={0,0,0,1};
	colorDisabledSecondary[]={1,1,1,0.25};
	sizeExSecondary="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary="RobotoCondensed";
	period=1.2;
	periodFocus=1.2;
	periodOver=1.2;
	size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	class TextPos
	{
		left="0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right=0.0049999999;
		bottom=0;
	};
	class Attributes
	{
		font="RobotoCondensed";
		color="#E5E5E5";
		align="left";
		shadow="false";
	};
	class ShortcutPos
	{
		left="5.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top=0;
		w="1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		h="1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.090000004,
		1
	};
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.090000004,
		1
	};
};

class RscProgress
{
	type = 8;
	style = 0;
	x = 0.334585 * safezoneW + safezoneX;
	y = 0.181 * safezoneH + safezoneY;
	w = 0.330831 * safezoneW;
	h = 0.033 * safezoneH;
	texture = "";
	shadow = 1;
	colorFrame[] = {1,1,1,0};
	colorBackground[] = {1,1,1,0.2};
	colorBar[] = {1,1,1,0.9};
};

class RscListBox
{
	style = 16;
	idc = -1;
	type = 5;
	w = 0.275;
	h = 0.04;
	x = 0;
	y = 0;
	font = "RobotoCondensed";
	colorSelect[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.28,0.28,0.28,0.28};
	colorSelect2[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorScrollbar[] = {0.2, 0.2, 0.2, 1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	rowHeight = 0.04;
	color[] = {0.7, 0.7, 0.7, 1};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class ListScrollBar: RscScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
	};
};

class RscListBox_forStatus: RscListBox
{
	colorSelect[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.16, 0.16, 0.19,1};
	colorSelect2[] = {1, 1, 1, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};
	colorScrollbar[] = {0.2, 0.2, 0.2, 1};
	sizeEx = "0.8 * (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";
};

class RscListBox_controlsFB: RscListBox
{
	colorBackground[] = {0.28,0.28,0.28,0};
};

class RscEdit
{
	type = 2;
	style = 0x00 + 0x40;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.16, 0.16, 0.19};
	shadow = 0;
	x = 0;
	y = 0;
	h = 0;
	w = 0;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	colorDisabled[] = {1, 1, 1, 0.25};
	autocomplete = 0;
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1};
	canModify = 1;
};

class RscXSliderH
{
	style = 1024;
	type = 43;
	shadow = 2;
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.400000;
	color[] = {
			1, 1, 1, 0.7
	};
	colorActive[] = {
			1, 1, 1, 1
	};
	colorDisabled[] = {
			1, 1, 1, 0.500000
	};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 50) * 1)";
	text = "";
};
class RscMapControl
{
	type=101;
	idc=51;
	style=48;
	widthRailWay=4;
	colorBackground[]={0.96899998,0.95700002,0.949,1};
	colorOutside[]={0,0,0,1};
	colorText[]={0,0,0,1};
	font="RobotoCondensedBold";
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorSea[]={0.46700001,0.63099998,0.85100001,0.5};
	colorForest[]={0.62400001,0.77999997,0.38800001,0.5};
	colorRocks[]={0,0,0,0.30000001};
	colorCountlines[]={0.57200003,0.354,0.18799999,0.25};
	colorMainCountlines[]={0.57200003,0.354,0.18799999,0.5};
	colorCountlinesWater[]={0.491,0.57700002,0.70200002,0.30000001};
	colorMainCountlinesWater[]={0.491,0.57700002,0.70200002,0.60000002};
	colorForestBorder[]={0,0,0,0};
	colorRocksBorder[]={0,0,0,0};
	colorPowerLines[]={0.1,0.1,0.1,1};
	colorRailWay[]={0.80000001,0.2,0,1};
	colorNames[]={0.1,0.1,0.1,0.89999998};
	colorInactive[]={1,1,1,0.5};
	colorLevels[]={0.28600001,0.177,0.093999997,0.5};
	colorTracks[]={0.83999997,0.75999999,0.64999998,0.15000001};
	colorRoads[]={0.69999999,0.69999999,0.69999999,1};
	colorMainRoads[]={0.89999998,0.5,0.30000001,1};
	colorTracksFill[]={0.83999997,0.75999999,0.64999998,1};
	colorRoadsFill[]={1,1,1,1};
	colorMainRoadsFill[]={1,0.60000002,0.40000001,1};
	colorGrid[]={0.1,0.1,0.1,0.60000002};
	colorGridMap[]={0.1,0.1,0.1,0.60000002};
	stickX[]=
	{
		0.2,

		{
			"Gamma",
			1,
			1.5
		}
	};
	stickY[]=
	{
		0.2,

		{
			"Gamma",
			1,
			1.5
		}
	};
	class LineMarker
	{
		lineDistanceMin=2.9999999e-005;
		lineLengthMin=5;
		lineWidthThick=0.014;
		lineWidthThin=0.0080000004;
		textureComboBoxColor="#(argb,8,8,3)color(1,1,1,1)";
	};
	class Legend
	{
		colorBackground[]={1,1,1,0.5};
		color[]={0,0,0,1};
		x="SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y="SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w="10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h="3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font="RobotoCondensed";
		sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	};
	class ActiveMarker
	{
		color[]={0.30000001,0.1,0.89999998,1};
		size=50;
	};
	class Command
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size=18;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class Task
	{
		colorCreated[]={1,1,1,1};
		colorCanceled[]={0.69999999,0.69999999,0.69999999,1};
		colorDone[]={0.69999999,1,0.30000001,1};
		colorFailed[]={1,0.30000001,0.2,1};
		color[]=
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
		};
		icon="\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated="\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled="\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone="\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed="\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		size=27;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class CustomMark
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size=24;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class Tree
	{
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size=12;
		importance="0.9 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class SmallTree
	{
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size=12;
		importance="0.6 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Bush
	{
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size="14/2";
		importance="0.2 * 14 * 0.05 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Church
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Chapel
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Cross
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Rock
	{
		color[]={0.1,0.1,0.1,0.80000001};
		icon="\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		size=12;
		importance="0.5 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Bunker
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size=14;
		importance="1.5 * 14 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Fortress
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size=16;
		importance="2 * 16 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class Fountain
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size=11;
		importance="1 * 12 * 0.05";
		coefMin=0.25;
		coefMax=4;
	};
	class ViewTower
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size=16;
		importance="2.5 * 16 * 0.05";
		coefMin=0.5;
		coefMax=4;
	};
	class Lighthouse
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Quay
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Fuelstation
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Hospital
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class BusStop
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Transmitter
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Stack
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size=20;
		importance="2 * 16 * 0.05";
		coefMin=0.89999998;
		coefMax=4;
	};
	class Ruin
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size=16;
		importance="1.2 * 16 * 0.05";
		coefMin=1;
		coefMax=4;
	};
	class Tourism
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size=16;
		importance="1 * 16 * 0.05";
		coefMin=0.69999999;
		coefMax=4;
	};
	class Watertower
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
	};
	class Waypoint
	{
		color[]={0,0,0,1};
		size=24;
		importance=1;
		coefMin=1;
		coefMax=1;
		icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
	};
	class WaypointCompleted
	{
		color[]={0,0,0,1};
		size=24;
		importance=1;
		coefMin=1;
		coefMax=1;
		icon="\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};
	moveOnEdges=0;
	x="SafeZoneXAbs";
	y="SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w="SafeZoneWAbs";
	h="SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow=0;
	ptsPerSquareSea=5;
	ptsPerSquareTxt=3;
	ptsPerSquareCLn=10;
	ptsPerSquareExp=10;
	ptsPerSquareCost=10;
	ptsPerSquareFor=9;
	ptsPerSquareForEdge=9;
	ptsPerSquareRoad=6;
	ptsPerSquareObj=9;
	showCountourInterval=0;
	scaleMin=0.001;
	scaleMax=1;
	scaleDefault=0.16;
	maxSatelliteAlpha=0.85000002;
	alphaFadeStartScale=0.34999999;
	alphaFadeEndScale=0.40000001;
	fontLabel="RobotoCondensed";
	sizeExLabel="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid="RobotoCondensedBold";
	sizeExGrid=0.02;
	fontUnits="RobotoCondensedBold";
	sizeExUnits="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames="RobotoCondensed";
	sizeExNames="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo="RobotoCondensed";
	sizeExInfo="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel="RobotoCondensedBold";
	sizeExLevel=0.02;
	text="#(argb,8,8,3)color(1,1,1,1)";
	class power
	{
		icon="\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class powersolar
	{
		icon="\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class powerwave
	{
		icon="\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class powerwind
	{
		icon="\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
	class shipwreck
	{
		icon="\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size=24;
		importance=1;
		coefMin=0.85000002;
		coefMax=1;
		color[]={1,1,1,1};
	};
};
class RscCombo
{
	style = 16;
	type = 4;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0, 0, 0, 1};
	soundExpand[] = {"",0.1,1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	colorBackground[] = {0,0,0,0.8};
	colorSelectBackground[] = {1, 1, 1, 0.7};
	colow_Rscrollbar[] = {1, 0, 0, 1};
	soundSelect[] = {
			"", 0.000000, 1
	};
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	wholeHeight = 0.45;
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0, 0, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";
	class ComboScrollBar : RscScrollBar {};
};

class RRP_RscFrame : RscFrame
{
  type = CT_STATIC;
  idc = -1;
  style = 64;
  shadow = 0;
  colorBackground[] = {0,0,0,0};
  colorText[] = {1,1,1,1};
  font = "RobotoCondensed";
  sizeEx = 0.025;
  text = "";
};

class RscPictureButtonMenu : RscButtonMenu
{
	colorBackground[] = {1,1,1,0.004};
	colorBackgroundFocused[] = {1,1,1,0.008};
	colorBackground2[] = {0.75,0.75,0.75,0.004};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {0,0,0,0.4};
};

class RscCheckBox
{
	idc = -1;
	type = 77;
	style = 0;
	checked = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	color[] =
	{
		1,
		1,
		1,
		0.7
	};
	colorFocused[] =
	{
		1,
		1,
		1,
		1
	};
	colorHover[] =
	{
		1,
		1,
		1,
		1
	};
	colorPressed[] =
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] =
	{
		1,
		1,
		1,
		0.2
	};
	colorBackground[] =
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundFocused[] =
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundHover[] =
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundPressed[] =
	{
		0,
		0,
		0,
		0
	};
	colorBackgroundDisabled[] =
	{
		0,
		0,
		0,
		0
	};
	textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] =
	{
		0,
		0,
		0,
		0.65
	};
	soundEnter[] =
	{
		"",
		0.1,
		1
	};
	soundPush[] =
	{
		"",
		0.1,
		1
	};
	soundClick[] =
	{
		"",
		0.1,
		1
	};
	soundEscape[] =
	{
		"",
		0.1,
		1
	};
};
class RscTextCheckBox
{
	idc = -1;
	type = 7;
	style = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	colorText[] =
	{
		1,
		0,
		0,
		1
	};
	color[] =
	{
		0,
		0,
		0,
		0
	};
	colorBackground[] =
	{
		0,
		0,
		0,
		0
	};
	colorTextSelect[] =
	{
		0,
		0.8,
		0,
		1
	};
	colorSelectedBg[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorSelect[] =
	{
		0,
		0,
		0,
		1
	};
	colorTextDisable[] =
	{
		0.4,
		0.4,
		0.4,
		1
	};
	colorDisable[] =
	{
		0.4,
		0.4,
		0.4,
		1
	};
	tooltipColorText[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] =
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] =
	{
		0,
		0,
		0,
		0.65
	};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows = 1;
	columns = 1;
	strings[] =
	{
		"UNCHECKED"
	};
	checked_strings[] =
	{
		"CHECKED"
	};
};

class RscTiles: RscControlsGroupNoScrollbars
{
  idc = 115099;
  x = "safezoneX";
  y = "safezoneY";
  w = "safezoneW";
  h = "safezoneH";
  disableCustomColors = 1;

  class Controls
  {

    class TileFrame: RscFrame
    {
      idc = 114999;
      x = 0;
      y = 0;
      w = "safezoneW";
      h = "safezoneH";
      colortext[] = { 0,0,0,1 };
    };

    class Tile_0_0: RscText
    {
      idc = 115000;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_1: RscText
    {
      idc = 115001;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_2: RscText
    {
      idc = 115002;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_3: RscText
    {
      idc = 115003;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_4: RscText
    {
      idc = 115004;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_0_5: RscText
    {
      idc = 115005;
      x = "( 0 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_0: RscText
    {
      idc = 115010;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_1: RscText
    {
      idc = 115011;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_2: RscText
    {
      idc = 115012;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_3: RscText
    {
      idc = 115013;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_4: RscText
    {
      idc = 115014;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_1_5: RscText
    {
      idc = 115015;
      x = "( 1 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_0: RscText
    {
      idc = 115020;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_1: RscText
    {
      idc = 115021;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_2: RscText
    {
      idc = 115022;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_3: RscText
    {
      idc = 115023;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_4: RscText
    {
      idc = 115024;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_2_5: RscText
    {
      idc = 115025;
      x = "( 2 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_0: RscText
    {
      idc = 115030;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_1: RscText
    {
      idc = 115031;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_2: RscText
    {
      idc = 115032;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_3: RscText
    {
      idc = 115033;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_4: RscText
    {
      idc = 115034;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_3_5: RscText
    {
      idc = 115035;
      x = "( 3 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_0: RscText
    {
      idc = 115040;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_1: RscText
    {
      idc = 115041;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_2: RscText
    {
      idc = 115042;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_3: RscText
    {
      idc = 115043;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_4: RscText
    {
      idc = 115044;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_4_5: RscText
    {
      idc = 115045;
      x = "( 4 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_0: RscText
    {
      idc = 115050;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 0 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_1: RscText
    {
      idc = 115051;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 1 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_2: RscText
    {
      idc = 115052;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 2 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_3: RscText
    {
      idc = 115053;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 3 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_4: RscText
    {
      idc = 115054;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 4 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };

    class Tile_5_5: RscText
    {
      idc = 115055;
      x = "( 5 * 1/6 ) * safezoneW";
      y = "( 5 * 1/6 ) * safezoneH";
      w = "1/6 * safezoneW";
      h = "1/6 * safezoneH";
      colorBackground[] = { 0,0,0,0.1 };
    };
  };
};
class Life_V3_ButtonMenu: RscButton
{
	style = "0xC0 + 0x00";
	shadow = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 28) * 1)";
	colorBackground[] = {"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_V3_BTBGF_R',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_G',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_B',0])", "(profilenamespace getvariable ['GUI_V3_BTBGF_A',0.7])"};
};

class Life_V3_RscProcessBar {
	type = 8;
	style = 0;
	texture = "";
	colorFrame[] = {"(profilenamespace getvariable ['GUI_V3_TXT_R',0])", "(profilenamespace getvariable ['GUI_V3_TXT_G',0])", "(profilenamespace getvariable ['GUI_V3_TXT_B',0])", "(profilenamespace getvariable ['GUI_V3_TXT_A',1])"};
	colorBar[] = {"(profilenamespace getvariable ['GUI_V3_PGB_R',1])", "(profilenamespace getvariable ['GUI_V3_PGB_G',1])", "(profilenamespace getvariable ['GUI_V3_PGB_B',1])", "(profilenamespace getvariable ['GUI_V3_PGB_A',0.8])"};
};

class Life_V3_RscProcessBarText: RscText
{
	shadow = 0;
	style = 2;
	colorText[] = {"(profilenamespace getvariable ['GUI_V3_PGT_R',0])", "(profilenamespace getvariable ['GUI_V3_PGT_G',0])", "(profilenamespace getvariable ['GUI_V3_PGT_B',0])", "(profilenamespace getvariable ['GUI_V3_PGT_A',1])"};
};
class Life_RscInvisibleButton {
	action = "";
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0,0,0,0};
	colorDisabled[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {0.95,0.60,0.25,0.3};
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	soundEnter[] = {"",0.09,1};
	soundPush[] = {"",0.09,1};
	soundClick[] = {"",0.07,1};
	soundEscape[] = {"",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = 0;
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};
class RscAppButton: RscButtonMenu
{
	type=16;
	style="0x02";
	period=1.2;
	periodFocus=1.2;
	periodOver=1.2;
	shadow=0;
	shortcuts[]={};
	textureNoShortcut="\A3\Ui_f\data\GUI\RscCommon\RscButtonMenuSteam\steam_ca.paa";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]=
	{
		"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBG_G',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBG_B',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"
	};
	colorBackgroundActive[]=
	{
		"(profilenamespace getvariable ['GUI_V3_BTBGF_R',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBGF_G',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBGF_B',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBGF_A',0.7])"
	};
	colorBackground2[]={255,255,255,0.050000001};
	colorBackgroundFocused[]={255,255,255,0.1};
	colorDisabled[]={1,1,1,0.25};
	colorDisabledSecondary[]={1,1,1,0.25};
	colorFocused[]=
	{
		"225/255",
		"65/255",
		"65/255",
		1
	};
	colorFocusedSecondary[]=
	{
		"225/255",
		"65/255",
		"65/255",
		1
	};
	colorText[]={1,1,1,1};
	color[]={1,1,1,1};
	color2[]=
	{
		"225/255",
		"65/255",
		"65/255",
		1
	};
	font="PuristaMedium";
	size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 28) * 1)";
	text="Text";
	colorSecondary[]={1,1,1,1};
	color2Secondary[]={0,0,0,1};
	fontSecondary="PuristaLight";
	sizeExSecondary="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	textSecondary="";
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.090000004,
		1
	};
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
		font="PuristaMedium";
	};
	class ShortcutPos
	{
		left=0;
		top=0;
		h=1;
		w=1;
	};
};


class Life_RscControlsGroup_TP_MarkersOnOff {
    type = 15;
    idc = -1;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    shadow = 0;
    style = 1024;

    class HScrollBar : RscScrollBar
    {
        height = 0.028;
    };

	class VScrollBar : RscScrollBar
	{
		width = 0.028;
	};

    class Controls {};
};
class RscAppButton1x1: RscAppButton
{
	w="6 * (0.025)";
	h="5 * (0.04)";
	textureNoShortcut="";
	text="";
	class ShortcutPos
	{
		left="(6 * (0.025)) * 0.25";
		top="(5 * (0.04)) * 0.15";
		w="(6 * (0.025)) * 0.5";
		h="(5 * (0.04)) * 0.5";
	};
	class TextPos
	{
		bottom=0;
		left=0;
		right=0;
		top="(5 * (0.04)) * 0.65";
	};
};
class Life_V3_ButtonMenuCentrText: Life_V3_ButtonMenu
{
	style="0x02";
	shadow=0;
	sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 28) * 1)";
	colorBackground[]=
	{
		"(profilenamespace getvariable ['GUI_V3_BTBG_R',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBG_G',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBG_B',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBG_A',0.7])"
	};
	colorBackgroundActive[]=
	{
		"(profilenamespace getvariable ['GUI_V3_BTBGF_R',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBGF_G',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBGF_B',0])",
		"(profilenamespace getvariable ['GUI_V3_BTBGF_A',0.7])"
	};
	class Attributes
	{
		align="center";
	};
};

class RRP_RscListBoxBigTiles {
	itemSpacing = 0.005;
	itemBackground[] = {1, 1, 1, 0.3};
	access = 0;
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	autoScrollSpeed = -1;
	colorBackground[] = {1,1,1,0};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorSelectRight[] = {0,0,0,1};
	colorShadow[]={0,0,0,0.5};
	colorText[] = {1,1,1,1};
	colorTextRight[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	font = "PuristaMedium";
	h = 0.3;
	maxHistoryDelay = 1;
	period = 1.2;
	rowHeight = "2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow = 0;
	sizeEx = "1 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	style = 16;
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	type = 5;
	w = 0.3;
	x = 0;
	y = 0;
	class List
	{
		colorBackground[]  = {1 , 1 , 1 , 0.2};
		colorBorder[] = { 1 , 1 , 1 , 1 };
	};
	class ListScrollBar {
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		autoScrollDelay = 5;
		autoScrollEnabled = 1;
		autoScrollRewind = 0;
		autoScrollSpeed = -1;
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		color[] = {1,1,1,1};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		height = 0;
		scrollSpeed = 0.06;
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		width = 0;
	};
};

class RRP_RscListBoxBigTiles_vInv : RRP_RscListBoxBigTiles
{
	font = "RobotoCondensed";
	sizeEx = "0.8 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	itemSpacing = 0.005;
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.26, 0.24, 0.31,1};
	colorSelectBackground[] = {1,1,1,0.8};
	colorSelectBackground2[] = {1,1,1,0.8};
};



	/*	Controls API

		RRP_background
		RRP_background_fade | Использовать в сочитании с lb,tree

		RRP_title
		RRP_RscEdit
		RRP_RscStructuredText
		RRP_RscListBox
		RRP_RscCombo
		RRP_RscXSliderH

		RRP_btn_interaction
		RRP_btn_blue
		RRP_btn_red
		RRP_btn_green
		RRP_btn_yellow
		RRP_btn_noLine

		RRP_btn_exit | старый вариант, картинка наятнута с помощью str text (не нужно использовать!)
		RRP_btn_exit_text | вместо картинки буква X
		RRP_btn_info

		true call RRPClient_gui_util_blur

		red     0.98, 0.01, 0.38
		blue    0.0, 0.92, 0.99
		bg      0.26, 0.24, 0.31,1
		bg dark 0.16, 0.16, 0.19,1
		grey    0.73, 0.72, 0.76
		yellow  0.98, 0.93, 0.0
		green   0.0, 1.0, 0.5
	*/
class RRP_progress : RscProgress {
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_PROGRESS;
	style = ST_HORIZONTAL;
	colorFrame[] = {0,0,0,0};
	colorBar[] = {0.0, 0.92, 0.99, 1};
	x = 0.025;
	y = 0.16;
	w = 0.9375;
	h = 0.12;
	shadow = 0;
	colorExtBar[] = { 0.73, 0.72, 0.76,1 };
	texture = "";
	colorBackground[] = {0.73, 0.72, 0.76,1};
}
class RRP_progressVertical : RscProgress {
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_PROGRESS;
	style = ST_VERTICAL;
	colorFrame[] = {0,0,0,0};
	colorBar[] = {0.0, 0.92, 0.99, 1};
	x = 0.025;
	y = 0.16;
	w = 0.9375;
	h = 0.12;
	shadow = 0;
	colorExtBar[] = { 0.73, 0.72, 0.76,1 };
	texture = "";
	colorBackground[] = {0.73, 0.72, 0.76,1};
}

class RRP_background : RscText
{
	colorBackground[] = {0.26, 0.24, 0.31,1};
};

class RRP_background_fade : RscText
{
	colorBackground[] = {0.26, 0.24, 0.31,0.8};
};

class RRP_title : RscText
{

	moving = 1;
	colorBackground[] = {0.16, 0.16, 0.19,1};
};

class RRP_RscText_centerText: RscText {
	font = "RobotoCondensedBold";
	class Attributes
	{
		align = "center";
		valign = "middle";
	};
};

class RRP_RscEdit: RscEdit
{
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.16, 0.16, 0.19};
	shadow = 0;
};

class RRP_RscEditMulti: RRP_RscEdit
{
	style=16;
};

class RRP_RscStructuredText: RscStructuredText
{
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	class Attributes {
		font = "RobotoCondensed";
        color = "#ffffff";
		align = "left";
		valign = "middle";
		shadow = 0;
	};
	class TextPos
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
};

class RRP_RscListBox: RscListBox
{
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.26, 0.24, 0.31,1};
	colorSelectBackground[] = {1,1,1,0.8};
	colorSelectBackground2[] = {1,1,1,0.8};
};
class RRP_RscListNBox: RscListNBox
{
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.26, 0.24, 0.31,1};
	colorSelectBackground[] = {1,1,1,0.8};
	colorSelectBackground2[] = {1,1,1,0.8};
};

class RRP_RscCombo: RscCombo
{
	colorText[] = {1,1,1,1};
	colorSelect[] = {1,1,1,1};
	colorBackground[] = {0.16, 0.16, 0.19, 1};
	colorSelectBackground[] = {0.26, 0.24, 0.31,1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {0.8,0.8,0.8,0.8};
	arrowEmpty = "\RRP_icons\UI\on.paa";
	arrowFull = "\RRP_icons\UI\off.paa";
};

class RRP_RscXSliderH : RscXSliderH {
	style = 1024;
	type = 43;
	shadow = 0;
	color[] = {1, 1, 1, 0.7};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.5};
	colorBackground[] = {0.16, 0.16, 0.19};
	colorSelectBackground[] = {0.16, 0.16, 0.19};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class RRP_btn_interaction: RscShortcutButton
{
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	color[] = {1,1,1,1};
	colorFocused[] = {0.0, 0.92, 0.99,1};
	color2[] = {0.98, 0.01, 0.38,1};
	colorDisabled[] = {0.89, 0.89, 0.89,0.8};
	colorBackground[] = {0.26, 0.24, 0.31,1};
	colorBackgroundFocused[] = {0.26, 0.24, 0.31,1};
	colorBackground2[] = {0.26, 0.24, 0.31,1};
	class TextPos
	{
		left = 0.007;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0;
		bottom = 0;
	};
};
class RRP_btn_blue : RscShortcutButton {
	animTextureDefault = "\RRP_icons\UI\buttonBlueDark.paa";
	animTextureNormal = "\RRP_icons\UI\buttonBlueDark.paa";
	animTextureDisabled = "\RRP_icons\UI\buttonGreyDark.paa";
	animTextureOver = "\RRP_icons\UI\buttonBlueDark.paa";
	animTextureFocused = "\RRP_icons\UI\buttonBlueDark.paa";
	animTexturePressed = "\RRP_icons\UI\buttonBlueLigth.paa";
	periodFocus = 0;
	periodOver = 0.1;
	period = 0;
	font = "RobotoCondensedBold";
	class Attributes
	{
		align="center";
		font = "RobotoCondensedBold";
	};
	class TextPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 4";
		right = 0;
		bottom = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 4";
	};
	color[] = {0.85,0.85,0.85,1};
	colorFocused[] = {1,1,1,1};
	color2[] = {1,1,1,1};
	colorDisabled[] = {0.51, 0.51, 0.51,1};

	colorBackground[] = {1,1,1,1};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,1};

	colorSecondary[] = {1,1,1,1};
	colorFocusedSecondary[] = {1,1,1,1};
	color2Secondary[] = {1,1,1,1};
	colorDisabledSecondary[] = {1,1,1,1};
};

class RRP_btn_red : RRP_btn_blue
{
	animTextureDefault = "\RRP_icons\UI\buttonRedDark.paa";
	animTextureNormal = "\RRP_icons\UI\buttonRedDark.paa";
	animTextureOver = "\RRP_icons\UI\buttonRedDark.paa";
	animTextureFocused = "\RRP_icons\UI\buttonRedDark.paa";
	animTexturePressed = "\RRP_icons\UI\buttonRedLigth.paa";
};
class RRP_btn_green : RRP_btn_blue
{
	animTextureDefault = "\RRP_icons\UI\buttonGreenDark.paa";
	animTextureNormal = "\RRP_icons\UI\buttonGreenDark.paa";
	animTextureOver = "\RRP_icons\UI\buttonGreenDark.paa";
	animTextureFocused = "\RRP_icons\UI\buttonGreenDark.paa";
	animTexturePressed = "\RRP_icons\UI\buttonGreenLigth.paa";
};
class RRP_btn_yellow : RRP_btn_blue
{
	animTextureDefault = "\RRP_icons\UI\buttonYellowDark.paa";
	animTextureNormal = "\RRP_icons\UI\buttonYellowDark.paa";
	animTextureOver = "\RRP_icons\UI\buttonYellowDark.paa";
	animTextureFocused = "\RRP_icons\UI\buttonYellowDark.paa";
	animTexturePressed = "\RRP_icons\UI\buttonYellowLigth.paa";
};
class RRP_btn_noLine : RRP_btn_blue {
	animTextureDefault = "\RRP_icons\UI\buttonDark.paa";
	animTextureNormal = "\RRP_icons\UI\buttonDark.paa";
	animTextureOver = "\RRP_icons\UI\buttonDark.paa";
	animTextureFocused = "\RRP_icons\UI\buttonDark.paa";
	animTexturePressed = "\RRP_icons\UI\buttonLight.paa";
};

class RRP_btn_exit : RRP_btn_interaction
{
	idc = -1;
	colorBackground[] = {0.98, 0.01, 0.38,1};
	colorDisabled[] = {0.98, 0.01, 0.38,1};
	colorBackgroundFocused[] = {0.98, 0.01, 0.38,1};
	colorBackground2[] = {0.98, 0.01, 0.38,1};
	colorFocused[] = {1,1,1,1};
	color2[] = {1,1,1,1};
	onLoad = "_this#0 ctrlSetStructuredText parseText '<t  size = ''1'' align = ''center'' shadow = ''0'' > <img image=''\RRP_icons\UI\exit.paa''/></t>' ;";
	onButtonClick = "closeDialog 0";
	class TextPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 4";
		right = 0;
		bottom = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 4";
	};
};

class RRP_btn_exit_text: RscButton
{	idc = -1;
	text = "X";
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	periodFocus = 0;
	periodOver = 0;
	period = 0;
	colorBackground[] = {0.98, 0.01, 0.38,1};
	color[] = {0.98, 0.01, 0.38,1};
	colorFocused[] = {0.98, 0.01, 0.38,1};
	color2[] = {0.98, 0.01, 0.38,1};
	colorDisabled[] = {0.98, 0.01, 0.38,1};
	onButtonClick = "closeDialog 0";
};

class RRP_btn_info : RRP_btn_interaction {
	idc = -1;
	colorBackground[] = {0.0, 0.92, 0.99,1};
	onLoad = "_this#0 ctrlSetStructuredText parseText '<t align = ''center'' shadow = ''0'' shadowOffset = ''0''> <img image=''buttons\info.paa''/></t>' ;";
	class TextPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 4";
		right = 0;
		bottom = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 4";
	};
};

class Life_RscButtonCenter : RscButtonMenu {
    style = 2;
};

class VRP_RscButtonClean : Life_RscButtonCenter {
    fade = 0;
	animTextureOver = "#(argb,8,8,3)color(0.6,0.6,0.6,0.8)";
    animTextureFocused = "#(argb,8,8,3)color(0.6,0.6,0.6,0.8)";
    animTexturePressed = "#(argb,8,8,3)color(0.6,0.6,0.6,0.8)";
    colorText[] = {1, 1, 1, 1};
	color2[] = {1, 1, 1, 1};
	colorFocused[] = {1, 1, 1, 1};
	colorBackgroundFocused[] = {0.2, 0.2, 0.2, 0.8};
    colorBackground[] = {0.15, 0.15, 0.15, 0.7};
	colorBackground2[] = {0.2, 0.2, 0.2, 0.8};
};

class VRP_ctrlAchievement : RscControlsGroupNoScrollbars {
    y = (1 * GUI_GRID_CENTER_H) / 2;
    x = (1 * GUI_GRID_CENTER_W) / 2;
    w = 5.885 * GUI_GRID_CENTER_W;
    h = 5.885 * GUI_GRID_CENTER_H;

    class Controls {
        class Background: RscText {
            idc = -1;
            colorBackground[] = FOOTER_COLOUR;
            w = 5.885 * GUI_GRID_CENTER_W;
            h = 5.885 * GUI_GRID_CENTER_H;
        };

        class AchievementIcon: RscPictureKeepAspect {
            idc = 101;
			text = "";
            w = 5.885 * GUI_GRID_CENTER_W;
            h = 4.885 * GUI_GRID_CENTER_H;
        };

        class AchievementName: RscStructuredText {
            idc = 102;
            colorBackground[] = HEADER_COLOUR;
            y = 4.885 * GUI_GRID_CENTER_H;
            w = 5.885 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
        };

        class Cover : RscText {
            idc = 103;
            colorBackground[] = { 0.06,0.06,0.06,0.9 };
            w = 5.885 * GUI_GRID_CENTER_W;
            h = 5.885 * GUI_GRID_CENTER_H;
        };
    };
};

class VRP_ctrlPerk : VRP_ctrlAchievement {
    class Controls : Controls {
        class Background : Background {};
        class PerkIcon : AchievementIcon {};
        class PerkName : AchievementName {};
        class SelectButton : VRP_RscButtonClean {
            idc = 104;
            colorBackground[] = {0, 0, 0, 0};
            y = 4.885 * GUI_GRID_CENTER_H;
            w = 5.885 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
        };
        class PerkLevel: RscStructuredText {
            idc = 105;
            colorBackground[] = HEADER_COLOUR;
            x = 4.32375 * GUI_GRID_CENTER_W;
            w = 1.57125 * GUI_GRID_CENTER_W;
            h = 1 * GUI_GRID_CENTER_H;
        };
        class Cover : Cover {};
    };
};
