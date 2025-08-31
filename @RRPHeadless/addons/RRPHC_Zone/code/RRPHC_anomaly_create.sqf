/*

	Filename: 	server_system_anomalyCreate.sqf
	Project: 	Empyrean Life RPG
	Author:		RamboKZ
	E-mail:		armenia.roma@gmail.com
	Web:		http://empyrean.club

*/
#include "..\macros.hpp"
params [
    ["_pos",[]],
	["_type","",[""]]
];
if (_pos isEqualTo [] OR _type isEqualTo "") exitWith {};
    
_pos = [_pos] call CBA_fnc_getPos;
if (count _pos < 3) then {
	_pos set [2,0];
};

private _trigger = createTrigger ["EmptyDetector", _pos];
_trigger setPosATL _pos;
[_trigger,"anomaly_cooldown",false] call CBA_fnc_setVarNet;
[_trigger,"anomaly_type",_type] call CBA_fnc_setVarNet;

private _triggerArea = M_CONFIG2(getArray,"LifeCfgAnomaly","Settings",_type,"triggerArea");
private _triggerStatements = M_CONFIG2(getArray,"LifeCfgAnomaly","Settings",_type,"triggerStatements");
private _triggerRectangle = (M_CONFIG2(getNumber,"LifeCfgAnomaly","Settings",_type,"triggerRectangle") == 1);
format ["LifeCfgAnomaly: %1 %2 %3",_triggerArea,_triggerStatements,_triggerRectangle] call RRPHC_util_debugConsole;
_triggerArea params ["_areaX","_areaY","_areaZ"];
_triggerStatements params ["_condition","_activation"];

if (anomalyDebug) then {
    format["setTrigger: TYPE %1 | ARG %2",_type,[
	    _trigger,
	    [_areaX, _areaY, 0, _triggerRectangle, _areaZ],
	    ["ANY", "PRESENT", true],
	    [_condition,_activation,""]
    ]] call RRPClient_system_log;
};

[
	_trigger,
	[_areaX, _areaY, 0, _triggerRectangle, _areaZ],
	["ANY", "PRESENT", true],
	[_condition,_activation,""]
] remoteExecCall ["Client_system_setTrigger", -2, _trigger];

if (EQUAL(_type,"Teleport") OR EQUAL(_type,"Teleport_v2")) then {
	anomalyTeleportIDS pushBack _trigger;
};

if (EQUAL(_type,"Radiation")) then {
	[_trigger,"radiationRadius",_areaX - random 50] call CBA_fnc_setVarNet;
	[_trigger,"radiationLevel",1 + random 1.5] call CBA_fnc_setVarNet;
};

if (isNil "anomalyHolder") then {anomalyHolder = []};
anomalyHolder pushBackUnique _trigger;

if(!isNil "anomalyDebug" && {anomalyDebug}) then {
	private _marker = createMarker [str(_pos),_pos];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "hd_dot";
	_marker setMarkerText (_trigger GVAR "anomaly_type");
	_trigger setVariable ["debug_marker",_marker];
};

_trigger enableDynamicSimulation false;
_trigger enableSimulationGlobal false;

_trigger
