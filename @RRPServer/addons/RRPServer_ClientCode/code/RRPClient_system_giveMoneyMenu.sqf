/*
	Filename: 	RRPClient_system_giveMoneyMenu.sqf
	Project: 	Rimas Altis Life RPG
*/

private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitwith {};
if (!isPlayer _unit) exitwith {};

disableSerialization;
if !(createDialog "RocketDialogGiveMoney") exitWith {};
ctrlSetText [5201,"Передать деньги"];
life_giveMoneyUnit = _unit;
