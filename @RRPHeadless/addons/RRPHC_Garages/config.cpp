class CfgPatches
{
	class RRPHC_Garages
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
	class RRPHC_Garages
	{
		class core
		{
			file="\RRPHC_Garages\bootstrap";
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