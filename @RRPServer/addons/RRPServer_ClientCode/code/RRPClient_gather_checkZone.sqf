/*

	Filename: 	RRPClient_gather_checkZone.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private _return = "";
private ["_curConfig","_resourceZones","_zoneSize"];
{
	_curConfig = _x;
	_resourceZones = getArray(_curConfig >> "zones");
	_zoneSize = getNumber(_curConfig >> "zoneSize");
	{
		if ([player,_x] call CBA_fnc_getDistance < _zoneSize) exitWith {_return = configName _curConfig};
	} forEach _resourceZones;
	if !(EQUAL(_return,"")) exitWith {};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgFarm"));

_return