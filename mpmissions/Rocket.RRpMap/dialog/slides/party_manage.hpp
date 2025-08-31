class PartyManageSlide: SlideTab
{
    idc = 36000;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class settingsText: AppRscStructuredText
		{
			idc = 36001;
            text = "Настройки"; //--- ToDo: Localize;
			x = 0.201082 * safezoneW;
			y = 0.12323 * safezoneH;
			w = 0.139229 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class promoteBtn: AppTabletButton
		{
			idc = 36002;
            text = "Пер. лидера"; //--- ToDo: Localize;
			x = 0.127875 * safezoneW;
			y = 0.501599 * safezoneH;
			w = 0.0670364 * safezoneW;
			h = 0.0329973 * safezoneH;
			onButtonClick = "_this call RRPClient_party_giveLeader";
		};
		class kickBtn: AppTabletButton
		{
			idc = 36003;
            text = "Исключить"; //--- ToDo: Localize;
			onButtonClick = "_this call RRPClient_party_kick";
			x = 0.0598161 * safezoneW;
			y = 0.501599 * safezoneH;
			w = 0.0618797 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class leaveBtn: AppTabletButton
		{
			idc = 36004;
			text = "Покинуть"; //--- ToDo: Localize;
			onButtonClick = "_this call RRPClient_party_leave";
			x = 0.20111 * safezoneW;
			y = 0.501599 * safezoneH;
			w = 0.0670364 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class disbandBtn: AppTabletButton
		{
			idc = 36005;
			text = "Распустить"; //--- ToDo: Localize;
			onButtonClick = "_this call RRPClient_party_disband";
			x = 0.274334 * safezoneW;
			y = 0.501607 * safezoneH;
			w = 0.0670364 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class playerList: AppRscListbox
		{
			idc = 36006;
			x = 0.0608474 * safezoneW;
			y = 0.156227 * safezoneH;
			w = 0.134073 * safezoneW;
			h = 0.340972 * safezoneH;
			onLbSelChanged = "_this call RRPClient_party_onLBPartyPlayers";
		};
		class partyMemText: AppRscStructuredText
		{
			idc = 36007;
            text = "Члены тусовки";
			x = 0.0608474 * safezoneW;
			y = 0.12323 * safezoneH;
			w = 0.134073 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class opOrClCheck: AppRscCheckBox
		{
			idc = 36009;
			onCheckedChanged = "_this call RRPClient_party_changeMode";
			x = 0.202113 * safezoneW;
			y = 0.178226 * safezoneH;
			w = 0.0192873 * safezoneW;
			h = 0.0329973 * safezoneH;
		};
		class opClStatus: RRP_RscText_centerText
		{
			idc = 36010;
            text = "Открыта или закрыта";
			x = 0.222743 * safezoneW;
			y = 0.178185 * safezoneH;
			w = 0.118622 * safezoneW;
			h = 0.0330067 * safezoneH;
		};
		class kvEdit: AppRscEdit
		{
			idc = 36012;
			text = "36.6";
			x = 0.205208 * safezoneW;
			y = 0.255219 * safezoneH;
			w = 0.0464098 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class kvBtn: AppTabletButton
		{
			idc = 36013;
            text = "Уст. КВ"; //--- ToDo: Localize;
			onButtonClick = "['kv'] call RRPClient_party_changeFreq";
			x = 0.260898 * safezoneW;
			y = 0.255219 * safezoneH;
			w = 0.0773497 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class dvSet: AppTabletButton
		{
			idc = 36014;
            text = "Уст. ДВ"; //--- ToDo: Localize;
			onButtonClick = "['dv'] call RRPClient_party_changeFreq";
			x = 0.260898 * safezoneW;
			y = 0.288217 * safezoneH;
			w = 0.0773497 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class dvEdit: AppRscEdit
		{
			idc = 36015;
			text = "100.0";
			x = 0.205208 * safezoneW;
			y = 0.288217 * safezoneH;
			w = 0.0464098 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class border: RscText
		{
			idc = 36016;
			x = 0.197988 * safezoneW;
			y = 0.12323 * safezoneH;
			w = 0.00103133 * safezoneW;
			h = 0.409166 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class tfarText: AppRscStructuredText
		{
			idc = 36017;
			text = "Частоты рации"; //--- ToDo: Localize;
			x = 0.202113 * safezoneW;
			y = 0.222222 * safezoneH;
			w = 0.139229 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class opOrClText: AppRscStructuredText
		{
			idc = 36018;
			text = "Режим"; //--- ToDo: Localize;
			x = 0.202113 * safezoneW;
			y = 0.156227 * safezoneH;
			w = 0.139229 * safezoneW;
			h = 0.0219982 * safezoneH;
		};
		class passwordGroup: RscControlsGroup
		{
			idc = 36019;
			show = "false";
			x = 0.20111 * safezoneW;
			y = 0.332213 * safezoneH;
			w = 0.139229 * safezoneW;
			h = 0.0769937 * safezoneH;
            class Controls
            {
                class pinText: AppRscStructuredText
                {
                    idc = 36021;
					text = "PIN-Код"; //--- ToDo: Localize;
					x = 0 * safezoneW;
					y = 0 * safezoneH;
					w = 0.139229 * safezoneW;
					h = 0.0219982 * safezoneH;
                };
                class pinEdit: AppRscEdit
                {
                    idc = 36022;
                    text = "1234"; //--- ToDo: Localize;
					onChar = "_this call RRPClient_gui_util_typeOnlyInt";
					maxChars = 4;
					x = 0.00515664 * safezoneW;
					y = 0.0329973 * safezoneH;
					w = 0.0464098 * safezoneW;
					h = 0.0219982 * safezoneH;
                };
                class setPinBtn: AppTabletButton
                {
                    idc = 36023;
					text = "Уст. PIN-Код"; //--- ToDo: Localize;
                    x = 0.0567231 * safezoneW;
					y = 0.0329973 * safezoneH;
					w = 0.0773497 * safezoneW;
					h = 0.0219982 * safezoneH;
					onButtonClick = "_this call RRPClient_party_setPin";
                };
            };
		};
        class back: MainMenuButton
        {
            idc = 36001;
        };
	};
};