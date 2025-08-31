/*
	Выдача боевой техники (для копов или кого угодно на рестарт)

	class уникальная_переменная {
		vehicleClass = "B_Heli_Transport_01_F"; //класс техники
		color = ""; //цвет, если он есть (из LifeCfgVehTextures)
		conditions = "('cop' call RRPClient_groups_getSideLevel) > 10"; //условие
		conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 11+"; //сообщение, выдаваемое при несоблюдении
		maximum = 1; //сколько единиц техники можно достать за 1 рестарт
	}

*/

class AbstractBattleVehicle {
	vehicleClass = "";
	color = "";
	conditions = "";
	conditionsMessage = "";
	maximum = 1;
};

class LifeCfgBattleVehicles {
	
	class RRPVehicle_sheriff_insurgent: AbstractBattleVehicle 
	{
		vehicleClass = "RRPVehicle_sheriff_insurgent";
		conditions = "('cop' call RRPClient_groups_getSideLevel) >= 4";
		conditionsMessage = "Нужно звание уровня 6 и выше";
		maximum = 4;
	};
	class RRPVehicle_sheriff_insurgent_armed: RRPVehicle_sheriff_insurgent
	{
		vehicleClass = "RRPVehicle_sheriff_insurgent_armed";
		maximum = 3;
	};
	class RRPVehicle_sheriff_strider: AbstractBattleVehicle 
	{
		vehicleClass = "RRPVehicle_sheriff_strider";
		conditions = "('cop' call RRPClient_groups_getSideLevel) >= 6";
		conditionsMessage = "Нужно звание уровня 6 и выше и когда происходит ограбление Национального резерва";
		maximum = 4;
	};
	class RRPVehicle_sheriff_strider_GMG: AbstractBattleVehicle 
	{
		vehicleClass = "RRPVehicle_sheriff_strider_GMG";
		conditions = "('cop' call RRPClient_groups_getSideLevel) >= 8";
		conditionsMessage = "Нужно звание уровня 8 и выше и когда происходит ограбление Национального резерва";
		maximum = 3;
	};
	
	
	// class cop_marsh: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 6 || getPlayerUID player in ['76561198108509544']";
	// 	vehicleClass = "RRP_S_12_7";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 6+";
	// 	maximum = 4;
	// };
	// class BTR90: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 10 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 10+";
	// 	vehicleClass = "RRPVehicle_BTR90_PD";
	// 	maximum = 4;
	// };
	// class B_UAV_01_F: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 10 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 10+";
	// 	vehicleClass = "B_UAV_01_F";
	// 	maximum = 5;
	// };
	// class B_UGV_02_Science_F: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 10 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 10+";
	// 	vehicleClass = "B_UGV_02_Science_F";
	// 	maximum = 2;
	// };
	
	// class RRP_BTR9023: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 10 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 10+";
	// 	vehicleClass = "RRP_BTR9023";
	// 	maximum = 1;
	// };
	// class I_UAV_01_F: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 10 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 10+";
	// 	vehicleClass = "I_UAV_01_F";
	// 	maximum = 3;
	// };
	// class B_UGV_02_Demining_F: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 26 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 10+";
	// 	vehicleClass = "B_UGV_02_Demining_F";
	// 	maximum = 3;
	// };
	
	// class RRPVehicle_Marshal_POLICE: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 8 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 10+";
	// 	vehicleClass = "RRPVehicle_Marshal_POLICE";
	// 	maximum = 5;
	// };
	// class RRPVehicle_Qilin_PD: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) >= 10 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 10+";
	// 	vehicleClass = "RRPVehicle_Qilin_PD";
	// 	maximum = 2;
	// };
	// class RRP_Marid_PD_Armered: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) > 14 || getPlayerUID player in ['76561198108509544']";
	// 	vehicleClass = "RRP_Marid_PD_Unarmed";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 15+";
	// 	maximum = 1;
	// };
	// class RRP_Marid_PD_Armered_1: example {
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) > 14 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 15+";
	// 	vehicleClass = "RRP_Marid_PD_Unarmed_1";
	// 	maximum = 1;
	// };
	// class cop_gh : example {
	// 	vehicleClass = "RRP_Ghost_Hawk_PD";
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) > 18 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 19+";
	// 	maximum = 1;
	// };
	// class cop_helli: example {
	// 	vehicleClass = "RRP_Ghost_Hawk_PD";
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) > 18 || getPlayerUID player in ['76561198108509544']";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 19+";
	// 	maximum = 1;
	// };
	// class I_C_Offroad_02_AT_F_cop : example {
	// 	vehicleClass = "I_C_Offroad_02_AT_F_cop";
	// 	conditions = "('cop' call RRPClient_groups_getSideLevel) > 16";
	// 	conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 19+";
	// 	maximum = 2;
	// };
};