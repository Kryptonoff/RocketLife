class CfgPatches
{
	class RRPServer_Keybinds
	{
		units[]={};
		weapons[]={};
		requiredVersion=1;
		requiredAddons[]=
		{
			"RRPServer",
			"rimas_agent"
		};
	};
};
class CfgFunctions
{
	class RRPServer_Keybinds
	{
		class core
		{
			file="\RRPServer_Keybinds\bootstrap";
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

class CfgKeybinds
{
	
};