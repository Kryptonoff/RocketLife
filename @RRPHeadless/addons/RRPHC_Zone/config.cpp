class CfgPatches
{
	class RRPHC_Zone
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
	class RRPHC_Zone
	{
		class core
		{
			file="\RRPHC_Zone\bootstrap";
			class postInit
			{
				postInit=1;
			};
			class preInit
			{
				preInit=1;
			};
		};
	};
};