class CfgPatches
{
	class RRPHC_Queue
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
	class RRPHC_Queue
	{
		class core
		{
			file="\RRPHC_Queue\bootstrap";
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
