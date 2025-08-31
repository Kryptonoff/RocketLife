/*

	Filename: 	RRPClient_inventory_saveContainer.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_container", objNull, [objNull]],
	["_mode", "", [""]]
];
if (isNull _container OR _mode isEqualTo "") exitWith {};

[_container, _mode, player] remoteExecCall ["RRPServer_inventory_saveContainer", 2];