class CfgPatches {
	class asct {
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "asct.pbo";
		author[]= {"vitaly mind chizhikov"};
	};
};

class CfgFunctions {
	class funcs {
		tag = "asct";
		class common {
			file = "\asct\fnc";
			
			class init {postInit = 1;};
			class read {};
		};
	};
};
