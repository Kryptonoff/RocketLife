/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_unit"];
if !(alive _unit) exitWith {0};
if (_unit getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) exitWith {0};
1 - (damage _unit);