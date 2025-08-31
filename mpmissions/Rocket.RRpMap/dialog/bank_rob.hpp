class lega_bank_robberys 
{
    safePositions[] = {
        {{12.2842,7.83301,-6.20513},-0.203005,"safe_10"}, 
        {{9.51807,7.82813,-7.084},-0.203005,"safe_2"},
        {{8.59375,7.81836,-7.05994},-0.203005,"safe_1"},
        {{8.59668,7.82813,-6.18203},-0.203005,"safe_6"},
        {{12.2837,7.8252,-7.08442},-0.203005,"safe_5"},
        {{10.4429,7.82617,-7.0841},-0.203005,"safe_3"},
        {{9.51758,7.83398,-6.20548},-0.203005,"safe_7"},
        {{11.3696,7.82227,-7.0841},-0.203005,"safe_4"},
        {{10.4375,7.83203,-5.32126},-0.203005,"safe_13"},
        {{11.3652,7.83008,-5.32143},-0.203005,"safe_14"},
        {{12.2798,7.83105,-5.32164},-0.203005,"safe_15"},
        {{10.4424,7.83398,-6.2047},-0.203005,"safe_8"},
        {{11.3701,7.83203,-6.20508},-0.203005,"safe_9"},
        {{8.5918,7.82617,-5.29745},-0.203005,"safe_11"},
        {{9.51367,7.83301,-5.32112},-0.203005,"safe_12"}
    };
    
    moneyPositions[] = {
        {{11.0522,2.6239,-6.19784},-40.936},
        {{10.123,2.9469,-6.19784},-20.3588},
        {{11.1372,2.99194,-6.19784},-90.3348},
        {{10.856,2.979,-6.19784},-56.787},
        {{9.94238,2.65796,-6.19784},-319.897},
        {{10.3179,2.64905,-6.19784},-121.868},
        {{10.6572,2.68445,-6.19644},-111.413},
        {{10.4634,3.0459,-6.19784},-39.338}
    };

    drill_positions[] = {
        {"Land_BackAlley_01_l_gate_F",{{-0.379883,0.12207,-0.861576}, 179.04},1},
        {"Land_Offices_01_V1_F", {{10.8906,0.1875,-6.37201},-1.005}, 3},
        {"Land_Offices_01_V1_F", {{7.76123,6.45703,-6.37873},-87.69}, 4},
        {"safe", {{-0.108398,-0.499023,-0.22282},359.999}}
    };
    
    robbery_types[] = {
        {"picklock", {{"Land_Offices_01_V1_F", 2}, {"Land_BackAlley_01_l_gate_F", 1}, {"safe", 0.5}}, 10},
        {"drill", {{"Land_Offices_01_V1_F", 1}, {"Land_BackAlley_01_l_gate_F", 0.5}, {"safe", 0.25}}, 100}
    };

    bank_position[] = {20229.2,16756.2,0.78466};
    bank_classname = "Land_Offices_01_V1_F";

    // Table Cash
    cashPerPile = 1000; // `max` amount of cash per pile of money on the table.
    minCashPerPile = 500; // `min` amount of cash per pile of money on the table.
    cash_item = "dirty_money";

    maxPiles = 10; // `max` piles of cash on the table
    secureDistance = 30; // Meters a set object to secure. 
    secureObject = "bank_1_gate"; // object to check for civilian for securing.
    // Safes 
    maxItems = 5; // `max` items in the safe
    safeItems[] = {"dirty_money"};

    loopTimer = 0.1;// time in minutes the loop adds more items / cash to the table / safes

    drill_item = "drill";
    picklock_item = "lockpick";

    minCops = -1;
};

class lega_bankrobbery_itemList
{
	idd=999;
	name="lega_bankrobbery_itemList";
	movingEnable=-1;
	enableSimulation=1;
	onLoad="uiNamespace setVariable ['lega_bankrobbery_itemList', _this select 0];";
	onUnload="uiNamespace setVariable ['lega_bankrobbery_itemList', displayNull]";
	onDestroy="uiNamespace setVariable ['lega_bankrobbery_itemList', displayNull]";
	class controlsBackground
	{
		class lega_bankrobbery_itemList_Title: RRP_title
		{
			idc=-1;
			x="((safeZoneX) + 0 * (pixelW * pixelGrid * 0.50) + (350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (50 / 4.5 / (350 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - (((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) / 2 + 0 * 2) - ((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (0 / (500 / 4.5)) + 0)) * (pixelH * pixelGrid * 0.50))";
			w="(((350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (300 / 4.5 / (350 / 4.5))) * (pixelW * pixelGrid * 0.50))";
			h="(((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (10 / 4.5 / (500 / 4.5))) * (pixelH * pixelGrid * 0.50))";
			colorBackground[]={0.70999998,0.63099998,0.208,1};
		};
		class lega_bankrobbery_itemList_ListBox_Group: RRP_RscStructuredText
		{
			idc=-1;
			x="((safeZoneX) + 0 * (pixelW * pixelGrid * 0.50) + (350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (50 / 4.5 / (350 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - (((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) / 2 + 0 * 2) - ((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (10 / 4.5 / (500 / 4.5)) + 0)) * (pixelH * pixelGrid * 0.50))";
			w="(((350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (300 / 4.5 / (350 / 4.5))) * (pixelW * pixelGrid * 0.50))";
			h="(((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (490 / 4.5 / (500 / 4.5))) * (pixelH * pixelGrid * 0.50))";
			colorBackground[]={0.40000001,0.40000001,0.40000001,0.69999999};
		};
	};
	class controls
	{
		class lega_bankrobbery_itemList_ListBox: RRP_RscListBox
		{
			idc=998;
			x="((safeZoneX) + 0 * (pixelW * pixelGrid * 0.50) + (350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (60 / 4.5 / (350 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - (((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) / 2 + 0 * 2) - ((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (20 / 4.5 / (500 / 4.5)) + 0)) * (pixelH * pixelGrid * 0.50))";
			w="(((350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (280 / 4.5 / (350 / 4.5))) * (pixelW * pixelGrid * 0.50))";
			h="(((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (410 / 4.5 / (500 / 4.5))) * (pixelH * pixelGrid * 0.50))";
			colorBackground[]={0.40000001,0.40000001,0.40000001,0.69999999};
		};
		class lega_bankrobbery_itemList_edit: RRP_RscEdit
		{
			idc=999;
			x="((safeZoneX) + 0 * (pixelW * pixelGrid * 0.50) + (350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (60 / 4.5 / (350 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - (((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) / 2 + 0 * 2) - ((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (440 / 4.5 / (500 / 4.5)) + 0)) * (pixelH * pixelGrid * 0.50))";
			w="(((350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (280 / 4.5 / (350 / 4.5))) * (pixelW * pixelGrid * 0.50))";
			h="(((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (20 / 4.5 / (500 / 4.5))) * (pixelH * pixelGrid * 0.50))";
			text=1;
			colorSelection[]={0.70999998,0.63099998,0.208,1};
			colorBackground[]={0,0,0,0};
		};
		class lega_bankrobbery_itemList_take: RRP_RscStructuredText
		{
			idc=1000;
			x="((safeZoneX) + 0 * (pixelW * pixelGrid * 0.50) + (350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (60 / 4.5 / (350 / 4.5)) * (pixelW * pixelGrid * 0.50))";
			y="(((getResolution select 3) * 0.5 * pixelH) - (((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) / 2 + 0 * 2) - ((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (470 / 4.5 / (500 / 4.5)) + 0)) * (pixelH * pixelGrid * 0.50))";
			w="(((350 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (280 / 4.5 / (350 / 4.5))) * (pixelW * pixelGrid * 0.50))";
			h="(((500 / 4.5) * (profileNamespace getVariable [""Lega_Dialog_Multiplier"", 0.70]) * (20 / 4.5 / (500 / 4.5))) * (pixelH * pixelGrid * 0.50))";
			colorBackground[]={0.70999998,0.63099998,0.208,1};
			text="<t align='center' font='RobotoCondensedLight' size='1.15'>Take Items</t>";
		};
	};
};