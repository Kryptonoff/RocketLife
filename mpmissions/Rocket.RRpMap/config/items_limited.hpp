class config_limitedItems {
	class srifle_LRR_F {
		condition = "true";
		limit = 4;
	};

	class srifle_DMR_05_blk_F {
		condition = "true";
		limit = 3;
	};

	class LMG_Zafir_F {
		condition = "true";
		limit = 2;
	};

	class launch_RPG32_F {
		condition = "true";
		limit = 2;
	};

	class B_Static_Designator_01_weapon_F {
		limit = 8;
	};

	class B_UAV_01_backpack_F {
		limit = 3;
	};

	class B_UavTerminal {
		limit = 11;
	};
};

class limitedItensSetting {
	not_saved_items[] = {
		"srifle_LRR_F",
		"7Rnd_408_Mag",

		"srifle_DMR_05_blk_F",
		"10Rnd_93x64_DMR_05_Mag",

		"LMG_Zafir_F",
		"150Rnd_762x54_Box",

		"launch_RPG32_F",
		"RPG32_F"
	};
};


