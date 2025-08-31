class CfgPatches
{
	class RRPHC_Threads
	{
		units[]={};
		weapons[]={};
		requiredVersion=1;
		requiredAddons[]=
		{
			"RRPHC",
			"rimas_agent"
		};
	};
};
class CfgFunctions
{
	class RRPHC_Threads
	{
		class core
		{
			file="\RRPHC_Threads\bootstrap";
			class preInit
			{
				preInit=1;
			};
            class postInit
            {
                postInit=1;
            };
		};
	};
};
class CfgCleanup
{
	class CleanupVehicle
	{
		cleanupCycle = 15;
		savePhysInventory = 0;
		costForWaterPenny = 1000;
	};
};