/*

	Filename: 	RRPClient_raid_fillBox.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
params [
	["_object", objNull, [objNull]]
];

private _items = getArray(missionConfigFile >> "CfgRaid" >> typeOf _object >> "items");
private _chance = random(100);
{[(_x select 0) select 0,(_x select 0) select 1, -1, _object] call RRPClient_inventory_addToBox} forEach (_items select {_chance <= (_x select 1)});