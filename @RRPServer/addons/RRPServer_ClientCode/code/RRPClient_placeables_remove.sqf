/*
	Project: Rimas Role Play
	License: CC BY-ND
	Author: Arrra, FairyTale
*/

private _object = cursorObject;
if (isNull _object) exitWith {};

if (isNil {_object getVariable "owner"}) exitWith {};
if ((_object getVariable "owner") != getPlayerUID player) exitWith { ["Это не ваше!"] call hints;};

{
    if (_x isEqualTo _object) then {
	    life_bar_placey deleteAt _forEachIndex;
	    deleteVehicle _x;
	};
} forEach life_bar_placey;