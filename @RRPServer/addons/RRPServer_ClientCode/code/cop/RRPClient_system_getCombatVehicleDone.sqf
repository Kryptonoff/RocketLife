/*
	Filename: 	RRPClient_system_getCombatVehicleDone.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
params [
	["_cfgClass","",[""]],
	["_marker","",[""]]
];

if (!isClass (missionConfigFile >> "LifeCfgBattleVehicles" >> _cfgClass)) exitWith {};

private _className = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"vehicleClass");
private _sp = getMarkerPos _marker;

private _vehicle = createVehicle [_className,_sp, [], 0, "NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setDir (markerDir _marker);
_vehicle setPos _sp;
player reveal _vehicle;
life_vehicles pushBack _vehicle;

[_vehicle,"vehicle_info_owners",[[steamid,GVAR_RNAME(player)]]] call CBA_fnc_setVarNet;

[steamid,_vehicle,1] remoteExecCall ["RRPServer_system_keyManagement",RSERV];

[_vehicle] call RRPClient_system_vehSetupRadio;
[_vehicle] call RRPClient_system_clearVehicleAmmo;
[_vehicle] spawn RRPClient_system_vehicleAnimate;
[_vehicle] call RRPClient_system_clearVehicleSensors;
[netID _vehicle] remoteExecCall ["RRPClient_system_SetVehFixExpl",2];

private _color = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"color");
if !(EQUAL(_color,"")) then {[_vehicle,_color] call RRPClient_system_colorVehicle};

_vehicle lock 2;
_vehicle disableTIEquipment false;
_vehicle allowDamage true;

private _animationList = getArray(missionConfigFile >> "LifeCfgVehicles" >> _className >> "animationList");
[
	_vehicle,
	nil,
	if (_animationList isEqualTo []) then {false} else {_animationList}
] call BIS_fnc_initVehicle;

closeDialog 0;
["Боевая техника готова!"] call hints;
