class EconomySlide: SlideTab
{
	idc = 32000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class progress: AppRscStructuredText
		{
			idc = 32001;
			x = 0.00515701 * safezoneW;
			y = 0.006523 * safezoneH;
			w = 0.394453 * safezoneW;
			h = 0.0329946 * safezoneH;
		};
		class list: AppRscListNbox
		{
			idc = 32002;
			x = 0.00541701 * safezoneW;
			y = 0.061616 * safezoneH;
			w = 0.286016 * safezoneW;
			h = 0.373935 * safezoneH;
			disableOverflow=1;
			columns[]={0,0.25,0.75};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
		class cbAll: AppRscCheckBox
		{
			idc = 32003;
			x = 0.005355 * safezoneW;
			y = 0.442153 * safezoneH;
			w = 0.0145394 * safezoneW;
			h = 0.0219964 * safezoneH;
            onCheckedChanged = "[_this#0,_this#1,'all'] call RRPClient_economy_filter";
		};
		class textAll: AppRscStructuredText
		{
			idc = 32004;
            text = "Все";
			x = 0.0237214 * safezoneW;
			y = 0.442249 * safezoneH;
			w = 0.0881666 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
		class cbLegal: AppRscCheckBox
		{
			idc = 32005;
			x = 0.00515701 * safezoneW;
			y = 0.486261 * safezoneH;
			w = 0.0145394 * safezoneW;
			h = 0.0219964 * safezoneH;
            onCheckedChanged = "[_this#0,_this#1,'legal'] call RRPClient_economy_filter";
		};
		class textLegal: AppRscStructuredText
		{
			idc = 32006;
            text = "Легальные";
			x = 0.023722 * safezoneW;
			y = 0.486261 * safezoneH;
			w = 0.0871353 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
		/*
		class cbPrivate: AppRscCheckBox
		{
			idc = 32007;
			x = 0.18564 * safezoneW;
			y = 0.486261 * safezoneH;
			w = 0.0145394 * safezoneW;
			h = 0.0219964 * safezoneH;
			onCheckedChanged = "[_this#0,_this#1,'private'] call RRPClient_economy_filter";
		};
		class textPrivate: AppRscStructuredText
		{
			idc = 32008;
            text = "Приватные";
			x = 0.203154 * safezoneW;
			y = 0.486261 * safezoneH;
			w = 0.0871353 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
		class cbPublic: AppRscCheckBox
		{
			idc = 32009;
			x = 0.18564 * safezoneW;
			y = 0.442249 * safezoneH;
			w = 0.0145394 * safezoneW;
			h = 0.0219964 * safezoneH;
            onCheckedChanged = "[_this#0,_this#1,'public'] call RRPClient_economy_filter";
		};
		class textPublic: AppRscStructuredText
		{
			idc = 32010;
            text = "Публичные";
			x = 0.203154 * safezoneW;
			y = 0.442249 * safezoneH;
			w = 0.0871353 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
		*/
		class cbiLegal: AppRscCheckBox
		{
			idc = 32011;
			x = 0.00515701 * safezoneW;
			y = 0.530274 * safezoneH;
			w = 0.0145394 * safezoneW;
			h = 0.0219964 * safezoneH;
            onCheckedChanged = "[_this#0,_this#1,'illegal'] call RRPClient_economy_filter";
		};
		class textiLegal: AppRscStructuredText
		{
			idc = 32012;
            text = "Нелегальные";
			x = 0.023722 * safezoneW;
			y = 0.530274 * safezoneH;
			w = 0.0871353 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
		/*class cbLocked: AppRscCheckBox
		{
			idc = 32013;
			x = 0.18562 * safezoneW;
			y = 0.530274 * safezoneH;
			w = 0.0145394 * safezoneW;
			h = 0.0219964 * safezoneH;
            onCheckedChanged = "[_this#0,_this#1,'locked'] call RRPClient_economy_filter";
		};
		class textLocked: AppRscStructuredText
		{
			idc = 32014;
            text = "Заблокированные";
			x = 0.203154 * safezoneW;
			y = 0.530274 * safezoneH;
			w = 0.0871353 * safezoneW;
			h = 0.0219964 * safezoneH;
		};*/
		class filter: AppRscListNbox
		{
			idc = 32015;
			x = 0.00541701 * safezoneW;
			y = 0.041817 * safezoneH;
			w = 0.285954 * safezoneW;
			h = 0.0175971 * safezoneH;
			disableOverflow=1;
			columns[]={0,0.25,0.75};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			class Items
			{
				class Name
				{
					text="Название";
					value=-1;
				};
				class Price
				{
					text = "Цена";
					value = -1;
				};
				class PriceMove
				{
					text="Движение цены";
					value=-1;
				};
			};
		};
        class tabInfo: RscControlsGroup
        {
            idc = 32016;
			x = 0.292899 * safezoneW;
			y = 0.0439349 * safezoneH;
			w = 0.106622 * safezoneW;
			h = 0.439928 * safezoneH;
            class Controls
            {
                class resName: AppRscStructuredText
                {
                    idc = 32017;
                    x = 0.004847 * safezoneW;
                    y = 0 * safezoneH;
                    w = 0.0969295 * safezoneW;
                    h = 0.0329946 * safezoneH;
                };
                class descriptionRes: AppRscStructuredText
                {
                    idc = 32018;
                    x = 0.00484659 * safezoneW;
                    y = 0.0439931 * safezoneH;
                    w = 0.0969295 * safezoneW;
                    h = 0.285953 * safezoneH;
                };
            };
        };
        class back: MainMenuButton
        {
            idc = 32019;
        };
	};
};

