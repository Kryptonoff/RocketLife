/*
	Project: Insurance permanent system
	Author: FairyTale5571
	License: CC BY-ND
*/

_vehicle = _this;
_id = _vehicle getVariable ["RRPDatabaseID",-1];
format ["insurVehicle:%1",_id] call RRPServer_DB_fireAndForget;
