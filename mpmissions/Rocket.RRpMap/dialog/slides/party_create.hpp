class PartyCreateSlide: SlideTab
{
	idc = 36300;
    show = "false";
    x = 0;
    y = 0;
	class Controls
	{
        class back: MainMenuButton
        {
            idc = 36301;
        };
		class actPartyText: AppRscStructuredText
		{
			idc = 36302;
			text = "Активные тусовки"; //--- ToDo: Localize;
			x = 0.206267 * safezoneW;
			y = 0.123214 * safezoneH;
			w = 0.139229 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class listParty: AppRscListNbox
		{
			idc = 36303;
			x = 0.206267 * safezoneW;
			y = 0.145214 * safezoneH;
			w = 0.139229 * safezoneW;
			h = 0.187 * safezoneH;
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			columns[] = {0, 0.4, 0.8};
			onLbSelChanged = "_this call RRPClient_party_onLbListParty";
		};
		class plrInPartyText: AppRscStructuredText
		{
			idc = 36304;
			text = "Игроки в тусовке"; //--- ToDo: Localize;
			x = 0.206267 * safezoneW;
			y = 0.343214 * safezoneH;
			w = 0.139229 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class listPlayers: AppRscListbox
		{
			idc = 36305;
			x = 0.207298 * safezoneW;
			y = 0.365214 * safezoneH;
			w = 0.139229 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class joinBtn: AppTabletButton
		{
			idc = 36306;
			text = "Присоединиться"; //--- ToDo: Localize;
			onButtonClick = "_this call RRPClient_party_joinRequest";
			x = 0.207298 * safezoneW;
			y = 0.508214 * safezoneH;
			w = 0.0979762 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class createText: AppRscStructuredText
		{
			idc = 36307;
			text = "Создайте свою тусовку"; //--- ToDo: Localize;
			x = 0.0608493 * safezoneW;
			y = 0.222214 * safezoneH;
			w = 0.134073 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class infoText: AppRscStructuredText
		{
			idc = 36308;
			x = 0.0598179 * safezoneW;
			y = 0.255214 * safezoneH;
			w = 0.134073 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class createBtn: AppTabletButton
		{
			idc = 36309;
			text = "Создать тусовку"; //--- ToDo: Localize;
			onButtonClick = "_this call RRPClient_party_create";
			x = 0.0598179 * safezoneW;
			y = 0.431214 * safezoneH;
			w = 0.134073 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class editParty: AppRscEdit
		{
			idc = 36310;
			text = "1"; //--- ToDo: Localize;
			x = 0.0598179 * safezoneW;
			y = 0.387214 * safezoneH;
			w = 0.134073 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pinEdit: AppRscEdit
		{
			idc = 36311;
			text = "1234"; //--- ToDo: Localize;
			x = 0.311462 * safezoneW;
			y = 0.508214 * safezoneH;
			w = 0.0360965 * safezoneW;
			h = 0.033 * safezoneH;
			maxChars = 4;
			onChar = "_this call RRPClient_gui_util_typeOnlyInt";
			tooltip = "PIN-Код требуется для входа в закрытую тусовку";
		};
	};
};