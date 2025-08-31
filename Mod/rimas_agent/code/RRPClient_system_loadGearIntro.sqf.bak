/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params [
	["_unit",objNull,[objNull]],
	["_inventory",[],[[]]]
];

if (isNull _unit) exitWith {};

removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeBackpackGlobal _unit;
removeUniform _unit;

_unit setUnitLoadout _inventory;