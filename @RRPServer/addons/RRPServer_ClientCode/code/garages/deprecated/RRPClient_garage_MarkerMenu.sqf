/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _spawnPos = param [0,"",[""]];
private _type = param [1,"",[""]];

["request",_type,_spawnPos] call RRPClient_garage_actions;
