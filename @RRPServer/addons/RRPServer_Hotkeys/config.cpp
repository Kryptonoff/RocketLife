class DefaultEventhandlers;
class CfgPatches
{
	class RRPServer_Hotkeys
	{
		units[]={};
		weapons[]={};
		requiredAddons[]=
		{
			"RRPServer"
		};
		fileName="RRPServer_Hotkeys.pbo";
		author="FairyTale#5571";
	};
};
class CfgFunctions
{
	class RRPServer_Hotkeys
	{
		class Bootstrap
		{
			file="\RRPServer_Hotkeys\bootstrap";
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