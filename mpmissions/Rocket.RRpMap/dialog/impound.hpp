
class RRPDialogGarageStore
{
	idd = 27100;
	name="RRPDialogGarageStore";
	movingEnable=-1;
	enableSimulation=1;
	onLoad="uiNamespace setVariable ['RRPDialogGarageStore', _this select 0];";
	onUnload="uiNamespace setVariable ['RRPDialogGarageStore', displayNull];";
	onDestroy="uiNamespace setVariable ['RRPDialogGarageStore', displayNull];";

	class controls
	{
		class controlGroup: RscControlsGroupNoScrollbars
		{
			idc = 27101;

			x="((safeZoneX) + 	0 * (pixelW * pixelGrid * 0.50) + 	((1920 / 4.5)) * (0 + (31 / 4.5) / (1920 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - ((	((1080 / 4.5)) / 2 + 	0 * 2) - (	((1080 / 4.5)) * (0 + (285 / 4.5) / (1080 / 4.5)) + 	0)) * (pixelH * pixelGrid * 0.50))";
			w="0.204258 * safezoneW";
			h="0.451691 * safezoneH";
			class Controls
			{
				class background: RRP_background_fade
				{
					idc = 27102;
                    x = 0 * safezoneW;
                    y = 0.0157407 * safezoneH;
                    w = 0.204123 * safezoneW;
                    h = 0.436016 * safezoneH;
				};
				class title: RRP_title
				{
					idc = 27103;
					text = "Техника рядом"; //--- ToDo: Localize;
                    x = 0 * safezoneW;
                    y = 0 * safezoneH;
                    w = 0.204416 * safezoneW;
                    h = 0.0220702 * safezoneH;
				};
				class VehicleList: RRP_RscListBoxBigTiles_vInv
				{
					idc = 27104;
                    x = 0.00159665 * safezoneW;
                    y = 0.02794 * safezoneH;
                    w = 0.201094 * safezoneW;
                    h = 0.374 * safezoneH;
					onLBDblClick = "_this call RRPClient_garage_store";
					onLBSelChanged = "_this call RRPClient_garage_store_onClick";
				};
				class storeBtn: RRP_btn_blue
				{
					idc = 27105;
					text = "Поставить в гараж"; //--- ToDo: Localize;
                    x = 0.00165 * safezoneW;
                    y = 0.41294 * safezoneH;
                    w = 0.199973 * safezoneW;
                    h = 0.0339962 * safezoneH;
					onButtonClick = "_this call RRPClient_garage_store";
				};
			};
		};
	};
};

class Garage_Edit: RRP_RscEdit
{
	type = 2;
	text = "";
	w = 0.0375;
	h = 0.06;
	maxChars = 1;
	colorFrame[]={0,0,0,0};
};


class RRPDialogGarage
{
	idd = 27000;
	name="RRPDialogGarage";
	movingEnable=-1;
	enableSimulation=1;
	onLoad="uiNamespace setVariable ['RRPDialogGarage', _this select 0];";
	onUnload="call RRPClient_garage_onUnload";
	onDestroy="call RRPClient_garage_onUnload";
	class controlsBackground
	{
		class mouseArea: RscText
		{
			text = "";
			idc = 9999;
			style=16;
			x="safezoneX";
			y="safezoneY";
			w="safezoneW";
			h="safezoneH";
		};

	};
	class controls 
	{
		class MainGroup: RscControlsGroupNoScrollbars
		{
			idc=27001;
			x="((safeZoneX) + 	0 * (pixelW * pixelGrid * 0.50) + 	((1920 / 4.5)) * (0 + (35 / 4.5) / (1920 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - ((	((1080 / 4.5)) / 2 + 	0 * 2) - (	((1080 / 4.5)) * (0 + (137 / 4.5) / (1080 / 4.5)) + 	0)) * (pixelH * pixelGrid * 0.50))";
			w=0.495169;
			h=1.17552;
			class controls
			{
                class background : RRP_background_fade
                {
                    idc = 27002;
                    x = 0;
                    y = 0;
                    w = 0.494567;
                    h = 1.12661;
                };
				class Title: RRP_title
				{
					idc = 27003;
					text = "Гараж"; //--- ToDo: Localize;
					x = 0;
					y = 0;
					w = 0.495649;
					h = 0.04;
				};
                class findEdit: RRP_RscEdit
                {
                    idc = 27004;
					text = "Быстрый поиск...";
                    x = 0.009;
                    y = 0.0488;
                    w = 0.475;
                    h = 0.04;
					onKeyDown = "_this call RRPClient_garage_finder";
                };
                class listVehicle: RRP_RscListBox
                {
                    idc = 27005;
					x = 0.009;
					y = 0.1088;
					w = 0.475;
					h = 0.644;
					onLbSelChanged = "_this call RRPClient_garage_onClick";
                };
				class ButtonsGroup: RscControlsGroupNoScrollbars
				{
					idc = 27006;
                    x = 0;
                    y = 0.8088;
                    w = 0.494567;
                    h = 0.318189;
					class Controls
					{
						class keySelectBox: RRP_RscCombo
						{
							idc = 27008;
                            x = 0.3125;
                            y = 0.24;
                            w = 0.175;
                            h = 0.06;
						};
						class retrieveBtn: RRP_btn_blue
						{
							idc = 27009;
                  			text = "Забрать транспорт"; //--- ToDo: Localize;
                            x = 0.0125;
                            y = 0.24;
                            w = 0.2875;
                            h = 0.06;
							onButtonClick = "_this call RRPClient_garage_retrieve";
						};
                        class plateFrame: RRP_RscFrame
                        {
                            idc = 27010;
                            text = " Номера "; //--- ToDo: Localize;
                            x = 0.0125;
                            y = 0.02;
                            w = 0.475;
                            h = 0.2;
							sizeEx = 0.8 * GUI_GRID_H;
                        };
                        class s1: Garage_Edit
                        {
                            idc = 27011;
                            x = 0.025;
                            y = 0.06;
                        };
                        class s2: Garage_Edit
                        {
                            idc = 27012;
                            x = 0.075;
                            y = 0.06;
                        };
                        class n1: Garage_Edit
                        {
                            idc = 27013;
                            x = 0.1625;
                            y = 0.06;
                        };
                        class n2: Garage_Edit
                        {
                            idc = 27014;
                            x = 0.2125;
                            y = 0.06;
                        };
                        class n3: Garage_Edit
                        {
                            idc = 27015;
                            x = 0.2625;
                            y = 0.06;
                        };
                        class n4: Garage_Edit
                        {
                            idc = 27016;
                            x = 0.3125;
                            y = 0.06;
                        };
                        class s3: Garage_Edit
                        {
                            idc = 27017;
                            x = 0.3875;
                            y = 0.06;
                        };
                        class s4: Garage_Edit
                        {
                            idc = 27018;
                            x = 0.4375;
                            y = 0.06;
                        };
						class set_new_plate_button: RRP_btn_yellow
						{
							idc = 27019;
							text = "Купить номера"; //--- ToDo: Localize;
							x = 0.025;
							y = 0.14;
							w = 0.45;
							h = 0.06;
							onButtonClick = "_this call RRPClient_garage_setPlate";
						};
					};
				};
				
				class progressFillGarageText: RRP_RscStructuredText
				{
					idc = 27120;
					x = 0.009;
					y = 0.7608;
					w = 0.475;
					h = 0.036;
					text = "";
				};
				class progressFillGarage: progressFillGarageText
				{
					idc = 27121;
					text = "";
				};
			};
		};
		class DescriptionGroup: RscControlsGroupNoScrollbars
		{
			idc=27020;
			x="(((safeZoneX + safeZoneW) ) - 	0 * (pixelW * pixelGrid * 0.50) - 	((1920 / 4.5)) * (pixelW * pixelGrid * 0.50) + 	((1920 / 4.5)) * (0 + (1511 / 4.5) / (1920 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - ((	((1080 / 4.5)) / 2 + 	0 * 2) - (	((1080 / 4.5)) * (0 + (149 / 4.5) / (1080 / 4.5)) + 	0)) * (pixelH * pixelGrid * 0.50))";
			w=0.449275;
			h=1.12721;
			class controls 
			{
				class background: RRP_background_fade
				{
					idc = 27022;
					x = 0;
					y = 0;
					w = 0.449058;
					h = 1.1268;
				};
				class title: RRP_title
				{
					idc = 27021;
					text = "Описание"; //--- ToDo: Localize;
					x = -0.000180006;
					y = -0.001266;
					w = 0.449724;
					h = 0.04;
				};
				class description_text: RRP_RscStructuredText
				{
					idc = 27023;
					text = "";
					x = 0.00524998;
					y = 0.0496;
					w = 0.439551;
					h = 0.0909453;
					colorBackground[] = {0.26, 0.24, 0.31,1};
				};
				class sell: RRP_btn_red
				{
					idc = 27024;
					text = "Продать"; //--- ToDo: Localize;
					x = 0.00524998;
					y = 1.0496;
					w = 0.4375;
					h = 0.06;
					onButtonClick = "_this call RRPClient_garage_sell";
				};
			};
		};
	};
};
