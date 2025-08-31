/*

	Filename: 	RRPClient_inventory_inArray.sqf
	Project: 	FATUM
	Author:		Kaboom
	
	Web:		https://fatum.club/

*/
params ["_item", "_stack"];

_stack findIf {_item == _x}