/*

	Filename: 	RRPClient_system_vehInit.sqf
	Project: 	Avalon Altis Life RPG
	Author:		Merrick
	Steam:		76561198006439083
	Web:		http://avalonlife.ru/

*/
private _vehicle = param [0,objNull,[objNull]];
if (_vehicle isEqualTo objNull) exitWith {};
	
life_vehicles pushBack _vehicle;

private _vehicle_limits = _vehicle getVariable ["vehicle_limits",""];
if (_vehicle_limits isEqualTo "") exitWith {};

switch (_vehicle_limits) do {
	case "carsharing": {
		life_cs_vehicle = _vehicle;
		life_cs_renting = true;
		life_cs_start = time;
		[{life_session_completed}, RRPClient_c2g_startTimer, []] call CBA_fnc_waitUntilAndExecute;
	};

	case "bus": {
		life_bus_vehicle = _vehicle;
		[{life_session_completed}, RRPClient_jobs_rentTimer, [life_gas_vehicle,"bus"]] call CBA_fnc_waitUntilAndExecute;
	};

	case "dhl": {
		life_dhl_vehicle = _vehicle;
		[{life_session_completed}, RRPClient_jobs_rentTimer, [life_gas_vehicle,"dhl"]] call CBA_fnc_waitUntilAndExecute;
	};

	case "eco_gs": {
		life_eco_gs_vehicle = _vehicle;
		[{life_session_completed}, RRPClient_jobs_rentTimer, [life_gas_vehicle,"eco_gs"]] call CBA_fnc_waitUntilAndExecute;
	};

	case "eco_ws": {
		life_eco_ws_vehicle = _vehicle;
		[{life_session_completed}, RRPClient_jobs_rentTimer, [life_gas_vehicle,"eco_ws"]] call CBA_fnc_waitUntilAndExecute;
	};

	case "eln": {
		life_eln_vehicle = _vehicle;
		[{life_session_completed}, RRPClient_jobs_rentTimer, [life_gas_vehicle,"eln"]] call CBA_fnc_waitUntilAndExecute;
	};

	case "dlv": {
		life_dlv_vehicle = _vehicle;
		[{life_session_completed}, RRPClient_jobs_rentTimer, [life_gas_vehicle,"dlv"]] call CBA_fnc_waitUntilAndExecute;
	};

	case "gas": {
		life_gas_vehicle = _vehicle;
		[{life_session_completed}, RRPClient_jobs_rentTimer, [life_gas_vehicle,"gas"]] call CBA_fnc_waitUntilAndExecute;
	};

	case "jail": {
		life_jail_truck = _vehicle;
	};

	default {};
};