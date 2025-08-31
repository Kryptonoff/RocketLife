class custom_inventory_move {
	idd = 1100;
	name="custom_inventory_move";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground {
		class CA_ContainerBackground: RscText
		{
			idc=1101;
			x=0.432365 * safezoneW + safezoneX;
			y=0.269087 * safezoneH + safezoneY;
			w=0.15 * safezoneW;
			h=0.151743 * safezoneH;
			colorBackground[]={0.05,0.05,0.05,0.7};
		};
		class TitleContainerBackground: RscText
		{
			idc=1102;
			style = "0x02";
			x=0.432573 * safezoneW + safezoneX;
			y=0.247095 * safezoneH + safezoneY;
			w=0.15 * safezoneW;
			h=0.0219917 * safezoneH;
			colorBackground[]={0.1,0.1,0.1,1};
		};
	};
	class controls {
		class ButtonBack: RscActiveText
		{
			idc=2;
			style=48;
			color[]={1,1,1,0.7};
			text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			x=0.570757 * safezoneW + safezoneX;
			y=0.247095 * safezoneH + safezoneY;
			w=0.0124865 * safezoneW;
			h=0.0219917 * safezoneH;
			colorText[]={1,1,1,0.7};
			colorActive[]={1,1,1,1};
			tooltip="$STR_DISP_CLOSE";
		};


		class HintText: RscStructuredText
		{
			idc=1103;
			x=0.437567 * safezoneW + safezoneX;
			y=0.280083 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;
		};

		class AmountSlider: RscXSliderH
		{
			idc=1104;
			x=0.437567 * safezoneW + safezoneX;
			y=0.313831 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;
		};

		class AmountText: RscStructuredText
		{
			idc=1105;
			x=0.437567 * safezoneW + safezoneX;
			y=0.347221 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;
		};

		class MoveButton: RscButton
		{
			idc=1106;
			x=0.437567 * safezoneW + safezoneX;
			y=0.387573 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;
		};
	};
};
class custom_inventory {
	idd = 1000;
	name="custom_inventory";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";
	
	onUnload = "_this call RRPClient_inventory_onUnload";
	onMouseButtonUp = "_this spawn RRPClient_inventory_dragStop";
	class controlsBackground {
		class CA_ContainerBackground: RscText
		{
			idc=1001;
			x=0.262756 * safezoneW + safezoneX;
			y=0.269087 * safezoneH + safezoneY;
			w=0.15 * safezoneW;
			h=0.483818 * safezoneH;
			colorBackground[]={0.05,0.05,0.05,0.7};
		};
		class CA_PlayerBackground: RscText
		{
			idc=1002;
			x=0.432573 * safezoneW + safezoneX;
			y=0.269087 * safezoneH + safezoneY;
			w=0.34025 * safezoneW;
			h=0.483818 * safezoneH;
			colorBackground[]={0.05,0.05,0.05,0.7};
		};
		class TitleContainerBackground: RscText
		{
			idc=1019;
			style = "0x02";
			x=0.262757 * safezoneW + safezoneX;
			y=0.247095 * safezoneH + safezoneY;
			w=0.15 * safezoneW;
			h=0.0219917 * safezoneH;

			sizeEx = 0.022 * safezoneH;
			colorBackground[]={0.1,0.1,0.1,1};
		};
		class TitlePlayerBackground: RscText
		{
			idc=1020;
			style = "0x02";
			x=0.432573 * safezoneW + safezoneX;
			y=0.247095 * safezoneH + safezoneY;
			w=0.34 * safezoneW;
			h=0.0219917 * safezoneH;
			
			sizeEx = 0.022 * safezoneH;
			colorBackground[]={0.1,0.1,0.1,1};
		};
		class BackgroundSlotPrimary: RscPicture
		{
			idc=1242;
			text = "";
			x=0.582411 * safezoneW + safezoneX;
			y=0.357054 * safezoneH + safezoneY;
			w=0.14859 * safezoneW;
			h=0.0659752 * safezoneH;
		};
		class BackgroundSlotPrimaryMuzzle: BackgroundSlotPrimary
		{
			idc=1243;
			x=0.582411 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotPrimaryUnderBarrel: BackgroundSlotPrimary
		{
			idc=1200;
			x=0.607384 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotPrimaryFlashlight: BackgroundSlotPrimary
		{
			idc=1244;
			x=0.632357 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotPrimaryOptics: BackgroundSlotPrimary
		{
			idc=1245;
			x=0.65733 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotPrimaryMagazineGL: BackgroundSlotPrimary
		{
			idc=1267;
			x=0.682304 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotPrimaryMagazine: BackgroundSlotPrimary
		{
			idc=1246;
			x=0.707277 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotSecondary: BackgroundSlotPrimary
		{
			idc=1247;
			x=0.582411 * safezoneW + safezoneX;
			y=0.478008 * safezoneH + safezoneY;
			w=0.14859 * safezoneW;
			h=0.0659752 * safezoneH;
		};
		class BackgroundSlotSecondaryMuzzle: BackgroundSlotPrimary
		{
			idc=1248;
			x=0.582411 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotSecondaryUnderBarrel: BackgroundSlotPrimary
		{
			idc=1266;
			x=0.612379 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotSecondaryFlashlight: BackgroundSlotPrimary
		{
			idc=1249;
			x=0.642347 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotSecondaryOptics: BackgroundSlotPrimary
		{
			idc=1250;
			x=0.672314 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotSecondaryMagazine: BackgroundSlotPrimary
		{
			idc=1251;
			x=0.702282 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotHandgun: BackgroundSlotPrimary
		{
			idc=1252;
			x=0.582411 * safezoneW + safezoneX;
			y=0.598963 * safezoneH + safezoneY;
			w=0.14859 * safezoneW;
			h=0.0659752 * safezoneH;
		};
		class BackgroundSlotHandgunMuzzle: BackgroundSlotPrimary
		{
			idc=1253;
			x=0.582411 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotHandgunUnderBarrel: BackgroundSlotPrimary
		{
			idc=1268;
			x=0.612379 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotHandgunFlashlight: BackgroundSlotPrimary
		{
			idc=1254;
			x=0.642347 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotHandgunOptics: BackgroundSlotPrimary
		{
			idc=1255;
			x=0.672314 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};
		class BackgroundSlotHandgunMagazine: BackgroundSlotPrimary
		{
			idc=1256;
			x=0.702282 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
		};

		class BackgroundSlotUniform: BackgroundSlotPrimary
		{
			idc=6332;
			x=0.583244 * safezoneW + safezoneX;
			y=0.28 * safezoneH + safezoneY;
			w=0.0374596 * safezoneW;
			h=0.0659752 * safezoneH;
		};

		class BackgroundSlotVest: BackgroundSlotPrimary
		{
			idc=6382;
			x=0.6378725 * safezoneW + safezoneX;
			y=0.28 * safezoneH + safezoneY;
			w=0.0374596 * safezoneW;
			h=0.0659752 * safezoneH;
		};

		class BackgroundSlotBackpack: BackgroundSlotPrimary
		{
			idc=6192;
			x=0.692501 * safezoneW + safezoneX;
			y=0.28 * safezoneH + safezoneY;
			w=0.0374596 * safezoneW;
			h=0.0659752 * safezoneH;
		};

		class BackgroundSlotHeadgear: BackgroundSlotUniform
		{
			idc=1257;
			x=0.739325 * safezoneW + safezoneX;
			y=0.28 * safezoneH + safezoneY;
			w=0.0225 * safezoneW;
			h=0.0425 * safezoneH;
		};
		class BackgroundSlotGoggles: BackgroundSlotHeadgear
		{
			idc=1258;
			y=0.328667 * safezoneH + safezoneY;
		};
		class BackgroundSlotHMD: BackgroundSlotHeadgear
		{
			idc=1259;
			y=0.377334 * safezoneH + safezoneY;
		};
		class BackgroundSlotBinoculars: BackgroundSlotHeadgear
		{
			idc=1260;
			y=0.426001 * safezoneH + safezoneY;
		};
		class BackgroundSlotMap: BackgroundSlotHeadgear
		{
			idc=1261;
			y=0.474668 * safezoneH + safezoneY;
		};
		class BackgroundSlotGPS: BackgroundSlotHeadgear
		{
			idc=1262;
			y=0.523335 * safezoneH + safezoneY;
		};
		class BackgroundSlotCompass: BackgroundSlotHeadgear
		{
			idc=1263;
			y=0.572002 * safezoneH + safezoneY;
		};
		class BackgroundSlotRadio: BackgroundSlotHeadgear
		{
			idc=1264;
			y=0.620669 * safezoneH + safezoneY;
		};
		class BackgroundSlotWatch: BackgroundSlotHeadgear
		{
			idc=1265;
			y=0.669336 * safezoneH + safezoneY;
		};

		class ExternalContainerBackground: RscPicture
		{
			colorText[]={1,1,1,0.1};
			text = "";
			idc=1240;
			x=0.268999 * safezoneW + safezoneX;
			y=0.306473 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.404648 * safezoneH;
		};
		class PlayerContainerBackground: ExternalContainerBackground
		{
			idc=1241;
			x=0.438816 * safezoneW + safezoneX;
			y=0.306473 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.404648 * safezoneH;
		};
	};
	class controls
	{

		class ButtonBack: RscActiveText
		{
			idc=2;
			style=48;
			color[]={1,1,1,0.7};
			text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			x=0.760136 * safezoneW + safezoneX;
			y=0.247095 * safezoneH + safezoneY;
			w=0.0124865 * safezoneW;
			h=0.0219917 * safezoneH;
			colorText[]={1,1,1,0.7};
			colorActive[]={1,1,1,1};
			tooltip="$STR_DISP_CLOSE";
		};
		class GroundContainer: RscListBox
		{
			idc=632;
			sizeEx=0.0176 * safezoneH;
			sizeEx2=0.0176 * safezoneH;
			rowHeight=0.033 * safezoneH;
			canDrag=1;
			colorText[]={1,1,1,1};
			colorBackground[]={0,0,0,0};
			itemBackground[]={1,1,1,0.6};
			itemSpacing=0.001;
			x=0.268999 * safezoneW + safezoneX;
			y=0.306473 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.404648 * safezoneH;
		};
		class BackpackContainer: GroundContainer
		{
			idc=619;
			x=0.438816 * safezoneW + safezoneX;
			y=0.306473 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.404648 * safezoneH;
			selectWithRMB = 1;
		};
		
		class GroundFilter: RscCombo
		{
			idc=6554;
			x=0.268999 * safezoneW + safezoneX;
			y=0.282282 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;

			onLBSelChanged = "_this call RRPClient_inventory_filterExternal";

			sizeEx = 0.0183333 * safezoneH;	
		};
		class BackpackFilter: RscCombo
		{
			idc=6555;
			x=0.437567 * safezoneW + safezoneX;
			y=0.282282 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;

			onLBSelChanged = "_this call RRPClient_inventory_filterBackpack";

			sizeEx = 0.0183333 * safezoneH;	
		};
		
		class GroundAllButton: RscButton
		{
			idc=6556;
			text = "Взять всё";
			x=0.268999 * safezoneW + safezoneX;
			y=0.76 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;

			onButtonClick = "[] spawn RRPClient_inventory_removeAllItemsFromGround";

			sizeEx = 0.0183333 * safezoneH;	
		};
		class Ground1Button: RscButton
		{
			idc=6558;
			text = "";
			x=0.268999 * safezoneW + safezoneX;
			y=0.79 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;

			onButtonClick = "";
			show = 0;

			sizeEx = 0.0183333 * safezoneH;	
		};
		class BackpackAllButton: RscButton
		{
			idc=6557;
			text = "Выложить всё";
			x=0.437567 * safezoneW + safezoneX;
			y=0.76 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;

			onButtonClick = "[] spawn RRPClient_inventory_removeAllItemsFromInventory";

			sizeEx = 0.0183333 * safezoneH;	
		};
		class Backpack1Button: RscButton
		{
			idc=6559;
			text = "";
			x=0.437567 * safezoneW + safezoneX;
			y=0.79 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.0219917 * safezoneH;

			onButtonClick = "";
			show = 0;

			sizeEx = 0.0183333 * safezoneH;	
		};

		class GroundLoad: RscProgress
		{
			idc=6307;
			texture="";
			textureExt="";
			colorBar[]={0.89999998,0.89999998,0.89999998,0.89999998};
			colorExtBar[]={1,1,1,1};
			colorFrame[]={1,1,1,1};
			x=0.268999 * safezoneW + safezoneX;
			y=0.719917 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.010995 * safezoneH;
		}
		class GroundLoadVirt: GroundLoad
		{
			idc=63071;
			x=0.268999 * safezoneW + safezoneX;
			y=0.735311 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.010995 * safezoneH;

			colorBar[] = {0,0.5,1,1};
		};
		class GroundLoadVirtText: RscText
		{
			idc=63072;
			style = "0x02";
			x=0.268999 * safezoneW + safezoneX;
			y=0.735311 * safezoneH + safezoneY;
			w=0.137352 * safezoneW;
			h=0.010995 * safezoneH;

			sizeEx = 0.015 * safezoneH;
		};
		class TotalLoad: GroundLoad
		{
			idc=6308;
			x=0.438816 * safezoneW + safezoneX;
			y=0.719917 * safezoneH + safezoneY;
			w=0.327564 * safezoneW;
			h=0.010995 * safezoneH;
		};
		class TotalLoadVirt: GroundLoad
		{
			idc=63081;
			x=0.438816 * safezoneW + safezoneX;
			y=0.735311 * safezoneH + safezoneY;
			w=0.327564 * safezoneW;
			h=0.010995 * safezoneH;

			colorBar[] = {0,0.5,1,1};
		};
		class TotalLoadVirtText: RscText
		{
			idc=63082;
			style = "0x02";
			x=0.438816 * safezoneW + safezoneX;
			y=0.735311 * safezoneH + safezoneY;
			w=0.327564 * safezoneW;
			h=0.010995 * safezoneH;

			sizeEx = 0.015 * safezoneH;
		};

		class SlotPrimary: RscActiveText
		{
			idc=610;
			style="0x30 + 0x800";
			color[]={1,1,1,1};
			colorBackground[]={1,1,1,0.1};
			colorBackgroundSelected[]={1,1,1,1};
			colorFocused[]={1,1,1,0};
			colorActive[] = {1, 1, 1, 1};
			soundDoubleClick[]= {"",0.1,1};
			canDrag=1;
			x=0.582411 * safezoneW + safezoneX;
			y=0.357054 * safezoneH + safezoneY;
			w=0.14859 * safezoneW;
			h=0.0659752 * safezoneH;
			colorText[]={0,0,0,0.5};

			onMouseButtonDown = "_this spawn RRPClient_inventory_drag";
		};
		class SlotPrimaryMuzzle: SlotPrimary
		{
			idc=620;
			x=0.582411 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryUnderBarrel: SlotPrimary
		{
			idc=641;
			x=0.607384 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryFlashlight: SlotPrimary
		{
			idc=622;
			x=0.632357 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryOptics: SlotPrimary
		{
			idc=621;
			x=0.65733 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryMagazineGL: SlotPrimary
		{
			idc=644;
			x=0.682304 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryMagazine: SlotPrimary
		{
			idc=623;
			x=0.707277 * safezoneW + safezoneX;
			y=0.425228 * safezoneH + safezoneY;
			w=0.0237244 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotPrimaryMagazineText: RscStructuredText
		{
			idc=6231;
			
			x=0.698 * safezoneW + safezoneX;
			y=0.368 * safezoneH + safezoneY;
			w=0.0358 * safezoneW;
			h=0.025 * safezoneH;

			size = 0.02 * safezoneH;
		};
		class SlotSecondary: SlotPrimary
		{
			idc=611;
			x=0.582411 * safezoneW + safezoneX;
			y=0.478008 * safezoneH + safezoneY;
			w=0.14859 * safezoneW;
			h=0.0659752 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryMuzzle: SlotPrimary
		{
			idc=624;
			x=0.582411 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryUnderBarrel: SlotPrimary
		{
			idc=642;
			x=0.612379 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryFlashlight: SlotPrimary
		{
			idc=626;
			x=0.642347 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryOptics: SlotPrimary
		{
			idc=625;
			x=0.672314 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryMagazine: SlotPrimary
		{
			idc=627;
			x=0.702282 * safezoneW + safezoneX;
			y=0.546183 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotSecondaryMagazineText: RscStructuredText
		{
			idc=6271;
			
			x=0.698 * safezoneW + safezoneX;
			y=0.4868 * safezoneH + safezoneY;
			w=0.0358 * safezoneW;
			h=0.025 * safezoneH;

			size = 0.02 * safezoneH;
		};
		class SlotHandgun: SlotPrimary
		{
			idc=612;
			x=0.582411 * safezoneW + safezoneX;
			y=0.598963 * safezoneH + safezoneY;
			w=0.14859 * safezoneW;
			h=0.0659752 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunMuzzle: SlotPrimary
		{
			idc=628;
			x=0.582411 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunUnderBarrel: SlotPrimary
		{
			idc=643;
			x=0.612379 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunFlashlight: SlotPrimary
		{
			idc=630;
			x=0.642347 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunOptics: SlotPrimary
		{
			idc=629;
			x=0.672314 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunMagazine: SlotPrimary
		{
			idc=631;
			x=0.702282 * safezoneW + safezoneX;
			y=0.667137 * safezoneH + safezoneY;
			w=0.028719 * safezoneW;
			h=0.0439835 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotHandgunMagazineText: RscStructuredText
		{
			idc=6311;
			
			x=0.698 * safezoneW + safezoneX;
			y=0.61 * safezoneH + safezoneY;
			w=0.0358 * safezoneW;
			h=0.025 * safezoneH;

			size = 0.02 * safezoneH;
		};

		class UniformSlot: SlotPrimary
		{
			idc=6331;
			x=0.583244 * safezoneW + safezoneX;
			y=0.28 * safezoneH + safezoneY;
			w=0.0374596 * safezoneW;
			h=0.0659752 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class VestSlot: SlotPrimary
		{
			idc=6381;
			x=0.6378725 * safezoneW + safezoneX;
			y=0.28 * safezoneH + safezoneY;
			w=0.0374596 * safezoneW;
			h=0.0659752 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class BackpackSlot: SlotPrimary
		{
			idc=6191;
			x=0.692501 * safezoneW + safezoneX;
			y=0.28 * safezoneH + safezoneY;
			w=0.0374596 * safezoneW;
			h=0.0659752 * safezoneH;
			colorText[]={0,0,0,0.5};
		};

		class SlotHeadgear: SlotPrimary
		{
			idc=6240;
			x=0.739325 * safezoneW + safezoneX;
			y=0.28 * safezoneH + safezoneY;
			w=0.0225 * safezoneW;
			h=0.0425 * safezoneH;
			colorText[]={0,0,0,0.5};
		};
		class SlotGoggles: SlotHeadgear
		{
			idc=6216;
			y=0.328667 * safezoneH + safezoneY;
		};
		class SlotHMD: SlotHeadgear
		{
			idc=6217;
			y=0.377334 * safezoneH + safezoneY;
		};
		class SlotBinoculars: SlotHeadgear
		{
			idc=6238;
			y=0.426001 * safezoneH + safezoneY;
		};
		class SlotMap: SlotHeadgear
		{
			idc=6211;
			y=0.474668 * safezoneH + safezoneY;
		};
		class SlotGPS: SlotHeadgear
		{
			idc=6215;
			y=0.523335 * safezoneH + safezoneY;
		};
		class SlotCompass: SlotHeadgear
		{
			idc=6212;
			y=0.572002 * safezoneH + safezoneY;
		};
		class SlotRadio: SlotHeadgear
		{
			idc=6214;
			y=0.620669 * safezoneH + safezoneY;
		};
		class SlotWatch: SlotHeadgear
		{
			idc=6213;
			y=0.669336 * safezoneH + safezoneY;
		};//0.00616/(0,669336 - (0,28+(0,0425 * 8))) / 8
		/*class ContainerMarker: GroundTab
		{
			idc=6325;
			x="0 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="24 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GroundMarker: ContainerMarker
		{
			idc=6385;
			x="1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="24 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SoldierMarker: ContainerMarker
		{
			idc=6405;
			x="3 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="24 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};*/
	};
};