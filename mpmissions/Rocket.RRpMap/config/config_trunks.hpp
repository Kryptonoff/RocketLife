/*


	Class = столбец name в gang_trunks
		object = имя хранилища на карте
		side = фракция, имеющая доступ к хранилищу
		conditions = условия, необходимые для доступа к хранилищу


*/
class CfgTrunkColors
{
    class Pictures
    {
		class Pictures_1
		{
			displayName = "Стандарт";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\metal_locker_pictures_co.paa";
        };
		class Pictures_2
		{
			displayName = "Мафия";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_Pictures_01.paa";
        };
		class Pictures_3
		{
			displayName = "Сиськи";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_Pictures_02.paa";
        };
		class Pictures_4
		{
			displayName = "Сиськи + танки 1";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_Pictures_03.paa";
        };
		class Pictures_5
		{
			displayName = "Сиськи + танки 2";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_Pictures_04.paa";
        };
		class Pictures_6
		{
			displayName = "WarThunder";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_Pictures_05.paa";
        };
		class Pictures_7
		{
			displayName = "Билли Херрингтон";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_Pictures_06.paa";
        };
		class Pictures_8
		{
			displayName = "Рикардо Милос";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_Pictures_07.paa";
        };
		class Pictures_9
		{
			displayName = "Патриотический";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_Pictures_08.paa";
        };
    };
    class Coloring
    {
		class Coloring_base
		{
			displayName = "Раскраска";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_co.paa";
        };
		class Coloring_1
		{
			displayName = "Анимэ";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_01.paa";
        };
		class Coloring_2
		{
			displayName = "Красный";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_02.paa";
        };
		class Coloring_3
		{
			displayName = "Синий";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_03.paa";
        };
		class Coloring_4
		{
			displayName = "Голубой";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_04.paa";
        };
		class Coloring_5
		{
			displayName = "Розовый";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_05.paa";
        };
		class Coloring_6
		{
			displayName = "Фиолетовый";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_06.paa";
        };
		class Coloring_7
		{
			displayName = "Бирюзовый";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_07.paa";
        };
		class Coloring_8
		{
			displayName = "Зеленый";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_08.paa";
        };
		class Coloring_9
		{
			displayName = "Желтый";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_09.paa";
        };
		class Coloring_10
		{
			displayName = "Черный";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_10.paa";
        };
		class Coloring_11
		{
			displayName = "Оранжевый";
			conditions = "";
			textures = "\3den_objects\objects_f\metal_locker_f\Metal_Locker_11.paa";
        };
    };
};
class LifeCfgTrunks
{
	class RRPtrunk_PD {
		object = "RRPtrunk_PD";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) >= 5";
	};
	class RRPtrunk_PD_Cadet {
		object = "RRPtrunk_PD_Cadet";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 0";
	};
	class RRPtrunk_PD_1 {
		object = "RRPtrunk_PD_1";
		side = "cop";
		conditions = "('cop' call RRPClient_groups_getSideLevel) >= 12";
	};
	class RRPtrunk_Med {
		object = "RRPtrunk_Med";
		side = "med";
		conditions = "('med' call RRPClient_groups_getSideLevel)  >= 5";
	};
	class RRPtrunk_Med_1 {
		object = "RRPtrunk_Med_1";
		side = "med";
		conditions = "('med' call RRPClient_groups_getSideLevel)  >= 8";
	};
	class RRPtrunk_Med_2 {
		object = "RRPtrunk_Med_2";
		side = "med";
		conditions = "('med' call RRPClient_groups_getSideLevel)  >= 1";
	};
	class RRPtrunk_BlackSnow {
		object = "RRPtrunk_BlackSnow";
		conditions = "license_blacksnow && ('civ' call RRPClient_groups_getSideLevel) > 2 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class RRPtrunk_Press {
		object = "RRPtrunk_Press";
		conditions = "license_press && ('civ' call RRPClient_groups_getSideLevel) > 2 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class RRPtrunk_Cigane_01 {
		object = "RRPtrunk_Cigane_01";
		conditions = "license_cigane && ('civ' call RRPClient_groups_getSideLevel) > 2 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class RRPtrunk_inagawakai {
		object = "RRPtrunk_inagawakai";
		conditions = "license_inagawakai && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class RRPtrunk_lacosanostra {
		object = "RRPtrunk_lacosanostra";
		conditions = "license_lacosanostra && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class RRPtrunk_blackwolves {
		object = "RRPtrunk_blackwolves";
		conditions = "license_blackwolves && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class RRPtrunk_PremGRP_2 {
		object = "RRPtrunk_PremGRP_2";
		conditions = "license_PremGRP_2 && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class RRPtrunk_PremGRP_3 {
		object = "RRPtrunk_PremGRP_3";
		conditions = "license_PremGRP_3 && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class RRPtrunk_PremGRP_4 {
		object = "RRPtrunk_PremGRP_4";
		conditions = "license_PremGRP_4 && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};

	class R_Trunk_Sector_01 {
		object = "R_Trunk_Sector_01";
		conditions = "license_sector && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
	class R_Trunk_Escobaro_01 {
		object = "R_Trunk_Escobaro_01";
		conditions = "license_escobaro && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};

	class RRP_Trunk_Sumiyoshi_01 {
		object = "RRP_Trunk_Sumiyoshi_01";
		conditions = "license_sumiyoshi && ('civ' call RRPClient_groups_getSideLevel) > 1 && 'allowTrunks' call RRPClient_groups_util_permCheck ";
	};
};