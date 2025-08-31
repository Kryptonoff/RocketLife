/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_vehicleObject", "_removeFromQueue"];
{
	_vehicleObject = _x;
	_removeFromQueue = false;
	if (isNull _vehicleObject) then
	{
		_removeFromQueue = true;
	}
	else 
	{
	
		if (diag_tickTime - (_vehicleObject getVariable ["VehicleSaveQueuedAt", 30]) > 60) then
		{
			_vehicleObject call RRPServer_vehicleSaveQueue_saveVehicle;
			_vehicleObject setVariable ["VehicleSaveQueuedAt", nil];
			_removeFromQueue = true;
		};
	};
	if (_removeFromQueue) then
	{
		RRPServerVehicleSaveQueue deleteAt _forEachIndex;
	};
}
forEach RRPServerVehicleSaveQueue;
true