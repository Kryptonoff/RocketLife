class DefaultEventhandlers;
class CfgPatches
{
	class RRPServer_Zones
	{
		units[]={};
		weapons[]={};
		requiredAddons[]=
		{
			"RRPServer",
			"RRPServer_Groups"
		};
		fileName="RRPServer_Groups.pbo";
		author="FairyTale#5571";
	};
};
class CfgFunctions
{
	class RRPServer_Zones
	{
		class Bootstrap
		{
			file="\RRPServer_Zones\bootstrap";
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