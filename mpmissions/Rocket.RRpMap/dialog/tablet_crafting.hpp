class RRPCraftingMenu {
	idd = 2500;
	name= "RRPCraftingMenu";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad="uiNamespace setVariable ['RRPCraftingMenu',_this select 0]; true call RRPClient_gui_util_blur;";
	onUnload = "uiNamespace setVariable ['RRPCraftingMenu', displayNull]; false call RRPClient_gui_util_blur;uiNamespace setVariable ['CraftnigRecipe', nil];uiNamespace setVariable ['ReadyRecipes', nil];uiNamespace setVariable ['curItemInfo', nil];";

	class controlsBackground {
		class backgrnd: RRP_background_fade
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.517 * safezoneH;
		};
	};

	class controls {
		class title: RRP_title
		{
			idc = -1;
			text = "Крафтинг";
			x = 0.29357 * safezoneW + safezoneX;
			y = 0.23688 * safezoneH + safezoneY;
			w = 0.397187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Welcometitle: RRP_title
		{
			colorBackground[]={1,1,1,0};
			idc = 2517;
			text = "";
			style = 2;
			sizeEx = 0.065;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.320 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				align = "center";
			};
		};
		class titleRecipe: RRP_title
		{
			colorBackground[]={1,1,1,0};
			idc = 2513;
			text = "Рецепт";
			style = 2;
			sizeEx = 0.065;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				align = "center";
			};
		};

		class exit: RRP_btn_exit_text
		{
			idc = -1;
			x = 0.690665 * safezoneW + safezoneX;
			y = 0.236926 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class lbRigth: RRP_RscListBox
		{
			idc = 2505;
			onLBSelChanged = "";
			x = 0.453593 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.154 * safezoneH;
		};

		class image: RscPictureKeepAspect
		{
			text = "";
			idc = 2506;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.297 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class desctiption: RRP_RscStructuredText
		{
			text = "";
			idc = 2507;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class welcome: RRP_RscStructuredText
		{
			text = "";
			idc = 2516;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class button: RRP_btn_green
		{
			idc = 2508;
			text = "Создать";
			onButtonClick = "[] spawn RRPClient_onBtnClick_addFinalItems";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				align="center";
			};
		};
		class frame: RscFrame
		{
			text = "";
			sizeEx = 0.035;
			idc = 2510;
			x = 0.453593 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.154 * safezoneH;
		};

		class edit: RRP_RscEdit
		{
			idc = 2512;
			text = "1";
			onKeyUp = "call RRPClient_crafting_updateRecipe; call RRPClient_crafting_updateLBrequiredItems;";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class notification: RRP_title
		{
			idc = 2515;
			text = "";
			font="RobotoCondensedLight";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class searchRecipes: RRP_title
		{
			idc = 645;
			text = "";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};

	};
};
