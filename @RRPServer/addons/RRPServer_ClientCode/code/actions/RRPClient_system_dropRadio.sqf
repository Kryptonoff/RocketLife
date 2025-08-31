/*
	Filename: 	RRPClient_system_dropRadio.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_item","_unit","_box"];
_unit = param [0,ObjNull,[ObjNull]];
_item = "";
{
	if (["tf_", _x] call RRPClient_util_xString && !(EQUAL(_x,"tf_microdagr"))) exitWith {_item = _x};
} forEach (assignedItems _unit);
if (EQUAL(_item,"")) exitWith {["У цели нет радио"] call hints};

_box = createVehicle ["groundWeaponHolder", player modelToWorld [0,0.8,0], [], 0.5, "CAN_COLLIDE"];
_box setDir floor (random 360);
_box addItemCargoGlobal [_item, 1];
_unit unlinkItem _item;

["Рация сброшена на землю"] call hints;
