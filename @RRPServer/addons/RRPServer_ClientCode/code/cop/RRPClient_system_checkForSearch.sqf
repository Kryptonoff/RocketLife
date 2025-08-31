/*
	Filename: 	RRPClient_system_checkForSearch.sqf
	Project: 	Rimas Altis Life RPG
*/
private _unit = param [0,objNull,[objNull]];
([_unit,"grp_PD"] call CBA_fnc_getDistance < 70) OR
([_unit,"grp_jail_marker"] call CBA_fnc_getDistance < 100)
