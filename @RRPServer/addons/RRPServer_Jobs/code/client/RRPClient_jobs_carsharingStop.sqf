/*

	Filename: 	RRPClient_jobs_carsharingStop.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
private _vehicle = param[0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

private _veh_crew = crew _vehicle;
if !(_veh_crew isEqualTo []) then {[] remoteExecCall ["RRPClient_system_pullOutVeh",_veh_crew]};

if (local _vehicle) then {
	[_vehicle,2] call RRPClient_system_lockvehicle;
} else {
	[_vehicle,2] remoteExecCall ["RRPClient_system_lockvehicle",_vehicle];
};
[{_this enableSimulationGlobal false; deleteVehicle _this},_vehicle,5] call CBA_fnc_waitAndExecute;