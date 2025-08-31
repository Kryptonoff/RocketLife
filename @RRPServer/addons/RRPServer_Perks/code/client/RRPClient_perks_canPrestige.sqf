/*
** Author: Jack "Scarso" Farhall
** Description: 
*/

(
	VRP_Level isEqualTo ([] call RRPClient_perks_getMaxLevel) && // Max Level
	{ VRP_XP isEqualTo ([VRP_Level] call RRPClient_perks_getRequiredXP) } // Max XP
)
