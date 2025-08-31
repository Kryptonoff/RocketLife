/*

	Filename: 	RRPClient_inventory_getContainerLoad.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_container", objNull, [objNull]]
];

private _maxWeight = _container call RRPClient_inventory_getContainerMaxMass;
if (_maxWeight isEqualTo 0) exitWith {1};

if (typeOf _container in ["Land_LuggageHeap_03_F", LIFE_SETTINGS(getText,"life_trunkClass")] OR _container getVariable ["shelter_container", false] OR _container getVariable ["safe_container", false]) exitWith {
	((_container GVAR ["inventory",[[],0]]) select 1) / _maxWeight
};

(_container call RRPClient_inventory_getContainerLoadAbs)/_maxWeight