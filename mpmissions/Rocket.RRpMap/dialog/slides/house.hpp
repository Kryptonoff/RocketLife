class HouseSlide: SlideTab
{
	idc = 22000;
	show = "false";
    x = 0;
    y = 0;
	class Controls
	{
		class backButton: MainMenuButton
		{
			idc = 22001;
		};
		class HouseMemberList: AppRscListbox
		{
			idc = 22002;
			x = 0.0103288 * safezoneW;
			y = 0.116614 * safezoneH;
			w = 0.26811 * safezoneW;
			h = 0.1958 * safezoneH;
		};
		class HouseLeave: AppTabletButton
		{
			idc = 22003;
			text = "ПРОДАТЬ";  
			onButtonClick = "[] spawn RRPClient_system_sellHouse";
			x = 0.0103288 * safezoneW;
			y = 0.420214 * safezoneH;
			w = 0.107243 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class HouseLock: AppTabletButton
		{
			idc = 22004;
			text = "Добавить слот";  
			onButtonClick = "[] spawn RRPClient_system_houseModAddSlot";
			x = 0.0103276 * safezoneW;
			y = 0.369614 * safezoneH;
			w = 0.107243 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class HouseKick: AppTabletButton
		{
			idc = 22005;
			onButtonClick = "[] spawn RRPClient_houses_kickNeighsRequest";
			text = "ВЫГНАТЬ";  
			x = 0.172212 * safezoneW;
			y = 0.422414 * safezoneH;
			w = 0.107243 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class InviteMember: AppTabletButton
		{
			idc = 22006;
			onButtonClick = "[] spawn RRPClient_houses_inviteNeighsRequest";
			text = "ПРОПИСАТЬ В ДОМ";  
			x = 0.283577 * safezoneW;
			y = 0.277214 * safezoneH;
			w = 0.108274 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class HouseList: AppRscCombo
		{
			idc = 22007;
			onLBSelChanged="_this call RRPClient_houses_onLbHousesLists";
			x = 0.0103288 * safezoneW;
			y = 0.090214 * safezoneH;
			w = 0.26811 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class payText: AppRscStructuredText
		{
			idc = 22008;
			text = "ДАТА ОПЛАТЫ:";  
			x = 0.283577 * safezoneW;
			y = 0.090214 * safezoneH;
			w = 0.108275 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class PayBtn: AppTabletButton
		{
			idc = 22009;
			onButtonClick = "[] spawn RRPClient_houses_payForHouse";
			text = "ОПЛАТИТЬ";  
			x = 0.0103288 * safezoneW;
			y = 0.321214 * safezoneH;
			w = 0.107243 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class lightsBtn: AppTabletButton
		{
			idc = 22010;
			onButtonClick = "_this call RRPClient_system_lightHouseAction";
			text = "Освещение ВКЛ";  
			x = 0.172216 * safezoneW;
			y = 0.321214 * safezoneH;
			w = 0.107243 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class secBtn: AppTabletButton
		{
			idc = 22011;
			onButtonClick = "[] spawn RRPClient_houses_installSecurity";
			text = "УСТ. ОХРАНУ";  
			x = 0.171201 * safezoneW;
			y = 0.369614 * safezoneH;
			w = 0.107243 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class trunkBtn: AppTabletButton
		{
			idc = 22012;
			onButtonClick = "[] spawn RRPClient_houses_openTrunk";
			text = "Открыть хранилище";  
			x = 0.0103288 * safezoneW;
			y = 0.466414 * safezoneH;
			w = 0.269141 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class listAllPlayers: AppRscListbox
		{
			idc = 22013;
			x = 0.283577 * safezoneW;
			y = 0.116614 * safezoneH;
			w = 0.108275 * safezoneW;
			h = 0.1496 * safezoneH;
		};
		class setName: AppTabletButton
		{
			idc = 22014;
			onButtonClick = "_this call RRPClient_houses_setNewName";
			text = "ПЕРЕИМЕНОВАТЬ";  
			x = 0.284608 * safezoneW;
			y = 0.376214 * safezoneH;
			w = 0.107244 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class setNameBox: AppRscEdit
		{
			idc = 22015;
			text = ""; //--- ToDo: Localize;
			x = 0.284608 * safezoneW;
			y = 0.345414 * safezoneH;
			w = 0.108275 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};