class LifeCfgTags {
	class beginner
	{
		title = "Новобранец";
		side = "civ";
		conditions = "!(player getVariable ['isBeginner',false])";
	};
	class cw_civ
	{
		title = "Осужденый к труду";
		side = "civ";
		conditions = "(player getVariable ['corrective_work',false])";
	};
	class cw_reb
	{
		title = "Осужденый к труду";
		side = "civ";
		conditions = "(player getVariable ['corrective_work',false])";
	};
	class blacksnow
	{
		title = "BlackSnow";
		side = "civ";
		conditions = "license_blacksnow";
	};
	class escobaro
	{
		title = "La Escobaro Family";
		side = "civ";
		conditions = "license_escobaro";
	};
	class sumiyoshi
	{
		title = "Sumiyoshi Kai";
		side = "civ";
		conditions = "license_sumiyoshi";
	};
	class cigane
	{
		title = "Cigane";
		side = "civ";
		conditions = "license_cigane";
	};
	class inagawakai
	{
		title = "Inagawa Kai";
		side = "civ";
		conditions = "license_inagawakai";
	};
	class lacosanostra
	{
		title = "lacosanostra";
		side = "civ";
		conditions = "license_lacosanostra";
	};
	class blackwolves
	{
		title = "blackwolves";
		side = "civ";
		conditions = "license_blackwolves";
	};
	class Sector
	{
		title = "Sector";
		side = "civ";
		conditions = "license_sector";
	};
	class PremGRP_2
	{
		title = "PremGRP_2";
		side = "civ";
		conditions = "license_PremGRP_2";
	};
	class PremGRP_3
	{
		title = "PremGRP_3";
		side = "civ";
		conditions = "license_PremGRP_3";
	};
	class PremGRP_4
	{
		title = "PremGRP_4";
		side = "civ";
		conditions = "license_PremGRP_4";
	};
	class flightschool
	{
		title = "Пилот";
		side = "civ";
		conditions = "license_flightschool";
	};
	class taxi
	{
		title = "TAXI";
		side = "civ";
		conditions = "license_taxi";
	};
	class press
	{
		title = "7NEWS";
		side = "civ";
		conditions = "license_press";
	};
	class gover
	{
		title = "Губернатор";
		side = "civ";
		conditions = "life_gov";
	};
	//west
	class cop1
	{
		title = "Cadet";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 1";
	};
	class cop2
	{
		title = "Private";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 2";
	};
	class cop3
	{
		title = "Sergeant l";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 3";
	};
	class cop4
	{
		title = "Sergeant ll";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 4";
	};
	class cop5
	{
		title = "Sergeant lll";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 5";
	};
	class cop6
	{
		title = "P.Officer l";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 6";
	};
	class cop7
	{
		title = "P.Officer ll";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 7";
	};
	class cop8
	{
		title = "Lieutenant l";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 8";
	};
	class cop9
	{
		title = "Lieutenant ll";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 9";
	};
	class cop10
	{
		title = "Сaptain";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 10";
	};
	class cop11
	{
		title = "Major";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 11";
	};
	class cop12
	{
		title = "Detective";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 12";
	};
	class cop13
	{
		title = "Chief Detective";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 13";
	};
	class cop14
	{
		title = "Chief PA";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 14";
	};
	class cop15
	{
		title = "D.Chief PD";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 15";
	};
	class cop16
	{
		title = "Detective O.P.R";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 16";
	};
	class cop17
	{
		title = "Chief O.P.R";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 17";
	};
	class cop18
	{
		title = "F.B.I";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 18";
	};
	class cop19
	{
		title = "Chief F.B.I";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 19";
	};
	class cop20
	{
		title = "Chief PD";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) == 20";
	};

	class med1
    {
        title = "Intern";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 1";
    };
    class med2
    {
        title = "Technician";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 2";
    };
    class med3
    {
        title = "Specialist";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 3";
    };
    class med4
    {
        title = "St.specialist";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 4";
    };
    class med5
    {
        title = "Attendant";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 5";
    };
    class med6
    {
        title = "Paramedic";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 6";
    };
    class med7
    {
        title = "Doctor";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 7";
    };
    class med8
    {
        title = "Major";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 8";
    };
    class med9
    {
        title = "Deputy Minister";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 9";
    };
    class med10
    {
        title = "Minister";
        side = "med";
        conditions = "('med' call RRPClient_groups_getSideLevel) == 10";
    };
};
