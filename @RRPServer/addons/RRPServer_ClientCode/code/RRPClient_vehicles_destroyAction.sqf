/*
	Filename: 	RRPClient_vehicles_destroyAction.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
private _veh = param [0,ObjNull,[ObjNull]];
if (isNull _veh OR !(ISPSIDE("cop"))) exitWith {};
if (player distance _veh > ((boundingBox _veh select 1) select 0) + 2) exitWith {["Вы находитесь слишком далеко от объекта"] call hints };

for "_i" from 1 to 10 do {
	titleText[format["Техника будет уничтожена через %1 сек.", (11 - _i)],"PLAIN"];
	uiSleep 1;
	if !(alive _veh) exitWith {};	
};

titleText["","PLAIN"];

if (alive _veh) then {	
	[_veh,"isInsured"] call RRPClient_system_clearGlobalVar;
	_veh setDamage 1;
};
