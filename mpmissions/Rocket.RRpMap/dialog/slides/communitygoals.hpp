class CommunityGoals: SlideTab
{
	idc = 19000;
	x = 0;
	y = 0;
	class Controls
	{
		class backButton: MainMenuButton
		{
			idc = 19001;
		};
		class Goals: AppRscListBox2
		{
			idc = 19002;
			x = 0.0051429 * safezoneW;
			y = 0.0109616 * safezoneH;
			w = 0.0773495 * safezoneW;
			h = 0.560824 * safezoneH;
		};
		class GoalDescription: AppRscStructuredText
		{
			idc = 19003;
			rowHeight = 0.08;

			x = 0.0866291 * safezoneW;
			y = 0.0109964 * safezoneH;
			w = 0.216579 * safezoneW;
			h = 0.03299 * safezoneH;
		};
		class GoalParameters: AppRscStructuredText
		{
			idc = 19004;
			x = 0.0871391 * safezoneW;
			y = 0.0571641 * safezoneH;
			w = 0.216579 * safezoneW;
			h = 0.175934 * safezoneH;
		};
		class GoalRewardsStructureTitle: RRP_title
		{
			idc = 19005;
			text = "Уровни наград";
			x = 0.0871391 * safezoneW;
			y = 0.244107 * safezoneH;
			w = 0.216579 * safezoneW;
			h = 0.03299 * safezoneH;
		};
		class GoalRewardsStructure: AppRscTree
		{
			idc = 19006;
			x = 0.0871391 * safezoneW;
			y = 0.277092 * safezoneH;
			w = 0.216579 * safezoneW;
			h = 0.182531 * safezoneH;
		};
		class GoalProgress: RRP_progressVertical
		{
			idc = 19007;
			x = 0.370754 * safezoneW;
			y = 0.0219748 * safezoneH;
			w = 0.0257832 * safezoneW;
			h = 0.538837 * safezoneH;
		};
	};
};