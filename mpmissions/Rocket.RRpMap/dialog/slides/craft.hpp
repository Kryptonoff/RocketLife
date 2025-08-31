class CraftSlide: SlideTab
{
    idc = 33000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 33001;
        };
        class lbRight: AppRscListbox
        {
            idc = 2505;
            x = 0.155716 * safezoneW;
            y = 0.387214 * safezoneH;
            w = 0.244407 * safezoneW;
            h = 0.154 * safezoneH;
        };
        class image: RscPictureKeepAspect
        {
            idc = 2506;
            text = "";
            x = 0.213461 * safezoneW;
            y = 0.045619 * safezoneH;
            w = 0.108281 * safezoneW;
            h = 0.143 * safezoneH;
        };
        class desctiption: AppRscStructuredText
        {
            idc = 2507;
            x = 0.156748 * safezoneW;
            y = 0.193614 * safezoneH;
            w = 0.242345 * safezoneW;
            h = 0.1518 * safezoneH;
        };
        class welcome: AppRscStructuredText
        {
            idc = 2516;
            x = 0.156764 * safezoneW;
            y = 0.00663976 * safezoneH;
            w = 0.242344 * safezoneW;
            h = 0.308 * safezoneH;
        };
        class button: AppTabletButton
        {
            idc = 2508;
            text = "Создать"; //--- ToDo: Localize;
			onButtonClick = "[] spawn RRPClient_onBtnClick_addFinalItems";
            x = 0.155717 * safezoneW;
            y = 0.547814 * safezoneH;
            w = 0.209344 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class edit: AppRscEdit
        {
            idc = 2512;
			onKeyUp = "call RRPClient_crafting_updateRecipe; call RRPClient_crafting_updateLBrequiredItems;";
			text = "1";
            x = 0.368145 * safezoneW;
            y = 0.547814 * safezoneH;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class notification: AppRscStructuredText
        {
            idc = 2515;
            text = ""; //--- ToDo: Localize;
            x = 0.155717 * safezoneW;
            y = 0.349814 * safezoneH;
            w = 0.244407 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class searchRecipes: RscEdit
        {
            idc = 645;
            text = ""; //--- ToDo: Localize;
            x = 0.00413911 * safezoneW;
            y = 0.00662156 * safezoneH;
            w = 0.149531 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class listTree: AppRscTree
        {
            idc = 646;
            idcSearch = 645;
            x = 0.00413912 * safezoneW;
            y = 0.0308204 * safezoneH;
            w = 0.149531 * safezoneW;
            h = 0.55 * safezoneH;
        };
	};
};