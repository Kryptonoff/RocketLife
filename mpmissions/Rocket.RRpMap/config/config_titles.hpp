class LifeCfgTitles {
	class default {
		title = "";
		conditions = "";
	};
	class vip {
		title = "Меценат";
		conditions = "(call life_donator) > 0";
	};
	class cop_1 {
		title = "Cadet";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 1";
	};
	class cop_2 {
		title = "Private";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 2";
	};
	class cop_3 {
		title = "Sergeant l";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 3";
	};
	class cop_4 {
		title = "Sergeant ll";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 4";
	};
	class cop_5 {
		title = "Sergeant lll";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 5";
	};
	class cop_6 {
		title = "P.Officer l";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 6";
	};
	class cop_7 {
		title = "P.Officer ll";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 7";
	};
	class cop_8 {
		title = "Lieutenant l";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 8";
	};
	class cop_9 {
		title = "Lieutenant ll";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 9";
	};
	class cop_10 {
		title = "Сaptain";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 10";
	};
	class cop_11 {
		title = "Major";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 11";
	};
	class cop_12 {
		title = "Detective";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 12";
	};
	class cop_13 {
		title = "Chief Detective";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 13";
	};
	class cop_14 {
		title = "Chief PA";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 14";
	};
	class cop_15 {
		title = "D.Chief PD";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 15";
	};
	class cop_16 {
		title = "Detective O.P.R";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 16";
	};
	class cop_17 {
		title = "Chief O.P.R";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 17";
	};
	class cop_18 {
		title = "F.B.I";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 18";
	};
	class cop_19 {
		title = "Chief F.B.I";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 19";
	};
	class cop_20 {
		title = "Chief PD";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 20";
	};
	class cop_21 {
		title = "Кадет";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 1";
	};
	class viptop {
		title = "Магнат";
		conditions = "(call life_donator) > 3";
	};
	class topgang {
		title = "Головорез";
		conditions = "false";
	};
};