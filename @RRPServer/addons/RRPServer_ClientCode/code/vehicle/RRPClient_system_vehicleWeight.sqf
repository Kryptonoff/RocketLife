/*
	
	Filename: 	RRPClient_system_vehicleWeight.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_vehicle","_weight","_used","_boxes"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {};

_used = (_vehicle GVAR ["Trunk",[[],0]]) select 1;
_weight = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"vItemSpace");

_boxes = _vehicle GVAR ["adacBoxes",0];
_weight = _weight + (100 * _boxes);

if(isNil "_used") then {_used = 0};
[_weight,_used];