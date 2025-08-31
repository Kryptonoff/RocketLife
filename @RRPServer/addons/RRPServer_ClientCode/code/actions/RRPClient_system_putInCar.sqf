/*
	Filename: 	RRPClient_system_putInCar.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR !isPlayer _unit) exitWith {};
if (!isNull life_DraggedBody) exitWith {["Вы кого-то несете. Положите его сперва на землю"] call hints};

private _nearestVehicle = nearestObjects[getPosATL player,["LandVehicle","Ship","Submarine","Air"],10] select 0;
if (isNil "_nearestVehicle") exitWith { ["Нету транспортного средства поблизости..."] call hints };

detach _unit;
[_nearestVehicle] remoteExecCall ["RRPClient_system_moveIn",_unit];