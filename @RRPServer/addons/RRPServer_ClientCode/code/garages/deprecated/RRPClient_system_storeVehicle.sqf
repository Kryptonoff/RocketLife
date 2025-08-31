/*
	Filename: 	RRPClient_system_storeVehicle.sqf
	Project: 	Rimas Altis Life RPG
*/


private _sp = param [0,"",[""]];
private _typeV = param [1,"",["",[]]];

["request_store",[false,_sp,_typeV]] call RRPClient_garage_actions;
