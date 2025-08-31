class CfgpGates
{
	class CP_1
	{
		displayName = "Пункт пропуска №1";
		//Ворота
		objects[] = {"copGate_KPP_11","copGate_KPP_12"};
		unlockOnRestart = 1;
		triggerCode = "call RRPClient_dolboeb_screenpic";
		condition = "true";
	};
	class CP_2
	{
		displayName = "Пункт пропуска №2";
		objects[] = {"copGate_KPP_21","copGate_KPP_22"};
		unlockOnRestart = 1;
		triggerCode = "call RRPClient_dolboeb_screenpic";
		condition = "true";
	};
	class CP_3
	{
		displayName = "Пункт пропуска №3";
		objects[] = {"copGate_KPP_31","copGate_KPP_32"};
		unlockOnRestart = 0;
		triggerCode = "call RRPClient_dolboeb_screenpic";
		condition = "true";
	};
};
