class UnionDialogVehicleShopV2
{
	idd = 2300;
	name="UnionDialogVehicleShopV2";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = 	"false call RRPClient_hud_show; ctrlShow [2330,false];";
	onUnload = 	"true call RRPClient_hud_show; [_this select 0] call RRPClient_system_shopBoxDestroy;";

	class controlsBackground
	{
		class LeftBackground : RRP_background
		{
			idc = -1;

			x = 0.00256251 * safezoneW + safezoneX;
			y = 0.052 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.938 * safezoneH;
		};
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
		class Title : RRP_title {
			idc = 2301;
			text = "";
			x = 0.00283438 * safezoneW + safezoneX;
			y = 0.01138 * safezoneH + safezoneY;
			w = 0.984844 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class Cash : Title {
			idc = 601;
			style = 1;
			text = "";
			colorBackground[] = {0,0,0,0};
		};

		class CloseImage : RRP_btn_exit {
			idc = -1;
			x = 0.966434 * safezoneW + safezoneX;
			y = 0.01094 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class VehicleList : RRP_RscListBox {
			idc = 2302;
			text = "";
			onLBSelChanged = "_this call RRPClient_system_vehicleShopLBChange";

			x = 0.0065 * safezoneW + safezoneX;
			y = 0.3012 * safezoneH + safezoneY;
			w = 0.175875 * safezoneW;
			h = 0.5824 * safezoneH;
		};

		class ColorList : RRP_RscCombo	{
			idc = 2304;
			onLBSelChanged = "_this call RRPClient_system_vehicleShopColorLBChange";

			x = 0.0065 * safezoneW + safezoneX;
			y = 0.8892 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class MatList : RRP_RscCombo	{
			idc = 2305;
			onLBSelChanged = "_this call RRPClient_system_vehicleShopColorLBChange";

			x = 0.0065 * safezoneW + safezoneX;
			y = 0.92 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.028 * safezoneH;
		};

		class vehicleInfomationList : RRP_RscStructuredText {
			idc = 2303;
			text = "";

			x = 0.0065 * safezoneW + safezoneX;
			y = 0.0576 * safezoneH + safezoneY;
			w = 0.175874 * safezoneW;
			h = 0.238 * safezoneH;
		};

		class RentCar : RRP_btn_green {
			idc = 2309;
			text = "Купить $";
			onButtonClick = "[""buy""] spawn RRPClient_system_vehicleShopBuy;";

			x = safeZoneX + safeZoneW * 0.125625;
			y = safeZoneY + safeZoneH * 0.95777778;
			w = safeZoneW * 0.05625;
			h = safeZoneH * 0.03111112;
		};

		class BuyCar : RRP_btn_yellow {
			idc = 2310;
			text = "Купить RC";
			onButtonClick = "[""buyRC""] spawn RRPClient_system_vehicleShopBuy;";
			tooltip = "Приобрести машину за RCredits";
			x = safeZoneX + safeZoneW * 0.005625;
			y = safeZoneY + safeZoneH * 0.95777778;
			w = safeZoneW * 0.05625;
			h = safeZoneH * 0.03111112;
		};

		class RcredisCar : RRP_btn_green {
			idc = 2311;
			text = "Аренда";
			onButtonClick = "[""Rent""] spawn RRPClient_system_vehicleShopBuy;";

			x = safeZoneX + safeZoneW * 0.065625;
			y = safeZoneY + safeZoneH * 0.95777778;
			w = safeZoneW * 0.05625;
			h = safeZoneH * 0.03111112;
		};

		class donthaveCredist : RRP_RscStructuredText
		{
		    idc = 2312;
			text = "";
			x = safeZoneX + safeZoneW * 0.2675;
			y = safeZoneY + safeZoneH * 0.06444445;
			w = safeZoneW * 0.4675;
			h = safeZoneH * 0.15555556;
		};


	};
};
