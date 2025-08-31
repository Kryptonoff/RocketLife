/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private ["_code", "_function", "_file"];
private _headerNoDebug = '
	private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
	private _fnc_scriptName = "%1";
	scriptName _fnc_scriptName;
';
private _is_dev = serverName isEqualTo "[RU] Aurora Role Play #DEV | rimasrp.life";

[
	["client", "RRPClient_system_progressBarSimple"],
	["client", "RRPClient_system_progressBarCustom"],

	["client", "RRPClient_darkjobs_jobSelection"],
	["client", "RRPClient_jobs_spawnVehicleTask"],
	["client", "RRPClient_jobs_spawnVehicle"],
	["client", "RRPClient_jobs_returnVehicle"],
	["client", "RRPClient_jobs_rentTimer"],
	["client", "RRPClient_jobs_jobSelection"],
	["client", "RRPClient_jobs_endJob"],
	["client", "RRPClient_jobs_clothSpawn"],
	["client", "RRPClient_jobs_clothCheck"],
	["client", "RRPClient_jobs_carsharingStop"],

	["client\eln", "RRPClient_eln_repair"],
	["client\eln", "RRPClient_eln_orderTake"],

	["client\eco_ws", "RRPClient_eco_ws_sampleTake"],
	["client\eco_ws", "RRPClient_eco_ws_orderTake"],
	["client\eco_gs", "RRPClient_eco_gs_sampleTake"],
	["client\eco_gs", "RRPClient_eco_gs_orderTake"],

	["client\ds", "RRPClient_ds_orderTake"],
	["client\ds", "RRPClient_ds_boxPutDown"],

	["client\dlv", "RRPClient_dlv_price"],
	["client\dlv", "RRPClient_dlv_getMissionMenu"],
	["client\dlv", "RRPClient_dlv_getMission"],
	["client\dlv", "RRPClient_dlv_finishMission"],

	["client\dhl", "RRPClient_dhl_orderTake"],
	["client\dhl", "RRPClient_dhl_orderDone"],
	["client\dhl", "RRPClient_dhl_menuUpdate"],
	["client\dhl", "RRPClient_dhl_menuOpen"],
	["client\dhl", "RRPClient_dhl_mailBoxGive"],
	["client\dhl", "RRPClient_dhl_boxTakeFromVeh"],
	["client\dhl", "RRPClient_dhl_boxStoreInVehicle"],
	["client\dhl", "RRPClient_dhl_boxSpawn"],
	["client\dhl", "RRPClient_dhl_boxPutDown"],
	["client\dhl", "RRPClient_dhl_boxPickUp"],

	["client\dcourrier", "RRPClient_dcourrier_orderTake"],
	["client\dcourrier", "RRPClient_dcourrier_dig"],

	["client\terror", "RRPClient_terror_orderTake"],
	["client\terror", "RRPClient_terror_bombPlant"],

	["client\rob", "RRPClient_rob_robGas"],
	["client\rob", "RRPClient_rob_orderTake"],

	["client\dcleaner", "RRPClient_dcleaner_orderTake"],
	["client\dcleaner", "RRPClient_dcleaner_cleanHouse"],

	["client\bus", "RRPClient_bus_orderTake"],
	["client\bus", "RRPClient_bus_checkIn"],
	
	["client\waypoints", "RRPClient_jobs_renderWaypoints"]
]apply{
	_x params ["_folder", "_function"];
	_code = if (_is_dev) then {compile (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Jobs\code\%1\%2.sqf",_folder, _function])
		} else {
			compileFinal (format[_headerNoDebug,_function] + preprocessFileLineNumbers format["\RRPServer_Jobs\code\%1\%2.sqf",_folder, _function])
	};
	missionNamespace setVariable [_function, _code,true];
};

true