class CfgPatches
{
	class RRPHC_Containers
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
	class RRPHC_Containers
	{
		class core
		{
			file="\RRPHC_Containers\bootstrap";
			class preInit
			{
				preInit=1;
			};
		};
	};
};
