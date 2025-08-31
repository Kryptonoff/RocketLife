/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_groupUnits"];
private _groupUnits = (_groupUnits apply {if ((headgear _x) in ["mgsr_headbag"]) then {objNull} else {_x}}) - [objNull];
private _groupUnitsDistance = _groupUnits apply {player distance _x};
private _sortedGroupUnitsDistance = +_groupUnitsDistance;
if (count _sortedGroupUnitsDistance > maximumSize) then {_sortedGroupUnitsDistance resize maximumSize};
_sortedGroupUnitsDistance apply {_groupUnits select (_groupUnitsDistance find _x)}
