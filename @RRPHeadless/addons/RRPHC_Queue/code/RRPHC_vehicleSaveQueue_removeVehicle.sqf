/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_vehicleObject", "_vehicleNetId", "_index"];
_vehicleObject = _this;
_vehicleNetId = netID _vehicleObject;
_index = RRPServerVehicleSaveQueue find _vehicleObject;
if (_index > -1) then 
{
	RRPServerVehicleSaveQueue deleteAt _index;
};
true