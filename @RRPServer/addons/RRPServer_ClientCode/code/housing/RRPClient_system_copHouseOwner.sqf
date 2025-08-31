/*
	Filename: 	RRPClient_system_copHouseOwner.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house GVAR "house_owner")}) exitWith {["Этот дом никому не принадлежит."] call hints};

private _uid = (_house GVAR "house_owner") select 0;
if !([_uid] call RRPClient_system_isUIDActive) exitWith {["Владелец дома не в сети и вы не можете обыскать этот дом!"] call hints};

[format["<t color='#FF0000'><t size='2'>" +("Владелец дома")+ "</t></t><br/>%1",(_house GVAR "house_owner") select 1]] call hints;
