class CfgPatches {
	class core {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {};
	};
};

class CfgFunctions {
	class mav {
		class core {
			file = "\ara_metrics_core\bin";

			class init { postInit = 1; };
		};
	};
};