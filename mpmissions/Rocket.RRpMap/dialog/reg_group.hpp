class RRPDialogOrgCreate
{
	idd = 25000;
	onLoad = "uiNamespace setVariable ['RRPDialogOrgCreate', _this select 0]";
	onUnload = "uiNamespace setVariable ['RRPDialogOrgCreate', displayNull]";
	class controlsBackground
	{
		class background: RscText
		{
			idc = -1;
			x = 0.350814 * safezoneW + safezoneX;
			y = 0.269085 * safezoneH + safezoneY;
			w = 0.298373 * safezoneW;
			h = 0.439838 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
	};
	class controls
	{
		class description: RscStructuredText
		{
			idc = 25001;

		};
		class NameEdit: RscEdit
		{
			idc = 25002;
			text = "Name Organization"; //--- ToDo: Localize;
			x = 0.386824 * safezoneW + safezoneX;
			y = 0.620955 * safezoneH + safezoneY;
			w = 0.226352 * safezoneW;
			h = 0.0329878 * safezoneH;
		};
		class Buy: RscButtonMenu
		{
			idc = 25003;
			text = "Buy Organization";
			x = 0.386824 * safezoneW + safezoneX;
			y = 0.664939 * safezoneH + safezoneY;
			w = 0.226352 * safezoneW;
			h = 0.0329878 * safezoneH;
			onButtonClick = "call RRPClient_groups_createGroupRequest";
		};
	};
};
