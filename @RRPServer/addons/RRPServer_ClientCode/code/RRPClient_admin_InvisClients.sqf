/*
	
	Filename: 	RRPClient_admin_InvisClients.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];

if (isNull _unit) exitWith {};
if (_unit == player) exitWith {};

_unit hideObject true;