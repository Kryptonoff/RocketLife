class PerksGroup: SlideTab
{
	idc = 42000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class back: MainMenuButton
		{
			idc = 42001;
		};
		class group: RscControlsGroup
		{
			idc = 42002;
			x = 0.00205792 * safezoneW;
			y = 0.0770068 * safezoneH;
			w = 0.398207 * safezoneW;
			h = 0.448847 * safezoneH;
			class controls {};
		};
		class LevelText: AppRscStructuredText
		{
			idc = 42003;
			text = "<t size='.9'><t align='left'>Level:</t><t align ='right'>1</t></t>";
			x = 0.00308671 * safezoneW;
			y = 0.00880112 * safezoneH;
			w = 0.117304 * safezoneW;
			h = 0.0220015 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class PrestigeLevelText: AppRscStructuredText
		{
			idc = 42004;
			text = "<t size='.9'><t align='left'>Prestige Level:</t><t align ='right'>0</t></t>";
			x = 0.00308671 * safezoneW;
			y = 0.044004 * safezoneH;
			w = 0.117304 * safezoneW;
			h = 0.0220015 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class PerkLimitsText: AppRscStructuredText
		{
			idc = 42005;
			text = "<t size='.9'><t align='left'>Active Perks:</t><t align ='right'>0/3</t></t>";
			x = 0.280906 * safezoneW;
			y = 0.0110013 * safezoneH;
			w = 0.117304 * safezoneW;
			h = 0.0220015 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class ActivatePrestige: AppTabletButton
		{
			idc = 42006;
			text = "<t size='0.8'>Активировать престиж</t>";
			onButtonClick = "_this call RRPClient_perks_prestige";
			x = 0.140967 * safezoneW;
			y = 0.0451752 * safezoneH;
			w = 0.117304 * safezoneW;
			h = 0.0220015 * safezoneH;
		};
		class XpNextText: AppRscStructuredText
		{
			idc = 42007;
			text = "<t size='.9'><t align='left'>To Next Level:</t><t align ='right'>1358 XP</t></t>";
			x = 0.140967 * safezoneW;
			y = 0.0110013 * safezoneH;
			w = 0.119362 * safezoneW;
			h = 0.0220015 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class BuyXp: AppTabletButton
		{
			idc = 42008;
			text = "<t size='0.8'>SaveTime</t>";
			onButtonClick = "[] spawn RRPClient_perks_buyXp";
			x = 0.280906 * safezoneW;
			y = 0.0451752 * safezoneH;
			w = 0.117304 * safezoneW;
			h = 0.0220015 * safezoneH;
		};

	};
};