/*

	Filename: 	RRPClient_evh_onAction.sqf
	Project: 	
	Author:		RamboKZ
	VK:		    https://vk.com/id194667034
	Web:		http://fatum.club/

*/
params ["_target", "_caller", "_index", "_action", "_actionName"]; 
if (([_caller,false] call RRPClient_system_isInputBlocked && [_caller] call RRPClient_system_isInputBlocked) OR (player setVariable ["isDragging", true])) exitWith {true};
if (_action in ["TakeWeaponFromBody", "TakeWeapon", "TakeMagazine", "TakeItem", "Rearm"]) exitWith {true};
if (_action isEqualTo "Gear") exitWith {
	[_target] spawn RRPClient_inventory_open;
	true
};
false