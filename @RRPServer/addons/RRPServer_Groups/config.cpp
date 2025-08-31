class DefaultEventhandlers;
class CfgPatches
{
	class RRPServer_Groups
	{
		units[]={};
		weapons[]={};
		requiredAddons[]=
		{
			"RRPServer"
		};
		fileName="RRPServer_Groups.pbo";
		author="FairyTale#5571";
	};
};
class CfgFunctions
{
	class RRPServer_Groups
	{
		class Bootstrap
		{
			file="\RRPServer_Groups\bootstrap";
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