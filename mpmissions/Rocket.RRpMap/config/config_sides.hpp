class CfgSides 
{
	/*
		При добавлении нового сайда нужно не забыть еще добавить в бд новый enum в players
	*/
	class error
	{
		displayName = "Неизвестный";
		initFunction = "[] spawn RRPClient_init_civ";
		safeMarker = "Stolica_1";
		colors[] = {0.902,0.553,1,1};
		markerColor = "ColorYellow";
	};	
	class civ 
	{
		displayName = "Гражданский";
		initFunction = "[] spawn RRPClient_init_civ";
		loadoutFunction = "";
		safeMarker = "Stolica_1";
		colors[] = {0.902,0.553,1,1};
		markerColor = "ColorYellow";
	};
	class reb
	{
		displayName = "Бандит";
		initFunction = "[] spawn RRPClient_init_reb";
		safeMarker = "base_reb_1";
		colors[] = {0,1,0,1};
		markerColor = "ColorGreen";

	};
	class med
	{
		displayName = "Медик";
		initFunction = "[] spawn RRPClient_init_medic";
		safeMarker = "base_hospital_1";
		colors[] = {1,0,0,1};
		markerColor = "ColorRed";

	};
	class cop 
	{
		displayName = "Полицейский";
		initFunction = "[] spawn RRPClient_init_cop";
		safeMarker = "cop_spawn_1";
		colors[] = {0,0.588,1,1};
		markerColor = "ColorBlue";
	};
};