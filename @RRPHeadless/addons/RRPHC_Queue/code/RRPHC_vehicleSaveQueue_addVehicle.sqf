/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_vehicleObject"];
_vehicleObject = _this;
if !(_vehicleObject in RRPServerVehicleSaveQueue) then
{
	if !((_vehicleObject getVariable ["RRPDatabaseID", -1]) isEqualTo -1) then
	{
		format ["Vehicle %1 (%2) Added to queue",typeOf _vehicleObject,_vehicleObject getVariable ["RRPDatabaseID", -1]] call RRPHC_util_debugConsole;
		_vehicleObject setVariable ["VehicleSaveQueuedAt", time];
		RRPServerVehicleSaveQueue pushBackUnique _vehicleObject;
		diag_log STR(RRPServerVehicleSaveQueue);
	};
};
true