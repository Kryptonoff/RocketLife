/*

	Filename:	RRPClient_inventory_checkConnection.sqf
	Project: 	
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://fatum.club/

*/

private _t_start = time;
clientOwner remoteExecCall ["RRPServer_inventory_checkConnection",2];
waitUntil {(life_wait OR time - _t_start > 10)};
if (life_wait) exitWith {life_wait = false; true};

false