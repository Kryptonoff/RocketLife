#define false 0
#define true 1

class CfgWaypoints 
{
	class WaypoitnsMarkers
	{
		class default {
			displayName = "Стандартный";
			fileName = "\a3\ui_f\data\Map\MapControl\custommark_CA.paa";
		};
		class mono {
			displayName = "Монохромный маркер";
			fileName = "\rimas_agent\assets\waypoints\01.paa";
		};
		class colored_marker {
			displayName = "Цветной маркер";
			fileName = "\rimas_agent\assets\waypoints\02.paa";
		};
		class circle {
			displayName = "Круг";
			fileName = "\rimas_agent\assets\waypoints\03.paa";
		};
		class cross {
			displayName = "Х";
			fileName = "\rimas_agent\assets\waypoints\04.paa";
		};
		class star {
			displayName = "Звезда";
			fileName = "\rimas_agent\assets\waypoints\05.paa";
		};
		class romb {
			displayName = "Ромб";
			fileName = "\rimas_agent\assets\waypoints\06.paa";
		};
		class dotted_cross {
			displayName = "Точечный Х";
			fileName = "\rimas_agent\assets\waypoints\07.paa";
		};
		class dot {
			displayName = "Точка";
			fileName = "\rimas_agent\assets\waypoints\08.paa";
		};
	};

	class WaypointsColors { 
		class default {
			displayName = "Стандартный";
			colors[] = {0.5,0.5,0.5,1};
		};
		class Red {
			displayName = "Красный";
			colors[] = {0.9,0,0,1};
		};
		class Maroon {
			displayName = "Бордовый";
			colors[] = {0.5,0,0,1};
		};
		class Brown {
			displayName = "Коричневый";
			colors[] = {0.5,0.25,0,1};
		};
		class Orange {
			displayName = "Оранжевый";
			colors[] = {1,0.4,0,1};
		};
		class Yellow {
			displayName = "Желтый";
			colors[] = {1,1,0,1};
		};
		class UNKNOWN {
			displayName = "Темный желтый";
			colors[] = {0.7,0.6,0,1};
		};
		class Khaki {
			displayName = "Хаки";
			colors[] = {0.5,0.6,0.4,1};
		};
		class Green {
			displayName = "Зеленый";
			colors[] = {0,0.8,0,1};
		};
		class GUER {
			displayName = "Темный зеленый";
			colors[] = {0,0.5,0,1};
		};
		class Blue {
			displayName = "Синий";
			colors[] = {0,0,1,1};
		};
		class Pink {
			displayName = "Розовый";
			colors[] = {1,0.3,0.4,1};
		};
		class CIV {
			displayName = "Пурпурный";
			colors[] = {0.4,0,0.5,1};
		};
	};
};