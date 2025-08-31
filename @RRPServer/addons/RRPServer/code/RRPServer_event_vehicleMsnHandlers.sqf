/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _netid = param [0,"",[""]];
if (_netid isEqualTo "") exitWith {"Vehicle can not be handled: NetID is empty" call RRPServer_util_log};
private _vehicle = objectFromNetId _netid;
if (isNull _vehicle) exitWith {"Vehicle can not be handled: NetID is empty" call RRPServer_util_log};
_vehicle removeAllEventHandlers "GetIn";
_vehicle removeAllEventHandlers "GetOut";
_vehicle removeAllEventHandlers "HandleDamage";
_vehicle removeAllMPEventHandlers "MPKilled";


_vehicle addEventHandler [
	"GetOut",
	{
		params ["_vehicle", "_role", "_unit", "_turret"];
		if !((_vehicle getVariable ["RRPDatabaseID", -1]) isEqualTo -1) then
		{
			if !(RRPHC_enable) then {
				_vehicle call RRPServer_vehicleSaveQueue_addVehicle;
			}else{
				_vehicle remoteExecCall ["RRPHC_vehicleSaveQueue_addVehicle",HC_Life];
			};
		};
	}
];
[_netid] call RRPClient_system_SetVehFixExpl;
_vehicle addMPEventHandler ["MPKilled", { if !(isServer) exitWith {}; _this call RRPServer_event_vehicle_MPKilled;}];
