/*
** Author: Jack "Scarso" Farhall
** Description: 
*/
scopeName "fn_getPerkLimit";

private _limit = getNumber (missionConfigFile >> "CfgPerks" >> "baseLimit");

// Every 2 prestige levels you get another slot... (Oh and ensure we add a cap so it doesn't get stupid...)
((_limit + floor VRP_Prestige) min getNumber (missionConfigFile >> "CfgPerks" >> "maxLimit"))