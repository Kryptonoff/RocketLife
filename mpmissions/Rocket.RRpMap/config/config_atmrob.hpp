/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

class CfgATMRob
{
	insertCardCondition = "'RRPmag_atmCard' in (backpackItems player) && (player call getSide) in ['reb','civ']";
	insertCardConditionMessage = "Вам нужна 'Кредитная карта'";
	insertCardTime = 25;

	robCondition = "count ('cop' call RRPClient_util_getPlayersBySide) > 2 && (player call getSide) in ['reb','civ']";
	robConditionMessage = "Для ограбления банкомата требуется наличие полиции на острове";
	robTime = 25;
	robReward = 10000;

	repairCondition = "player call getSide in ['med','cop']";
	repairConditionMessage = "Банкомат могут починить сотрудники Полиции или EMS";
	repairTime = 10;
	repairReward = 10000;
};